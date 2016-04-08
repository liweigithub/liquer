package gallerylib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class thumb extends flash.display.MovieClip
    {
        public function thumb(arg1:flash.display.MovieClip, arg2:flash.display.Stage, arg3:flash.display.MovieClip, arg4:Number, arg5:Number, arg6:flash.display.MovieClip, arg7:Number, arg8:Number, arg9:flash.display.MovieClip, arg10:flash.display.MovieClip)
        {
            this.dataLoader = new flash.display.Loader();
            this.imageLoader = new flash.display.Loader();
            this.imageLoaderContext = new flash.system.LoaderContext(true);
            this.bg = new flash.display.Sprite();
            this.iconbg = new flash.display.Sprite();
            this.closeiconbg = new flash.display.Sprite();
            this.zoombigiconbg = new flash.display.Sprite();
            this.container = new flash.display.MovieClip();
            this.iconmc = new flash.display.MovieClip();
            this.closeiconmc = new flash.display.MovieClip();
            this.bigimagemc = new flash.display.MovieClip();
            this.zoombigiconmc = new flash.display.MovieClip();
            this.closeiconvar = new closeicon();
            this.preloadervar = new preloadermc();
            this.preloadervarbig = new preloadermc();
            this.zoombigiconvar = new zoomicon();
            super();
            this._root = arg1;
            this._stage = arg2;
            this._container = arg3;
            this._ivar = arg4;
            this._categoryivar = arg5;
            this._category = arg6;
            this._xvar = arg7;
            this._yvar = arg8;
            this._gallery = arg9;
            this._description = arg10;
            this.x = this._xvar;
            this.y = this._yvar;
            this.thumbwidth = this._root.thumbwidth;
            this.thumbheight = this._root.thumbheight;
            this.ts = this._root.thumbscaleup;
            this.fx = this._root.thumbfxstrength;
            this.bl = this._root.thumbblurstrength;
            this.sh = this._root.thumbshadowstrength;
            this.so = this._root.thumbshadowopacity;
            this.mw = (this._root.thumbwidth + this._root.thumbspacing) * this._root.thumbcolumns;
            this.mh = (this._root.thumbheight + this._root.thumbspacing) * this._root.thumbrows;
            this.thumburl = this._root.gallerydata_array[this._categoryivar]["entrythumblink"][this._ivar];
            this.entrytype = this._root.gallerydata_array[this._categoryivar]["entrytype"][this._ivar];
            this.preloadervar.alpha = 0.2;
            this.preloadervar.x = this._xvar + Math.round(this.thumbwidth / 2);
            this.preloadervar.y = this._yvar + Math.round(this.thumbheight / 2);
            this._container.addChild(this.preloadervar);
            this.imageLoad();
            return;
        }

        public function onMouseOver(arg1:flash.events.MouseEvent):*
        {
            this._description.txtfield.htmlText = this._root.gallerydata_array[this._categoryivar]["text"][this._ivar];
            this._description.txtfield.y = Math.round(this._gallery.descareaheight / 2 - this._description.txtfield.height / 2);
            this._container.setChildIndex(this, (this._container.numChildren - 1));
            var loc1:*=org.libspark.betweenas3.BetweenAS3.tween(this.container, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, {"_colorMatrixFilter":{"matrix":[0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0]}}, 2, org.libspark.betweenas3.easing.Sine.easeOut);
            var loc2:*=org.libspark.betweenas3.BetweenAS3.to(this.container, {"scaleX":this.ts, "scaleY":this.ts}, 0.6, org.libspark.betweenas3.easing.Expo.easeOut);
            var loc3:*=org.libspark.betweenas3.BetweenAS3.tween(this.container, {"_blurFilter":{"blurX":0, "blurY":0, "quality":1}}, {"_blurFilter":{"blurX":this.bl, "blurY":this.bl, "quality":1}}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            var loc4:*=org.libspark.betweenas3.BetweenAS3.to(this.container, {"_dropShadowFilter":{"distance":0, "angle":0, "color":0, "alpha":this.so, "blurX":this.sh, "blurY":this.sh, "strength":1.5, "quality":2}}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            var loc5:*=org.libspark.betweenas3.BetweenAS3.to(this.iconmc, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            if (this.tout != null) 
            {
                this.tout.stop();
            }
            this.tover = org.libspark.betweenas3.BetweenAS3.parallel(loc1, loc2, loc3, loc4, loc5);
            this.tover.play();
            this._gallery.showDescription();
            return;
        }

        internal function loadBigImage():void
        {
            var loc1:*;
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function (arg1:flash.events.IOErrorEvent):void
            {
                return;
            }, false, 0, true)
            this.urllink = this._root.gallerydata_array[this._categoryivar]["entrylink"][this._ivar];
            this.urllinkrequest = new flash.net.URLRequest(this.urllink);
            this.imageLoader.load(this.urllinkrequest, this.imageLoaderContext);
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.bigImageLoadingDone, false, 0, true);
            return;
        }

        internal function bigImageOut(arg1:*):void
        {
            if (this.bigzoom_t != null) 
            {
                this.bigzoom_t.stop();
            }
            this.bigzoom_t = org.libspark.betweenas3.BetweenAS3.to(this.zoombigiconmc, {"alpha":0}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.bigzoom_t.play();
            return;
        }

        internal function checkForNext():void
        {
            if (this._category.selectnext) 
            {
                this._category.selectnext = false;
                this._category.loadNext();
            }
            else if (this._category.selectprevious) 
            {
                this._category.selectprevious = false;
                this._category.loadPrevious();
            }
            return;
        }

        public function loadEntry():void
        {
            this._gallery.disallowClicks();
            this._category.detailmode = true;
            this.addPreloadFrame();
            this._gallery.hidePageNav();
            this._gallery.showDetailNav();
            if (this.entrytype != "image") 
            {
                if (this.entrytype != "video") 
                {
                    if (this.entrytype == "youtube") 
                    {
                        this.createVideo("youtube");
                    }
                }
                else 
                {
                    this.createVideo("video");
                }
            }
            else 
            {
                this.loadBigImage();
            }
            this._description.txtfield.htmlText = this._root.gallerydata_array[this._categoryivar]["text"][this._ivar];
            this._description.txtfield.y = Math.round(this._gallery.descareaheight / 2 - this._description.txtfield.height / 2);
            this._gallery.showDescription();
            return;
        }

        internal function bigImageClick(arg1:*):void
        {
            var loc1:*=NaN;
            var loc2:*=NaN;
            var loc3:*=NaN;
            var loc4:*=NaN;
            var loc5:*=NaN;
            var loc6:*=NaN;
            var loc7:*=null;
            var loc8:*=null;
            var loc9:*=null;
            var loc10:*=null;
            var loc11:*=null;
            var loc12:*=null;
            var loc13:*=null;
            var loc14:*=null;
            if (this._gallery.clicksAllowedCheck()) 
            {
                this._gallery.disallowClicks();
                if (this._category.imagezoomed) 
                {
                    this._category.imagezoomed = false;
                    if (this.tbt != null) 
                    {
                        this.tbt.stop();
                    }
                    this.tbt = org.libspark.betweenas3.BetweenAS3.to(this.thumbblock, {"x":this.tbx, "y":this.tby, "width":this.tbwidth, "height":this.tbheight}, 0.5, org.libspark.betweenas3.easing.Sine.easeInOut);
                    this.tbt.play();
                    this._stage.removeEventListener(flash.events.Event.RESIZE, this.bigImageResize);
                    if (this._category.lb_t_detail != null) 
                    {
                        this._category.lb_t_detail.stop();
                    }
                    this._category.lb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailleft_mc, {"x":this._root.gallerypadding + 15, "y":this._root.galleryheight - Math.round(this._gallery.descareaheight / 2)}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
                    this._category.lb_t_detail.play();
                    if (this._category.rb_t_detail != null) 
                    {
                        this._category.rb_t_detail.stop();
                    }
                    this._category.rb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailright_mc, {"x":this._root.gallerywidth - this._root.gallerypadding - 14, "y":this._root.galleryheight - Math.round(this._gallery.descareaheight / 2)}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
                    this._category.rb_t_detail.play();
                    loc11 = org.libspark.betweenas3.BetweenAS3.tween(this.bitmapSmoothed, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, {"_colorMatrixFilter":{"matrix":[0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0]}}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
                    loc12 = org.libspark.betweenas3.BetweenAS3.tween(this.bitmapSmoothed, {"_blurFilter":{"blurX":0, "blurY":0, "quality":1}}, {"_blurFilter":{"blurX":this.bl / 2, "blurY":this.bl / 2, "quality":1}}, 0.5, org.libspark.betweenas3.easing.Sine.easeIn);
                    loc13 = org.libspark.betweenas3.BetweenAS3.to(this.bitmapSmoothed, {"width":this.origwidth, "height":this.origheight}, 0.5, org.libspark.betweenas3.easing.Expo.easeInOut);
                    loc14 = org.libspark.betweenas3.BetweenAS3.to(this.bitmapSmoothed, {"x":Math.round(this.tbwidth / 2 - this.origwidth / 2), "y":Math.round(this.tbheight / 2 - this.origheight / 2)}, 0.5, org.libspark.betweenas3.easing.Expo.easeInOut);
                    if (this.image_t != null) 
                    {
                        this.image_t.stop();
                    }
                    this.image_t = org.libspark.betweenas3.BetweenAS3.parallel(loc11, loc12, loc13, loc14);
                    this.image_t.onComplete = this.restoreNavig;
                    this.image_t.play();
                    if (this.closeicon_t != null) 
                    {
                        this.closeicon_t.stop();
                    }
                    this.closeicon_t = org.libspark.betweenas3.BetweenAS3.to(this.closeiconmc, {"x":Math.round(Math.round(this.tbwidth / 2 - this.origwidth / 2) + this.origwidth - this.closeiconmc.width / 2) - 10, "y":Math.round(Math.round(this.tbheight / 2 - this.origheight / 2) + this.closeiconmc.width / 2) + 10}, 0.4, org.libspark.betweenas3.easing.Expo.easeInOut);
                    this.closeicon_t.play();
                }
                else 
                {
                    this._category.imagezoomed = true;
                    this._root.mainroot.module.deactivateMask();
                    this._root.mainroot.util.hideUtil();
                    this._root.mainroot.menuobj.menuOff();
                    this._root.mainroot.logo.logoOff();
                    loc1 = this.bitmapSmoothed.width / this.bitmapSmoothed.height;
                    loc2 = this.bitmapSmoothed.height / this.bitmapSmoothed.width;
                    if (this._stage.stageHeight / this._stage.stageWidth < loc2) 
                    {
                        loc4 = this._stage.stageHeight;
                        loc3 = Math.round(loc1 * this._stage.stageHeight);
                    }
                    else 
                    {
                        loc3 = this._stage.stageWidth;
                        loc4 = Math.round(loc2 * this._stage.stageWidth);
                    }
                    loc5 = Math.round(this._stage.stageWidth / 2 - loc3 / 2) - this._root.gallerypadding - this._root.playerx;
                    loc6 = Math.round(this._stage.stageHeight / 2 - loc4 / 2) - this._root.categoryareaheight - this._root.gallerypadding - this._root.playery;
                    if (this._category.lb_t_detail != null) 
                    {
                        this._category.lb_t_detail.stop();
                    }
                    this._category.lb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailleft_mc, {"x":loc5 + 45, "y":loc6 + loc4 + 15}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
                    this._category.lb_t_detail.play();
                    if (this._category.rb_t_detail != null) 
                    {
                        this._category.rb_t_detail.stop();
                    }
                    this._category.rb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailright_mc, {"x":loc5 + loc3 - 5, "y":loc6 + loc4 + 15}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
                    this._category.rb_t_detail.play();
                    loc7 = org.libspark.betweenas3.BetweenAS3.tween(this.bitmapSmoothed, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, {"_colorMatrixFilter":{"matrix":[0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0]}}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
                    loc8 = org.libspark.betweenas3.BetweenAS3.tween(this.bitmapSmoothed, {"_blurFilter":{"blurX":0, "blurY":0, "quality":1}}, {"_blurFilter":{"blurX":this.bl / 2, "blurY":this.bl / 2, "quality":1}}, 0.5, org.libspark.betweenas3.easing.Sine.easeIn);
                    loc9 = org.libspark.betweenas3.BetweenAS3.to(this.bitmapSmoothed, {"width":loc3, "height":loc4}, 0.5, org.libspark.betweenas3.easing.Expo.easeInOut);
                    loc10 = org.libspark.betweenas3.BetweenAS3.to(this.bitmapSmoothed, {"x":loc5, "y":loc6}, 0.5, org.libspark.betweenas3.easing.Expo.easeInOut);
                    if (this.image_t != null) 
                    {
                        this.image_t.stop();
                    }
                    this.image_t = org.libspark.betweenas3.BetweenAS3.parallel(loc7, loc8, loc9, loc10);
                    this.image_t.onComplete = this._gallery.allowClicks;
                    this.image_t.play();
                    if (this.closeicon_t != null) 
                    {
                        this.closeicon_t.stop();
                    }
                    this.closeicon_t = org.libspark.betweenas3.BetweenAS3.to(this.closeiconmc, {"x":Math.round(loc5 + loc3 - this.closeiconmc.width / 2) - 10, "y":Math.round(loc6 + this.closeiconmc.width / 2) + 10}, 0.6, org.libspark.betweenas3.easing.Expo.easeInOut);
                    this.closeicon_t.play();
                    this.tbx = this.thumbblock.x;
                    this.tby = this.thumbblock.y;
                    this.tbwidth = this.thumbblock.width;
                    this.tbheight = this.thumbblock.height;
                    this.thumbblock.x = -this._root.playerx - this.tbx - this._root.gallerypadding;
                    this.thumbblock.y = -this._root.playery - this.tby - this._root.categoryareaheight - this._root.gallerypadding;
                    this.thumbblock.width = this._stage.stageWidth;
                    this.thumbblock.height = this._stage.stageHeight;
                    this.thumbblock.alpha = 0;
                    if (this.tbt != null) 
                    {
                        this.tbt.stop();
                    }
                    this.tbt = org.libspark.betweenas3.BetweenAS3.to(this.thumbblock, {"alpha":this._root.preloadoverlayopacity}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.tbt.play();
                    this._stage.addEventListener(flash.events.Event.RESIZE, this.bigImageResize, false, 0, true);
                }
            }
            return;
        }

        public function killLoader():void
        {
            var loc1:*;
            try 
            {
                if (!this.loaded) 
                {
                    this.dataLoader.close();
                }
                this.dataLoader.unload();
                this.imageLoader.unload();
            }
            catch (e:Error)
            {
            };
            return;
        }

        public function bigRemover():void
        {
            var loc1:*=null;
            var loc2:*=null;
            var loc3:*=null;
            var loc4:*=null;
            var loc5:*=null;
            var loc6:*=null;
            if (this._gallery.clicksAllowedCheck()) 
            {
                this._gallery.disallowClicks();
                this._description.txtfield.htmlText = "";
                this._gallery.showPageNav();
                this._gallery.hideDetailNav();
                if (this.tbt != null) 
                {
                    this.tbt.stop();
                }
                if (this.entrytype != "image") 
                {
                    loc4 = org.libspark.betweenas3.BetweenAS3.tween(this.videocontainer, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, {"_colorMatrixFilter":{"matrix":[0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0]}}, 0.3, org.libspark.betweenas3.easing.Expo.easeOut);
                    loc5 = org.libspark.betweenas3.BetweenAS3.tween(this.videocontainer, {"_blurFilter":{"blurX":this.bl / 2, "blurY":this.bl / 2, "quality":1}}, {"_blurFilter":{"blurX":0, "blurY":0, "quality":1}}, 0.3, org.libspark.betweenas3.easing.Sine.easeOut);
                    loc6 = org.libspark.betweenas3.BetweenAS3.to(this.videocontainer, {"alpha":0}, 0.3, org.libspark.betweenas3.easing.Sine.easeOut);
                    if (this.closei_t != null) 
                    {
                        this.closei_t.stop();
                    }
                    this.closei_t = org.libspark.betweenas3.BetweenAS3.to(this.closeiconmc, {"alpha":0}, 0.2, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.closei_t.play();
                    if (this.image_t != null) 
                    {
                        this.image_t.stop();
                    }
                    this.image_t = org.libspark.betweenas3.BetweenAS3.parallel(loc4, loc5, loc6);
                    this.image_t.onComplete = this.killVideo;
                    this.image_t.play();
                    this.videop.mutePlayer();
                }
                else 
                {
                    if (this.image_t != null) 
                    {
                        this.image_t.stop();
                    }
                    loc1 = org.libspark.betweenas3.BetweenAS3.tween(this.bitmapSmoothed, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, {"_colorMatrixFilter":{"matrix":[0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0]}}, 0.3, org.libspark.betweenas3.easing.Expo.easeOut);
                    loc2 = org.libspark.betweenas3.BetweenAS3.tween(this.bitmapSmoothed, {"_blurFilter":{"blurX":this.bl / 2, "blurY":this.bl / 2, "quality":1}}, {"_blurFilter":{"blurX":0, "blurY":0, "quality":1}}, 0.3, org.libspark.betweenas3.easing.Sine.easeOut);
                    loc3 = org.libspark.betweenas3.BetweenAS3.to(this.bitmapSmoothed, {"alpha":0}, 0.3, org.libspark.betweenas3.easing.Sine.easeOut);
                    if (this.closei_t != null) 
                    {
                        this.closei_t.stop();
                    }
                    this.closei_t = org.libspark.betweenas3.BetweenAS3.to(this.closeiconmc, {"alpha":0}, 0.2, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.closei_t.play();
                    if (this.image_t != null) 
                    {
                        this.image_t.stop();
                    }
                    this.image_t = org.libspark.betweenas3.BetweenAS3.parallel(loc1, loc2, loc3);
                    this.image_t.onComplete = this.killImage;
                    this.image_t.play();
                }
                this.resetDetailNav();
            }
            return;
        }

        internal function mouse_click(arg1:*):void
        {
            if (this._gallery.clicksAllowedCheck()) 
            {
                this.loadEntry();
            }
            return;
        }

        internal function addPreloadFrame():void
        {
            this.thumbblock = new flash.display.Sprite();
            this.thumbblock.graphics.beginFill(this._root.preloadoverlaycolor);
            this.thumbblock.graphics.drawRect(0, 0, this.mw, this.mh);
            this.thumbblock.graphics.endFill();
            this.thumbblock.buttonMode = false;
            this.thumbblock.mouseEnabled = true;
            this.thumbblock.alpha = 0;
            this._container.addChild(this.thumbblock);
            if (this.tbt != null) 
            {
                this.tbt.stop();
            }
            this.tbt = org.libspark.betweenas3.BetweenAS3.to(this.thumbblock, {"alpha":this._root.preloadoverlayopacity}, 1, org.libspark.betweenas3.easing.Sine.easeOut);
            this.tbt.play();
            this.preloadervarbig.mouseEnabled = false;
            this.preloadervarbig.buttonMode = false;
            this.preloadervarbig.alpha = 0.6;
            this.preloadervarbig.x = Math.round(this.mw / 2);
            this.preloadervarbig.y = Math.round(this.mh / 2);
            this._container.addChild(this.preloadervarbig);
            return;
        }

        public function onMouseOut(arg1:flash.events.MouseEvent):*
        {
            var loc1:*=org.libspark.betweenas3.BetweenAS3.to(this.container, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
            var loc2:*=org.libspark.betweenas3.BetweenAS3.to(this.container, {"scaleX":1, "scaleY":1}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            var loc3:*=org.libspark.betweenas3.BetweenAS3.tween(this.container, {"_blurFilter":{"blurX":0, "blurY":0, "quality":1}}, {"_blurFilter":{"blurX":this.bl / 2, "blurY":this.bl / 2, "quality":1}}, 0.4, org.libspark.betweenas3.easing.Sine.easeIn);
            var loc4:*=org.libspark.betweenas3.BetweenAS3.to(this.container, {"_dropShadowFilter":{"distance":0, "angle":0, "color":0, "alpha":0, "blurX":0, "blurY":0, "strength":0, "quality":1}}, 0.4, org.libspark.betweenas3.easing.Sine.easeIn);
            var loc5:*=org.libspark.betweenas3.BetweenAS3.to(this.iconmc, {"alpha":0}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            if (this.tover != null) 
            {
                this.tover.stop();
            }
            this.tout = org.libspark.betweenas3.BetweenAS3.parallel(loc1, loc2, loc3, loc4, loc5);
            this.tout.play();
            if (!this._category.detailmode) 
            {
                this._gallery.hideDescription();
            }
            return;
        }

        internal function zoomImage():void
        {
            var loc1:*=NaN;
            var loc2:*=NaN;
            var loc3:*=NaN;
            var loc4:*=NaN;
            var loc5:*=NaN;
            var loc6:*=NaN;
            var loc7:*=null;
            var loc8:*=null;
            var loc9:*=null;
            var loc10:*=null;
            this._gallery.allowClicks();
            if (this._gallery.clicksAllowedCheck()) 
            {
                this._gallery.disallowClicks();
                this._root.mainroot.module.deactivateMask();
                this._root.mainroot.util.hideUtil();
                this._root.mainroot.menuobj.menuOff();
                this._root.mainroot.logo.logoOff();
                loc1 = this.bitmapSmoothed.width / this.bitmapSmoothed.height;
                loc2 = this.bitmapSmoothed.height / this.bitmapSmoothed.width;
                if (this._stage.stageHeight / this._stage.stageWidth < loc2) 
                {
                    loc4 = this._stage.stageHeight;
                    loc3 = Math.round(loc1 * this._stage.stageHeight);
                }
                else 
                {
                    loc3 = this._stage.stageWidth;
                    loc4 = Math.round(loc2 * this._stage.stageWidth);
                }
                loc5 = Math.round(this._stage.stageWidth / 2 - loc3 / 2) - this._root.gallerypadding - this._root.playerx;
                loc6 = Math.round(this._stage.stageHeight / 2 - loc4 / 2) - this._root.categoryareaheight - this._root.gallerypadding - this._root.playery;
                this.lbx = this._gallery.detailleft_mc.x;
                this.lby = this._gallery.detailleft_mc.y;
                this.rbx = this._gallery.detailright_mc.x;
                this.rby = this._gallery.detailright_mc.y;
                if (this._category.lb_t_detail != null) 
                {
                    this._category.lb_t_detail.stop();
                }
                this._category.lb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailleft_mc, {"x":loc5 + 45, "y":loc6 + loc4 + 15}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
                this._category.lb_t_detail.play();
                if (this._category.rb_t_detail != null) 
                {
                    this._category.rb_t_detail.stop();
                }
                this._category.rb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailright_mc, {"x":loc5 + loc3 - 5, "y":loc6 + loc4 + 15}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
                this._category.rb_t_detail.play();
                loc7 = org.libspark.betweenas3.BetweenAS3.tween(this.bitmapSmoothed, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, {"_colorMatrixFilter":{"matrix":[0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0]}}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
                loc8 = org.libspark.betweenas3.BetweenAS3.tween(this.bitmapSmoothed, {"_blurFilter":{"blurX":0, "blurY":0, "quality":1}}, {"_blurFilter":{"blurX":this.bl / 2, "blurY":this.bl / 2, "quality":1}}, 0.5, org.libspark.betweenas3.easing.Sine.easeIn);
                loc9 = org.libspark.betweenas3.BetweenAS3.to(this.bitmapSmoothed, {"width":loc3, "height":loc4}, 0.5, org.libspark.betweenas3.easing.Expo.easeInOut);
                loc10 = org.libspark.betweenas3.BetweenAS3.to(this.bitmapSmoothed, {"x":loc5, "y":loc6}, 0.5, org.libspark.betweenas3.easing.Expo.easeInOut);
                if (this.image_t != null) 
                {
                    this.image_t.stop();
                }
                this.image_t = org.libspark.betweenas3.BetweenAS3.parallel(loc7, loc8, loc9, loc10);
                this.image_t.onComplete = this._gallery.allowClicks;
                this.image_t.play();
                if (this.closeicon_t != null) 
                {
                    this.closeicon_t.stop();
                }
                this.closeicon_t = org.libspark.betweenas3.BetweenAS3.to(this.closeiconmc, {"x":Math.round(loc5 + loc3 - this.closeiconmc.width / 2) - 10, "y":Math.round(loc6 + this.closeiconmc.width / 2) + 10}, 0.6, org.libspark.betweenas3.easing.Expo.easeInOut);
                this.closeicon_t.play();
                this.tbx = this.thumbblock.x;
                this.tby = this.thumbblock.y;
                this.tbwidth = this.thumbblock.width;
                this.tbheight = this.thumbblock.height;
                this.thumbblock.x = -this._root.playerx - this.tbx - this._root.gallerypadding;
                this.thumbblock.y = -this._root.playery - this.tby - this._root.categoryareaheight - this._root.gallerypadding;
                this.thumbblock.width = this._stage.stageWidth;
                this.thumbblock.height = this._stage.stageHeight;
                this.thumbblock.alpha = 0;
                if (this.tbt != null) 
                {
                    this.tbt.stop();
                }
                this.tbt = org.libspark.betweenas3.BetweenAS3.to(this.thumbblock, {"alpha":this._root.preloadoverlayopacity}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.tbt.play();
                this._stage.addEventListener(flash.events.Event.RESIZE, this.bigImageResize, false, 0, true);
            }
            return;
        }

        internal function addEvents():void
        {
            this.bg.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.onMouseOut, false, 0, true);
            this.bg.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.onMouseOver, false, 0, true);
            this.bg.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click, false, 0, true);
            return;
        }

        public function imageLoadingDone(arg1:flash.events.Event):void
        {
            this.dataLoader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone);
            this.loaded = true;
            var loc6:*;
            var loc7:*=((loc6 = this._category).thumbsloaded + 1);
            loc6.thumbsloaded = loc7;
            this.bitmapStore = new flash.display.BitmapData(this.thumbwidth, this.thumbheight);
            this.bitmapStore.draw(this.dataLoader.content);
            this.bitmapSmoothed = new flash.display.Bitmap(this.bitmapStore, "auto", true);
            this.bitmapSmoothed.x = -Math.round(this.thumbwidth / 2);
            this.bitmapSmoothed.y = -Math.round(this.thumbheight / 2);
            this.bg.graphics.beginFill(0, 0);
            this.bg.graphics.drawRect(0, 0, this.thumbwidth, this.thumbheight);
            this.bg.graphics.endFill();
            this.container.x = Math.round(this.thumbwidth / 2);
            this.container.y = Math.round(this.thumbheight / 2);
            this.container.alpha = 0;
            this.addChild(this.container);
            this.addChild(this.bg);
            this.bg.buttonMode = true;
            if (this.entrytype != "image") 
            {
                this.iconvar = new playicon();
            }
            else 
            {
                this.iconvar = new zoomicon();
            }
            this.iconbg.graphics.beginFill(this._root.thumbiconbgcolor);
            this.iconbg.graphics.drawRoundRect(-15, -15, 30, 30, 7, 7);
            this.iconbg.graphics.endFill();
            this.closeiconbg.graphics.beginFill(this._root.thumbiconbgcolor);
            this.closeiconbg.graphics.drawRoundRect(-15, -15, 30, 30, 7, 7);
            this.closeiconbg.graphics.endFill();
            this.zoombigiconbg.graphics.beginFill(this._root.thumbiconbgcolor);
            this.zoombigiconbg.graphics.drawRoundRect(-15, -15, 30, 30, 7, 7);
            this.zoombigiconbg.graphics.endFill();
            this._gallery.colorTrans(this.iconvar, this._root.thumbiconcolor);
            this.iconbg.alpha = loc6 = this._root.thumbiconopacity;
            this.iconvar.alpha = loc6;
            this.iconmc.mouseEnabled = loc6 = false;
            this.iconbg.mouseEnabled = loc6 = loc6;
            this.iconvar.mouseEnabled = loc6;
            this._gallery.colorTrans(this.closeiconvar, this._root.thumbiconcolor);
            this.closeiconbg.alpha = loc6 = this._root.thumbiconopacity;
            this.closeiconvar.alpha = loc6;
            this.closeiconbg.mouseEnabled = loc6 = false;
            this.closeiconvar.mouseEnabled = loc6;
            this._gallery.colorTrans(this.zoombigiconvar, this._root.thumbiconcolor);
            this.zoombigiconbg.alpha = loc6 = this._root.thumbiconopacity;
            this.zoombigiconvar.alpha = loc6;
            this.zoombigiconbg.mouseEnabled = loc6 = false;
            this.zoombigiconvar.mouseEnabled = loc6 = loc6;
            this.zoombigiconmc.mouseEnabled = loc6;
            this.iconmc.addChild(this.iconbg);
            this.iconmc.addChild(this.iconvar);
            this.iconmc.x = Math.round(this.thumbwidth / 2);
            this.iconmc.y = Math.round(this.thumbheight / 2);
            this.iconmc.alpha = 0;
            this.closeiconmc.addChild(this.closeiconbg);
            this.closeiconmc.addChild(this.closeiconvar);
            this.zoombigiconmc.addChild(this.zoombigiconbg);
            this.zoombigiconmc.addChild(this.zoombigiconvar);
            this.container.addChild(this.bitmapSmoothed);
            this.addChild(this.iconmc);
            this._container.addChild(this);
            org.libspark.betweenas3.BetweenAS3.apply(this.container, {"_colorMatrixFilter":{"matrix":[0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0]}});
            org.libspark.betweenas3.BetweenAS3.apply(this.container, {"scaleX":this.ts, "scaleY":this.ts});
            org.libspark.betweenas3.BetweenAS3.apply(this.container, {"_blurFilter":{"blurX":this.bl, "blurY":this.bl}});
            org.libspark.betweenas3.BetweenAS3.apply(this.container, {"_dropShadowFilter":{"distance":0, "angle":0, "color":0, "alpha":this.so, "blurX":this.sh, "blurY":this.sh, "strength":1.5, "quality":1}});
            var loc1:*=org.libspark.betweenas3.BetweenAS3.to(this.container, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            var loc2:*=org.libspark.betweenas3.BetweenAS3.to(this.container, {"scaleX":1, "scaleY":1}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            var loc3:*=org.libspark.betweenas3.BetweenAS3.tween(this.container, {"_blurFilter":{"blurX":0, "blurY":0, "quality":1}}, {"_blurFilter":{"blurX":this.bl / 2, "blurY":this.bl / 2, "quality":1}}, 0.5, org.libspark.betweenas3.easing.Sine.easeIn);
            var loc4:*=org.libspark.betweenas3.BetweenAS3.to(this.container, {"_dropShadowFilter":{"distance":0, "angle":0, "color":0, "alpha":0, "blurX":0, "blurY":0, "strength":0, "quality":1}}, 0.5, org.libspark.betweenas3.easing.Sine.easeIn);
            var loc5:*=org.libspark.betweenas3.BetweenAS3.to(this.container, {"alpha":1}, 0.3, org.libspark.betweenas3.easing.Sine.easeOut);
            this.tin = org.libspark.betweenas3.BetweenAS3.parallel(loc1, loc2, loc3, loc4, loc5);
            this.tin.onComplete = this.addEvents;
            this.tin.play();
            if (this._category.selectfirst && this._category.thumbsloaded == this._category.thumbsonpage) 
            {
                this._category.selectfirst = false;
                this._category.firstEntry();
            }
            else if (this._category.selectlast && this._category.thumbsloaded == this._category.thumbsonpage) 
            {
                this._category.selectlast = false;
                this._category.lastEntry();
            }
            return;
        }

        internal function close_out(arg1:*):void
        {
            if (this.closei_t != null) 
            {
                this.closei_t.stop();
            }
            this.closei_t = org.libspark.betweenas3.BetweenAS3.to(this.closeiconmc, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.closei_t.play();
            return;
        }

        internal function restoreNavig():void
        {
            this._gallery.allowClicks();
            this._root.mainroot.module.activateMask();
            this._root.mainroot.util.showUtil();
            this._root.mainroot.menuobj.menuOn();
            this._root.mainroot.logo.logoOn();
            return;
        }

        internal function bigImageLoadingDone(arg1:flash.events.Event):void
        {
            var loc1:*=NaN;
            var loc2:*=NaN;
            this.imageLoader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone);
            this.bitmapStore = new flash.display.BitmapData(this.imageLoader.content.width, this.imageLoader.content.height);
            this.bitmapStore.draw(this.imageLoader.content);
            this.bitmapSmoothed = new flash.display.Bitmap(this.bitmapStore, "auto", true);
            loc1 = this.bitmapSmoothed.width / this.bitmapSmoothed.height;
            loc2 = this.bitmapSmoothed.height / this.bitmapSmoothed.width;
            if (this.thumbblock.height / this.thumbblock.width < loc2) 
            {
                this.bitmapSmoothed.height = this.thumbblock.height;
                this.bitmapSmoothed.width = Math.round(loc1 * this.thumbblock.height);
            }
            else 
            {
                this.bitmapSmoothed.width = this.thumbblock.width;
                this.bitmapSmoothed.height = Math.round(loc2 * this.thumbblock.width);
            }
            this.bitmapSmoothed.x = Math.round(this.thumbblock.width / 2 - this.bitmapSmoothed.width / 2);
            this.bitmapSmoothed.y = Math.round(this.thumbblock.height / 2 - this.bitmapSmoothed.height / 2);
            this.origwidth = this.bitmapSmoothed.width;
            this.origheight = this.bitmapSmoothed.height;
            this.zoombigiconmc.x = this.bitmapSmoothed.x + Math.round(this.bitmapSmoothed.width / 2);
            this.zoombigiconmc.y = this.bitmapSmoothed.y + Math.round(this.bitmapSmoothed.height / 2);
            this.zoombigiconmc.alpha = 0;
            this.bitmapSmoothed.alpha = 0;
            this.bigimagemc.mouseEnabled = true;
            this.bigimagemc.buttonMode = true;
            this._container.addChild(this.bigimagemc);
            this._container.addChild(this.zoombigiconmc);
            this.bigimagemc.addChild(this.bitmapSmoothed);
            var loc3:*=org.libspark.betweenas3.BetweenAS3.tween(this.bitmapSmoothed, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, {"_colorMatrixFilter":{"matrix":[0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0]}}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            var loc4:*=org.libspark.betweenas3.BetweenAS3.tween(this.bitmapSmoothed, {"_blurFilter":{"blurX":0, "blurY":0, "quality":1}}, {"_blurFilter":{"blurX":this.bl / 2, "blurY":this.bl / 2, "quality":1}}, 0.5, org.libspark.betweenas3.easing.Sine.easeIn);
            var loc5:*=org.libspark.betweenas3.BetweenAS3.to(this.bitmapSmoothed, {"alpha":1}, 0.3, org.libspark.betweenas3.easing.Sine.easeOut);
            this.image_t = org.libspark.betweenas3.BetweenAS3.parallel(loc3, loc4, loc5);
            if (this._category.imagezoomed) 
            {
                this.image_t.onComplete = this.zoomImage;
            }
            else 
            {
                this.image_t.onComplete = this._gallery.allowClicks;
            }
            this.image_t.play();
            this.addCloseFunction("image");
            this.bigimagemc.addEventListener(flash.events.MouseEvent.CLICK, this.bigImageClick, false, 0, true);
            this.bigimagemc.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.bigImageOver, false, 0, true);
            this.bigimagemc.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.bigImageOut, false, 0, true);
            this._category.activethumb = this;
            this._category.activethumbivar = this._ivar;
            this._category.setDetailNav();
            return;
        }

        internal function close_click(arg1:*):void
        {
            if (this._gallery.clicksAllowedCheck()) 
            {
                this._category.imagezoomed = false;
                this.bigRemover();
            }
            return;
        }

        internal function bigImageOver(arg1:*):void
        {
            if (this.bigzoom_t != null) 
            {
                this.bigzoom_t.stop();
            }
            this.bigzoom_t = org.libspark.betweenas3.BetweenAS3.to(this.zoombigiconmc, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.bigzoom_t.play();
            return;
        }

        internal function killImage():void
        {
            this.bigimagemc.removeChild(this.bitmapSmoothed);
            this._category.detailmode = false;
            this.closeiconmc.removeEventListener(flash.events.MouseEvent.MOUSE_OVER, this.close_over);
            this.closeiconmc.removeEventListener(flash.events.MouseEvent.MOUSE_OUT, this.close_out);
            this.closeiconmc.removeEventListener(flash.events.MouseEvent.CLICK, this.close_click);
            this._container.removeChild(this.zoombigiconmc);
            this._container.removeChild(this.closeiconmc);
            this._container.removeChild(this.thumbblock);
            this._container.removeChild(this.preloadervarbig);
            this.restoreNavig();
            this.checkForNext();
            return;
        }

        internal function close_over(arg1:*):void
        {
            if (this.closei_t != null) 
            {
                this.closei_t.stop();
            }
            this.closei_t = org.libspark.betweenas3.BetweenAS3.to(this.closeiconmc, {"alpha":0.6}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.closei_t.play();
            return;
        }

        internal function resetDetailNav():void
        {
            this._stage.removeEventListener(flash.events.Event.RESIZE, this.bigImageResize);
            if (this.tbt != null) 
            {
                this.tbt.stop();
            }
            this.tbt = org.libspark.betweenas3.BetweenAS3.to(this.thumbblock, {"alpha":0}, 0.3, org.libspark.betweenas3.easing.Sine.easeOut);
            this.tbt.play();
            if (this._category.lb_t_detail != null) 
            {
                this._category.lb_t_detail.stop();
            }
            if (this._category.rb_t_detail != null) 
            {
                this._category.rb_t_detail.stop();
            }
            this._gallery.detailleft_mc.x = this._root.gallerypadding + 15;
            this._gallery.detailleft_mc.y = this._root.galleryheight - Math.round(this._gallery.descareaheight / 2);
            this._gallery.detailright_mc.x = this._root.gallerywidth - this._root.gallerypadding - 14;
            this._gallery.detailright_mc.y = this._root.galleryheight - Math.round(this._gallery.descareaheight / 2);
            return;
        }

        public function killVideo():void
        {
            if (!(this.videop == null) && !(this.entrytype == "image")) 
            {
                this.videop.killPlayer();
                this.videop = null;
                this._category.detailmode = false;
                this.closeiconmc.removeEventListener(flash.events.MouseEvent.MOUSE_OVER, this.close_over);
                this.closeiconmc.removeEventListener(flash.events.MouseEvent.MOUSE_OUT, this.close_out);
                this.closeiconmc.removeEventListener(flash.events.MouseEvent.CLICK, this.close_click);
                this._container.removeChild(this.closeiconmc);
                this._container.removeChild(this.thumbblock);
                this._container.removeChild(this.preloadervarbig);
                this.checkForNext();
            }
            return;
        }

        internal function bigImageResize(arg1:flash.events.Event):void
        {
            var loc1:*=NaN;
            var loc2:*=NaN;
            var loc3:*=NaN;
            var loc4:*=NaN;
            var loc5:*=NaN;
            var loc6:*=NaN;
            if (this._category.imagezoomed) 
            {
                if (this.image_t != null) 
                {
                    this.image_t.stop();
                }
                if (this.closeicon_t != null) 
                {
                    this.closeicon_t.stop();
                }
                if (this._category.lb_t_detail != null) 
                {
                    this._category.lb_t_detail.stop();
                }
                if (this._category.rb_t_detail != null) 
                {
                    this._category.rb_t_detail.stop();
                }
                loc1 = this.bitmapSmoothed.width / this.bitmapSmoothed.height;
                loc2 = this.bitmapSmoothed.height / this.bitmapSmoothed.width;
                if (this._stage.stageHeight / this._stage.stageWidth < loc2) 
                {
                    loc4 = this._stage.stageHeight;
                    loc3 = Math.round(loc1 * this._stage.stageHeight);
                }
                else 
                {
                    loc3 = this._stage.stageWidth;
                    loc4 = Math.round(loc2 * this._stage.stageWidth);
                }
                loc5 = Math.round(this._stage.stageWidth / 2 - loc3 / 2) - this._root.gallerypadding - this._root.playerx;
                loc6 = Math.round(this._stage.stageHeight / 2 - loc4 / 2) - this._root.categoryareaheight - this._root.gallerypadding - this._root.playery;
                this._gallery.detailleft_mc.x = loc5 + 45;
                this._gallery.detailleft_mc.y = loc6 + loc4 + 15;
                this._gallery.detailright_mc.x = loc5 + loc3 - 5;
                this._gallery.detailright_mc.y = loc6 + loc4 + 15;
                this.bitmapSmoothed.width = loc3;
                this.bitmapSmoothed.height = loc4;
                this.bitmapSmoothed.x = loc5;
                this.bitmapSmoothed.y = loc6;
                this.closeiconmc.x = Math.round(loc5 + loc3 - this.closeiconmc.width / 2) - 10;
                this.closeiconmc.y = Math.round(loc6 + this.closeiconmc.width / 2) + 10;
                this.thumbblock.x = -this._root.playerx - this.tbx - this._root.gallerypadding;
                this.thumbblock.y = -this._root.playery - this.tby - this._root.categoryareaheight - this._root.gallerypadding;
                this.thumbblock.width = this._stage.stageWidth;
                this.thumbblock.height = this._stage.stageHeight;
            }
            return;
        }

        internal function createVideo(arg1:String):void
        {
            this.videocontainer = new flash.display.MovieClip();
            this._container.addChild(this.videocontainer);
            if (arg1 != "video") 
            {
                if (arg1 == "youtube") 
                {
                    this.videop = new gallerylib.createyoutubeplayer(this._stage, this._root, this, this.videocontainer, this._gallery, this.videop, this._root.gallerydata_array[this._categoryivar]["entrylink"][this._ivar], this._root.gallerydata_array[this._categoryivar]["videopreviewimage"][this._ivar], this._root.videoplayerwidth, this._root.videoplayerheight, this._root.videoautoplay, this._root.videoloop, this._root.videostartvolume);
                }
            }
            else 
            {
                this.videop = new gallerylib.createvideoplayer(this._stage, this._root, this, this.videocontainer, this._gallery, this.videop, this._root.gallerydata_array[this._categoryivar]["entrylink"][this._ivar], this._root.gallerydata_array[this._categoryivar]["videopreviewimage"][this._ivar], this._root.videoplayerwidth, this._root.videoplayerheight, this._root.videoautoplay, this._root.videoloop, this._root.videostartvolume);
            }
            this.addCloseFunction("video");
            this._category.activethumb = this;
            this._category.activethumbivar = this._ivar;
            this._category.setDetailNav();
            return;
        }

        internal function addCloseFunction(arg1:String):void
        {
            if (arg1 != "video") 
            {
                if (arg1 == "image") 
                {
                    this.closeiconmc.x = Math.round(this.bitmapSmoothed.x + this.bitmapSmoothed.width - this.closeiconmc.width / 2) - 10;
                    this.closeiconmc.y = Math.round(this.bitmapSmoothed.y + this.closeiconmc.width / 2) + 10;
                }
            }
            else 
            {
                this.closeiconmc.x = Math.round(this.thumbblock.x + this.thumbblock.width - this.closeiconmc.width / 2) - 10;
                this.closeiconmc.y = Math.round(this.thumbblock.y + this.closeiconmc.width / 2) + 10;
            }
            this.closeiconmc.alpha = 0;
            this.closeiconmc.buttonMode = true;
            this.closeiconmc.mouseEnabled = true;
            this._container.addChild(this.closeiconmc);
            this.closeiconmc.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.close_over, false, 0, true);
            this.closeiconmc.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.close_out, false, 0, true);
            this.closeiconmc.addEventListener(flash.events.MouseEvent.CLICK, this.close_click, false, 0, true);
            if (this.closei_t != null) 
            {
                this.closei_t.stop();
            }
            this.closei_t = org.libspark.betweenas3.BetweenAS3.to(this.closeiconmc, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.closei_t.play();
            return;
        }

        public function imageLoad():void
        {
            this.dataLoader.load(new flash.net.URLRequest(this.thumburl));
            this.dataLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone, false, 0, true);
            return;
        }

        internal var origwidth:int;

        internal var closeicon_t:org.libspark.betweenas3.tweens.ITween;

        internal var bigimagemc:flash.display.MovieClip;

        internal var closei_t:org.libspark.betweenas3.tweens.ITween;

        internal var _description:flash.display.MovieClip;

        internal var bg:flash.display.Sprite;

        internal var rbx:int;

        internal var rby:int;

        internal var imageLoader:flash.display.Loader;

        internal var bl:Number;

        internal var _onMouseOver:*=null;

        internal var sh:Number;

        internal var tover:org.libspark.betweenas3.tweens.ITween;

        internal var tout:org.libspark.betweenas3.tweens.ITween;

        internal var so:Number;

        internal var _category:flash.display.MovieClip;

        internal var zoombigiconmc:flash.display.MovieClip;

        public var dataLoader:flash.display.Loader;

        internal var videocontainer:flash.display.MovieClip;

        public var videop:Object;

        internal var preloadervarbig:*;

        internal var closeiconbg:flash.display.Sprite;

        internal var thumbblock:flash.display.Sprite;

        internal var thumbheight:int;

        internal var iconbg:flash.display.Sprite;

        internal var ts:Number;

        internal var imageLoaderContext:flash.system.LoaderContext;

        internal var _container:flash.display.MovieClip;

        internal var hovertype:String;

        internal var _onMouseOut:*=null;

        internal var container:flash.display.MovieClip;

        internal var urllinkrequest:flash.net.URLRequest;

        internal var _xvar:Number;

        internal var bigzoom_t:org.libspark.betweenas3.tweens.ITween;

        internal var tin:org.libspark.betweenas3.tweens.ITween;

        internal var image_t:org.libspark.betweenas3.tweens.ITween;

        internal var mh:int;

        internal var cursorstate:int=0;

        internal var posy:int;

        internal var origheight:int;

        internal var posx:int;

        internal var entrytype:String;

        internal var zoombigiconbg:flash.display.Sprite;

        internal var iconvar:*;

        internal var thumbwidth:int;

        internal var mw:int;

        internal var _onMouseDown:*=null;

        internal var _gallery:flash.display.MovieClip;

        internal var loaded:Boolean=false;

        internal var tbheight:int;

        internal var _root:flash.display.MovieClip;

        internal var lbx:int;

        internal var lby:int;

        internal var dragx:int;

        internal var dragy:int;

        internal var tbt:org.libspark.betweenas3.tweens.ITween;

        public var closeiconmc:flash.display.MovieClip;

        internal var tbx:int;

        internal var tby:int;

        internal var iconmc:flash.display.MovieClip;

        internal var _onMouseUp:*=null;

        internal var fx:Number;

        internal var tbwidth:int;

        internal var _onMouseRollOver:*=null;

        internal var thumburl:String;

        internal var closeiconvar:*;

        internal var cursor_t:org.libspark.betweenas3.tweens.ITween;

        internal var zoombigiconvar:*;

        internal var bitmapSmoothed:flash.display.Bitmap;

        internal var urllink:String;

        internal var _yvar:Number;

        internal var preloadervar:*;

        internal var bitmapStore:flash.display.BitmapData;

        internal var close_t:org.libspark.betweenas3.tweens.ITween;

        internal var ease:int=2;

        internal var _categoryivar:Number;

        internal var _ivar:Number;

        internal var _stage:flash.display.Stage;
    }
}
