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
             <div class="container text-center">
                <br><br>
                <br><br>
                <div class="row">
                    <h2>Pomyślnie wylogowano z systemu</h2>
                    <p><a class="btn btn-action" href="{$conf->action_url}homeShow">Powrót do strony głównej</a></p>
                </div>
            </div>
            <div class="container">
            
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