<?php
// W skrypcie definicji kontrolera nie trzeba dołączać problematycznego skryptu config.php,
// ponieważ będzie on użyty w miejscach, gdzie config.php zostanie już wywołany.

namespace app\controllers;

use core\App;

class HomeControl
{
    
        public function action_homeShow()
        {
		$this->generateView();
	}
	public function generateView()
        {        
            App::getSmarty()->display('homeView.tpl');
        }
			
}
