﻿if (t_cur<t_max) {	all.x=midxstage-tran_amp*Math.cos(t_cur);	t_cur+=t_int;} else {	all.x=midxstage-tran_amp*Math.cos(t_max);//[On]/Off-Dispels jetlag effect//	if (keyboard_input.is_right()) {		if (t_max>0) {			t_cur=-3*Math.PI;			t_max=-2*Math.PI;		}	} else {		if (keyboard_input.is_left()) {			if (t_max<0) {				t_cur=2*Math.PI;				t_max=3*Math.PI;			}		}	}}////presetif (keyboard_input.is_right()) {	xkeydir3=-1;	xkeydir2=-1;} else {	if (keyboard_input.is_left()) {		xkeydir3=1;		xkeydir2=1;	} else {		xkeydir3=0;	}}if (vel_wlk_cur<vel_wlk_max) {	vel_wlk_cur+=vel_wlk_int;}if (keyboard_input.is_right()) {	if (vel_wlk_dir==-1) {		vel_wlk_cur=- vel_wlk_int;	}	if (vel_wlk_dir*all.bg.x>vel_wlk_dir*bound_bg_r) {		all.bg.x-=vel_wlk_dir*vel_wlk_cur;	}	vel_wlk_dir=1;}if (keyboard_input.is_left()) {	if (vel_wlk_dir==1) {		vel_wlk_cur=- vel_wlk_int;	}	if (vel_wlk_dir*all.bg.x>vel_wlk_dir*bound_bg_l) {		all.bg.x-=vel_wlk_dir*vel_wlk_cur;	}	vel_wlk_dir=-1;}if ((all.bg.x>bound_bg_r)&&(all.bg.x<bound_bg_l)) {}if ((keyboard_input.is_left())||(keyboard_input.is_right())) {} else {}//trace(k.lor());if (t_cur<t_max) {	all.x=midxstage-tran_amp*Math.cos(t_cur);	t_cur+=t_int;} else {	all.x=midxstage-tran_amp*Math.cos(t_max);//[On]/Off-Dispels jetlag effect//}if (k.is_right()) {	//means lor=+1	if (k.lor()*t_max>0) {		if (t_cur<t_max) {			t_cur=- t_cur;		} else {			t_cur=-3*Math.PI;		}		t_max=-2*Math.PI;	}} else {	if (k.is_left()) {		//means lor=-1		if (k.lor()*t_max>0) {			if (t_cur<t_max) {				t_cur=- t_cur;			} else {				t_cur=2*Math.PI;			}			t_max=3*Math.PI;		}	}}//if (all.boxi.x>=400) {	if (all.boxi.x<=800) {		if ((all.boxi.x+wlk_vel)<400) {			//rstage}mstage			all.bg.x-=wlk_vel;			all.boxi.x=400;		} else {			if ((all.boxi.x+wlk_vel)<800) {				all.boxi.x+=wlk_vel;			} else {				all.boxi.x=800;				wlk_vel=0;			}		}	}}//if (all.bg.x-wlk_vel<bound_bg_r_in) {	all.boxi.x+=wlk_vel;	all.bg.x=-868.9;} else {	all.bg.x-=0}//if (all.bg.x<0) {				//mstage				if ((all.bg.x-wlk_vel)>0) {					//mstage}lstage					all.boxi.x+=wlk_vel;					all.bg.x=0;				} else {					all.bg.x-=wlk_vel;				}			} else {				if (all.boxi.x<=400) {					//lstage					if (all.boxi.x>=0) {						if ((all.boxi.x+wlk_vel)>400) {							//lstage}mstage							all.bg.x-=wlk_vel;							all.boxi.x=400;						} else {							if ((all.boxi.x+wlk_vel)>0) {								all.boxi.x+=wlk_vel;							} else {								all.boxi.x=0;								//wlk_vel=-wlk_vel//Wall Elasticity [Off]/On								wlk_vel=0;							}						}					}				}			}//if (all.boxi.x+wlk_vel>=0) {						//boxi not leftest bound						all.boxi.x+=wlk_vel;					} else {						//boxi over leftest bound						all.boxi.x=0;						wlk_vel=0;					}//if (! all.bg.x==0) {					trace("x: "+all.bg.x);					trace("w: "+wlk_vel);					if (all.bg.x>wlk_vel) {						trace("x>w");					} else {						trace("x<w");					}				}//if (all.boxi.x+wlk_vel<400) {						all.boxi.x=400;						trace ("nay")					} else {						all.boxi.x+=wlk_vel//-all.bg.x;						all.bg.x=bound_bg_r_in;						trace ("hay")					}//if (all.platform.hitTestPoint(mouseX,mouseY,true)){				trace ("hit")			} else {				trace ("none")			}//airh=all.boxi.y-20;			groundh=all.boxi.y+20;			if (!(all.platform.hitTestPoint(all.boxi.x+wlk_vel,airh,true))&&(all.platform.hitTestPoint(all.boxi.x+wlk_vel,groundh,true))) {				//doesn't handle cliffs or steep bounds _| or `|				//need to input variables				//YES - Masking Definitively Works - Hello0o0 Destructuctable World!				for (var p=0; p<=5; p++) {					tagh=(airh+groundh)/2;					if (all.platform.hitTestPoint(all.boxi.x+wlk_vel,tagh,true)) {						groundh=tagh;					} else {						airh=tagh;					}					if (p==5) {						all.boxi.y=groundh					}				}			} else {				wlk_vel=0//wlk_vel/2;			}//					if (gycnt==0) {						gpreyhit=gcuryhit;					}					if (gcuryhit==gpreyhit) {						gptyboxi-=gcuryhit*gyint;					}					if (gcuryhit==- gpreyhit) {						all.boxi.y=gptyboxi;						gycnt=gymax;					}//for (var i=1; i<jump_vel; i+=gyint) {								trace (i)								if (all.platform.hitTestPoint(all.boxi.x+wlk_vel,all.boxi.y-i,true)) {									all.boxi.y-=i-gyint									i=jump_vel								}							}							//all.boxi.y-=5