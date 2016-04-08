package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class social extends flash.display.MovieClip
    {
        public function social(arg1:flash.display.MovieClip, arg2:flash.display.MovieClip, arg3:Number, arg4:Number)
        {
            var cont:flash.display.MovieClip;
            var r:flash.display.MovieClip;
            var iv:Number;
            var xv:Number;

            var loc1:*;
            r = arg1;
            cont = arg2;
            xv = arg3;
            iv = arg4;
            this.socialLoader = new flash.display.Loader();
            this.socialLoaderContext = new flash.system.LoaderContext(true);
            super();
            this._root = r;
            this._container = cont;
            this._xvar = xv;
            this._ivar = iv;
            this.socialLoader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function (arg1:flash.events.IOErrorEvent):void
            {
                return;
            }, false, 0, true)
            this.socialLoader.load(new flash.net.URLRequest(this._root.socialdata_array[this._ivar]["iconlink"]), this.socialLoaderContext);
            this.socialLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.socialLoadingDone);
            return;
        }

        internal function mouse_press(arg1:*):void
        {
            var urltarget:String;
            var urllink:String;
            var event:*;
            var req:flash.net.URLRequest;

            var loc1:*;
            event = arg1;
            urllink = this._root.socialdata_array[this._ivar]["urllink"];
            urltarget = this._root.socialdata_array[this._ivar]["urltarget"];
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

        internal function socialLoadingDone(arg1:flash.events.Event):void
        {
            this.socialLoader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.socialLoadingDone);
            this._container.addChild(this);
            this.x = this._xvar;
            this.alpha = 0;
            org.libspark.betweenas3.BetweenAS3.apply(this, {"_blurFilter":{"blurX":5, "blurY":5, "quality":1}});
            this.addChild(this.socialLoader.content);
            var loc1:*=org.libspark.betweenas3.BetweenAS3.to(this, {"alpha":1}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
            var loc2:*=org.libspark.betweenas3.BetweenAS3.delay(loc1, this._ivar * 0.1);
            var loc3:*=org.libspark.betweenas3.BetweenAS3.to(this, {"_blurFilter":{"blurX":0, "blurY":0, "quality":1}}, 1, org.libspark.betweenas3.easing.Sine.easeOut);
            var loc4:*=org.libspark.betweenas3.BetweenAS3.delay(loc3, this._ivar * 0.1);
            var loc5:*;
            (loc5 = org.libspark.betweenas3.BetweenAS3.parallel(loc1, loc2, loc3, loc4)).play();
            this.buttonMode = true;
            this.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mouse_over);
            this.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mouse_out);
            this.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_press);
            this._container.addChild(new tooltip(this._root, this, this._container, this._ivar));
            return;
        }

        internal function mouse_out(arg1:*):void
        {
            this.t_out = org.libspark.betweenas3.BetweenAS3.to(this, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
            if (this.t_over != null) 
            {
                this.t_over.stop();
            }
            this.t_out.play();
            return;
        }

        internal function mouse_over(arg1:*):void
        {
            this.t_over = org.libspark.betweenas3.BetweenAS3.tween(this, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, {"_colorMatrixFilter":{"matrix":[2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0]}}, 1, org.libspark.betweenas3.easing.Sine.easeOut);
            if (this.t_out != null) 
            {
                this.t_out.stop();
            }
            this.t_over.play();
            return;
        }

        internal var socialLoader:flash.display.Loader;

        internal var _root:flash.display.MovieClip;

        internal var t_out:org.libspark.betweenas3.tweens.ITween;

        internal var _container:flash.display.MovieClip;

        internal var _xvar:Number;

        internal var socialLoaderContext:flash.system.LoaderContext;

        internal var _ivar:Number;

        internal var t_over:org.libspark.betweenas3.tweens.ITween;
    }
}
