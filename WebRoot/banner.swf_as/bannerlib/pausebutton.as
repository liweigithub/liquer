package bannerlib 
{
    import flash.display.*;
    import flash.events.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class pausebutton extends flash.display.MovieClip
    {
        public function pausebutton(arg1:flash.display.MovieClip, arg2:flash.display.MovieClip)
        {
            super();
            this._root = arg1;
            this._banner = arg2;
            if (this._root.selectbuttonstyle != "dark") 
            {
                this.btnstyle = new banner_pause2();
            }
            else 
            {
                this.btnstyle = new banner_pause();
            }
            if (this._root.selectbuttonorientation != "left") 
            {
                if (this._root.selectbuttonorientation != "right") 
                {
                    if (this._root.selectbuttonorientation == "center") 
                    {
                        this.buttonpos = Math.round(this._root.bannerwidth / 2) - Math.round(this._root.maxbanner * (28 + this._root.selectbuttonspacing) / 2) - Math.round(this._root.selectbuttonspacing * 1.5) - 14;
                    }
                }
                else 
                {
                    this.buttonpos = this._root.bannerwidth - this._root.selectbuttonpaddingleft - (28 + this._root.selectbuttonspacing) * this._root.maxbanner - 28 - this._root.leftpos;
                }
            }
            else 
            {
                this.buttonpos = this._root.leftpos + this._root.selectbuttonpaddingleft;
            }
            this.btnstyle.buttonMode = true;
            this.btnstyle.alpha = 0;
            this.btnstyle.x = this.buttonpos;
            this.btnstyle.y = this._root.bannerheight - this._root.selectbuttonpaddingbottom - 28;
            this._banner.addChild(this.btnstyle);
            if (this.btn_t != null) 
            {
                this.btn_t.stop();
            }
            this.btn_t = org.libspark.betweenas3.BetweenAS3.to(this.btnstyle, {"alpha":1}, 1, org.libspark.betweenas3.easing.Sine.easeInOut);
            this.btn_t.play();
            this.btnstyle.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mouse_over, false, 0, true);
            this.btnstyle.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mouse_out, false, 0, true);
            this.btnstyle.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click, false, 0, true);
            return;
        }

        internal function mouse_over(arg1:*):void
        {
            if (this.btn_t != null) 
            {
                this.btn_t.stop();
            }
            this.btn_t = org.libspark.betweenas3.BetweenAS3.to(this.btnstyle, {"alpha":0.7}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            this.btn_t.play();
            return;
        }

        public function hideBtn():void
        {
            this.btnstyle.visible = false;
            return;
        }

        internal function mouse_out(arg1:*):void
        {
            if (this.btn_t != null) 
            {
                this.btn_t.stop();
            }
            this.btn_t = org.libspark.betweenas3.BetweenAS3.to(this.btnstyle, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            this.btn_t.play();
            return;
        }

        internal function mouse_click(arg1:*):void
        {
            this._banner.pauseTimer();
            return;
        }

        public function showBtn():void
        {
            this.btnstyle.visible = true;
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var buttonpos:Number;

        internal var _banner:flash.display.MovieClip;

        internal var btn_t:org.libspark.betweenas3.tweens.ITween;

        internal var btnstyle:*;
    }
}
