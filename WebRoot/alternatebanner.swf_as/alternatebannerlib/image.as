package alternatebannerlib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class image extends flash.display.MovieClip
    {
        public function image(arg1:flash.display.MovieClip, arg2:flash.display.MovieClip, arg3:Number, arg4:flash.display.MovieClip)
        {
            var con:flash.display.MovieClip;
            var r:flash.display.MovieClip;
            var iv:Number;
            var ba:flash.display.MovieClip;

            var loc1:*;
            r = arg1;
            con = arg2;
            iv = arg3;
            ba = arg4;
            this.imageLoader = new flash.display.Loader();
            this.imageLoaderContext = new flash.system.LoaderContext(true);
            this.preshape = new flash.display.Sprite();
            this.preloadermc = new flash.display.MovieClip();
            super();
            this._root = r;
            this._container = con;
            this._ivar = iv;
            this._banner = ba;
            this.urllink = this._root.bannerdata_array[this._ivar]["entryurl"];
            this.urllinkrequest = new flash.net.URLRequest(this.urllink);
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function (arg1:flash.events.IOErrorEvent):void
            {
                return;
            }, false, 0, true)
            this.preshape.graphics.beginFill(this._root.preloadercolor);
            this.preshape.graphics.drawRect(0, 0, 10, 10);
            this.preshape.graphics.endFill();
            this.preshape.mouseEnabled = false;
            this.preshape.alpha = this._root.preloaderopacity;
            this.preloadermc.addChild(this.preshape);
            this.preloadermc.width = 0;
            this.preloadermc.height = this._root.preloaderheight;
            this.preloadermc.alpha = 0;
            this._root.addChild(this.preloadermc);
            this.loadImage();
            return;
        }

        internal function imageLoadingDone(arg1:flash.events.Event):void
        {
            if (this.preloaderfade_t != null) 
            {
                this.preloaderfade_t.stop();
            }
            this.preloaderfade_t = org.libspark.betweenas3.BetweenAS3.to(this.preloadermc, {"alpha":0}, 1, org.libspark.betweenas3.easing.Expo.easeIn);
            this.preloaderfade_t.onComplete = this.deletePreloader;
            this.preloaderfade_t.play();
            this.loadedvar = true;
            this.imageLoader.contentLoaderInfo.removeEventListener(flash.events.ProgressEvent.PROGRESS, this.loadProgress);
            this.imageLoader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone);
            this.addChild(this.imageLoader.content);
            return;
        }

        public function unLoad():void
        {
            this.imageLoader.unload();
            return;
        }

        internal function deletePreloader():void
        {
            this._root.removeChild(this.preloadermc);
            return;
        }

        internal function loadProgress(arg1:flash.events.ProgressEvent):void
        {
            var loc1:*=arg1.bytesLoaded / arg1.bytesTotal;
            if (this.preloader_t != null) 
            {
                this.preloader_t.stop();
            }
            this.preloader_t = org.libspark.betweenas3.BetweenAS3.to(this.preloadermc, {"alpha":1, "width":loc1 * this._root.bannerwidth}, 0.2, org.libspark.betweenas3.easing.Sine.easeOut);
            this.preloader_t.play();
            return;
        }

        internal function loadImage():void
        {
            this.imageLoader.load(this.urllinkrequest, this.imageLoaderContext);
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone, false, 0, true);
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.ProgressEvent.PROGRESS, this.loadProgress, false, 0, true);
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var urllinkrequest:flash.net.URLRequest;

        internal var imageLoaderContext:flash.system.LoaderContext;

        internal var _container:flash.display.MovieClip;

        internal var _banner:flash.display.MovieClip;

        public var imageLoader:flash.display.Loader;

        public var loadedvar:Boolean=false;

        internal var preloadermc:flash.display.MovieClip;

        internal var preshape:flash.display.Sprite;

        public var _callback:*;

        internal var preloaderfade_t:org.libspark.betweenas3.tweens.ITween;

        internal var urllink:String;

        internal var preloader_t:org.libspark.betweenas3.tweens.ITween;

        internal var tweentarget:int;

        internal var _ivar:Number;
    }
}
