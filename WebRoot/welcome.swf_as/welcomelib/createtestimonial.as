package welcomelib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.text.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createtestimonial extends flash.display.MovieClip
    {
        public function createtestimonial(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            this.txt = new flash.text.TextField();
            this.txt_mc = new flash.display.MovieClip();
            this.imageLoader = new flash.display.Loader();
            super();
            this._stage = arg1;
            this._root = arg2;
            this.txt.multiline = true;
            this.txt.condenseWhite = true;
            this.txt.wordWrap = true;
            this.txt.embedFonts = false;
            this.txt.selectable = false;
            this.txt.mouseWheelEnabled = false;
            this.txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.txt.autoSize = flash.text.TextFieldAutoSize.NONE;
            this.txt.gridFitType = flash.text.GridFitType.PIXEL;
            if (this._root.testimonialimageurl == "") 
            {
                this.txt.width = 420;
            }
            else 
            {
                this.txt.width = 310;
                this.imageLoad();
            }
            this.txt.height = 115;
            this.txt.styleSheet = this._root.style;
            this.txt.htmlText = this._root.testimonialtext;
            var loc1:*=new dropshadow(this._root, this.txt, 2, 45, 0, this._root.testimonialshadowopacity, 2, 2, 1, 1);
            this.txt_mc.alpha = 0;
            this.txt_mc.addChild(this.txt);
            this.txt_mc.x = 530;
            this.txt_mc.y = 380;
            addChild(this.txt_mc);
            this._root.addChild(this);
            this.t_text = org.libspark.betweenas3.BetweenAS3.to(this.txt_mc, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.t_text.play();
            return;
        }

        public function imageLoadingDone(arg1:flash.events.Event):void
        {
            this.imageLoader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone);
            this.imageLoader.content.x = 840;
            this.imageLoader.content.y = 380;
            this.addChild(this.imageLoader.content);
            return;
        }

        public function imageLoad():void
        {
            this.imageLoader.load(new flash.net.URLRequest(this._root.testimonialimageurl));
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone, false, 0, true);
            return;
        }

        internal var _root:flash.display.MovieClip;

        public var txt_mc:flash.display.MovieClip;

        internal var imageLoader:flash.display.Loader;

        internal var txt:flash.text.TextField;

        internal var t_text:org.libspark.betweenas3.tweens.ITween;

        internal var _stage:flash.display.Stage;
    }
}
