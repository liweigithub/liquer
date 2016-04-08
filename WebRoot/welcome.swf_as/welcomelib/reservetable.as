package welcomelib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.text.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class reservetable extends flash.display.MovieClip
    {
        public function reservetable(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            this.imageLoader = new flash.display.Loader();
            this.captionbg = new flash.display.Sprite();
            this.container = new flash.display.MovieClip();
            this.txt = new flash.text.TextField();
            super();
            this._root = arg2;
            this._stage = arg1;
            this.container.alpha = 0;
            this.container.buttonMode = true;
            this.x = 280;
            this.y = 385;
            this._root.addChild(this);
            addChild(this.container);
            this.thumburl = this._root.reserveimageurl;
            this.imageLoad();
            return;
        }

        public function imageLoadingDone(arg1:flash.events.Event):void
        {
            this.imageLoader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone);
            this.txt.multiline = true;
            this.txt.condenseWhite = true;
            this.txt.wordWrap = true;
            this.txt.embedFonts = false;
            this.txt.selectable = false;
            this.txt.mouseEnabled = false;
            this.txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.txt.gridFitType = flash.text.GridFitType.SUBPIXEL;
            this.txt.width = this.imageLoader.content.width;
            this.txt.height = 30;
            this.txt.styleSheet = this._root.style;
            this.txt.htmlText = this._root.reservetabletext;
            this.txt.x = 0;
            this.txt.y = 6;
            this.txt.mouseEnabled = false;
            var loc1:*=new dropshadow(this._root, this.txt, 2, 45, 0, this._root.reserveshadowopacity, 2, 2, 1, 1);
            this.captionbg.graphics.beginFill(this._root.reservecaptionbgcolor);
            this.captionbg.graphics.drawRect(0, 0, this.imageLoader.content.width, 30);
            this.captionbg.graphics.endFill();
            this.captionbg.mouseEnabled = false;
            this.imageLoader.content.y = 30;
            this.container.addChild(this.imageLoader.content);
            this.container.addChild(this.captionbg);
            this.container.addChild(this.txt);
            this.tin = org.libspark.betweenas3.BetweenAS3.to(this.container, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.tin.play();
            this.container.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click, false, 0, true);
            this.container.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.onMouseOut, false, 0, true);
            this.container.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.onMouseOver, false, 0, true);
            return;
        }

        public function onMouseOver(arg1:flash.events.MouseEvent):*
        {
            if (this.tout != null) 
            {
                this.tout.stop();
            }
            this.tover = org.libspark.betweenas3.BetweenAS3.tween(this.imageLoader.content, {"_colorMatrixFilter":{"matrix":[1.5, 0, 0, 0, 0, 0, 1.5, 0, 0, 0, 0, 0, 1.5, 0, 0, 0, 0, 0, 1.5, 0]}}, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, 0.8, org.libspark.betweenas3.easing.Expo.easeOut);
            this.tover.play();
            return;
        }

        public function imageLoad():void
        {
            this.imageLoader.load(new flash.net.URLRequest(this.thumburl));
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone, false, 0, true);
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
            urllink = this._root.reserveclicklink;
            urltarget = this._root.reserveclicktarget;
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
            if (this.tover != null) 
            {
                this.tover.stop();
            }
            this.tout = org.libspark.betweenas3.BetweenAS3.to(this.imageLoader.content, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, 0.8, org.libspark.betweenas3.easing.Expo.easeOut);
            this.tout.play();
            return;
        }

        internal var tbg:org.libspark.betweenas3.tweens.ITween;

        internal var _root:flash.display.MovieClip;

        internal var urllinkrequest:flash.net.URLRequest;

        internal var container:flash.display.MovieClip;

        internal var imageLoader:flash.display.Loader;

        internal var tover:org.libspark.betweenas3.tweens.ITween;

        internal var tin:org.libspark.betweenas3.tweens.ITween;

        internal var tout:org.libspark.betweenas3.tweens.ITween;

        internal var thumburl:String;

        internal var captionbg:flash.display.Sprite;

        internal var txt:flash.text.TextField;

        internal var ttxt:org.libspark.betweenas3.tweens.ITween;

        internal var _stage:flash.display.Stage;
    }
}
