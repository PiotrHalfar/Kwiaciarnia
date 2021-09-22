<?php

namespace app\controllers;

use core\App;
use core\Utils;
use core\ParamUtils;
use core\Validator;
use app\forms\SchedulesEditForm;

class SchedulesEditControl 
{

	private $form; //dane formularza

	public function __construct()
        {
		//stworzenie potrzebnych obiektów
		$this->form = new SchedulesEditForm();
	}

	//validacja danych przed zapisem (nowe dane lub edycja)
	public function validateSave() 
        {
		//0. Pobranie parametrów z walidacją
		$this->form->id = ParamUtils::getFromRequest('id',true,'Błędne wywołanie aplikacji');
		$this->form->name = ParamUtils::getFromRequest('name',true,'Błędne wywołanie aplikacji');
		$this->form->surname = ParamUtils::getFromRequest('surname',true,'Błędne wywołanie aplikacji');
		$this->form->deadline = ParamUtils::getFromRequest('deadline',true,'Błędne wywołanie aplikacji');
                $this->form->service = ParamUtils::getFromRequest('service',true,'Błędne wywołanie aplikacji');
                $this->form->delivery = ParamUtils::getFromRequest('delivery',true,'Błędne wywołanie aplikacji');

		// 1. sprawdzenie czy wartości wymagane nie są puste oraz sprawdzenie czy nie sa liczba
		if (empty(trim($this->form->name))) 
                {
                        Utils::addErrorMessage('Wprowadź imię klienta');
		}
                if (is_numeric ( $this->form->name )) 
                {
                    Utils::addErrorMessage('Błędne imię klienta!');
		}
		if (empty(trim($this->form->surname))) 
                {
			Utils::addErrorMessage('Wprowadź nazwisko klienta');
		}
                if (is_numeric ( $this->form->surname )) 
                {
                    Utils::addErrorMessage('Błędne nazwisko klienta!');
		}
                if (empty(trim($this->form->deadline))) 
                {
			Utils::addErrorMessage('Wprowadź termin odbioru');
		}
                if (empty(trim($this->form->service))) 
                {
			Utils::addErrorMessage('Wprowadź rodzaj usługi');
		}
                if (is_numeric ( $this->form->service )) 
                {
                    Utils::addErrorMessage('Błędny rodzaj usługi!');
                }
                if (empty(trim($this->form->delivery))) 
                {
			Utils::addErrorMessage('Wprowadź rodzaj dostawy');
		}
                if (is_numeric ( $this->form->delivery )) 
                {
                    Utils::addErrorMessage('Błędny rodzaj dostawy!');
                }        
		if (App::getMessages()->isError())
                        return false;
		// 2. sprawdzenie poprawności przekazanych parametrów
		 $d = \DateTime::createFromFormat('Y-m-d', $this->form->deadline);
                if ($d === false) 
                {
                    Utils::addErrorMessage('Zły format daty. Przykład: 2015-12-20');
                }
                return !App::getMessages()->isError();
	}

	//validacja danych przed wyswietleniem do edycji
	public function validateEdit() 
        {
                //pobierz parametry na potrzeby wyswietlenia danych do edycji
                //z widoku listy osób (parametr jest wymagany)
                $this->form->id = ParamUtils::getFromCleanURL(1, true, 'Błędne wywołanie aplikacji');
                return !App::getMessages()->isError();
        }
	
	public function action_clientNew()
        {
		$this->generateView();
	}
	//wysiweltenie rekordu do edycji wskazanego parametrem 'id'
	public function action_clientEdit()
        {
		// 1. walidacja id osoby do edycji
		if ( $this->validateEdit() )
                {
			try 
                        {
				// 2. odczyt z bazy danych osoby o podanym ID (tylko jednego rekordu)
				$record = App::getDB()->get("terminarz", "*",[
					"clientid" => $this->form->id
				]);
				// 2.1 jeśli osoba istnieje to wpisz dane do obiektu formularza
				$this->form->id = $record['clientid'];
				$this->form->name = $record['name'];
				$this->form->surname = $record['surname'];
                                $this->form->deadline = $record['deadline'];
                                $this->form->service = $record['service'];
                                $this->form->delivery = $record['delivery'];
			} catch (\PDOException $e)
                        {
				Utils::addErrorMessage('Wystąpił błąd podczas odczytu rekordu');
				if (App::getConf()->debug) 
                                    Utils::addErrorMessage($e->getMessage());			
			}	
		} 
		// 3. Wygenerowanie widoku
		$this->generateView();		
	}

	public function action_clientDelete()
        {		
		// 1. walidacja id osoby do usuniecia
		if ( $this->validateEdit() )
                {
			
			try
                        {
				// 2. usunięcie rekordu
				App::getDB()->delete("terminarz",[
					"clientid" => $this->form->id
				]);
				Utils::addInfoMessage('Pomyślnie usunięto rekord');
			} catch (\PDOException $e)
                        {
				Utils::addErrorMessage('Wystąpił błąd podczas usuwania rekordu');
				if (App::getConf()->debug) 
                                    Utils::addErrorMessage($e->getMessage());			
			}	
		}
		// 3. Przekierowanie na stronę listy produktow
		App::getRouter()->forwardTo('schedulesShow');		
	}

	public function action_clientSave()
        {	
		// 1. Walidacja danych formularza (z pobraniem)
		if ($this->validateSave()) 
                {
			// 2. Zapis danych w bazie
			try 
                        {
				//2.1 Nowy rekord
				if ($this->form->id == '') 
                                {
										
                                    App::getDB()->insert("terminarz", [
                                            "name" => $this->form->name,
                                            "surname" => $this->form->surname,
                                            "deadline" => $this->form->deadline,
                                            "service" => $this->form->service,
                                            "delivery" => $this->form->delivery,
                                    ]);					
				} 
                                else 
                                { 
				//2.2 Edycja rekordu o danym ID
					App::getDB()->update("terminarz", [
						"name" => $this->form->name,
                                                "surname" => $this->form->surname,
                                                "deadline" => $this->form->deadline,
                                                "service" => $this->form->service,
                                                "delivery" => $this->form->delivery,
					], [ 
						"clientid" => $this->form->id
					]);
				}
				Utils::addInfoMessage('Pomyślnie zapisano rekord');

			} catch (\PDOException $e)
                        {
				Utils::addErrorMessage('Wystąpił nieoczekiwany błąd podczas zapisu rekordu');
				if (App::getConf()->debug) 
                                    Utils::addErrorMessage($e->getMessage());			
			}
			// 3b. Po zapisie przejdź na stronę listy osób (w ramach tego samego żądania http)
			App::getRouter()->forwardTo('schedulesShow');
		} 
                else 
                {
			// 3c. Gdy błąd walidacji to pozostań na stronie
			$this->generateView();
		}		
	}
	public function generateView()
        {
		App::getSmarty()->assign('form',$this->form); // dane formularza dla widoku
		App::getSmarty()->display('schedulesEdit.tpl');
	}
}
 