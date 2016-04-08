package alternatebannerlib 
{
    import flash.display.*;
    import flash.events.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class playbutton extends flash.display.MovieClip
    {
        public function playbutton(arg1:flash.display.MovieClip, arg2:flash.display.MovieClip)
        {
            this.btnmc = new flash.display.MovieClip();
            this.btnicon = new banner_play();
            super();
            this._root = arg1;
            this._banner = arg2;
            if (this._root.navigleftright != "true") 
            {
                this.buttonpos = Math.round(this._root.bannerwidth / 2) - 15;
            }
            else 
            {
                this.buttonpos = Math.round(this._root.bannerwidth / 2) - this._root.navigbuttonspacing - 45;
            }
            this.btnicon.buttonMode = true;
            if (this._root.navigshowonhover != "true") 
            {
                this.btnicon.alpha = this._root.navigbuttonopacity;
            }
            else 
            {
                this.btnicon.alpha = 0;
            }
            this.btnicon.x = this.buttonpos;
            this.btnicon.y = this._root.bannerheight - this._root.navigbuttonpaddingbottom - 30;
            this._banner.colorTrans(this.btnicon, this._root.navigbuttonidlecolor);
            org.libspark.betweenas3.BetweenAS3.apply(this.btnmc, {"_dropShadowFilter":{"distance":this._root.navigbuttonshadowdistance, "angle":this._root.navigbuttonshadowangle, "color":this._root.navigbuttonshadowcolor, "alpha":this._root.navigbuttonshadowopacity, "blurX":this._root.navigbuttonshadowsize, "blurY":this._root.navigbuttonshadowsize, "strength":this._root.navigbuttonshadowstrength, "quality":3}});
            this.btnmc.addChild(this.btnicon);
            this._banner.addChild(this.btnmc);
            this.btnicon.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mouse_over, false, 0, true);
            this.btnicon.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mouse_out, false, 0, true);
            this.btnicon.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click, false, 0, true);
            return;
        }

        public function activateButton():void
        {
            this.btnicon.buttonMode = true;
            this.btnicon.mouseEnabled = true;
            return;
        }

        internal function mouse_over(arg1:*):void
        {
            if (parseInt(this._root.bannerdata_array[this._banner.currentslideid]["entryshowtime"]) == 0) 
            {
                this.btnicon.buttonMode = false;
                this.btnicon.mouseEnabled = false;
            }
            else 
            {
                if (this.color_t != null) 
                {
                    this.color_t.stop();
                }
                this.btnicon.alpha = 1;
                this.color_t = org.libspark.betweenas3.BetweenAS3.to(this.btnicon, {"transform":{"colorTransform":{"redOffset":this._banner.selectrgb["red"], "greenOffset":this._banner.selectrgb["green"], "blueOffset":this._banner.selectrgb["blue"]}}}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
                this.color_t.play();
            }
            return;
        }

        internal function mouse_out(arg1:*):void
        {
            if (this.color_t != null) 
            {
                this.color_t.stop();
            }
            this.color_t = org.libspark.betweenas3.BetweenAS3.to(this.btnicon, {"transform":{"colorTransform":{"redOffset":this._banner.idlergb["red"], "greenOffset":this._banner.idlergb["green"], "blueOffset":this._banner.idlergb["blue"]}}}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            this.color_t.play();
            return;
        }

        public function fadeOutBtn():void
        {
            if (this.btn_t != null) 
            {
                this.btn_t.stop();
                this.btn_t = null;
            }
            this.btn_t = org.libspark.betweenas3.BetweenAS3.to(this.btnicon, {"alpha":0}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.btn_t.play();
            return;
        }

        public function fadeInBtn():void
        {
            if (this.btn_t != null) 
            {
                this.btn_t.stop();
                this.btn_t = null;
            }
            this.btn_t = org.libspark.betweenas3.BetweenAS3.to(this.btnicon, {"alpha":this._root.navigbuttonopacity}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.btn_t.play();
            return;
        }

        public function hideBtn():void
        {
            this.btnicon.visible = false;
            return;
        }

        internal function mouse_click(arg1:*):void
        {
            if (parseInt(this._root.bannerdata_array[this._banner.currentslideid]["entryshowtime"]) != 0) 
            {
                this._banner.resumeTimer();
            }
            return;
        }

        public function showBtn():void
        {
            this.btnicon.visible = true;
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var buttonpos:Number;

        internal var btn_t:org.libspark.betweenas3.tweens.ITween;

        internal var btnmc:flash.display.MovieClip;

        internal var btnicon:*;

        internal var color_t:org.libspark.betweenas3.tweens.ITween;

        internal var _banner:flash.display.MovieClip;
    }
}
