<?php

namespace app\controllers;

use core\App;
use core\Utils;
use core\RoleUtils;
use core\ParamUtils;
use app\forms\LoginForm;

class LoginControl {

    private $form;

    public function __construct() {
        //stworzenie potrzebnych obiektów
        $this->form = new LoginForm();
    }

   public function validate() {
        $this->form->login = ParamUtils::getFromRequest('login');
        $this->form->password = ParamUtils::getFromRequest('password');

        //nie ma sensu walidować dalej, gdy brak parametrów
        if (!isset($this->form->login))
            return false;

        // sprawdzenie, czy potrzebne wartości zostały przekazane
        if (empty(trim($this->form->login))) {
            Utils::addErrorMessage('Wprowadź login');
        }
       if (empty(trim($this->form->password))) {
            Utils::addErrorMessage('Wprowadź hasło');
        }

        //nie ma sensu walidować dalej, gdy brak wartości
        if (App::getMessages()->isError())
            return false;

        // sprawdzenie, czy dane logowania poprawne
        // (takie informacje najczęściej przechowuje się w bazie danych)
      

        return !App::getMessages()->isError();
    }
   
    public function action_loginShow() {
        $this->generateView();
    }
 
    public function action_login() 
    {       
        if($this->validate())
        {
            try {		
                $role = App::getDB()->get("logowanie", "role",[
                        "login" => $this->form->login,
                        "password" => $this->form->password,
                ]); $this->role = $role;
            } catch (\PDOException $e){
                    Utils::addErrorMessage('Wystąpił błąd podczas odczytu rekordu');
                    if (App::getConf()->debug) 
                        Utils::addErrorMessage($e->getMessage());			
            }       //sprawdza czy wczytano rekord, jesli pusty to wyswietl blad
                    if (empty($role)) {
                        Utils::addErrorMessage('Niepoprawne dane!');
                    }
                    //sprawdza czy wczytano rekord, jesli zawiera haslo to nadaj odpowiednia role z bazy
                    else{
                        RoleUtils::addRole($role);
                        App::getRouter()->redirectTo("homeShow");
                    }              
        }
        $this->generateView();
    }

    public function generateView() {
        App::getSmarty()->assign('form', $this->form); // dane formularza do widoku
        App::getSmarty()->display('loginView.tpl');
    }

}
