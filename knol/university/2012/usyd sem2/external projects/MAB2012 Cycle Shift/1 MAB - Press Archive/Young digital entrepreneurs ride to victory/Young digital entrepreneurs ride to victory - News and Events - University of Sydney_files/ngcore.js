/**
 * $Id: ngcore.js,v 1.2 2005/11/14 00:07:59 ajessup Exp $
 *
 * Javascript Library v0.1
 *
 * Copyright Noggin <info@noggin.com.au> 2003,2004
 *
 * Last Updated: 12/Sep/2004
 *      Depends: Javascript >= 1.2
 *
 * @author Travers Carter <tcarter@noggin.com.au>
 *
 * Changelog:
 *   12/Sep/2004 TC: Initial version
 *
 * TODO
 * -----------------
 * - Date.parse2() - Context sensitive date parser
 * - Date.fullYear()
 * - Number.format()
 * - Number.parse()
 */

var __G = new Object(); // Engine globals
var N = null;
var T = true;
var F = false;

function NG() {}

NG.rev = '$Id: ngcore.js,v 1.2 2005/11/14 00:07:59 ajessup Exp $';

// Core functions
function isFunc(x) { return typeof x == 'function' || (isObj(x) && String(x).search(/^\s*function [a-zA-Z]+\(\) \{\s+\[native code\]\s+\}\s*$/) != -1 ? T : F); }
function isDef(x) { return x != 'undefined'; }
function isObj(x) { return typeof x == 'object' && !isNull(x); }
function isArr(x) { return isObj(x) && x.constructor == Array; }
function isStr(x) { return typeof x == 'string'; }
function isNum(x) { return typeof x == 'number'; }
function isInt(x) { return typeof x == 'number' && Math.floor(x) == x; }
function isIntVal(x) { return isInt(x) || (isStr(x) && x.search(/^[\-\+]?[1-9][0-9]*$/) != -1); }
function isRegex(x) { return (x && isFunc(x.test)) || (isObj(x) && x.constructor == RegExp); }
function isNull(x) { return x === N; }
function isId(x) { return isIntVal(x) && x>=1; }
function ifnull() { var a=arguments; for (var i=0; i<a.length; i++) if (a[i] !== N) return a[i]; return N; }
function ifnot() { var a=arguments; for (var i=0; i<a.length; i++) if (a[i]) return a[i]; return N; }

NG.dump = function (x) { var s = ''; for (var i in x) s += i + ' = ' +x[i]+'\n'; alert(s); }

//--------------- Forwards compatibility / Browser bugfixes ------------------------


// Browser Bugfix - Gecko 64bit
// TODO: Test Math.exp() & Math.log() on a broken Gecko
if (Math.pow(2,2) == 0) {
	Math.pow = function (b,p) {
		if (p == 0) return 1;
		var pi = Math.floor(Math.abs(p))
		var pf = Math.abs(p)-pi;
		var r = 1;
		for (var i=0; i<pi; i++) r*=b; // Integer component
		if (pf != 0 && b != 1) r *= Math.exp(Math.log(b)*pf); // Fractional component
		if (p < 0) r = 1/r; // Reciprocal if pow -ve
		return r;
	}
}

if (!isFunc(Array.prototype.splice)) {
	Array.prototype.splice = function (at, del) {
		var al = arguments.length-2, d = al-del, nl = this.length+d;
		var rm = this.slice(at, at+del);
		if (d <= 0) {
			for (i=at; i-at<al; i++) this[i] = arguments[i-at+2];
			if (d < 0) {
				for (i++; i <= nl; i++) this[i+d] = this[i];
			}
		} else {
			for (i=nl-1; i >= at+al; i--) this[i] = this[i-d];
			for (i=0; i<al; i++) this[at+i] = arguments[i+2];
		}
		this.length = nl;
		return rm;
	};
}
if (!isFunc(Array.prototype.pop)) { Array.prototype.pop = function () { return (this.splice(this.length-1, 1))[0]; } }
if (!isFunc(Array.prototype.push)) { Array.prototype.push = function () { this.splice(this.length, 0, arguments); return this.length; }}
if (!isFunc(Array.prototype.shift)) { Array.prototype.shift = function () { return (this.splice(0, 1))[0]; }}
if (!isFunc(Array.prototype.unshift)) { Array.prototype.unshift = function () { this.splice(0, 0, arguments); return this.length; }}

if (!isFunc(Array.prototype.search)) {
	Array.prototype.search = function (element) {
		for (var i = 0; i < this.length; i++) if (this[i] === element) return i;
		return -1;
	}
}

