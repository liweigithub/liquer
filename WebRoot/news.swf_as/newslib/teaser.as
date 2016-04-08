package newslib 
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
        public function teaser(arg1:flash.display.MovieClip, arg2:flash.display.Stage, arg3:flash.display.MovieClip, arg4:Number, arg5:Number, arg6:flash.display.MovieClip)
        {
            this.imageLoader = new flash.display.Loader();
            this.solidbg = new flash.display.Sprite();
            this.captionbg = new flash.display.Sprite();
            this.container = new flash.display.MovieClip();
            this.lineoverlay = new flash.display.Sprite();
            this.txt = new flash.text.TextField();
            super();
            this._root = arg1;
            this._stage = arg2;
            this._container = arg3;
            this._ivar = arg4;
            this._yvar = arg5;
            this._creator = arg6;
            this.container.alpha = 0;
            this.container.buttonMode = true;
            this.solidbg.graphics.beginFill(this._root.solidbackgroundcolor);
            if (this._root.solidbackgroundrounded != 0) 
            {
                this.solidbg.graphics.drawRoundRect(0, 0, this._root.newswidth, this._root.teaserimageheight + 2 * this._root.teaserimagepadding, this._root.solidbackgroundrounded, this._root.solidbackgroundrounded);
            }
            else 
            {
                this.solidbg.graphics.drawRect(0, 0, this._root.newswidth, this._root.teaserimageheight + 2 * this._root.teaserimagepadding);
            }
            this.solidbg.graphics.endFill();
            this.solidbg.mouseEnabled = false;
            this.solidbg.alpha = this._root.solidbackgroundopacity;
            this.txt.multiline = true;
            this.txt.condenseWhite = true;
            this.txt.wordWrap = true;
            this.txt.embedFonts = false;
            this.txt.selectable = false;
            this.txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.txt.gridFitType = flash.text.GridFitType.SUBPIXEL;
            this.txt.width = this._root.newswidth - this._root.teaserimagewidth - 2 * this._root.teaserimagepadding - 30;
            this.txt.styleSheet = this._root.style;
            this.txt.htmlText = this._root.teaserdata_array[this._ivar]["text"];
            this.txt.x = this._root.teaserimagewidth + this._root.teaserimagepadding + 20;
            this.txt.y = this._root.teaserimagepadding;
            this.txt.mouseEnabled = false;
            var loc1:*=Math.round(this.txt.height);
            this.captionbg.graphics.beginFill(this._root.teasercaptionbgcolor);
            this.captionbg.graphics.drawRect(0, 0, this._root.newswidth - this._root.teaserimagewidth - 2 * this._root.teaserimagepadding, this._root.teaserimageheight);
            this.captionbg.graphics.endFill();
            this.captionbg.alpha = this._root.teasercaptionbgopacity;
            this.captionbg.x = this._root.teaserimagewidth + this._root.teaserimagepadding;
            this.captionbg.y = this._root.teaserimagepadding;
            this.captionbg.mouseEnabled = false;
            this.y = this._yvar;
            this._container.addChild(this);
            addChild(this.container);
            this.container.addChild(this.solidbg);
            this.thumburl = this._root.teaserdata_array[this._ivar]["imageurl"];
            this.imageLoad();
            return;
        }

        public function onMouseOver(arg1:flash.events.MouseEvent):*
        {
            if (this.tout != null) 
            {
                this.tout.stop();
            }
            this.tover = org.libspark.betweenas3.BetweenAS3.tween(this.imageLoader.content, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, {"_colorMatrixFilter":{"matrix":[0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0]}}, 3, org.libspark.betweenas3.easing.Expo.easeOut);
            this.tover.play();
            return;
        }

        public function killText():*
        {
            var destroy:Function;

            var loc1:*;
            destroy = null;
            destroy = function ():*
            {
                textobject.killListeners();
                textobject.removeScrollListeners();
                _creator.removeChild(textobject);
                textobject = null;
                _creator.allowClick();
                return;
            }
            if (this.ttext != null) 
            {
                this.ttext.stop();
            }
            this.ttext = org.libspark.betweenas3.BetweenAS3.to(this.textobject, {"alpha":0}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.ttext.onComplete = destroy;
            this.ttext.play();
            return;
        }

        public function imageLoadingDone(arg1:flash.events.Event):void
        {
            this.imageLoader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone);
            this.loaded = true;
            var loc2:*;
            this.imageLoader.content.y = loc2 = this._root.teaserimagepadding;
            this.imageLoader.content.x = loc2;
            this.container.addChild(this.imageLoader.content);
            this.container.addChild(this.captionbg);
            this.container.addChild(this.txt);
            var loc1:*=new dropshadow(this._root, this.imageLoader.content, this._root.imageshadowdistance, this._root.imageshadowangle, this._root.imageshadowcolor, this._root.imageshadowopacity * 2, this._root.imageshadowblur, this._root.imageshadowblur, 1, 3);
            this.tin = org.libspark.betweenas3.BetweenAS3.to(this.container, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.tin.play();
            this.addEvents();
            return;
        }

        internal function mouse_click(arg1:*):void
        {
            var urltarget:String;
            var urllink:String;
            var event:*;
            var req:flash.net.URLRequest;

            var loc1:*;
            urllink = null;
            urltarget = null;
            req = null;
            event = arg1;
            if (this._root.teaserdata_array[this._ivar]["clicklink"] == "") 
            {
                if (this._creator.allow) 
                {
                    this._creator.disallowClick();
                    this.textobject = new newslib.createtext(this._stage, this._root, this._ivar, this);
                    this.textobject.alpha = 0;
                    this._creator.addChild(this.textobject);
                    if (this.ttext != null) 
                    {
                        this.ttext.stop();
                    }
                    this.ttext = org.libspark.betweenas3.BetweenAS3.to(this.textobject, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.ttext.play();
                }
            }
            else 
            {
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
            }
            return;
        }

        public function onMouseOut(arg1:flash.events.MouseEvent):*
        {
            if (this.tover != null) 
            {
                this.tover.stop();
            }
            this.tout = org.libspark.betweenas3.BetweenAS3.to(this.imageLoader.content, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
            this.tout.play();
            return;
        }

        public function imageLoad():void
        {
            this.imageLoader.load(new flash.net.URLRequest(this.thumburl));
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone, false, 0, true);
            return;
        }

        internal function addEvents():void
        {
            this.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.onMouseOut, false, 0, true);
            this.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.onMouseOver, false, 0, true);
            this.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click, false, 0, true);
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var ttext:org.libspark.betweenas3.tweens.ITween;

        internal var loaded:Boolean=false;

        internal var urllinkrequest:flash.net.URLRequest;

        internal var container:flash.display.MovieClip;

        internal var imageLoader:flash.display.Loader;

        internal var tover:org.libspark.betweenas3.tweens.ITween;

        internal var _container:flash.display.MovieClip;

        internal var thumburl:String;

        internal var lineoverlay:flash.display.Sprite;

        internal var tin:org.libspark.betweenas3.tweens.ITween;

        internal var tout:org.libspark.betweenas3.tweens.ITween;

        internal var captionbg:flash.display.Sprite;

        internal var textobject:*;

        internal var _creator:flash.display.MovieClip;

        internal var solidbg:flash.display.Sprite;

        public var _yvar:Number;

        internal var txt:flash.text.TextField;

        internal var _ivar:Number;

        internal var _stage:flash.display.Stage;
    }
}
