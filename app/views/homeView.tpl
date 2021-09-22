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
            <div class="navbar-header">
				<a href="{$conf->action_url}homeShow">
                                <img src="{$conf->app_url}/assets/images/KwiaciarniaLogo.png" alt="Kwiaciarnia Rybnik">
                                </a>
			</div>
            <ul class="nav navbar-nav pull-right">
                <br>
                <li class="active"><a href="{$conf->action_url}homeShow">Strona Główna</a></li>
                <li><a href="{$conf->action_url}priceListShow">Cennik</a></li>
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

                
     <div class="container text-center">
         <br><br>
         <br><br>
		
                <div class="row">
                        <h1>Witaj na stronie kwiaciarni</h1>
                        <p class="tagline">Na stronie sprawdzisz listę naszych produktów oraz ich ceny</p>
                        <p><a class="btn btn-action btn-lg" href="{$conf->action_url}priceListShow">Cennik</a></p>
                </div>
	</div>                    
    <footer style=" position: absolute; bottom:0; width: 100%; height: 222.5px;" id="footer" >
        <div class="footer1">
			<div class="container">
				<div class="row">
					
					<div class="col-md-8 widget container text-left">
						<h3 class="widget-title">Kontakt</h3>
						<div class="widget-body">
							<p>+48 111 222 333<br>
								<a href="mailto:#">kwiaciarniaRybnik@gmail.com</a><br>
								<br>
								Rybnik Polska
							</p>	
						</div>
					</div>

					

					<div class="col-md-4 widget container text-right">	
                                            <h3 class="widget-title">Oferujemy</h3>
						<div class="widget-body">
							<p>- kwiaty cięte i doniczkowe - upominki - kartki okolicznościowe - wiązanki okolicznościowe - florystyka ślubna - florystyka żałobna.</p>						
                                                        <p>U nas zapłacisz kartą.</p>
                                                </div>
					</div>

				</div> <!-- /row of widgets -->
                                
			</div>
		</div>
        
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