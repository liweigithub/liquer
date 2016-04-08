package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createmodule extends flash.display.MovieClip
    {
        public function createmodule(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            this.modulecontainer = new flash.display.MovieClip();
            super();
            this._stage = arg1;
            this._root = arg2;
            this.preloadervar = new preloader();
            this.preloadervar.alpha = 0;
            this.preloadervar.x = Math.round(this._stage.stageWidth) - 25;
            this.preloadervar.y = 25;
            this._stage.addChild(this.preloadervar);
            this._stage.addChildAt(this.modulecontainer, 5);
            this.moduleMask = new flash.display.Sprite();
            this.moduleMask.graphics.beginFill(0);
            this.moduleMask.graphics.drawRect(0, 0, 10, 10);
            this.moduleMask.graphics.endFill();
            this.moduleMask.mouseEnabled = false;
            this.moduleMask.alpha = 0;
            this.moduleMask.width = 0;
            this.moduleMask.height = 0;
            this._stage.addChild(this.moduleMask);
            this._stage.addEventListener(flash.events.Event.RESIZE, this.onStageResizeModule);
            return;
        }

        public function deactivateMask():void
        {
            this.loadedModule.mask = null;
            return;
        }

        internal function hideModule():void
        {
            this.loadedModule.mask = this.moduleMask;
            if (this.t_maskshow != null) 
            {
                this.t_maskshow.stop();
            }
            if (this.t_maskhide != null) 
            {
                this.t_maskhide.stop();
            }
            this.t_maskhide = org.libspark.betweenas3.BetweenAS3.to(this.moduleMask, {"y":this.modulecontainer.y, "height":0}, 1, org.libspark.betweenas3.easing.Expo.easeInOut);
            this.t_maskhide.onComplete = this.unloadModule;
            this.t_maskhide.play();
            return;
        }

        internal function setPositions():void
        {
            if (this.t_maskshow != null) 
            {
                this.t_maskshow.stop();
            }
            if (this.t_maskhide != null) 
            {
                this.t_maskhide.stop();
            }
            if (this.moduleo != "top") 
            {
                if (this.moduleo == "center") 
                {
                    this.spaceleft = Math.round((this._stage.stageHeight - this._root.headerheight - this._root.menubarheight - this._root.footerheight) / 2) - Math.round(this.moduleh / 2);
                    if (this._stage.stageHeight - this._root.templateheight - this._root.headerminheight >= this._root.headerminheight && this._stage.stageHeight - this._root.templateheight - this._root.headerminheight <= this._root.headermaxheight) 
                    {
                        this.mtarg = Math.round(this._stage.stageHeight - this._root.templateheight - this._root.headerminheight) + this._root.menubarheight + this.spaceleft;
                        this.masktarg = Math.round(this._stage.stageHeight - this._root.templateheight - this._root.headerminheight) + this._root.menubarheight + this.spaceleft + this.moduleh;
                    }
                    else if (this._stage.stageHeight - this._root.templateheight - this._root.headerminheight < this._root.headerminheight) 
                    {
                        this.mtarg = this._root.headerminheight + this._root.menubarheight + this.spaceleft;
                        this.masktarg = this._root.headerminheight + this._root.menubarheight + this.spaceleft + this.moduleh;
                    }
                    else if (this._stage.stageHeight - this._root.templateheight - this._root.headerminheight > this._root.headermaxheight) 
                    {
                        this.mtarg = this._root.headermaxheight + this._root.menubarheight + this.spaceleft;
                        this.masktarg = this._root.headermaxheight + this._root.menubarheight + this.spaceleft + this.moduleh;
                    }
                }
            }
            else if (this._stage.stageHeight - this._root.templateheight - this._root.headerminheight >= this._root.headerminheight && this._stage.stageHeight - this._root.templateheight - this._root.headerminheight <= this._root.headermaxheight) 
            {
                this.mtarg = Math.round(this._stage.stageHeight - this._root.templateheight - this._root.headerminheight) + this._root.menubarheight + this._root.moduletoppadding;
                this.masktarg = Math.round(this._stage.stageHeight - this._root.templateheight - this._root.headerminheight) + this._root.menubarheight + this._root.moduletoppadding + this.moduleh;
            }
            else if (this._stage.stageHeight - this._root.templateheight - this._root.headerminheight < this._root.headerminheight) 
            {
                this.mtarg = this._root.headerminheight + this._root.menubarheight + this._root.moduletoppadding;
                this.masktarg = this._root.headerminheight + this._root.menubarheight + this._root.moduletoppadding + this.moduleh;
            }
            else if (this._stage.stageHeight - this._root.templateheight - this._root.headerminheight > this._root.headermaxheight) 
            {
                this.mtarg = this._root.headermaxheight + this._root.menubarheight + this._root.moduletoppadding;
                this.masktarg = this._root.headermaxheight + this._root.menubarheight + this._root.moduletoppadding + this.moduleh;
            }
            this.vspace = Math.round(this._stage.stageHeight) - this._root.footerheight - this.mtarg;
            var loc1:*;
            this.moduleMask.x = loc1 = Math.round(this._stage.stageWidth / 2) - Math.round(this.modulew / 2);
            this.modulecontainer.x = loc1;
            if (this.moduleh == 0 && this.moduleo == "top") 
            {
                this.moduleMask.y = this.masktarg + this.vspace;
            }
            else 
            {
                this.moduleMask.y = this.masktarg;
            }
            this.modulecontainer.y = this.mtarg;
            return;
        }

        public function loadModule(arg1:flash.display.MovieClip, arg2:String, arg3:String, arg4:int, arg5:int, arg6:String):void
        {
            this._menu = arg1;
            this.module_link = arg2;
            this.module_xml = arg3;
            this.modulew = arg4;
            this.moduleh = arg5;
            this.moduleo = arg6;
            this.loaded = false;
            if (this._root.activeimage != this._menu.selectedmenu.imagepath) 
            {
                this._root.activeimage = this._menu.selectedmenu.imagepath;
                this._root.bg.initImage();
            }
            if (this.loadedModule != null) 
            {
                if (this.t_maskhide == null) 
                {
                    if (this.t_maskshow == null) 
                    {
                        this.hideModule();
                    }
                    else 
                    {
                        this.t_maskshow.stop();
                        this.unloadModule();
                    }
                }
                else 
                {
                    this.t_maskhide.stop();
                    this.unloadModule();
                }
            }
            else 
            {
                this.initLoading();
            }
            return;
        }

        internal function initLoading():void
        {
            this.showPreloader();
            var loc1:*=new flash.net.URLRequest();
            loc1.url = this.module_link;
            if (!(this.loader == null) && this.loader.contentLoaderInfo.hasEventListener(flash.events.Event.COMPLETE)) 
            {
                this.loader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.addModule);
            }
            if (this.loader != null) 
            {
                this.loader = null;
            }
            this.loader = new flash.display.Loader();
            this.addListeners(this.loader.contentLoaderInfo);
            this.loader.load(loc1);
            return;
        }

        internal function onStageResizeModule(arg1:flash.events.Event):void
        {
            var e:flash.events.Event;

            var loc1:*;
            e = arg1;
            this.setPositions();
            if (this.loaded) 
            {
                if (this.moduleh == 0 && this.moduleo == "top") 
                {
                    this.t_maskshow = org.libspark.betweenas3.BetweenAS3.to(this.moduleMask, {"height":this.vspace, "y":this.modulecontainer.y}, 1, org.libspark.betweenas3.easing.Expo.easeInOut);
                }
                else 
                {
                    this.t_maskshow = org.libspark.betweenas3.BetweenAS3.to(this.moduleMask, {"height":this.moduleh, "y":this.modulecontainer.y}, 1, org.libspark.betweenas3.easing.Expo.easeInOut);
                }
                this.t_maskshow.play();
                try 
                {
                    this.loadedModuleObj.setPos(this.modulecontainer.x, this.mtarg);
                }
                catch (e:Error)
                {
                };
                try 
                {
                    this.loadedModuleObj.setSpace(this.vspace);
                }
                catch (e:Error)
                {
                };
                try 
                {
                    this.loadedModuleObj.setModuleHeight(this.moduleh);
                }
                catch (e:Error)
                {
                };
            }
            if (this.preloadervar != null) 
            {
                this.preloadervar.x = Math.round(this._stage.stageWidth) - 25;
            }
            return;
        }

        internal function addModule(arg1:flash.events.Event):void
        {
            var event:flash.events.Event;

            var loc1:*;
            event = arg1;
            this.hidePreloader();
            this.loaded = true;
            event.target.removeEventListener(flash.events.Event.COMPLETE, this.addModule);
            this.loadedModule = event.target.content;
            this.moduleMask.height = 0;
            this.moduleMask.width = this.modulew;
            this.loadedModule.mask = this.moduleMask;
            this.modulecontainer.addChild(this.loadedModule);
            this.loadedModuleObj = Object(this.loadedModule);
            try 
            {
                this.loadedModuleObj.setVar(this.module_xml, this._root);
                this.loadedModuleObj.setPos(this.modulecontainer.x, this.modulecontainer.y);
            }
            catch (e:Error)
            {
            };
            this.onStageResizeModule(null);
            this.showModule();
            return;
        }

        internal function showPreloader():void
        {
            if (this.t_preloader != null) 
            {
                this.t_preloader.stop();
            }
            this.t_preloader = org.libspark.betweenas3.BetweenAS3.to(this.preloadervar, {"alpha":1}, 0.9, org.libspark.betweenas3.easing.Expo.easeOut);
            this.t_preloader.play();
            return;
        }

        internal function showModule():void
        {
            this.setPositions();
            if (this.moduleh == 0 && this.moduleo == "top") 
            {
                this.t_maskshow = org.libspark.betweenas3.BetweenAS3.to(this.moduleMask, {"height":this.vspace, "y":this.modulecontainer.y}, 1, org.libspark.betweenas3.easing.Expo.easeInOut);
            }
            else 
            {
                this.t_maskshow = org.libspark.betweenas3.BetweenAS3.to(this.moduleMask, {"height":this.moduleh, "y":this.modulecontainer.y}, 1, org.libspark.betweenas3.easing.Expo.easeInOut);
            }
            this.t_maskshow.onComplete = this.moduleShown;
            this.t_maskshow.play();
            return;
        }

        internal function unloadModule():void
        {
            this._root.videoactive = false;
            this._root.module.activateMask();
            this._root.util.showUtil();
            this._root.menuobj.menuOn();
            this.loader.unloadAndStop();
            this.t_maskhide = null;
            this.loadedModule.mask = null;
            this.modulecontainer.removeChild(this.loadedModule);
            while (this.modulecontainer.numChildren) 
            {
                this.modulecontainer.removeChildAt(0);
            }
            this.loadedModule = null;
            this.loadedModuleObj = null;
            this.loaded = false;
            this.initLoading();
            if (this._root.util.pausevar && !this._root.util.activepausevar) 
            {
                this._root.util.extPlay();
            }
            return;
        }

        public function activateMask():void
        {
            this.loadedModule.mask = this.moduleMask;
            return;
        }

        internal function hidePreloader():void
        {
            if (this.t_preloader != null) 
            {
                this.t_preloader.stop();
            }
            this.preloadervar.alpha = 1;
            this.t_preloader = org.libspark.betweenas3.BetweenAS3.to(this.preloadervar, {"alpha":0}, 0.9, org.libspark.betweenas3.easing.Expo.easeIn);
            this.t_preloader.play();
            return;
        }

        internal function moduleShown():void
        {
            this.t_maskshow = null;
            return;
        }

        internal function addListeners(arg1:flash.events.IEventDispatcher):void
        {
            arg1.addEventListener(flash.events.Event.COMPLETE, this.addModule, false, 0, true);
            return;
        }

        internal var moduleo:String;

        internal var loaded:Boolean=false;

        internal var modulew:int;

        internal var spaceleft:int;

        internal var _stage:flash.display.Stage;

        internal var loader:flash.display.Loader;

        internal var moduleh:int;

        public var modulecontainer:flash.display.MovieClip;

        internal var t_maskhide:org.libspark.betweenas3.tweens.ITween;

        public var moduleypos:int=0;

        internal var _menu:flash.display.MovieClip;

        internal var _root:flash.display.MovieClip;

        internal var t_maskshow:org.libspark.betweenas3.tweens.ITween;

        internal var masktarg:int;

        public var modulexpos:int=0;

        internal var mtarg:int;

        internal var moduleURL:flash.net.URLRequest;

        internal var loadedModuleObj:Object;

        internal var t_preloader:org.libspark.betweenas3.tweens.ITween;

        internal var module_link:String;

        internal var preloadervar:flash.display.MovieClip;

        internal var vspace:int;

        internal var loadedModule:flash.display.MovieClip;

        internal var moduleMask:flash.display.Sprite;

        internal var module_xml:String;
    }
}
