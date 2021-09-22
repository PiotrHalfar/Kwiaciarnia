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
                <li class="active"><a href="{$conf->action_url}schedulesShow">Terminarz</a></li>
                {if count($conf->roles)>0}
                <li><a href="{$conf->action_url}logoutShow">Wyloguj</a></li>
                {else}
                <li><a href="{$conf->action_url}login">Zaloguj</a></li>
                {/if}
            </ul>
        </div>                                   
    </div> 
    <div class="container">
	<div>
            <form action="{$conf->action_url}schedulesShow">
                <header class="page-header">
                    <h1 class="page-title">Terminarz</h1>
                </header>
                <fieldset>
                    <div class="col">
                        <label for="period">Wyszukaj klienta: </label>
                        <input type="text" placeholder="nazwisko klienta" name="sf_surname" value="{$searchForm->surname}" />
                        &nbsp;
                        <button type="submit" class="btn btn-action">Filtruj</button>
                    </div>      
                </fieldset>
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
        <br>
        <a class="btn btn-action btn-lg" href="{$conf->action_root}clientNew">Dodaj nowego klienta</a>
        <br>
        <br>
        <table class="table" style="text-align:center">
            <thead>
                <tr>
                    <th style="text-align:center">Imię</th>
                    <th style="text-align:center">Nazwisko</th>
                    <th style="text-align:center">Termin</th>
                    <th style="text-align:center">Usługa</th>
                    <th style="text-align:center">Dostawa</th>
                    <th style="text-align:center">Opcje</th>
                </tr>
            </thead>
         <tbody>
        {foreach $clients as $p}
        {strip}
            <tr>
                <td>{$p["name"]}</td>
                <td>{$p["surname"]}</td>
                <td>{$p["deadline"]}</td>
                <td>{$p["service"]}</td>
                <td>{$p["delivery"]}</td>
                <td>
                    <a class="btn btn-action" href="{$conf->action_url}clientEdit/{$p['clientid']}">Edytuj</a>
                    &nbsp;
                    <a class="btn btn-action" href="{$conf->action_url}clientDelete/{$p['clientid']}">Usuń</a>
                </td>
            </tr>
        {/strip}
        {/foreach}
        </tbody>
        </table>
    </div>
    <footer id="footer" class="top-space">
        <div class="footer2">
                <div class="container">
                    <div class="row">
                        <div class="widget-body">
                            <p class="text-right">
                                Copyright 2021 | Piotr Halfar 
                            </p>
                        </div>
                    </div> 
                </div>
            </div>
    </footer>	
</body>
</html>