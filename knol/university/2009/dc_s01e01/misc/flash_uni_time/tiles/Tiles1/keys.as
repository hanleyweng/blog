﻿package {	import flash.events.KeyboardEvent;	public class keys {		private var press_left=false;		private var press_right=false;		private var lori=0;//left none right //both doesn't register		private var doui=0;//down none up		private var lri=0;//left right		private var dui=0;//down up		private var lrudi=0;//leftright updown		private var press_up=false;		private var press_down=false;		private var press_space=false;		public function keys(movieclip) {			movieclip.stage.addEventListener(KeyboardEvent.KEY_DOWN,key_down);			movieclip.stage.addEventListener(KeyboardEvent.KEY_UP,key_up);		}		public function lefti() {			return press_left;		}		public function righti() {			return press_right;		}		public function upi() {			return press_up;		}		public function downi() {			return press_down;		}		public function is_space() {			return press_space;		}		public function lor(){			return lori		}		public function dou(){			return doui		}		public function lr(){			return lri		}		public function lrud(){			return lrudi		}		public function du(){			return dui		}		public function key_down(event:KeyboardEvent) {			if (event.keyCode==32) {				press_space=true;			}			if (event.keyCode==37) {				press_left=true;				lori=-1				lri=-1				lrudi=-1			}			if (event.keyCode==38) {				press_up=true;				doui=1				dui=1				lrudi=1			}			if (event.keyCode==39) {				press_right=true;				lori=1				lri=1				lrudi=-1			}			if (event.keyCode==40) {				press_down=true;				doui=-1				dui=-1				lrudi=1			}		}		public function key_up(event:KeyboardEvent) {			if (event.keyCode==32) {				press_space=false;			}			if (event.keyCode==37) {				press_left=false;			}			if (event.keyCode==38) {				press_up=false;			}			if (event.keyCode==39) {				press_right=false;			}			if (event.keyCode==40) {				press_down=false;			}			if ((event.keyCode==37)||(event.keyCode==39)) {				lori=0			}			if ((event.keyCode==38)||(event.keyCode==40)) {				doui=0			}		}	}}