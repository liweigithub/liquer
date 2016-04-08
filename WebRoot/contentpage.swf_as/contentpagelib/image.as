package contentpagelib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
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
            this.tiledmc_array = new Array();
            this.tween_array = new Array();
            this.captions = new Array();
            super();
            this._root = r;
            this._container = con;
            this._ivar = iv;
            this._banner = ba;
            this.tilenumber = this._root.bannerdata_array[this._ivar]["animtilenumber"];
            this.animtiletime = this._root.bannerdata_array[this._ivar]["animtiletime"];
            this.animtilefadetime = this._root.bannerdata_array[this._ivar]["animtilefadetime"];
            this.animtilefxtime = this._root.bannerdata_array[this._ivar]["animtilefxtime"];
            this.animtiledelay = this._root.bannerdata_array[this._ivar]["animtiledelay"];
            this.animtilefxstrength = this._root.bannerdata_array[this._ivar]["animtilefxstrength"];
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function (arg1:flash.events.IOErrorEvent):void
            {
                return;
            }, false, 0, true)
            this.urllink = this._root.bannerdata_array[this._ivar]["imageurl"];
            this.urllinkrequest = new flash.net.URLRequest(this.urllink);
            return;
        }

        public function showImage():void
        {
            var loc1:*=undefined;
            var loc4:*=null;
            var loc5:*=null;
            var loc6:*=null;
            var loc7:*=NaN;
            var loc8:*=NaN;
            var loc9:*=null;
            var loc10:*=null;
            var loc11:*=null;
            if (this._root.bannerdata_array[this._ivar]["animtilepos"] != "top") 
            {
                if (this._root.bannerdata_array[this._ivar]["animtilepos"] != "bottom") 
                {
                    if (this._root.bannerdata_array[this._ivar]["animtilepos"] == "center") 
                    {
                        this.y = this._root.toppos;
                        this.tweentarget = 0;
                    }
                }
                else 
                {
                    this.y = this.imageLoader.content.height + this._root.toppos;
                    this.tweentarget = -this.imageLoader.content.height;
                }
            }
            else 
            {
                this.y = -this.imageLoader.content.height + this._root.toppos;
                this.tweentarget = this.imageLoader.content.height;
            }
            this._container.setChildIndex(this, (this._container.numChildren - 1));
            if (this._root.bannerdata_array[this._ivar]["animeasingtype"] != "Back") 
            {
                if (this._root.bannerdata_array[this._ivar]["animeasingtype"] != "Bounce") 
                {
                    if (this._root.bannerdata_array[this._ivar]["animeasingtype"] != "Circ") 
                    {
                        if (this._root.bannerdata_array[this._ivar]["animeasingtype"] != "Cubic") 
                        {
                            if (this._root.bannerdata_array[this._ivar]["animeasingtype"] != "Elastic") 
                            {
                                if (this._root.bannerdata_array[this._ivar]["animeasingtype"] != "Expo") 
                                {
                                    if (this._root.bannerdata_array[this._ivar]["animeasingtype"] != "Linear") 
                                    {
                                        if (this._root.bannerdata_array[this._ivar]["animeasingtype"] != "Quad") 
                                        {
                                            if (this._root.bannerdata_array[this._ivar]["animeasingtype"] != "Quart") 
                                            {
                                                if (this._root.bannerdata_array[this._ivar]["animeasingtype"] != "Quint") 
                                                {
                                                    if (this._root.bannerdata_array[this._ivar]["animeasingtype"] == "Sine") 
                                                    {
                                                        loc1 = org.libspark.betweenas3.easing.Sine.easeOut;
                                                    }
                                                }
                                                else 
                                                {
                                                    loc1 = org.libspark.betweenas3.easing.Quint.easeOut;
                                                }
                                            }
                                            else 
                                            {
                                                loc1 = org.libspark.betweenas3.easing.Quart.easeOut;
                                            }
                                        }
                                        else 
                                        {
                                            loc1 = org.libspark.betweenas3.easing.Quad.easeOut;
                                        }
                                    }
                                    else 
                                    {
                                        loc1 = org.libspark.betweenas3.easing.Linear.easeOut;
                                    }
                                }
                                else 
                                {
                                    loc1 = org.libspark.betweenas3.easing.Expo.easeOut;
                                }
                            }
                            else 
                            {
                                loc1 = org.libspark.betweenas3.easing.Elastic.easeOut;
                            }
                        }
                        else 
                        {
                            loc1 = org.libspark.betweenas3.easing.Cubic.easeOut;
                        }
                    }
                    else 
                    {
                        loc1 = org.libspark.betweenas3.easing.Circ.easeOut;
                    }
                }
                else 
                {
                    loc1 = org.libspark.betweenas3.easing.Bounce.easeOut;
                }
            }
            else 
            {
                loc1 = org.libspark.betweenas3.easing.Back.easeOut;
            }
            var loc2:*=0;
            while (loc2 < this.tiledmc_array.length) 
            {
                if (this.tween_array[loc2] != null) 
                {
                    this.tween_array[loc2].stop();
                }
                this.tiledmc_array[loc2].y = 0;
                this.tiledmc_array[loc2].alpha = 0;
                loc4 = org.libspark.betweenas3.BetweenAS3.to(this.tiledmc_array[loc2], {"y":this.tweentarget}, this.animtiletime, loc1);
                loc5 = org.libspark.betweenas3.BetweenAS3.to(this.tiledmc_array[loc2], {"alpha":0.99}, this.animtilefadetime, org.libspark.betweenas3.easing.Quart.easeOut);
                loc6 = org.libspark.betweenas3.BetweenAS3.tween(this.tiledmc_array[loc2], {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, {"_colorMatrixFilter":{"matrix":[0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0]}}, this.animtilefxtime, org.libspark.betweenas3.easing.Quart.easeOut);
                loc7 = this.animtiledelay * loc2;
                loc8 = this.animtiledelay * loc2 * 1.5;
                loc9 = org.libspark.betweenas3.BetweenAS3.delay(loc4, loc7);
                loc10 = org.libspark.betweenas3.BetweenAS3.delay(loc5, loc7);
                loc11 = org.libspark.betweenas3.BetweenAS3.delay(loc6, loc8);
                this.tween_array[loc2] = org.libspark.betweenas3.BetweenAS3.parallel(loc4, loc9, loc5, loc10, loc6, loc11);
                this.tween_array[loc2].onComplete = this.tweenDone;
                this.tween_array[loc2].onCompleteParams = [loc2];
                this.tween_array[loc2].play();
                ++loc2;
            }
            var loc3:*=0;
            while (loc3 < this.captions.length) 
            {
                this.captions[loc3].fadeInCaption(this.tweentarget);
                ++loc3;
            }
            return;
        }

        internal function imageLoadingDone(arg1:flash.events.Event):void
        {
            var loc2:*=null;
            this.loadedvar = true;
            this._banner.navigdots[this._ivar].fadeInBtn();
            this.imageLoader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone);
            this.alpha = 1;
            this.tilewidth = Math.ceil(this.imageLoader.content.width / this.tilenumber);
            this.tileheight = this.imageLoader.content.height;
            var loc1:*=0;
            while (loc1 < this.tilenumber) 
            {
                this.bmpdata = new flash.display.BitmapData(this.tilewidth, this.tileheight, true, 16777215);
                this.matrix = this.imageLoader.content.transform.matrix;
                this.matrix.translate((-this.tilewidth) * loc1, 0);
                this.bmpdata.draw(this.imageLoader.content, this.matrix);
                this.tiledmc = new flash.display.MovieClip();
                this.tiledmc.x = this.imageLoader.content.x + this.tilewidth * loc1 + this._root.leftpos;
                this.tiledmc.y = 0;
                this.tiledmc.alpha = 0;
                this.bmp = new flash.display.Bitmap(this.bmpdata);
                this.tiledmc.addChild(this.bmp);
                this.tween_array.push(loc2);
                this.tiledmc_array.push(this.tiledmc);
                addChild(this.tiledmc);
                ++loc1;
            }
            if (this._ivar == 0) 
            {
                this._banner.nextImage();
            }
            this.createCaptionText();
            var loc3:*;
            var loc4:*=((loc3 = this._banner).loadedimages + 1);
            loc3.loadedimages = loc4;
            this._callback();
            return;
        }

        internal function tweenDone(arg1:int):void
        {
            this.tiledmc_array[arg1].y = this.tweentarget;
            this.tiledmc_array[arg1].alpha = 1;
            return;
        }

        internal function loadImage():void
        {
            this.imageLoader.load(this.urllinkrequest, this.imageLoaderContext);
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone, false, 0, true);
            return;
        }

        public function init():*
        {
            this.alpha = 0;
            this.y = this._root.toppos;
            this._container.addChild(this);
            this._banner.images.push(this);
            this.loadImage();
            return;
        }

        internal function createCaptionText():void
        {
            var loc1:*=0;
            while (loc1 < this._root.bannerdata_array[this._ivar]["entrylength"]) 
            {
                this.captions[loc1] = new contentpagelib.caption(this._root, this, loc1, this._ivar);
                ++loc1;
            }
            return;
        }

        internal var imageLoaderContext:flash.system.LoaderContext;

        internal var bmp:flash.display.Bitmap;

        internal var urllinkrequest:flash.net.URLRequest;

        internal var animtilefadetime:Number;

        internal var _container:flash.display.MovieClip;

        internal var tiledmc:flash.display.MovieClip;

        public var loadedvar:Boolean=false;

        internal var animtilefxstrength:Number;

        internal var animtiletime:Number;

        internal var tween_array:Array;

        internal var bitmapSmoothed:flash.display.Bitmap;

        internal var animtilefxtime:Number;

        public var _callback:*;

        internal var bmpdata:flash.display.BitmapData;

        internal var _root:flash.display.MovieClip;

        internal var tweentarget:int;

        internal var matrix:flash.geom.Matrix;

        internal var _banner:flash.display.MovieClip;

        public var captions:Array;

        internal var imageLoader:flash.display.Loader;

        internal var tileheight:int;

        internal var tilewidth:int;

        internal var animtiledelay:Number;

        internal var tiledmc_array:Array;

        internal var urllink:String;

        internal var bitmapStore:flash.display.BitmapData;

        internal var tilenumber:Number;

        internal var _ivar:Number;
    }
}
