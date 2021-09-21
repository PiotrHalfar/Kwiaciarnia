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
            Utils::addErrorMessage('Nie podano loginu');
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
//           try {
//                $connection = App::getDB()->select("logowanie","login","password",[
//
//                "login" => "admin" && "user", "password" => "admin" && "user"]);
//               }catch (\PDOException $e){
//				Utils::addErrorMessage('Wystąpił błąd podczas odczytu rekordu');
//				if (App::getConf()->debug) 
//                                    Utils::addErrorMessage($e->getMessage());			
//                 }  
//            
      if($this->validate()&&((trim($this->form->login == "admin")&& (trim($this->form->password == "admin")))||(trim($this->form->login == "user")&& (trim($this->form->password == "user")))))
      {
        try {		
				$record = App::getDB()->get("logowanie", "*",[
					"login" => $this->form->login,
                                        "password" => $this->form->password,
				]); $this->role = $record['role'];
			} catch (\PDOException $e){
				Utils::addErrorMessage('Wystąpił błąd podczas odczytu rekordu');
				if (App::getConf()->debug) 
                                    Utils::addErrorMessage($e->getMessage());			
			}                      
                        //nadanie roli z bazy danych
                        RoleUtils::addRole($this->role);
                        App::getRouter()->redirectTo("homeShow");
                        }
       else {
           Utils::addErrorMessage('złe dane');
           $this->generateView();
       }              
    }

    public function action_logout() {
        // 1. zakończenie sesji
        session_destroy();
        // 2. idź na stronę główną - system automatycznie przekieruje do strony logowania
        App::getRouter()->redirectTo('homeShow');
    }

    public function generateView() {
        App::getSmarty()->assign('form', $this->form); // dane formularza do widoku
        App::getSmarty()->display('loginView.tpl');
    }

}