if (!isFunc(Number.prototype.toFixed)) {
	Number.prototype.toFixed = function (l) {
		if (l<=0) return Math.round(this).toString();
		var p = this.toString().split('\.',2);
		if (p[1].length < l) {
			p[1] += str_repeat('0', l-p[1].length);
		} else if (p[1].length > l) {
			p[1] = Math.round(Number(p[1].substr(0,l)+'.'+p[1].substr(l))).toString();
		}
		return p.join('.');
	}
}
//TODO: Finish toPrecision / toExponential
// if (!isFunc(Number.prototype.toPrecision2)) {
// 	Number.prototype.toPrecision2 = function (l) {
// 		var p = this.toString().split(/\./,2);
// 		if (p[0].length+p[1].length == l) {
// 			return p.join('.');
// 		} else if (p[0].length <= l) {
// 			return this.toFixed(l-p[0].length);
// 		} else {
// 			return this.toString();
// 		}
// 	}
// }
// if (!isFunc(Number.prototype.toExponential2)) {
// 	Number.prototype.toExponential2 = function (l) {
// 		var p = this.toString().split(/\./,2);
// 		return p[0].charAt(0)+'.'+p[0].substr(1)+p[1]+'+e'+(p[0].length-1)
// 	}
// }

if (!isFunc(Function.prototype.apply)) {
	Function.prototype.apply = function (o,a) {
		var r, n = '__NGapply';
		o[n] = this;
		switch (a.length) {
			case 0: r = o[n](); break;
			case 1: r = o[n](a[0]); break;
			case 2: r = o[n](a[0],a[1]); break;
			case 3: r = o[n](a[0],a[1],a[2]); break;
			case 4: r = o[n](a[0],a[1],a[2],a[3]); break;
			default:
				var e = 'r = o[n](a[0]';
				for (var i=0; i<a.length; i++) e += ',a['+i+']';
				eval(e + ');');
		}
		delete o[n];
		return r;
	}
}
if (!isFunc(Function.prototype.call)) {
	Function.prototype.call = function (o) { return this.apply(o,arguments.slice(1)); }
}

//-------------- New functionality for native objects  --------------------

Array.prototype.unset = function (i) { if (isInt(i) && i >= 0 && i < this.length) this.splice(i,1); }
Array.prototype.map = function (f) { for (var i=0; i<this.length; i++) this[i] = f(this[i]); }

Object.prototype.clone = function () { var i,o = new this.constructor(); for (i in this) o[i] = this[i]; return o; }

String.prototype.repeat = function (n) {var s=''; for (var i=0; i<n; i++) s += this; return s;}
String.prototype.normalize_nl = function (nl) { var s = this.replace(/\r\n/g, '\n').replace(/\r/g, '\n'); return (nl != '\n' ? s.replace(/\n/g, nl) : s); }
String.prototype.nl2unix = function () { return this.normalize_nl('\n'); }
String.prototype.nl2dos = function () { return this.normalize_nl('\r\n'); }
String.prototype.nl2mac = function () { return this.normalize_nl('\r'); }
String.prototype.span = function (s) { for (var i=0; i<this.length && s.indexOf(this.charAt(i)) != -1; i++); return i; }
String.prototype.insert = function (v,p) { return this.substr(0,p)+v+this.substr(p); }

Number.prototype.ordinal = function (show) {
	if (!isDef(typeof show)) show = T;
	var s = this.toString().substr(-2);
	var n = (show ? this : '');
	if (s.length == 2 && (s.substr(0, 1) == '1')) return n+'th';
	switch (s.substr(s.length-1, 1)) {
		case '1':  return n+'st'; break;
		case '2':  return n+'nd'; break;
		case '3':  return n+'rd'; break;
		default: return n+'th'; break;
	}
}
if (!isFunc(Number.prototype.toFixed)) {
	Number.prototype.toFixed = function (l) {
		if (!isDef(typeof l) || l == 0) return Math.round(this).toString();
		var v=Math.abs(this), i=Math.floor(v), d=Math.round((v-i)*Math.pow(10,l)).toString();
		d = '0'.repeat(l-d.length+1)+d;
		d = d.insert('.', d.length-l);
		i += parseInt(d);
		d = d.substr(d.indexOf('.')+1);
		return ((this < 0) ? '-' : '') + i+'.'+d;
	}
}

//------------------ NG scoped functions --------------------

NG.round = function (v,d) { if (arguments.length < 2) d = 0; return new Number(v).toFixed(d); }

