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
        <div>
            <form action="{$conf->action_root}itemSave" method="post">
                <header class="page-header">
                    <h1 class="page-title">Dane produktu</h1>
                </header>
                <fieldset>
                    <div class="col">
                        <label for="itemname">Produkt</label><br>
                        <input style="text-align:center" id="itemname" type="text" placeholder=" nazwa produktu" name="itemname" value="{$form->itemname}"><br><br>
                    </div>
                    <div class="col">
                        <label for="price">Cena</label><br>
                        <input style="text-align:center" id="price" type="text" placeholder="cena produktu" name="price" value="{$form->price}"><br><br>
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

</body>