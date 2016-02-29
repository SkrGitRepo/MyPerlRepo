function e_onLoadEvent()
{
  e_displayLogin();
  e_promoCode();
}

var getElementWithId =
(
  function()
  {
    if (document.getElementById) { return ( function (id) { return document.getElementById(id); }); }
    else if(document.all) { return ( function (id) { return document.all[id]; }); }
    return (function(id){return null;});
  }
)();

function e_promoCode()
{
  if (window.location.search && window.location.search != "")
  {
    var q = window.location.search.substring (1, window.location.search.length).toLowerCase();  // lose leading ?
    var div = getElementWithId('promo');

    if (div)
    {
      if (q === "pc=gift")
      {
        div.innerHTML = "<p>Use promotional code GIFT when buying on our web site this month and get 50% discount.</p>";
      }
    }
  }
}

function e_dynamic_login_html()
{
	document.write('<div id="show-login" style="display:none;">');
	document.write('  <a class="nounderline" href="/cgi-bin/account/login.cgi">login</a> / <a class="nounderline" href="/cgi-bin/account/register.cgi">register</a>');
	document.write('</div>');
	document.write('<div id="show-logout"  style="display:none;">');
	document.write('  <a class="nounderline" href="/cgi-bin/account/logout.cgi">logout</a> / <a class="nounderline" href="/cgi-bin/account/profile_admin.cgi">your account</a>');
	document.write('  <div id="show-cart">/ <a class="nounderline" href="/cgi-bin/cart/view.cgi">show cart</a></div>');
	document.write('</div>');
}

function e_dynamic_login_html_fr()
{
	document.write('<div id="show-login" style="display:none;">');
	document.write('  <a class="nounderline" href="/cgi-bin/account/login.cgi">Connexion</a> / <a class="nounderline" href="/cgi-bin/account/register.cgi">Enregistrer</a>');
	document.write('</div>');
	document.write('<div id="show-logout"  style="display:none;">');
	document.write('  <a class="nounderline" href="/cgi-bin/account/logout.cgi">D&eacute;connexion</a> / <a class="nounderline" href="/cgi-bin/account/profile_admin.cgi">Votre compte</a>');
	document.write('  <div id="show-cart">/ <a class="nounderline" href="/cgi-bin/cart/view.cgi">Afficher le panier</a></div>');
	document.write('</div>');
}

function e_dynamic_login_html_fr()
{
	document.write('<div id="show-login" style="display:none;">');
	document.write('  <a class="nounderline" href="/cgi-bin/account/login.cgi">Connexion</a> / <a class="nounderline" href="/cgi-bin/account/register.cgi">Enregistrer</a>');
	document.write('</div>');
	document.write('<div id="show-logout"  style="display:none;">');
	document.write('  <a class="nounderline" href="/cgi-bin/account/logout.cgi">D&eacute;connexion</a> / <a class="nounderline" href="/cgi-bin/account/profile_admin.cgi">Votre compte</a>');
	document.write('  <div id="show-cart">/ <a class="nounderline" href="/cgi-bin/cart/view.cgi">Afficher le panier</a></div>');
	document.write('</div>');
}

function e_dynamic_login_html_de()
{
	document.write('<div id="show-login" style="display:none;">');
	document.write('  <a class="nounderline" href="/cgi-bin/account/login.cgi">Anmelden</a> / <a class="nounderline" href="/cgi-bin/account/register.cgi">Registrieren</a>');
	document.write('</div>');
	document.write('<div id="show-logout"  style="display:none;">');
	document.write('  <a class="nounderline" href="/cgi-bin/account/logout.cgi">Abmelden</a> / <a class="nounderline" href="/cgi-bin/account/profile_admin.cgi">Ihrem Konto</a>');
	document.write('  <div id="show-cart">/ <a class="nounderline" href="/cgi-bin/cart/view.cgi">Einkaufswagen</a></div>');
	document.write('</div>');
}

function e_dynamic_login_html_es()
{
	document.write('<div id="show-login" style="display:none;">');
	document.write('  <a class="nounderline" href="/cgi-bin/account/login.cgi">Acceder</a> / <a class="nounderline" href="/cgi-bin/account/register.cgi">Reg&iacute;strese</a>');
	document.write('</div>');
	document.write('<div id="show-logout"  style="display:none;">');
	document.write('  <a class="nounderline" href="/cgi-bin/account/logout.cgi">Salir</a> / <a class="nounderline" href="/cgi-bin/account/profile_admin.cgi">Mi Cuenta</a>');
	document.write('  <div id="show-cart">/ <a class="nounderline" href="/cgi-bin/cart/view.cgi">Revisar Cesta</a></div>');
	document.write('</div>');
}

function e_displayLogin()
{
	var s = e_getCookie('sessionid');

	if(s)
	{
		var v = s.substr(0, 1);
		if(v == 0)
		{
			e_setStyle('show-login', 'inline');
			e_setStyle('show-logout', 'none');
			e_setStyle('show-cart', 'none');
		}
		
		if(v & 1)
		{
			e_setStyle('show-login', 'none');
			e_setStyle('show-logout', 'inline');
		}
		else
		{
			e_setStyle('show-login', 'inline');
			e_setStyle('show-logout', 'none');
		}
		
		if(v & 1 && v & 2)
		{
			e_setStyle('show-cart', 'inline');
		}
		else
		{
			e_setStyle('show-cart', 'none');
		}
	}
	else
	{
		e_setStyle('show-login', 'inline');
		e_setStyle('show-logout', 'none');
		e_setStyle('show-cart', 'none');
	}
	
}

function e_setStyle(item, value)
{
	document.getElementById(item).style.display = value;
}


function e_setCookie(name, value, expires, path, domain, secure)
{
  document.cookie= name + "=" + escape(value) +
    ((expires) ? "; expires=" + expires.toGMTString() : "") +
    ((path) ? "; path=" + path : "") +
    ((domain) ? "; domain=" + domain : "") +
    ((secure) ? "; secure" : "");
}


function e_getCookie(item)
{
	var cookie = document.cookie;
	//alert(cookie + " - " + cookie.indexOf("logged_in"));
	var start = cookie.indexOf(item);
	if(start != -1)
	{
		var end   = cookie.indexOf(";", start);
		if(end == -1)
		{
			var cookie_val = cookie.substring(start + item.length + 1, cookie.length);
		}
		else
		{
			var cookie_val = cookie.substring(start + item.length + 1, end);
		}
	}
	//alert(cookie_val);
	return cookie_val;
}

function e_deleteCookie(name, path, domain)
{
	if (e_getCookie(name))
	{
		var out = name + "=" + 
		((path) ? "; path=" + path : "") +
		((domain) ? "; domain=" + domain : "") +
			"; expires=Thu, 01-Jan-70 00:00:01 GMT";
		document.cookie = out;		
	}
}

function e_deleteAllCookies()
{
	e_deleteCookie('logged_in', '/');
	e_deleteCookie('username', '/');
}

function isUndefined(v) {
  var undef;
  return v===undef;
}

var _popup_features = 'left=110,top=90,width=375,height=550,resizable=1,scrollbars=1,toolbar=0,status=0,location=0,directories=0,menubar=0';

function popup_security (filename, features) 
{
  if (isUndefined(features)) features = _popup_features;
  faq_window = window.open (filename, "faq_window", features)
  faq_window.focus();
}