NG.point = function (x,y) {
	this.x = parseInt(x);
	this.y = parseInt(y);
}

NG.getPagePos = function (node) {
	var r,t,p = new NG.point(node.offsetLeft, node.offsetTop);
	if (node.offsetParent) {
		t = NG.getPagePos(node.offsetParent);
		p.x += t.x;
		p.y += t.y;
	} else if (node.tagName == 'BODY' && isDef(typeof node.leftMargin) && NG.ua.is('MACIE')) {
		p.x += parseInt((r = node.currentStyle.marginLeft.match(/([0-9]+)px/)) ? r[1] : node.leftMargin);
		p.y += parseInt((r = node.currentStyle.marginTop.match(/([0-9]+)px/)) ? r[1] : node.topMargin);
	}
	return p;
}

NG.include = function (uri, force) {
	if (!isObj(__G['includes'])) __G['includes'] = new Object();
	if (!force && isDef(typeof __G['includes'][uri])) return F;
	__G['includes'][uri] = T;
	document.writeln('<scr'+'ipt type="text/javascript" language="Javascript1.2" src="'+uri+'"></scr'+'ipt>');
	return T;
}

NG.imgPreload = function (url) { new Image().src = url; }

NG.rollover = function(img,altSrc,preload) {
	if (!isDef(typeof img.onmouseout) || isNull(img.onmouseout)) {
		img.altSrc = altSrc;
		img.origSrc = img.src;
		if (preload) NG.imgPreload(img.altSrc);
		img.onmouseout = function out() { this.src = this.origSrc; }
	}
	img.src = img.altSrc;
}

NG.attachRollovers = function(preload) {
	if (arguments.length == 0) preload = true;
	var i,s,imgs = document.getElementsByTagName('IMG');
	function over() { NG.rollover(this,this.getAttribute('altsrc')); }
	for (i = 0; i < imgs.length; i++) {
		s = imgs[i].getAttribute('altsrc');
		if (isStr(s) && s != '') {
			if (preload) NG.imgPreload(s);
			imgs[i].onmouseover = over;
		}
	}
}

