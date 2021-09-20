<html lang="pl">
<head>

    <meta charset="utf-8"/>
	<title>Kalkulator Kredytowy</title>
	<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="{$conf->app_url}/css/bootstrap.min.css">
	<link rel="stylesheet" href="{$conf->app_url}/css/font-awesome.min.css">
	<link rel="stylesheet" href="{$conf->app_url}/css/bootstrap-theme.css" media="screen" >
	<link rel="stylesheet" href="{$conf->app_url}/css/main.css">
</head>

<body>
    <div class="container">
        <header id="head">
        <form action="{$conf->action_url}login" method="post">
            <h1 class="lead">Logowanie do systemu</h1>
                <fieldset>
                <div class="col">
                                <label for="id_login">login: </label>
                                <input id="id_login" type="text" name="login"/>
                        </div>
                <div class="col">
                                <label for="id_pass">hasło: </label>
                                <input id="id_pass" type="password" name="pass" /><br />
                        </div>
                    <br> 
                        <div class="col">
                                <input type="submit" value="zaloguj" class="btn btn-action btn-lg"/>
                        </div>
                </fieldset>
        </form>
        </header>
    </div>
<div class="container">
    <div class="row">
<div class="messages">

{* wyświeltenie listy błędów, jeśli istnieją *}
{if $msgs->isError()}
	<h4>Wystąpiły błędy: </h4>
	<ol class="err">
	{foreach $msgs->getErrors() as $err}
	{strip}
		<li>{$err}</li>
	{/strip}
	{/foreach}
	</ol>
{/if}

{* wyświeltenie listy informacji, jeśli istnieją *}
{if $msgs->isInfo()}
	<h4>Informacje: </h4>
	<ol class="inf">
	{foreach $msgs->getInfos() as $inf}
	{strip}
		<li>{$inf}</li>
	{/strip}
	{/foreach}
	</ol>
{/if}

<br>  
    </div>  
    </div>
</div>
</body>
</html>