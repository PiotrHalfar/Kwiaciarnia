<?php
require_once 'init.php';


//To do

App::getRouter()->setDefaultRoute('homeShow'); // akcja/ścieżka domyślna
App::getRouter()->setLoginRoute('login'); // akcja/ścieżka na potrzeby logowania (przekierowanie, gdy nie ma dostępu)
//panels show
Utils::addRoute('homeShow',		'HomeControl');
Utils::addRoute('priceListShow',	'PriceListControl');
Utils::addRoute('schedulesShow',	'SchedulesControl', ['admin']);
//login
Utils::addRoute('loginShow',            'LoginControl');
Utils::addRoute('login',		'LoginControl');
Utils::addRoute('logout',		'LoginControl');
//pricelist
Utils::addRoute('itemNew',		'PriceListEditControl',	['admin']);
Utils::addRoute('itemEdit',		'PriceListEditControl',	['admin']);
Utils::addRoute('itemSave',		'PriceListEditControl',	['admin']);
Utils::addRoute('itemDelete',            'PriceListEditControl',['admin']);
//schedule
Utils::addRoute('clientNew',		'SchedulesEditControl',	['admin']);
Utils::addRoute('clientEdit',		'SchedulesEditControl',	['admin']);
Utils::addRoute('clientSave',		'SchedulesEditControl',	['admin']);
Utils::addRoute('clientDelete',         'SchedulesEditControl',	['admin']);