function userAgent() {
	this.App = N;
	this.AppVer = [];
	this.Engine = N;
	this.EngineVer = [];
	this.OS = N;
	this.OSRel = N;
	this.OSVer = [];
	this.Arch = N;

	var n = navigator;
	var p = n.userAgent.indexOf('(');
	var a = n.userAgent.substr(p, n.userAgent.length-p);

	if ((r = a.match(/ Opera ([\.0-9]+)/))) {
		this.App = 'Opera';
		this.AppVer = r[1].split('.');
		this.Engine = 'OPERA';
		this.EngineVer = r[1].split('.');
	} else if (a.indexOf('(KHTML, like Gecko)') != -1 || (r = a.match(/ KHTML\/([\.0-9]+) \(like Gecko\)/))) {
		this.Engine = 'KHTML';
		this.EngineVer = r ? r[1].split('.') : N;
		if ((r = a.match(/ Konqueror\/([\.0-9]+); /))) {
			this.App = 'Konqueror';
			this.AppVer = r[1].split('.');
		} else if ((r = a.match(/ Safari\/([\.0-9]+)( |$)/))) {
			this.App = 'Safari';
			this.AppVer = r[1].split('.');
			if (isNull(this.EngineVer)) this.EngineVer = this.AppVer;
		}
	} else if (n.product && n.product == 'Gecko') {
		this.Engine = 'GECKO';
		this.EngineVer = n.productSub;
		if ((r = a.match(/ (Firefox|Camino|Netscape6)\/([0-9]+(\.[0-9]+)*)( |$)/))) {
			this.App = r[1].replace(/6$/,'');
			this.AppVer = r[2].split('.');
		} else if ((r = a.match(/[;\(] rv:([\.0-9]+)[ \)]/))) {
			this.App = 'Mozilla';
			this.AppVer = r[1].split('.');
		} else if (n.vendor && n.vendor.length > 0) {
			this.App = n.vendor;
			this.AppVer = n.vendorSub.split('.');
		}
	} else if ((r = a.match(/[;\(] ?MSIE ([\.0-9]+)[;\)]/))) {
		if (a.search('Mac') != -1) { // Check for Mac
			this.Engine = 'MACIE';
		} else {
			this.Engine = 'MSIE';
		}
		this.EngineVer = r[1].split('.');
		this.App = n.appName;
		this.AppVer = this.EngineVer;
	} else if ((r = n.userAgent.match(/^Mozilla\/([\.0-9]+)/)) && r[1] < 5) {
		this.Engine = 'NS4';
		this.EngineVer = r[1];
		this.App = 'Netscape';
		this.AppVer = r[1];
	}

	var p = n.platform ? n.platform : N;
	if (p && p.search(/^Linux.*/) != -1) {
		this.OS='Unix';
		this.OSRel='Linux';
		if (p.search(/^Linux i[0-9]86/) != -1) {
			this.Arch = 'x86';
		}
	} else if (p == 'Win32') {
		this.OS='Win';
		if (n.oscpu && (r = n.oscpu.match(/^Win(dows)? ?(95|98|NT)?( ?[0-9]+\.[0-9]+)?/))) {
			this.OSRel = r[2];
			this.OSVer = r[3].split('.');
		} else if ((r = n.appVersion.match(/(\(|; ?)Win(dows)? ?(95|98|NT)?( ?[0-9]+\.[0-9]+)?/))) {
			this.OSRel = r[3];
			this.OSVer = r[4].split('.');
		}
		// May be dangerous assumption, NT on Alpha, x86_64
		this.Arch = n.cpuClass ? n.cpuClass : 'x86';
	} else if (p == 'MacPPC') {
		this.OS = 'MacOS';
		this.Arch = 'PPC';
		if (p.search(/ Mac OS X /)) {
			this.OSRel = 'X';
			this.OSVer = [10];
		}
	} else if (p && (r = p.match(/^(SunOS) (.*)/))) {
		this.OS = r[1];
		this.Arch = r[2];
	}

}

NG.ua = function () {}

NG.ua.get = function () {
	if (!isObj(__G['userAgent'])) __G['userAgent'] = new userAgent();
	return __G['userAgent'];
}


NG.ua.cmp = function (v1, cmp, v2) {
	if (!isArr(v1)) v1 = String(v1).split('.');
	if (!isArr(v2)) v2 = String(v2).split('.');

	v1.map(parseInt);
	v2.map(parseInt);

	var cl = Math.min(v1.length,v2.length);

	for (var i=0; i<cl; i++) {
		switch (cmp) {
			case '>':
			case '>=':
				if (v1[i] > v2[i]) return T;
				if (v1[i] < v2[i]) return F;
				break;
			case '==':
			case '=':
				if (v1[i] != v2[i]) return F;
				break;
			case '<':
			case '<=':
				if (v1[i] > v2[i]) return F;
				if (v1[i] < v2[i]) return T;
				break;
			case '!=':
				if (v1[i] != v2[i]) return T;
				break;
		}
	}
	switch (cmp) {
		case '>=': if (v1.length == v2.length) return T;
		case '>': return (v1.length > v2.length);
		case '=':
		case '==': return (v1.length == v2.length);
		case '<=': if (v1.length == v2.length) return T;
		case '<': return (v1.length < v2.length);
		case '!=': return (v1.length != v2.length);
	}
}

NG.ua.isCmp = function (want, have) { return isRegex(want) ? want.test(have) : have == want; }

NG.ua.isEng = function (eng, engVer, cmp) {
	var a = arguments, ua = NG.ua.get();
	if (a.length < 3) var cmp = '=';
	if (a.length > 0 && !isNull(eng) && ua.Engine != eng) return F;
	if (a.length > 1 && !isNull(engVer) && !NG.ua.cmp(ua.EngineVer, cmp, engVer)) return F;
	return T;
}

NG.ua.isApp = function (app, appVer, cmp) {
	var a = arguments, ua = NG.ua.get();
	if (a.length < 3) var cmp = '=';
	if (a.length > 0 && !isNull(app) && !NG.ua.isCmp(app, ua.App)) return F;
	if (a.length > 1 && !isNull(appVer) && !NG.ua.cmp(ua.AppVer, cmp, appVer)) return F;
	return T;
}

NG.ua.isOS = function (os, osRel, osVer, arch, cmp) {
	var a = arguments, ua = NG.ua.get();
	if (a.length < 5) var cmp = '=';
	if (a.length > 0 && !isNull(os) && ua.OS != os) return F;
	if (a.length > 1 && !isNull(osRel) && ua.OSRel != osRel) return F;
	if (a.length > 2 && !isNull(osVer) && !NG.ua.cmp(ua.osVer, cmp, osVer)) return F;
	if (a.length > 3 && !isNull(arch) && ua.Arch != arch) return F;
	return T;
}

NG.ua.is = function (eng, engVer, app, appVer, cmp) { return (NG.ua.isEng(eng,engVer,cmp) && NG.ua.isApp(app,appVer,cmp)); }

NG.ua.hasPlugin = function (name, ver) {
	//TODO Implement this
}

NG.popup = function () {
	NG.popup.open.apply(NG.popup, arguments);
	return false;
}

NG.popup.open = function (a) {
	if (!isDef(typeof a)) a = '';
	if (!isStr(a)) a = a.href;
	if (!isObj(__G['popup'])) __G['popup'] = new Object();
	var g=arguments,s='',i,d,w,o=(g.length > 1 && isObj(g[g.length-1]) ? g[g.length-1].clone() : new Object());
	if (g.length >= 2 && isInt(g[1])) o.width = g[1];
	if (g.length >= 3 && isInt(g[2])) o.height = g[2];
	d = {'width':600,'height':400,'toolbars':'no','scrollbars':'yes','resizable':'yes'};
	for (i in d) if (!isDef(typeof o[i])) o[i] = d[i];
	if (isDef(typeof o.modal) && !NG.popup.isClosed(__G['popup']['modalWindow'])) return null;
	if (isDef(typeof o.modal)) o.dependant = N;
	if (isDef(typeof o.name)) {
		w = o.name;
		delete o.name;
	} else {
		w = a.replace(/[^a-zA-Z0-9_]/g, '');
	}
	if (isDef(typeof o.arg)) {
		if (!isObj(__G['popup']['args'])) __G['popup']['args'] = new Object();
		__G['popup']['args'][w] = o.arg;
		delete o.arg;
	}
	for (i in o) {
		if (isStr(o[i]) || isInt(o[i])) s += (s == '' ? '' : ',')+i+'='+o[i];
		else if (isNull(o[i])) s += (s == '' ? '' : ',')+i;
	}
	i = window.open(a, w, s);
	i.focus();
	if (isDef(typeof o.modal)) {
		__G['popup']['modalWindow'] = i;
		NG.popup.focusModal.install(window.top);
	}
	if (isDef(typeof o.dependant)) {
		if (!isObj(__G['popup']['dependantWindows'])) __G['popup']['dependantWindows'] = new Object();
		__G['popup']['dependantWindows'][w] = i;
		NG.addEventListener(window, 'unload', NG.popup.closeDependant);
	}
	return i;
}

NG.unpopup = function (reload) {
	if (NG.popup.hasOpener()) {
		if (arguments.length == 0 || reload) window.opener.location.reload();
		window.opener.focus();
	}
	window.close();
}

NG.popup.isClosed = function (win) { return (!isObj(win) || win.closed); }
NG.popup.hasOpener = function () { return !NG.popup.isClosed(window.opener); }

NG.popup.getArg = function () {
	if (!NG.popup.hasOpener()) return N;
	var o = window.opener;
	if (isObj(o.__G) && isObj(o.__G['popup']) && isObj(o.__G['popup']['args']) && isDef(typeof o.__G['popup']['args'][window.name])) {
		return o.__G['popup']['args'][window.name];
	}
	return N;
}

NG.popup.focusModal = function (e) {
	if (isObj(__G['popup']) && !NG.popup.isClosed(__G['popup']['modalWindow'])) {
		__G['popup']['modalWindow'].focus();
		NG.stopPropagation(e);
		return false;
	} else {
		NG.popup.focusModal.uninstall(window.top);
	}
}

NG.popup.focusModal.install = function (win) {
	NG.addEventListener(win, 'focus', NG.popup.focusModal);
	for (var i = 0; i < win.frames.length; i++) NG.popup.focusModal.install(win.frames[i]);
}

NG.popup.focusModal.uninstall = function (win) {
	NG.removeEventListener(win, 'focus', NG.popup.focusModal);
	for (var i = 0; i < win.frames.length; i++) NG.popup.focusModal.uninstall(win.frames[i]);
}

NG.popup.closeDependant = function () {
	if (!isObj(__G['popup']) || !isObj(__G['popup']['dependantWindows'])) return;
	var d = __G['popup']['dependantWindows'];
	for (var w in d) if (!NG.popup.isClosed(d[w])) d[w].close();
}

NG.heightToContent = function () {
	if (NG.ua.isEng('GECKO')) {
		window.innerHeight = Math.min(document.body.scrollHeight,(document.body.offsetTop*2)+document.body.offsetHeight,window.screen.availHeight);
	} else if (NG.ua.isEng('MSIE') || NG.ua.isEng('MACIE')) {
		window.resizeBy(0,-1*(document.body.scrollHeight-100));
		window.resizeBy(0,Math.min(window.screen.availHeight-100,document.body.scrollHeight-(document.body.clientHeight+(document.body.clientTop*2))));
	} else if (NG.ua.isEng('KHTML')) {
		window.resizeBy(0,-1*(document.body.scrollHeight-100));
		window.resizeBy(0,Math.min(window.screen.availHeight-100,document.body.scrollHeight-window.innerHeight));
	} else if (isFunc(window.sizeToContent)) {
		window.sizeToContent();
	}
}

NG.addEventListener = function (node, eventName, func) {
	if (eventName == 'sglclick') {
		if (!isFunc(NG.addTrigger)) return;
		if (!isObj(node.NGEventListener)) node.NGEventListener = new Object();
		var c = NG.addTrigger(node, 'click', func, 250);
		var d = NG.addTrigger(node, 'dblclick', NG.cancelTimeout, N, [c]);
		function e(e,f,c,d) { this.e = e; this.f = f; this.c = c; this.d = d; }
		node.NGEventListener[node.NGEventListener.length] = new e(eventName,func,c,d);
	} else if (isFunc(node.addEventListener) && (eventName != 'dblclick' || !NG.ua.is('KHTML'))) {
		return node.addEventListener(eventName, func, F);
/*	} else if (isFunc(node.attachEvent)) {
		if (!isObj(node.NGEventListener)) node.NGEventListener = new Object();
		if (!isArr(node.NGEventListener[eventName])) node.NGEventListener[eventName] = new Array();
		node.NGEventListener[eventName][node.NGEventListener[eventName].length] = func;
		var tmpFunc = function () {
			var node = window.event.srcElement;
			for (var i = 0; i < node.NGEventListener[window.event.type].length; i++) {
				node.NGcurrentEvent = node.NGEventListener[window.event.type][i];
				node.NGcurrentEvent();
			}
		}
		return node.attachEvent('on'+eventName, tmpFunc);*/
	} else {
		if (!isObj(node.NGEventListener)) node.NGEventListener = new Object();
		if (!isArr(node.NGEventListener[eventName])) node.NGEventListener[eventName] = new Array();
		node.NGEventListener[eventName][node.NGEventListener[eventName].length] = func;
		node['on'+eventName] = function (e) {
			for (var i = 0; i < node.NGEventListener[eventName].length; i++) {
				node.NGEventListener[eventName][i](e);
			}
		}
	}
}

NG.removeEventListener = function (node, eventName, func) {
	if (eventName == 'sglclick') {
		if (!isFunc(NG.addTrigger)) return;
		if (!isObj(node.NGEventListener)) return;
		for (var i = 0; i < node.NGEventListener.length; i++) {
			with (node.NGEventListener[i]) { if (e == eventName && f == func) { NG.removeTrigger(c); NG.removeTrigger(d); return; } }
		}
	} else if (isFunc(node.removeEventListener) && (eventName != 'dblclick' || !NG.ua.is('KHTML'))) {
		return node.removeEventListener(eventName, func, F);
	} else if (isFunc(node.detachEvent)) {
		return node.detachEvent('on'+eventName, func);
	} else {
		if (isObj(node.NGEventListener) && isArr(node.NGEventListener[eventName])) {
			for (var i = 0; i < node.NGEventListener[eventName].length; i++) {
				if (node.NGEventListener[eventName][i] == func) {
					delete node.NGEventListener[eventName][i];
					return;
				}
			}
		}
	}
}

NG.stopPropagation = function (e) {
	if (!isObj(e) && isObj(window.event)) var e = window.event;
	if (isObj(e)) {
		if (isDef(typeof e.stopPropagation) && isFunc(e.stopPropagation)) {
			e.stopPropagation();
		} else if (isDef(typeof e.cancelBubble)) {
			e.cancelBubble = T;
		} else if (isDef(typeof e.originalEvent) && isObj(e.originalEvent)) {
			NG.stopPropagation(e.originalEvent);
		}
	}
}

NG.applyCallable = function (func, args) {
	if (arguments.length < 2) var args = [];
	else if (!isArr(args)) args = [args];
	if (isFunc(func)) {
		return func.apply(window,args);
	} else if (isStr(func)) {
		return eval(func);
	} else if (isArr(func) && func.length == 2 && isObj(func[0]) && isStr(func[1]) && isFunc(func[0][func[1]])) {
		return func[0][func[1]].apply(func[0],args);
	}
}
