package bannerlib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.events.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createbanner extends flash.display.MovieClip
    {
        public function createbanner(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            this.banner = new flash.display.MovieClip();
            this.bannerbg = new flash.display.Sprite();
            this.bannermask = new flash.display.Sprite();
            this.lineoverlay = new flash.display.Sprite();
            this.timerbar = new flash.display.Sprite();
            this.timerbarmc = new flash.display.MovieClip();
            this.images = new Array();
            this.navigdots = new Array();
            super();
            this._stage = arg1;
            this._root = arg2;
            if (this._root.autoplay == "false") 
            {
                this.bannerpause = true;
            }
            this.bannermask.graphics.beginFill(16711680);
            this.bannermask.graphics.drawRect(0, 0, this._root.imagewidth, this._root.imageheight);
            this.bannermask.graphics.endFill();
            this.bannermask.x = this._root.leftpos;
            this.bannermask.y = this._root.toppos;
            this.bannermask.mouseEnabled = false;
            this.bannermask.alpha = 0;
            this.bannerbg.graphics.beginFill(this._root.bannerbackgroundcolor);
            this.bannerbg.graphics.drawRect(0, 0, this._root.imagewidth, this._root.imageheight);
            this.bannerbg.graphics.endFill();
            this.bannerbg.x = this._root.leftpos;
            this.bannerbg.y = this._root.toppos;
            this.bannerbg.mouseEnabled = false;
            this.bannerbg.alpha = 0;
            this.timerbar.graphics.beginFill(this._root.timerbarcolor);
            this.timerbar.graphics.drawRect(0, 0, 1, this._root.timerbarheight);
            this.timerbar.graphics.endFill();
            this.timerbar.mouseEnabled = false;
            this.timerbar.alpha = this._root.timerbaropacity;
            this.timerbarmc.x = this._root.leftpos;
            if (this._root.timerbarpos != "top") 
            {
                this.timerbarmc.y = this._root.toppos + this._root.imageheight - this._root.timerbarheight;
            }
            else 
            {
                this.timerbarmc.y = this._root.toppos;
            }
            this.timerbarmc.alpha = 0;
            this.timerbarmc.addChild(this.timerbar);
            var loc1:*=new dropshadow(this._root, this.bannerbg, this._root.imageshadowdistance, this._root.imageshadowangle, this._root.imageshadowcolor, this._root.imageshadowopacity, this._root.imageshadowblur, this._root.imageshadowblur, 1, 3);
            this.banner.buttonMode = true;
            addChild(this.bannerbg);
            addChild(this.banner);
            addChild(this.timerbarmc);
            addChild(this.bannermask);
            this.banner.mask = this.bannermask;
            this.bg_t = org.libspark.betweenas3.BetweenAS3.to(this.bannerbg, {"alpha":this._root.bannerbackgroundopacity}, 0.6, org.libspark.betweenas3.easing.Sine.easeInOut);
            this.bg_t.play();
            this.createNavigDots();
            this.loadNextImage();
            this.banner.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click, false, 0, true);
            if (this._root.timerpauseonhover == "true") 
            {
                this.banner.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mouse_over, false, 0, true);
                this.banner.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mouse_out, false, 0, true);
            }
            return;
        }

        public function runTimer():void
        {
            this.resetTimer();
            this.timevar = parseInt(this._root.bannerdata_array[this._root.activebanner]["imageshowtime"]);
            this.timerbar_t = org.libspark.betweenas3.BetweenAS3.to(this.timerbarmc, {"width":this._root.imagewidth}, this._root.bannerdata_array[this._root.activebanner]["imageshowtime"], org.libspark.betweenas3.easing.Linear.easeOut);
            this.timerbar_t.addEventListener(org.libspark.betweenas3.events.TweenEvent.COMPLETE, this.onComplete);
            this.timerbar_t.play();
            return;
        }

        internal function checkIfLoaded(arg1:flash.events.Event):void
        {
            if (this.images[this._root.activebanner].loadedvar) 
            {
                this.removeEventListener(flash.events.Event.ENTER_FRAME, this.checkIfLoaded);
                this.navigdots[this._root.activebanner].selectBtn();
                this.images[this._root.activebanner].showImage();
                this.runTimer();
                if (this.bannerfirstrun) 
                {
                    this.bannerfirstrun = false;
                    if (this._root.autoplay != "false") 
                    {
                        this.playbtn.hideBtn();
                        this.pausebtn.showBtn();
                    }
                    else 
                    {
                        this.bannerpause = true;
                        this.timerbar_t.togglePause();
                        this.pausebtn.hideBtn();
                        this.playbtn.showBtn();
                    }
                }
            }
            return;
        }

        internal function mouse_out(arg1:*):void
        {
            this.resumeTimer();
            return;
        }

        internal function mouse_over(arg1:*):void
        {
            this.pauseTimer();
            return;
        }

        public function resumeTimer():void
        {
            if (!this.timerbar_t.isPlaying && this.bannerpause) 
            {
                this.bannerpause = false;
                if (this.bannerreset) 
                {
                    this.runTimer();
                    this.bannerreset = false;
                }
                else 
                {
                    this.timerbar_t.togglePause();
                }
                this.playbtn.hideBtn();
                this.pausebtn.showBtn();
            }
            return;
        }

        public function resetTimer():void
        {
            if (this._root.bannerdata_array[this._root.activebanner]["imageclicklink"] == "") 
            {
                this.banner.mouseEnabled = false;
                this.banner.buttonMode = false;
            }
            else 
            {
                this.banner.mouseEnabled = true;
                this.banner.buttonMode = true;
            }
            if (this.timerbar_t != null) 
            {
                if (this.timerbar_t.hasEventListener(org.libspark.betweenas3.events.TweenEvent.COMPLETE)) 
                {
                    this.timerbar_t.removeEventListener(org.libspark.betweenas3.events.TweenEvent.COMPLETE, this.onComplete);
                }
                this.timerbar_t.stop();
            }
            this.timerbarmc.alpha = 1;
            this.timerbarmc.width = 0;
            return;
        }

        public function nextImage():void
        {
            if (this._root.activebanner != -1) 
            {
                this.navigdots[this._root.activebanner].deselectBtn();
            }
            if (this._root.activebanner < (this._root.maxbanner - 1)) 
            {
                var loc1:*;
                var loc2:*=((loc1 = this._root).activebanner + 1);
                loc1.activebanner = loc2;
            }
            else 
            {
                this._root.activebanner = 0;
            }
            this.addEventListener(flash.events.Event.ENTER_FRAME, this.checkIfLoaded, false, 0, true);
            return;
        }

        public function selectImage():void
        {
            this.navigdots[this._root.activebanner].selectBtn();
            this.images[this._root.activebanner].showImage();
            if (this.bannerpause) 
            {
                this.resetTimer();
                this.bannerreset = true;
            }
            else 
            {
                this.runTimer();
            }
            return;
        }

        internal function onComplete(arg1:org.libspark.betweenas3.events.TweenEvent):void
        {
            if (!(this.timerbar_t == null) && this.timerbar_t.hasEventListener(org.libspark.betweenas3.events.TweenEvent.COMPLETE)) 
            {
                this.timerbar_t.removeEventListener(org.libspark.betweenas3.events.TweenEvent.COMPLETE, this.onComplete);
            }
            this.nextImage();
            return;
        }

        internal function createNavigDots():void
        {
            var loc1:*=0;
            while (loc1 < this._root.maxbanner) 
            {
                this.navigdots[loc1] = new bannerlib.navigdot(this._root, this.banner, loc1, this);
                ++loc1;
            }
            if (this._root.playpauseactivated == "true") 
            {
                this.playbtn = new bannerlib.playbutton(this._root, this);
                this.pausebtn = new bannerlib.pausebutton(this._root, this);
            }
            return;
        }

        internal function loadNextImage():void
        {
            if (this.curimage < this._root.maxbanner) 
            {
                this.images[this.curimage] = new bannerlib.image(this._root, this.banner, this.curimage, this);
                this.images[this.curimage]._callback = this.loadNextImage;
                this.images[this.curimage].init();
                var loc1:*;
                var loc2:*=((loc1 = this).curimage + 1);
                loc1.curimage = loc2;
            }
            return;
        }

        internal function mouse_click(arg1:*):void
        {
            var urllinktarget:String;
            var urllinkrequest:flash.net.URLRequest;
            var urllink:String;
            var event:*;

            var loc1:*;
            urllink = null;
            urllinkrequest = null;
            urllinktarget = null;
            event = arg1;
            if (this._root.bannerdata_array[this._root.activebanner]["imageclicklink"] != "") 
            {
                urllink = this._root.bannerdata_array[this._root.activebanner]["imageclicklink"];
                urllinkrequest = new flash.net.URLRequest(urllink);
                urllinktarget = this._root.bannerdata_array[this._root.activebanner]["imageclicklinktarget"];
                try 
                {
                    flash.net.navigateToURL(urllinkrequest, urllinktarget);
                }
                catch (e:Error)
                {
                    trace("ERROR NAVIGATING TO URL");
                }
            }
            return;
        }

        public function pauseTimer():void
        {
            if (this.timerbar_t.isPlaying && !this.bannerpause) 
            {
                this.bannerpause = true;
                this.timerbar_t.togglePause();
                this.pausebtn.hideBtn();
                this.playbtn.showBtn();
            }
            return;
        }

        internal var timerbar_t:org.libspark.betweenas3.tweens.ITween;

        internal var banner:flash.display.MovieClip;

        internal var timerbar:flash.display.Sprite;

        internal var timevar:Number;

        internal var bannerfirstrun:Boolean=true;

        internal var _root:flash.display.MovieClip;

        public var timerbarmc:flash.display.MovieClip;

        internal var bannermask:flash.display.Sprite;

        internal var bannerpause:Boolean=false;

        public var navigdots:Array;

        internal var curimage:Number=0;

        public var loadedimages:Number=0;

        internal var lineoverlay:flash.display.Sprite;

        internal var bannerreset:Boolean=false;

        internal var pausebtn:*;

        internal var playbtn:*;

        internal var bannerbg:flash.display.Sprite;

        public var images:Array;

        internal var bg_t:org.libspark.betweenas3.tweens.ITween;

        internal var _stage:flash.display.Stage;
    }
}
