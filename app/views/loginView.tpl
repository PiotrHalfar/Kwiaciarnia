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
                            <label for="login">login: </label>
                            <input id="login" type="text" name="login"/>
                        </div>
                        <div class="col">
                            <label for="password">hasło: </label>
                            <input id="password" type="password" name="password" /><br />
                        </div>
                        <br> 
                        <div class="col">
                            <input type="submit" value="zaloguj" class="btn btn-action btn-lg"/>
                        </div>
                    </fieldset>
                <input type="hidden" name="id" value="{$form->id}">
            </form>
        </header>
    </div>
    <div class="container">
        <div class="row">
            <div class="messages">
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
            </div>  
        </div>
    </div>
</body>
</html>