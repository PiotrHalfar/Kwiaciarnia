<?php

namespace app\controllers;

use core\App;

class LogoutControl
{
        public function action_logoutShow()
        {
                session_destroy();     
		$this->generateView();       
	}
	public function generateView()
        {        
            App::getSmarty()->display('logoutView.tpl');
        }
			
}