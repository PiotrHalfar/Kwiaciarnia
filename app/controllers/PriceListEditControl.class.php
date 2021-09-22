<?php

namespace app\controllers;

use core\App;
use core\Utils;
use core\ParamUtils;
use core\Validator;
use app\forms\PriceListEditForm;

class PriceListEditControl {

	private $form; //dane formularza

	public function __construct(){
		//stworzenie potrzebnych obiektów
		$this->form = new PriceListEditForm();
	}

	//validacja danych przed zapisem (nowe dane lub edycja)
	public function validateSave() {
		//0. Pobranie parametrów z walidacją
		$this->form->id = ParamUtils::getFromRequest('id',true,'Błędne wywołanie aplikacji');
		$this->form->itemname = ParamUtils::getFromRequest('itemname',true,'Błędne wywołanie aplikacji');
		$this->form->price = ParamUtils::getFromRequest('price',true,'Błędne wywołanie aplikacji');


		// 1. sprawdzenie czy wartości wymagane nie są puste
		if (empty(trim($this->form->itemname))) {
                    Utils::addErrorMessage('Wprowadź nazwę produktu');
		}
                if (is_numeric ( $this->form->itemname )) {
                    Utils::addErrorMessage('Błędna nazwa produktu!');
			}
		if (empty(trim($this->form->price))) {
                    Utils::addErrorMessage('Wprowadź cenę');
		}
		if ( App::getMessages()->isError() ) 
                    return false;
		if (! is_numeric ( $this->form->price )) {
                    Utils::addErrorMessage('Cena musi być liczbą!');
			}
                return !App::getMessages()->isError();
		// 2. sprawdzenie poprawności przekazanych parametrów
		
	}

	//validacja danych przed wyswietleniem do edycji
	 public function validateEdit() {
            //pobierz parametry na potrzeby wyswietlenia danych do edycji
            //z widoku listy osób (parametr jest wymagany)
            $this->form->id = ParamUtils::getFromCleanURL(1, true, 'Błędne wywołanie aplikacji');
            return !App::getMessages()->isError();
        }
	
	public function action_itemNew(){
		$this->generateView();
	}
	//wysiweltenie rekordu do edycji wskazanego parametrem 'id'
	public function action_itemEdit(){
		// 1. walidacja id osoby do edycji
		if ( $this->validateEdit() ){
			try {
				// 2. odczyt z bazy danych osoby o podanym ID (tylko jednego rekordu)
				$record = App::getDB()->get("cennik", "*",[
					"itemid" => $this->form->id
				]);
				// 2.1 jeśli osoba istnieje to wpisz dane do obiektu formularza
				$this->form->id = $record['itemid'];
				$this->form->itemname = $record['itemname'];
				$this->form->price = $record['price'];
			} catch (\PDOException $e){
				Utils::addErrorMessage('Wystąpił błąd podczas odczytu rekordu');
				if (App::getConf()->debug) 
                                     Utils::addErrorMessage($e->getMessage());			
			}	
		} 
		
		// 3. Wygenerowanie widoku
		$this->generateView();		
	}

	public function action_itemDelete(){		
		// 1. walidacja id osoby do usuniecia
		if ( $this->validateEdit() ){
			
			try{
				// 2. usunięcie rekordu
				App::getDB()->delete("cennik",[
					"itemid" => $this->form->id
				]);
				Utils::addInfoMessage('Pomyślnie usunięto rekord');
			} catch (\PDOException $e){
				Utils::addErrorMessage('Wystąpił błąd podczas usuwania rekordu');
				if (App::getConf()->debug)
                                     Utils::addErrorMessage($e->getMessage());			
			}	
		}
		
		// 3. Przekierowanie na stronę listy produktow
		 App::getRouter()->forwardTo('priceListShow');		
	}

	public function action_itemSave(){
			
		// 1. Walidacja danych formularza (z pobraniem)
		if ($this->validateSave()) {
			// 2. Zapis danych w bazie
			try {
				
				//2.1 Nowy rekord
				if ($this->form->id == '') {
					//sprawdź liczebność rekordów - nie pozwalaj przekroczyć 20
					$count = App::getDB()->count("cennik");
					if ($count <= 20) {
						App::getDB()->insert("cennik", [
							"itemname" => $this->form->itemname,
							"price" => $this->form->price,
						]);
					} else { //za dużo rekordów
						// Gdy za dużo rekordów to pozostań na stronie
						 Utils::addInfoMessage('Ograniczenie: Zbyt dużo rekordów. Aby dodać nowy usuń wybrany wpis.');
						$this->generateView(); //pozostań na stronie edycji
						exit(); //zakończ przetwarzanie, aby nie dodać wiadomości o pomyślnym zapisie danych
					}
				} else { 
				//2.2 Edycja rekordu o danym ID
					App::getDB()->update("cennik", [
						"itemname" => $this->form->itemname,
                                                "price" => $this->form->price,
                                                ], [ 
						"itemid" => $this->form->id
					]);
				}
				Utils::addInfoMessage('Pomyślnie zapisano rekord');

			} catch (\PDOException $e){
				Utils::addErrorMessage('Wystąpił nieoczekiwany błąd podczas zapisu rekordu');
				 if (App::getConf()->debug)
                                    Utils::addErrorMessage($e->getMessage());			
			}
			
			// 3b. Po zapisie przejdź na stronę listy osób (w ramach tego samego żądania http)
			 App::getRouter()->forwardTo('priceListShow');

		} else {
			// 3c. Gdy błąd walidacji to pozostań na stronie
			$this->generateView();
		}		
	}
	
	public function generateView(){
		App::getSmarty()->assign('form',$this->form); // dane formularza dla widoku
		App::getSmarty()->display('priceListEdit.tpl');
	}
}
 