package welcomelib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.text.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class teaser extends flash.display.MovieClip
    {
        public function teaser(arg1:flash.display.MovieClip, arg2:flash.display.Stage, arg3:flash.display.MovieClip, arg4:Number, arg5:Number, arg6:Number, arg7:flash.display.MovieClip)
        {
            this.imageLoader = new flash.display.Loader();
            this.captionbg = new flash.display.Sprite();
            this.container = new flash.display.MovieClip();
            this.txt = new flash.text.TextField();
            super();
            this._root = arg1;
            this._stage = arg2;
            this._container = arg3;
            this._ivar = arg4;
            this._xvar = arg5;
            this._yvar = arg6;
            this._creator = arg7;
            this.container.alpha = 0;
            this.captionbg.alpha = 0;
            this.txt.alpha = 0;
            this.container.buttonMode = true;
            this.x = this._xvar;
            this.y = this._yvar;
            this._container.addChild(this);
            addChild(this.container);
            this.thumburl = this._root.teaserdata_array[this._ivar]["imageurl"];
            this.imageLoad();
            return;
        }

        public function imageLoad():void
        {
            this.imageLoader.load(new flash.net.URLRequest(this.thumburl));
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone, false, 0, true);
            return;
        }

        public function imageLoadingDone(arg1:flash.events.Event):void
        {
            this.imageLoader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone);
            this.loaded = true;
            this.txt.multiline = true;
            this.txt.condenseWhite = true;
            this.txt.wordWrap = true;
            this.txt.embedFonts = false;
            this.txt.selectable = false;
            this.txt.mouseEnabled = false;
            this.txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.txt.gridFitType = flash.text.GridFitType.SUBPIXEL;
            this.txt.width = this.imageLoader.content.width - 40;
            this.txt.height = this.imageLoader.content.height - 40;
            this.txt.styleSheet = this._root.style;
            this.txt.htmlText = this._root.teaserdata_array[this._ivar]["text"];
            this.txt.x = 20;
            this.txt.y = 20;
            this.txt.mouseEnabled = false;
            var loc1:*=Math.round(this.txt.height);
            this.captionbg.graphics.beginFill(this._root.teasercaptionbgcolor);
            this.captionbg.graphics.drawRect(0, 0, this.imageLoader.content.width, this.imageLoader.content.height);
            this.captionbg.graphics.endFill();
            this.captionbg.mouseEnabled = false;
            this.container.addChild(this.imageLoader.content);
            this.container.addChild(this.captionbg);
            this.container.addChild(this.txt);
            this.tin = org.libspark.betweenas3.BetweenAS3.to(this.container, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.tin.play();
            this.addEvents();
            return;
        }

        public function onMouseOver(arg1:flash.events.MouseEvent):*
        {
            if (this.tbg != null) 
            {
                this.tbg.stop();
            }
            if (this.ttxt != null) 
            {
                this.ttxt.stop();
            }
            this.tbg = org.libspark.betweenas3.BetweenAS3.to(this.captionbg, {"alpha":this._root.teasercaptionbgopacity}, 0.6, org.libspark.betweenas3.easing.Expo.easeOut);
            this.tbg.play();
            this.ttxt = org.libspark.betweenas3.BetweenAS3.to(this.txt, {"alpha":1}, 0.6, org.libspark.betweenas3.easing.Sine.easeOut);
            this.ttxt.play();
            return;
        }

        internal function addEvents():void
        {
            this.container.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.onMouseOut, false, 0, true);
            this.container.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.onMouseOver, false, 0, true);
            this.container.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click, false, 0, true);
            return;
        }

        internal function mouse_click(arg1:*):void
        {
            var urltarget:String;
            var urllink:String;
            var event:*;
            var req:flash.net.URLRequest;

            var loc1:*;
            event = arg1;
            urllink = this._root.teaserdata_array[this._ivar]["clicklink"];
            urltarget = this._root.teaserdata_array[this._ivar]["clicktarget"];
            req = new flash.net.URLRequest(urllink);
            try 
            {
                flash.net.navigateToURL(req, urltarget);
            }
            catch (e:Error)
            {
                trace("Could not navigate to URL!");
            }
            return;
        }

        public function onMouseOut(arg1:flash.events.MouseEvent):*
        {
            if (this.tbg != null) 
            {
                this.tbg.stop();
            }
            if (this.ttxt != null) 
            {
                this.ttxt.stop();
            }
            this.tbg = org.libspark.betweenas3.BetweenAS3.to(this.captionbg, {"alpha":0}, 0.6, org.libspark.betweenas3.easing.Expo.easeOut);
            this.tbg.play();
            this.ttxt = org.libspark.betweenas3.BetweenAS3.to(this.txt, {"alpha":0}, 0.6, org.libspark.betweenas3.easing.Sine.easeOut);
            this.ttxt.play();
            return;
        }

        internal var tbg:org.libspark.betweenas3.tweens.ITween;

        internal var _root:flash.display.MovieClip;

        internal var loaded:Boolean=false;

        internal var urllinkrequest:flash.net.URLRequest;

        internal var container:flash.display.MovieClip;

        internal var _container:flash.display.MovieClip;

        public var _xvar:Number;

        internal var imageLoader:flash.display.Loader;

        internal var thumburl:String;

        internal var tin:org.libspark.betweenas3.tweens.ITween;

        internal var captionbg:flash.display.Sprite;

        public var _yvar:Number;

        internal var txt:flash.text.TextField;

        internal var _creator:flash.display.MovieClip;

        internal var ttxt:org.libspark.betweenas3.tweens.ITween;

        internal var _ivar:Number;

        internal var _stage:flash.display.Stage;
    }
}
