package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createlogo extends flash.display.MovieClip
    {
        public function createlogo(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            var st:flash.display.Stage;
            var r:flash.display.MovieClip;

            var loc1:*;
            st = arg1;
            r = arg2;
            this.logoLoader = new flash.display.Loader();
            this.logoLoaderContext = new flash.system.LoaderContext(true);
            this.logomc = new flash.display.MovieClip();
            super();
            this._stage = st;
            this._root = r;
            this.logoLoader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function (arg1:flash.events.IOErrorEvent):void
            {
                return;
            }, false, 0, true)
            this.logoLoader.load(new flash.net.URLRequest(this._root.logourl), this.logoLoaderContext);
            this.logoLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.logoLoadingDone);
            return;
        }

        internal function onStageResize(arg1:flash.events.Event):void
        {
            if (this._root.logoorientation != "left") 
            {
                if (this._root.logoorientation != "right") 
                {
                    if (this._root.logoorientation == "center") 
                    {
                        this.logomc.x = Math.round(this._stage.stageWidth / 2) - Math.round(this.logomc.width / 2);
                    }
                }
                else 
                {
                    this.logomc.x = Math.round(this._stage.stageWidth / 2) + Math.round(this._root.templatewidth / 2) - this._root.logopadding - this.logomc.width;
                }
            }
            else 
            {
                this.logomc.x = Math.round(this._stage.stageWidth / 2) - Math.round(this._root.templatewidth / 2) + this._root.logopadding;
            }
            this.logomc.y = Math.round(this._root.headerheight / 2) - Math.round(this._root.logoheight / 2);
            return;
        }

        public function logoOff():void
        {
            if (this.t_logo != null) 
            {
                this.t_logo.stop();
            }
            this.t_logo = org.libspark.betweenas3.BetweenAS3.to(this.logomc, {"alpha":0}, 0.3, org.libspark.betweenas3.easing.Sine.easeOut);
            this.t_logo.onComplete = this.logoInVis;
            this.t_logo.play();
            return;
        }

        public function logoOn():void
        {
            this.logomc.visible = true;
            if (this.t_logo != null) 
            {
                this.t_logo.stop();
            }
            this.t_logo = org.libspark.betweenas3.BetweenAS3.to(this.logomc, {"alpha":1}, 0.3, org.libspark.betweenas3.easing.Sine.easeOut);
            this.t_logo.play();
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
            urllink = this._root.logoclicklink;
            urltarget = this._root.logoclicktarget;
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

        internal function logoInVis():void
        {
            this.logomc.visible = false;
            return;
        }

        internal function logoLoadingDone(arg1:flash.events.Event):void
        {
            this.logomc.alpha = 0;
            org.libspark.betweenas3.BetweenAS3.apply(this.logomc, {"_blurFilter":{"blurX":5, "blurY":5, "quality":1}});
            this._stage.addChild(this.logomc);
            this.logomc.addChild(this.logoLoader.content);
            var loc1:*=org.libspark.betweenas3.BetweenAS3.to(this.logomc, {"alpha":1}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
            var loc2:*=org.libspark.betweenas3.BetweenAS3.delay(loc1, 0.5);
            var loc3:*=org.libspark.betweenas3.BetweenAS3.to(this.logomc, {"_blurFilter":{"blurX":0, "blurY":0, "quality":1}}, 1.5, org.libspark.betweenas3.easing.Expo.easeOut);
            var loc4:*=org.libspark.betweenas3.BetweenAS3.delay(loc3, 0.5);
            if (this.t_logo != null) 
            {
                this.t_logo.stop();
            }
            this.t_logo = org.libspark.betweenas3.BetweenAS3.parallel(loc1, loc2, loc3, loc4);
            this.t_logo.play();
            this._stage.addEventListener(flash.events.Event.ADDED, this.onStageResize, false, 0, true);
            this._stage.addEventListener(flash.events.Event.RESIZE, this.onStageResize);
            this.logomc.mouseEnabled = true;
            this.logomc.buttonMode = true;
            this.logomc.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click, false, 0, true);
            this.onStageResize(null);
            return;
        }

        internal var logomc:flash.display.MovieClip;

        internal var logoLoader:flash.display.Loader;

        internal var _root:flash.display.MovieClip;

        internal var logoLoaderContext:flash.system.LoaderContext;

        internal var t_logo:org.libspark.betweenas3.tweens.ITween;

        internal var _stage:flash.display.Stage;
    }
}
