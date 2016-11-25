/* Toolbar, Text size and Auto page resize functions */
function getCookieVal (offset) {
  var endstr = document.cookie.indexOf (";", offset);
  if (endstr == -1)
    endstr = document.cookie.length;
  return unescape(document.cookie.substring(offset, endstr));
}
function GetCookie (name) {
  var arg = name + "=";
  var alen = arg.length;
  var clen = document.cookie.length;
  var i = 0;
  while (i < clen) {
    var j = i + alen;
    if (document.cookie.substring(i, j) == arg)
      return getCookieVal (j);
    i = document.cookie.indexOf(" ", i) + 1;
    if (i == 0) break; 
  }
  return null;
}
function SetCookie (name,value,expires,path,domain,secure) {
  document.cookie = name + "=" + escape (value) +
    ((expires) ? "; expires=" + expires.toGMTString() : "") +
    ((path) ? "; path=" + path : "") +
    ((domain) ? "; domain=" + domain : "") +
    ((secure) ? "; secure" : "");
}

function Browser_CSS( ) {
	var width= 0;
	if( typeof(window.innerWidth ) == 'number' ) {
		width = window.innerWidth;}
	else if( document.documentElement && document.documentElement.clientWidth ) {
		width = document.documentElement.clientWidth;} 
	else if( document.body && document.body.clientWidth ) {
		width = document.body.clientWidth;}
	if ( width > "1000" ) {
		document.write('<style>#main {width: 990px;}</style>');
	}
}
Browser_CSS( );
function WriteTextSize ( ) {
	var textsize = GetCookie('textsize');
	if(textsize != null) {
		document.write('<style type="text/css" media="screen" title="default">body {font-size:'+textsize+'%;}');
		if (textsize > 100) {
			document.write('.pagetools .textsize {background: url("/images/nav/cws/largertext.gif") no-repeat 0 0}');
			}
		document.write('</style>');
	}
}
WriteTextSize( );
function preload() {
  var d=document; if(d.images){ if(!d.p) d.p=new Array();
    var i,j=d.p.length,a=preload.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.p[j]=new Image; d.p[j++].src=a[i];}}
}

function swapImgRestore() {
  var i,x,a=document.sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function findObj(n, d) {
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function swapImage() {
  var i,j=0,x,a=swapImage.arguments; document.sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=findObj(a[i]))!=null){document.sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function printFriendlyURL( href ) {
	if(href.match("[\?]")) {
		return (href + "&printable");
	}else{
		return (href + "?printable");
	}
}

preload('/images/nav/cws/rghtbrkt.gif');
preload('/images/nav/cws/defaulttext.gif');
preload('/images/nav/cws/largertext.gif');

