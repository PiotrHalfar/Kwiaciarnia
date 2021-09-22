<?php

namespace app\controllers;

use core\App;
use core\Utils;
use core\ParamUtils;
use app\forms\SchedulesSearchForm;

class SchedulesControl 
{

	private $form; //dane formularza wyszukiwania
	private $records; //rekordy pobrane z bazy danych

	public function __construct()
        {
		//stworzenie potrzebnych obiektów
		$this->form = new SchedulesSearchForm();
	}
		
	public function validate() 
        {
		// 1. sprawdzenie, czy parametry zostały przekazane
		$this->form->surname = ParamUtils::getFromRequest('sf_surname');
                if (is_numeric($this->form->surname)) 
                {
                     Utils::addErrorMessage('Niepoprawne nazwisko klienta');
                }

		if ( App::getMessages()->isError() ) 
                    return false;
		
		return !App::getMessages()->isError();
	}
	
	public function action_schedulesShow()
        {
		// 1. Walidacja danych formularza (z pobraniem)
		if($this->validate())
                {
                    // 2. Przygotowanie mapy z parametrami wyszukiwania (nazwa_kolumny => wartość)
                    $search_params = []; //przygotowanie pustej struktury (aby była dostępna nawet gdy nie będzie zawierała wierszy)
                    if ( isset($this->form->surname) && strlen($this->form->surname) > 0) 
                    {
                            $search_params['surname[~]'] = $this->form->surname.'%'; // dodanie symbolu % zastępuje dowolny ciąg znaków na końcu
                    }

                    // 3. Pobranie listy rekordów z bazy danych
                    //przygotowanie frazy where na wypadek większej liczby parametrów
                    $num_params = sizeof($search_params);
                    if ($num_params > 1) 
                    {
                            $where = [ "AND" => &$search_params ];
                    } 
                    else 
                    {
                            $where = &$search_params;
                    }
                    //dodanie frazy sortującej po nazwisku
                    $where ["ORDER"] = "surname";
                    //wykonanie zapytania

                    try{
                            $this->records = App::getDB()->select("terminarz", [
                                            "clientid",
                                            "name",
                                            "surname",
                                            "deadline",
                                            "service",
                                            "delivery",
                                    ], $where );
                    } catch (\PDOException $e)
                    {
                            Utils::addErrorMessage('Wystąpił błąd podczas pobierania rekordów');
                            if (App::getConf()->debug) 
                                Utils::addErrorMessage($e->getMessage());			
                    }	
                }
		// 4. wygeneruj widok
		App::getSmarty()->assign('searchForm',$this->form); // dane formularza (wyszukiwania w tym wypadku)
		App::getSmarty()->assign('clients',$this->records);  // lista rekordów z bazy danych
		App::getSmarty()->display('schedulesView.tpl');
	}
	
}
