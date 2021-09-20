<div class="bottom-margin">
<form action="{$conf->action_root}itemSave" method="post" class="pure-form pure-form-aligned">
	<fieldset>
		<legend>Dane produktu</legend>
		<div class="pure-control-group">
            <label for="itemname">produkt</label>
            <input id="itemname" type="text" placeholder="produkt" name="itemname" value="{$form->itemname}">
        </div>
		<div class="pure-control-group">
            <label for="price">cena</label>
            <input id="price" type="text" placeholder="cena" name="price" value="{$form->price}">
        </div>

		<div class="pure-controls">
			<input type="submit" class="pure-button pure-button-primary" value="Zapisz"/>
			<a class="pure-button button-secondary" href="{$conf->action_root}priceListShow">Powrót</a>
		</div>
	</fieldset>
    <input type="hidden" name="id" value="{$form->id}">
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