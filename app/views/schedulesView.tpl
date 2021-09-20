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
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-static-top headroom" >
		<div class="container">
         
				<ul class="nav navbar-nav pull-right">
					<li><a href="{$conf->action_url}homeShow">Strona Główna</a></li>
					<li><a href="{$conf->action_url}priceListShow">Cennik</a></li>
                                        <li class="active"><a href="{$conf->action_url}schedulesShow">Terminarz</a></li>
                                        <li><a href="{$conf->action_url}logout">Wyloguj</a></li>
                                        
				</ul>

		</div>
                                        
	</div> 

	<div class="bottom-margin">
<form class="pure-form pure-form-stacked" action="{$conf->action_url}schedulesShow">
	<legend>Opcje wyszukiwania</legend>
	<fieldset>
		<input type="text" placeholder="nazwisko" name="sf_surname" value="{$searchForm->surname}" /><br />
		<button type="submit" class="pure-button pure-button-primary">Filtruj</button>
	</fieldset>
</form>
                
</div>	
                
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
                <div class="bottom-margin">
<a class="pure-button button-success" href="{$conf->action_root}clientNew">+ Nowa osoba</a>
</div>	

        <table id="tab_people" class="pure-table pure-table-bordered">
            <thead>
                    <tr>
                            <th>imię</th>
                            <th>nazwisko</th>
                            <th>termin</th>
                            <th>usługa</th>
                            <th>opcje</th>
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
		<td>
			<a class="button-small pure-button button-secondary" href="{$conf->action_url}clientEdit/{$p['clientid']}">Edytuj</a>
&nbsp;
			<a class="button-small pure-button button-warning" href="{$conf->action_url}clientDelete/{$p['clientid']}">Usuń</a>
		</td>
	</tr>
{/strip}
{/foreach}
</tbody>
</table>

	 <footer id="footer">
        <div class="footer2">
                <div class="container">
                        <div class="row">
                                <div class="col-md-12 widget">
                                        <div class="widget-body">
                                                <p class="text-right">
                                                        Copyright © 2021 Piotr Halfar
                                                </p>
                                        </div>
                                </div>
                        </div> 
                </div>
        </div>
    </footer>        
		




	
</body>
</html>