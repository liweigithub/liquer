package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class bgimage extends flash.display.MovieClip
    {
        public function bgimage(arg1:flash.display.Stage, arg2:flash.display.MovieClip, arg3:flash.display.MovieClip, arg4:flash.display.MovieClip)
        {
            this.maskShape = new bgmaskmc();
            super();
            this._stage = arg1;
            this._root = arg2;
            this._imagecontainer = arg3;
            this._createbg = arg4;
            this.maskShape.width = this._stage.stageWidth;
            this.maskShape.height = 0;
            this._stage.addEventListener(flash.events.Event.RESIZE, this.resizeFunction);
            return;
        }

        internal function imageLoadingDone(arg1:flash.events.Event):void
        {
            this.imageLoader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone);
            this.bitmapStore = new flash.display.BitmapData(this.imageLoader.content.width, this.imageLoader.content.height);
            this.bitmapStore.draw(this.imageLoader.content);
            this.bitmapSmoothed = new flash.display.Bitmap(this.bitmapStore, "auto", true);
            this.bitmapSmoothed.mask = this.maskShape;
            this._imagecontainer.addChild(this.bitmapSmoothed);
            this._imagecontainer.addChild(this.maskShape);
            this._createbg.loadedvar = true;
            this.resizeFunction(null);
            if (this.t_image != null) 
            {
                this.t_image.stop();
            }
            this.t_image = org.libspark.betweenas3.BetweenAS3.to(this.maskShape, {"height":this._stage.stageHeight}, 2, org.libspark.betweenas3.easing.Quint.easeInOut);
            this.t_image.onComplete = this.runKiller;
            this.t_image.play();
            return;
        }

        public function addImage():void
        {
            var loc1:*;
            this._createbg.stopLoaders();
            this._createbg.loadedvar = false;
            this.imageLoader = new flash.display.Loader();
            this.imageLoaderContext = new flash.system.LoaderContext(true);
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function (arg1:flash.events.IOErrorEvent):void
            {
                return;
            }, false, 0, true)
            this.imageLoad();
            return;
        }

        public function stopLoading():void
        {
            var loc1:*;
            if (!this._createbg.loadedvar) 
            {
                try 
                {
                    this.imageLoader.close();
                    this.imageLoader.unload();
                }
                catch (e:Error)
                {
                };
            }
            return;
        }

        internal function imageLoad():void
        {
            this.imageLoader.load(new flash.net.URLRequest(this._root.activeimage), this.imageLoaderContext);
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone);
            return;
        }

        internal function resizeFunction(arg1:flash.events.Event):void
        {
            var loc1:*=NaN;
            var loc2:*=NaN;
            var loc3:*=NaN;
            var loc4:*=undefined;
            var loc5:*=undefined;
            if (this._createbg.loadedvar) 
            {
                this.maskShape.width = this._stage.stageWidth;
                if (this.t_image != null) 
                {
                    this.t_image.stop();
                }
                this.t_image = org.libspark.betweenas3.BetweenAS3.to(this.maskShape, {"height":this._stage.stageHeight}, 1, org.libspark.betweenas3.easing.Quint.easeInOut);
                this.t_image.onComplete = this.runKiller;
                this.t_image.play();
                loc1 = this._stage.stageWidth;
                loc2 = this._stage.stageHeight;
                loc4 = loc1 / this.imageLoader.content.width;
                loc5 = loc2 / this.imageLoader.content.height;
                if (loc4 > loc5) 
                {
                    loc3 = loc4;
                }
                else 
                {
                    loc3 = loc5;
                }
                this.bitmapSmoothed.scaleX = loc3;
                this.bitmapSmoothed.scaleY = loc3;
            }
            return;
        }

        internal function runKiller():void
        {
            this._createbg.killImages();
            return;
        }

        public function removeImage():void
        {
            this._stage.removeEventListener(flash.events.Event.RESIZE, this.resizeFunction);
            this.bitmapSmoothed.mask = null;
            this._imagecontainer.removeChild(this.maskShape);
            this._imagecontainer.removeChild(this.bitmapSmoothed);
            this.bitmapSmoothed = null;
            this.bitmapStore = null;
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var imageLoaderContext:flash.system.LoaderContext;

        internal var imageLoader:flash.display.Loader;

        internal var t_image:org.libspark.betweenas3.tweens.ITween;

        internal var maskShape:bgmaskmc;

        internal var bitmapSmoothed:flash.display.Bitmap;

        internal var _createbg:flash.display.MovieClip;

        internal var _imagecontainer:flash.display.MovieClip;

        internal var bitmapStore:flash.display.BitmapData;

        internal var _stage:flash.display.Stage;
    }
}
