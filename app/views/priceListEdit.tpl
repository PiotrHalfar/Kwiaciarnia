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
            <ul class="nav navbar-nav pull-right">
                <li><a href="{$conf->action_url}homeShow">Strona Główna</a></li>
                <li class="active"><a href="{$conf->action_url}priceListShow">Cennik</a></li>
                {if \core\RoleUtils::inRole("admin")}
                <li><a href="{$conf->action_url}schedulesShow">Terminarz</a></li>
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
        <div class="bottom-margin">
            <form action="{$conf->action_root}itemSave" method="post">
                <header class="page-header">
                    <h1 class="page-title">Dane produktu</h1>
                </header>
                <fieldset>
                    <div class="col">
                        <label for="itemname">produkt</label>
                        <input id="itemname" type="text" placeholder="produkt" name="itemname" value="{$form->itemname}">
                    </div>
                    <div class="col">
                        <label for="price">cena</label>
                        <input id="price" type="text" placeholder="cena" name="price" value="{$form->price}">
                    </div>
                    <br>
                    <div class="pure-controls">
                        <input type="submit" class="btn btn-action btn-lg" value="Zapisz"/>
                        &nbsp
                        <a class="btn btn-action btn-lg" href="{$conf->action_root}priceListShow">Powrót</a>
                    </div>
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