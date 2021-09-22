<!DOCTYPE html>
<html lang="pl">
<head>

    <meta charset="utf-8"/>
	<title>Kwiaciarnia</title>
	<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="{$conf->app_url}/css/bootstrap.min.css">
	<link rel="stylesheet" href="{$conf->app_url}/css/font-awesome.min.css">
	<link rel="stylesheet" href="{$conf->app_url}/css/bootstrap-theme.css" media="screen" >
	<link rel="stylesheet" href="{$conf->app_url}/css/main.css">
</head>
<body>
    <div class="navbar navbar-inverse navbar-static-top headroom" >
        <div class="container">
            <div class="navbar-header">
				<a href="{$conf->action_url}homeShow">
                                <img src="{$conf->app_url}/assets/images/KwiaciarniaLogo.png" alt="Kwiaciarnia Rybnik">
                                </a>
            </div>
            <ul class="nav navbar-nav pull-right">
                <br>
                <li><a href="{$conf->action_url}homeShow">Strona Główna</a></li>
                <li><a href="{$conf->action_url}priceListShow">Cennik</a></li>
                {if \core\RoleUtils::inRole("admin")}
                <li class="active"><a href="{$conf->action_url}schedulesShow">Terminarz</a></li>
                {/if}
                {if count($conf->roles)>0}
                <li><a href="{$conf->action_url}logout">Wyloguj</a></li>
                {else}
                <li><a href="{$conf->action_url}login">Zaloguj</a></li>
                {/if}
            </ul>
        </div>
    </div>
    <div class="container">
        <div>
            <form action="{$conf->action_root}clientSave" method="post">
                    <fieldset>
                        <header class="page-header">
                            <h1 class="page-title">Dane klienta</h1>
                        </header>
                       
                        <div class="col">
                            <label for="name">Imię</label><br>   
                            <input style="text-align:center" id="name" type="text" placeholder="imię klienta" name="name" value="{$form->name}"><br><br>
                        </div>
                        <div class="col">
                            <label for="surname">Nazwisko</label><br>
                            <input style="text-align:center" id="surname" type="text" placeholder="nazwisko klienta" name="surname" value="{$form->surname}"><br><br>
                        </div>
                        <div class="col">
                            <label for="deadline">Termin</label><br>
                            <input style="text-align:center" id="deadline" type="text" placeholder="termin wykonania" name="deadline" value="{$form->deadline}"><br><br>
                        </div>
                        <div class="col">
                            <label for="service">Usługa</label><br>
                            <input style="text-align:center" id="service" type="text" placeholder="rodzaj usługi" name="service" value="{$form->service}"><br><br>
                        </div>
                         <div class="col">
                            <label for="delivery">Dostawa</label><br>
                            <input style="text-align:center" id="delivery" type="text" placeholder="rodzaj dostawy" name="delivery" value="{$form->delivery}"><br><br>
                        </div>
                        <br>
                        <input type="submit" class="btn btn-action" value="Zapisz"/>
                        &nbsp
                        <a class="btn btn-action" href="{$conf->action_root}schedulesShow">Powrót</a>
                    </fieldset>
                <input type="hidden" name="id" value="{$form->id}">
            </form>	
        </div>
        <br>
    
    {if $msgs->isMessage()}
    <div class="messages bottom-margin">
        <ul>
        {foreach $msgs->getMessages() as $msg}
        {strip}
                <li class="msg {if $msg->isError()}error{/if} {if $msg->isWarning()}warning{/if} {if $msg->isInfo()}info{/if}">{$msg->text}</li>
        {/strip}
        {/foreach}
        </ul>
    </div>
    {/if}
    </div>

</body>