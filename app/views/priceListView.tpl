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
                <li><a href="{$conf->action_url}logoutShow">Wyloguj</a></li>
                {else}
                <li><a href="{$conf->action_url}login">Zaloguj</a></li>
                {/if}
            </ul>
        </div>
    </div> 
    <div  class="container text-center">
	<div>
            <form action="{$conf->action_url}priceListShow">
                <header class="page-header">
                    <h1 class="page-title">Cennik</h1>
                </header>
                <fieldset>
                    <div class="col">
                        <label for="period">Wyszukaj produkt: </label>
                        <input style="text-align:center" type="text" placeholder="nazwa produktu" name="sf_itemname" value="{$searchForm->itemname}" />
                        &nbsp;
                        <button type="submit" class="btn btn-action">Filtruj</button>
                    </div>
                </fieldset>
            </form>      
        </div>	
                        
       {if $msgs->isMessage()}
           <br>
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
        {if count($conf->roles)>0}
        <a align="center" class="btn btn-action btn-lg" href="{$conf->action_root}itemNew">Dodaj nowy przedmiot</a>
        {/if}
        <br>
        <br>
      
        <table align="center" class="table table-bordered table-hover" style="text-align: center; width:60%">              
            <thead>
                    <tr>   
                        <th style="text-align:center">Produkt</th>
                        <th style="text-align:center">Cena</th>
                        {if count($conf->roles)>0}
                        <th style="text-align:center">Opcje</th>
                        {/if}
                    </tr>
            </thead>
            <tbody>
                {foreach $items as $p}
                {strip}
                    <tr>
                        <td>{$p["itemname"]}</td>
                        <td>{$p["price"]} zł</td>
                        {if count($conf->roles)>0}
                        <td>
                            <a class="btn btn-action" href="{$conf->action_url}itemEdit/{$p['itemid']}">Edytuj</a>
                            &nbsp;
                            <a class="btn btn-action" href="{$conf->action_url}itemDelete/{$p['itemid']}">Usuń</a>
                        </td>
                        {/if}
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