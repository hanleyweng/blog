/**
 * $Id: ngevent.js,v 1.2 2005/11/14 00:07:59 ajessup Exp $
 *
 * Noggin Javascript Event Library v1.0
 *
 * Copyright Noggin <info@noggin.com.au> 2005
 *
 * Last Updated: 21/Jan/2005
 *      Depends: Javascript >= 1.2
 *      Depends: Noggin Javascript Core Library >= 0.1
 *
 * @author Owen Prime <owen@noggin.com.au>
 *
 * Changelog:
 *   21/Jan/2005 OP: Initial version
 *   10/Feb/2005 OP: Pre-release Ready
 *
 * DESCRIPTION
 * -----------------
 * This event manager primarily performs two functions:
 *
 * Firstly, it provides an extension to the standard setTimeout() and setInterval() functions
 * to allow arguments to be passedin non-compliant browsers (MSIE for example). It also extends
 * the "expression" argument to allow the usual expression, the usual function, and now an
 * array of [object, method_name] which will call the method on that object. This could also
 * be thought of as [scope, function_name].
 *
 * Secondly, it provides the ability to execute a function, object method, expression, timeout,
 * or interval when an event on a DOM node fires. This is particulary helpful as the developer
 * does not have to be concerned with the scope of "this".
 */

function NGEventManager() {
	this.events = new Object();   // The store of events currently active
	this.seq = 1;            // The handle identifier sequence

	// Registers a new event and returns it
	this.addEvent = function (func, argArr) {
		var event = new NGEvent(this.seq++, func, argArr);
		this.events[event.id] = event;
		return event;
	}

	// Returns the event object for the passed handle identifier. Throws an exception if handle does not exist.
	this.getEvent = function (id) {
		if (this.hasEvent(id)) return this.events[id];
		return null;
	}

	this.hasEvent = function (id) {
		return (isDef(typeof this.events[id]));
	}

	function NGEvent(id, func, argArr) {

		var t = this;
		t.id         = id;     // The unique event identifier to perform operations on
		t.numTimes   = 1;      // The number of times to execute the event
		t.delay      = 0;      // The delay & interval in msecs before executing event
		t.timeoutId  = N;   // The setTimeout or setInterval handle identifier for use with clearing it
		t.eventNode  = N;   // The node this event is attached to
		t.eventName  = N;   // The name of the method this event is attached to. NB: Does not have the "on" prefix.
		t.eventFunc  = N;   // The internal function used in the event listener. Store for cancelling perposes only.
		t.event      = N;
		t.func       = func;   // The function to call (or method if this.object exists) when executing event
		t.argArr     = argArr;

		t.remove = function () {
			this.detachNode();
			this.cancel();
			delete this.func;
			delete NG.getEventManager().events[this.id];
		}

		t.cancel = function () {
			if (!isNull(this.timeoutId)) {
				clearTimeout(this.timeoutId);
				this.timeoutId = N;
			}
		}

		t.execute = function () {
			if (!isArr(this.argArr)) this.argArr = [];
			if (isNull(this.event)) {
				NG.applyCallable(this.func, this.argArr);
			} else {
				NG.applyCallable(this.func, this.argArr.concat([NG.eventObj(this.event)]));
			}
			if (this.numTimes > 1) {
				this.schedule(this.delay, this.numTimes-1);
			} else if (this.numTimes == 1) {
				if (isNull(this.eventNode)) {
					this.remove();
				} else {
					this.cancel();
				}
			}
		}

		t.schedule = function (delay, numTimes) {
			this.cancel(); // Cancel any pending timeouts or intervals
			this.delay = delay;
			this.numTimes = numTimes;
			if (this.delay > 0) {
				this.timeoutId = window[(numTimes > 0 ? 'setTimeout' : 'setInterval')]('NG.getEventManager().getEvent('+this.id+').execute()', this.delay);
			} else {
				this.execute();
			}
			return this.id;
		}

		t.attachNode = function (node, eventName, delay, numTimes) {
			this.eventFunc = new Function('e', 'var n = NG.getEventManager(); if (n.hasEvent('+this.id+')) { if (!isObj(e) && isObj(event)) var e = event; n.getEvent('+this.id+').event = e; n.getEvent('+this.id+').schedule('+delay+','+numTimes+'); }');
			this.eventNode = node;
			this.eventName = eventName;
			NG.addEventListener(this.eventNode, this.eventName, this.eventFunc);
			return this.id;
		}

		t.detachNode = function () {
			if (isNull(this.eventNode)) return F;
			NG.removeEventListener(this.eventNode, this.eventName, this.eventFunc);
		}
	}
}

NG.getEventManager = function () {
	if (!isObj(__G['EventManager'])) __G['EventManager'] = new NGEventManager();
	return __G['EventManager'];
}

NG.setTimeout = function (func, delay, argArr, numTimes) {
	var a = arguments;
	if (a.length < 4) numTimes = 1;
	if (a.length < 5) argArr = [];
	if (!isInt(delay) || delay <= 0) throw('Invalid second arg');
	if (!isInt(numTimes) || numTimes < -1 || numTimes == 0) throw('Invalid forth arg');
	if (!isArr(argArr)) argArr = [argArr];
	return NG.getEventManager().addEvent(func, argArr).schedule(delay, numTimes);
}

NG.setInterval = function (func, delay, argArr) {
	return NG.setTimeout(func, delay, argArr, -1);
}

NG.addTrigger = function (node, eventName, func, delay, argArr, numTimes) {
	var a = arguments;
	if (a.length < 4) delay = 0;
	if (a.length < 5) argArr = [];
	if (a.length < 6) numTimes = 1;
	if (!isObj(node)) throw('Invalid first arg');
	if (!isStr(eventName)) throw('Invalid second arg');
	if (eventName.search(/^on.+/i) != -1) eventName = eventName.substr(2,eventName.length-2);
	eventName = eventName.toLowerCase();
	if (isNull(delay)) delay = 0;
	if (!isInt(delay) || delay < 0) throw('Invalid forth arg');
	if (!isInt(numTimes) || numTimes < -1 || numTimes == 0) throw('Invalid sixth argument');
	if (!isArr(argArr)) argArr = [argArr];
	return NG.getEventManager().addEvent(func, argArr).attachNode(node, eventName, delay, numTimes);
}

NG.cancelTimeout = function (id) {
	if (NG.getEventManager().hasEvent(id)) return NG.getEventManager().getEvent(id).cancel();
	return F;
}

NG.cancelInterval = NG.cancelTimeout;

NG.removeTrigger = function (id) {
	if (NG.getEventManager().hasEvent(id)) return NG.getEventManager().getEvent(id).remove();
	return F;
}

NG.preventDefault = function (e) {
	if (!isObj(e) && isObj(window.event)) var e = window.event;
	if (isObj(e)) {
		if (isFunc(e.preventDefault)) {
			e.preventDefault();
		} else if (isDef(typeof e.returnValue)) {
			e.returnValue = false;
		} else if (isDef(typeof e.originalEvent) && isObj(e.originalEvent)) {
			NG.preventDefault(e.originalEvent);
		}
	}
}

NG.eventObj = function (o) {
	function tryProp(obj) {
		for (var i = 1; i < arguments.length; i++) if (isDef(typeof obj[arguments[i]])) return obj[arguments[i]];
		return N;
	}
	var n = {};
	n.pageX = tryProp(o,'pageX','clientX');
	n.pageY = tryProp(o,'pageY','clientY');
	n.target = tryProp(o,'target','srcElement');
	n.originalEvent = o;
	return n;
}
