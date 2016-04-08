package bannerlib 
{
    import flash.display.*;
    import flash.events.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class navigdot extends flash.display.MovieClip
    {
        public function navigdot(arg1:flash.display.MovieClip, arg2:flash.display.MovieClip, arg3:Number, arg4:flash.display.MovieClip)
        {
            super();
            this._root = arg1;
            this._container = arg2;
            this._ivar = arg3;
            this._banner = arg4;
            if (this._root.selectbuttonstyle != "dark") 
            {
                this.navselect = new nav_dot_selected2();
                this.navnotselect = new nav_dot_notselected2();
            }
            else 
            {
                this.navselect = new nav_dot_selected();
                this.navnotselect = new nav_dot_notselected();
            }
            if (this._root.playpauseactivated == "true") 
            {
                this.playpausespacing = 28 + this._root.selectbuttonspacing;
            }
            if (this._root.selectbuttonorientation != "left") 
            {
                if (this._root.selectbuttonorientation != "right") 
                {
                    if (this._root.selectbuttonorientation == "center") 
                    {
                        this.dotpos = Math.round(this._root.bannerwidth / 2) - Math.round(this._root.maxbanner * (28 + this._root.selectbuttonspacing) / 2) + (28 + this._root.selectbuttonspacing) * this._ivar + this.playpausespacing - Math.round(this._root.selectbuttonspacing * 1.5) - 14;
                    }
                }
                else 
                {
                    this.dotpos = this._root.bannerwidth - this._root.selectbuttonpaddingleft - (28 + this._root.selectbuttonspacing) * (this._root.maxbanner - this._ivar) + this._root.selectbuttonspacing - this._root.leftpos;
                }
            }
            else 
            {
                this.dotpos = this._root.leftpos + this._root.selectbuttonpaddingleft + (28 + this._root.selectbuttonspacing) * this._ivar + this.playpausespacing;
            }
            this.navnotselect.buttonMode = true;
            this.navnotselect.alpha = 0;
            this.navnotselect.x = this.dotpos;
            this.navnotselect.y = this._root.bannerheight - this._root.selectbuttonpaddingbottom - 28;
            this.navselect.mouseEnabled = false;
            this.navselect.alpha = 0;
            this.navselect.x = this.dotpos;
            this.navselect.y = this._root.bannerheight - this._root.selectbuttonpaddingbottom - 28;
            this._banner.addChild(this.navnotselect);
            this._banner.addChild(this.navselect);
            if (this.navignot_t != null) 
            {
                this.navignot_t.stop();
            }
            this.navignot_t = org.libspark.betweenas3.BetweenAS3.to(this.navnotselect, {"alpha":0.2}, 1, org.libspark.betweenas3.easing.Sine.easeInOut);
            this.navignot_t.play();
            this.navnotselect.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mouse_over, false, 0, true);
            this.navnotselect.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mouse_out, false, 0, true);
            this.navnotselect.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click, false, 0, true);
            return;
        }

        public function selectBtn():void
        {
            if (this.navig_t != null) 
            {
                this.navig_t.stop();
            }
            this.navig_t = org.libspark.betweenas3.BetweenAS3.to(this.navselect, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.navig_t.play();
            this.selectvar = true;
            return;
        }

        public function fadeInBtn():void
        {
            this.navnotselect.buttonMode = true;
            this.navnotselect.mouseEnabled = true;
            if (this.navignot_t != null) 
            {
                this.navignot_t.stop();
            }
            this.navignot_t = org.libspark.betweenas3.BetweenAS3.to(this.navnotselect, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeInOut);
            this.navignot_t.play();
            this.loaded = true;
            return;
        }

        public function deselectBtn():void
        {
            this.navnotselect.buttonMode = true;
            this.navnotselect.mouseEnabled = true;
            if (this.navig_t != null) 
            {
                this.navig_t.stop();
            }
            this.navig_t = org.libspark.betweenas3.BetweenAS3.to(this.navselect, {"alpha":0}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.navig_t.play();
            this.selectvar = false;
            return;
        }

        internal function mouse_over(arg1:*):void
        {
            if (!this.selectvar && this.loaded) 
            {
                this.navnotselect.buttonMode = true;
                this.navnotselect.mouseEnabled = true;
                if (this.navig_t != null) 
                {
                    this.navig_t.stop();
                }
                this.navig_t = org.libspark.betweenas3.BetweenAS3.to(this.navselect, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.navig_t.play();
            }
            else 
            {
                this.navnotselect.buttonMode = false;
                this.navnotselect.mouseEnabled = false;
            }
            return;
        }

        internal function mouse_out(arg1:*):void
        {
            if (!this.selectvar && this.loaded) 
            {
                if (this.navig_t != null) 
                {
                    this.navig_t.stop();
                }
                this.navig_t = org.libspark.betweenas3.BetweenAS3.to(this.navselect, {"alpha":0}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.navig_t.play();
            }
            return;
        }

        internal function mouse_click(arg1:*):void
        {
            if (!this.selectvar && this.loaded) 
            {
                this._banner.navigdots[this._root.activebanner].deselectBtn();
                this._root.activebanner = this._ivar;
                this._banner.selectImage();
            }
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var loaded:Boolean=false;

        internal var playpausespacing:Number=0;

        internal var _container:flash.display.MovieClip;

        internal var _banner:flash.display.MovieClip;

        internal var navnotselect:*;

        internal var navselect:*;

        internal var navignot_t:org.libspark.betweenas3.tweens.ITween;

        internal var dotpos:Number;

        public var selectvar:Boolean=false;

        internal var navig_t:org.libspark.betweenas3.tweens.ITween;

        internal var _ivar:Number;
    }
}
