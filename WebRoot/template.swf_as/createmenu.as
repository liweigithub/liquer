package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.utils.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createmenu extends flash.display.MovieClip
    {
        public function createmenu(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            this.mainmenu_array = new Array();
            this.menucontainer = new flash.display.MovieClip();
            this.menubg = new flash.display.MovieClip();
            this.backgroundGradient = new flash.display.Sprite();
            this.headerbg = new flash.display.MovieClip();
            this.headerbgsprite = new flash.display.Sprite();
            this.glaregfx = new glare();
            super();
            this._stage = arg1;
            this._root = arg2;
            this.menubgheight = this._root.menubarheight;
            this.menubg.addChild(this.backgroundGradient);
            this.menubg.alpha = 0;
            this.headerbg.addChild(this.headerbgsprite);
            this.headerbg.alpha = 0;
            this.glaregfx.alpha = 0;
            this.headerbg.addChild(this.glaregfx);
            var loc1:*=new dropshadow(this._root, this.menubg, this._root.menubarshadowdistance, -90, 0, this._root.menubarshadowopacity, this._root.menubarshadowstrength, this._root.menubarshadowstrength, 1, 3);
            this._stage.addChildAt(this.headerbg, 6);
            this._stage.addChildAt(this.menubg, 7);
            this._stage.addChildAt(this.menucontainer, 8);
            addEventListener(flash.events.Event.ENTER_FRAME, this.tweenCheck);
            var loc2:*=0;
            while (loc2 < this._root.mainmenulength) 
            {
                this.menucontainer.addChild(new mainmenu(this._root, this, loc2));
                ++loc2;
            }
            this._stage.addEventListener(flash.events.Event.ADDED, this.onStageResize, false, 0, true);
            this._stage.addEventListener(flash.events.Event.RESIZE, this.onStageResize);
            SWFAddress.addEventListener(SWFAddressEvent.CHANGE, this.handleSWFAddress);
            return;
        }

        public function selectModule():void
        {
            if (this.changeTimer != null) 
            {
                this.changeTimer.stop();
                if (this.changeTimer.hasEventListener(flash.events.TimerEvent.TIMER_COMPLETE)) 
                {
                    this.changeTimer.removeEventListener(flash.events.TimerEvent.TIMER_COMPLETE, this.proceed);
                }
                this.changeTimer = null;
            }
            this.changeTimer = new flash.utils.Timer(this.timeout, 1);
            this.changeTimer.addEventListener(flash.events.TimerEvent.TIMER_COMPLETE, this.proceed);
            this.changeTimer.start();
            return;
        }

        public function showSubMenu(arg1:flash.display.MovieClip):void
        {
            var loc1:*=0;
            while (loc1 < arg1.submenu_array.length) 
            {
                arg1.submenu_array[loc1].fadeIn(loc1);
                ++loc1;
            }
            if (arg1.t_subm != null) 
            {
                arg1.t_subm.stop();
            }
            arg1.t_subm = org.libspark.betweenas3.BetweenAS3.to(arg1.submenubg, {"height":arg1.submenuheighttarg}, 0.6, org.libspark.betweenas3.easing.Expo.easeOut);
            arg1.t_subm.play();
            return;
        }

        public function makeRGB(arg1:Number):Object
        {
            var loc1:*={"red":(arg1 & 16711680) >> 16, "green":(arg1 & 65280) >> 8, "blue":arg1 & 255};
            return loc1;
        }

        internal function menuInVis():void
        {
            this.menubg.visible = false;
            this.menucontainer.visible = false;
            this.headerbg.visible = false;
            return;
        }

        public function hideSubMenu(arg1:flash.display.MovieClip):void
        {
            var loc1:*=(arg1.submenu_array.length - 1);
            while (loc1 > -1) 
            {
                arg1.submenu_array[loc1].fadeOut(arg1.submenu_array.length - loc1);
                --loc1;
            }
            if (arg1.t_subm != null) 
            {
                arg1.t_subm.stop();
            }
            arg1.t_subm = org.libspark.betweenas3.BetweenAS3.to(arg1.submenubg, {"height":0}, 0.6, org.libspark.betweenas3.easing.Expo.easeInOut);
            arg1.t_subm.play();
            return;
        }

        public function menuOn():void
        {
            this.menubg.visible = true;
            this.menucontainer.visible = true;
            this.headerbg.visible = true;
            if (this.t_menubg != null) 
            {
                this.t_menubg.stop();
            }
            this.t_menubg = org.libspark.betweenas3.BetweenAS3.to(this.menubg, {"alpha":this._root.menubaralpha}, 0.3, org.libspark.betweenas3.easing.Sine.easeOut);
            this.t_menubg.play();
            if (this.t_headerbg != null) 
            {
                this.t_headerbg.stop();
            }
            this.t_headerbg = org.libspark.betweenas3.BetweenAS3.to(this.headerbg, {"alpha":this._root.headerbgalpha}, 0.3, org.libspark.betweenas3.easing.Sine.easeOut);
            this.t_headerbg.play();
            if (this.t_menu != null) 
            {
                this.t_menu.stop();
            }
            this.t_menu = org.libspark.betweenas3.BetweenAS3.to(this.menucontainer, {"alpha":1}, 0.3, org.libspark.betweenas3.easing.Sine.easeOut);
            this.t_menu.play();
            return;
        }

        internal function proceed(arg1:flash.events.Event):void
        {
            if (this.changeTimer.hasEventListener(flash.events.TimerEvent.TIMER_COMPLETE)) 
            {
                this.changeTimer.removeEventListener(flash.events.TimerEvent.TIMER_COMPLETE, this.proceed);
            }
            this.changeTimer = null;
            SWFAddress.setValue(this.selectedmenu.deeplink);
            this._root.module.loadModule(this, this.selectedmenu.modulepath, this.selectedmenu.modulexmlpath, this.selectedmenu.modulewidth, this.selectedmenu.moduleheight, this.selectedmenu.modulealign);
            return;
        }

        public function menuOff():void
        {
            if (this.t_menubg != null) 
            {
                this.t_menubg.stop();
            }
            this.t_menubg = org.libspark.betweenas3.BetweenAS3.to(this.menubg, {"alpha":0}, 0.3, org.libspark.betweenas3.easing.Sine.easeOut);
            this.t_menubg.play();
            if (this.t_headerbg != null) 
            {
                this.t_headerbg.stop();
            }
            this.t_headerbg = org.libspark.betweenas3.BetweenAS3.to(this.headerbg, {"alpha":0}, 0.3, org.libspark.betweenas3.easing.Sine.easeOut);
            this.t_headerbg.play();
            if (this.t_menu != null) 
            {
                this.t_menu.stop();
            }
            this.t_menu = org.libspark.betweenas3.BetweenAS3.to(this.menucontainer, {"alpha":0}, 0.3, org.libspark.betweenas3.easing.Sine.easeOut);
            this.t_menu.onComplete = this.menuInVis;
            this.t_menu.play();
            return;
        }

        internal function tweenDone(arg1:flash.display.MovieClip, arg2:int):void
        {
            if (!this._root.firstrun) 
            {
                arg1.y = arg2;
                arg1.alpha = 1;
            }
            return;
        }

        public function handleSWFAddress(arg1:SWFAddressEvent):*
        {
            var loc1:*=0;
            var loc2:*=0;
            if (SWFAddress.getValue().split("/")[1] == "") 
            {
                if (this.selectedmenu == null) 
                {
                    if (this.mainmenu_array[0].submenu_array.length != 0) 
                    {
                        this.mainmenu_array[0].submenu_array[0].mouse_over(null);
                        this.mainmenu_array[0].submenu_array[0].mouse_click(null);
                        SWFAddress.setTitle(this._root.websitetitle + " : " + this._root.menudata_array[0]["smheadline"][0]);
                    }
                    else 
                    {
                        this.mainmenu_array[0].mouse_over(null);
                        this.mainmenu_array[0].mouse_click(null);
                        SWFAddress.setTitle(this._root.websitetitle + " : " + this._root.menudata_array[0]["headline"]);
                    }
                }
            }
            else 
            {
                loc1 = 0;
                while (loc1 < this.mainmenu_array.length) 
                {
                    if (this.mainmenu_array[loc1].deeplink == SWFAddress.getValue().split("/")[1]) 
                    {
                        this.mainmenu_array[loc1].mouse_over(null);
                        this.mainmenu_array[loc1].mouse_click(null);
                        SWFAddress.setTitle(this._root.websitetitle + " : " + this._root.menudata_array[loc1]["headline"]);
                        return;
                    }
                    loc2 = 0;
                    while (loc2 < this.mainmenu_array[loc1].submenu_array.length) 
                    {
                        if (this.mainmenu_array[loc1].submenu_array[loc2].deeplink == SWFAddress.getValue().split("/")[1]) 
                        {
                            this.mainmenu_array[loc1].submenu_array[loc2].mouse_over(null);
                            this.mainmenu_array[loc1].submenu_array[loc2].mouse_click(null);
                            SWFAddress.setTitle(this._root.websitetitle + " : " + this._root.menudata_array[loc1]["smheadline"][loc2]);
                            return;
                        }
                        ++loc2;
                    }
                    ++loc1;
                }
            }
            return;
        }

        internal function tweenCheck(arg1:flash.events.Event):void
        {
            if (this.mainmenufadedin == this._root.mainmenulength) 
            {
                removeEventListener(flash.events.Event.ENTER_FRAME, this.tweenCheck);
                this._root.firstrun = false;
            }
            return;
        }

        internal function onStageResize(arg1:flash.events.Event):void
        {
            var colors2:Array;
            var ratios2:Array;
            var menubgmatrix:flash.geom.Matrix;
            var focalPoint2:Number;
            var ratios:Array;
            var focalPoint:Number;
            var e:flash.events.Event;
            var colors:Array;
            var headerbgmatrix:flash.geom.Matrix;
            var alphas:Array;
            var alphas2:Array;

            var loc1:*;
            e = arg1;
            if (this._root.menualign != "left") 
            {
                if (this._root.menualign != "center") 
                {
                    if (this._root.menualign == "right") 
                    {
                        this.menucontainer.x = Math.round(this._stage.stageWidth / 2) + Math.round(this._root.templatewidth / 2) - this._root.menuspacing - this.menux;
                    }
                }
                else 
                {
                    this.menucontainer.x = Math.round(this._stage.stageWidth / 2) - Math.round((this.menux - this._root.menuspacing) / 2);
                }
            }
            else 
            {
                this.menucontainer.x = Math.round(this._stage.stageWidth / 2) - Math.round(this._root.templatewidth / 2) + this._root.menubarpadding + this._root.menuspacing;
            }
            if (this._stage.stageHeight - this._root.templateheight - this._root.headerminheight >= this._root.headerminheight && this._stage.stageHeight - this._root.templateheight - this._root.headerminheight <= this._root.headermaxheight) 
            {
                this._root.headerheight = Math.round(this._stage.stageHeight - this._root.templateheight - this._root.headerminheight);
            }
            else if (this._stage.stageHeight - this._root.templateheight - this._root.headerminheight < this._root.headerminheight) 
            {
                this._root.headerheight = this._root.headerminheight;
            }
            else if (this._stage.stageHeight - this._root.templateheight - this._root.headerminheight > this._root.headermaxheight) 
            {
                this._root.headerheight = this._root.headermaxheight;
            }
            this.menubg.x = 0;
            this.menubg.y = this._root.headerheight;
            this.glaregfx.x = Math.round(this._stage.stageWidth / 2) - 490;
            this.glaregfx.width = 980;
            this.glaregfx.height = this._root.headerheight;
            colors = [this._root.menubarcolor1, this._root.menubarcolor2];
            alphas = [1, 1];
            ratios = [0, 255];
            menubgmatrix = new flash.geom.Matrix();
            menubgmatrix.createGradientBox(this._stage.stageWidth, this.menubgheight, Math.PI * 0.5, 0, 0);
            focalPoint = 0;
            var loc2:*;
            with (loc2 = this.backgroundGradient.graphics) 
            {
                clear();
                beginGradientFill(GradientType.LINEAR, colors, alphas, ratios, menubgmatrix, SpreadMethod.PAD, InterpolationMethod.RGB, focalPoint);
                drawRect(0, 0, _stage.stageWidth, menubgheight);
                endFill();
            }
            colors2 = [this._root.headerbgcolor1, this._root.headerbgcolor2];
            alphas2 = [1, 1];
            ratios2 = [0, 255];
            headerbgmatrix = new flash.geom.Matrix();
            headerbgmatrix.createGradientBox(this._stage.stageWidth, this.menubg.y, Math.PI * 0.5, 0, 0);
            focalPoint2 = 0;
            with (loc2 = this.headerbgsprite.graphics) 
            {
                clear();
                beginGradientFill(GradientType.LINEAR, colors2, alphas2, ratios2, headerbgmatrix, SpreadMethod.PAD, InterpolationMethod.RGB, focalPoint2);
                drawRect(0, 0, _stage.stageWidth, menubg.y);
                endFill();
            }
            this.menucontainer.y = (this._root.headerheight + Math.round(this._root.menubarheight / 2 - this.mainmenuheight / 2) - 1);
            this.t_menubg = org.libspark.betweenas3.BetweenAS3.to(this.menubg, {"alpha":this._root.menubaralpha}, 1, org.libspark.betweenas3.easing.Sine.easeOut);
            this.t_menubg.play();
            this.t_headerbg = org.libspark.betweenas3.BetweenAS3.to(this.headerbg, {"alpha":this._root.headerbgalpha}, 1, org.libspark.betweenas3.easing.Sine.easeOut);
            this.t_headerbg.play();
            this.t_glare = org.libspark.betweenas3.BetweenAS3.to(this.glaregfx, {"alpha":this._root.headerbgglarealpha}, 1, org.libspark.betweenas3.easing.Sine.easeOut);
            this.t_glare.play();
            return;
        }

        internal var menubgheight:int;

        internal var backgroundGradient:flash.display.Sprite;

        internal var t_menubg:org.libspark.betweenas3.tweens.ITween;

        internal var headerbg:flash.display.MovieClip;

        public var selectedmenu:flash.display.MovieClip=null;

        public var mainmenuheight:int=0;

        internal var _root:flash.display.MovieClip;

        internal var t_glare:org.libspark.betweenas3.tweens.ITween;

        public var parentselected:flash.display.MovieClip=null;

        internal var glaregfx:glare;

        internal var t_menu:org.libspark.betweenas3.tweens.ITween;

        public var selectedtype:String;

        internal var headerbgsprite:flash.display.Sprite;

        public var mainmenu_array:Array;

        public var selectedparent:flash.display.MovieClip=null;

        internal var timeout:int=500;

        internal var menubg:flash.display.MovieClip;

        internal var menucontainer:flash.display.MovieClip;

        internal var changeTimer:flash.utils.Timer;

        public var menux:int=0;

        public var mainmenufadedin:int=0;

        internal var t_headerbg:org.libspark.betweenas3.tweens.ITween;

        internal var _stage:flash.display.Stage;
    }
}
