﻿if (t_cur<t_max) {				all.x=midxstage-tran_amp*Math.cos(t_cur);				t_cur+=t_int;			} else {				all.x=midxstage-tran_amp*Math.cos(t_max);//[On]/Off-Dispels jetlag effect//				if (keyboard_input.is_right()) {					if (t_max>0) {						t_cur=-3*Math.PI;						t_max=-2*Math.PI;					}				} else {					if (keyboard_input.is_left()) {						if (t_max<0) {							t_cur=2*Math.PI;							t_max=3*Math.PI;						}					}				}			}