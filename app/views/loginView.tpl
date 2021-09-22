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
    
  
    <!-- Fixed navbar -->
    <div class="navbar navbar-inverse navbar-static-top headroom" >
        
        <div class="container">
            
            <div class="navbar-header">
				<a href="{$conf->action_url}homeShow">
                                <img src="{$conf->app_url}/assets/images/KwiaciarniaLogo.png" alt="Kwiaciarnia Rybnik">
                                </a>
			</div>
            
            <ul class="nav navbar-nav pull-right">
                <br>
                <li class="active"><a href="{$conf->action_url}homeShow">Strona Główna</a></li>
            </ul>
        </div>
    </div> 
    <div class="container text-center ">
        
            <form action="{$conf->action_url}login" method="post">
                <h1 class="lead">Logowanie do systemu</h1>
                    <fieldset>
                        <div class="col">
                            <label for="login">login: </label><br>
                            <input id="login" type="text" name="login"/><br><br>
                        </div>
                        <div class="col">
                            <label for="password">hasło: </label><br>
                            <input id="password" type="password" name="password" /><br />
                        </div>
                        <br> 
                        <div class="col">
                            <input type="submit" value="Zaloguj" class="btn btn-action btn-lg"/><br><br>
                            <p><a class="btn btn-action" href="{$conf->action_url}homeShow">Strona główna</a></p>
                        </div>
                    </fieldset>
                <input type="hidden" name="id" value="{$form->id}">
            </form>
    </div>
    
            <div class="container">
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
    <footer style=" position: absolute; bottom:0; width: 100%; height: 44px;" id="footer"> 
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