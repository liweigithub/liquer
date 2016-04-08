package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.text.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class mainmenu extends flash.display.MovieClip
    {
        public function mainmenu(arg1:flash.display.MovieClip, arg2:flash.display.MovieClip, arg3:int)
        {
            this._menumc = new flash.display.MovieClip();
            this._menumcwrapper = new flash.display.MovieClip();
            this.submenubg = new flash.display.Sprite();
            this.mainmenuarea = new flash.display.Sprite();
            this.submenuarea = new flash.display.Sprite();
            this.colorTransform = new flash.geom.ColorTransform();
            this.txt = new flash.text.TextField();
            this.myFormat = new flash.text.TextFormat();
            this.submenu_array = new Array();
            super();
            this._root = arg1;
            this._menu = arg2;
            this._ivar = arg3;
            this.idlergb = this._menu.makeRGB(this._root.menuidlecolor);
            this.selectrgb = this._menu.makeRGB(this._root.menuselectcolor);
            this.myFormat.font = this._root.menufont;
            this.myFormat.indent = this.indent;
            this.myFormat.color = this._root.menuidlecolor;
            this.myFormat.size = this._root.menufontsize;
            if (this._root.menufontbold == "true") 
            {
                this.myFormat.bold = true;
            }
            this.txt.multiline = false;
            this.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.txt.embedFonts = false;
            this.txt.selectable = false;
            this.txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.txt.gridFitType = flash.text.GridFitType.PIXEL;
            this.txt.text = this._root.menudata_array[this._ivar]["headline"];
            this.txt.setTextFormat(this.myFormat);
            this.txt.mouseEnabled = false;
            this.colorTransform.color = this._root.menuidlecolor;
            this.txt.transform.colorTransform = this.colorTransform;
            this.txt.y = Math.round(this._root.menubarheight / 2 - this.txt.height / 2) + 1;
            this.mainmenuarea.graphics.beginFill(16711680);
            this.mainmenuarea.graphics.drawRect(0, 0, Math.round(this.txt.width), this._root.menubarheight);
            this.mainmenuarea.graphics.endFill();
            this.mainmenuarea.x = this.txt.x;
            this.mainmenuarea.y = 1;
            this.mainmenuarea.alpha = 0;
            this.deeplink = this._root.menudata_array[this._ivar]["deeplink"];
            this.imagepath = this._root.menudata_array[this._ivar]["backgroundimage"];
            this.modulepath = this._root.menudata_array[this._ivar]["module"];
            this.modulexmlpath = this._root.menudata_array[this._ivar]["modulexml"];
            this.modulewidth = this._root.menudata_array[this._ivar]["modulewidth"];
            this.moduleheight = this._root.menudata_array[this._ivar]["moduleheight"];
            this.clicklink = this._root.menudata_array[this._ivar]["urllink"];
            this.clicktarget = this._root.menudata_array[this._ivar]["urltarget"];
            this.modulealign = this._root.menudata_array[this._ivar]["modulealign"];
            this._menumc.mouseEnabled = true;
            this._menumc.buttonMode = true;
            this._menumc.addChild(this.mainmenuarea);
            this._menumc.addChild(this.txt);
            var loc1:*=new dropshadow(this._root, this._menumc, this._root.menushadowdistance, 45, 0, this._root.menushadowopacity, this._root.menushadowstrength, this._root.menushadowstrength, 2, 1);
            this._menu.mainmenuheight = this._menumc.height;
            this._menumc.alpha = 0;
            this._menumcwrapper.x = this._menu.menux;
            this.menuxsave = this._menumc.x;
            this._menu.menux = this._menu.menux + (Math.round(this._menumc.width) + this._root.menuspacing);
            this.addChild(this._menumcwrapper);
            this._menumcwrapper.addChild(this.submenubg);
            this._menumcwrapper.addChild(this.submenuarea);
            this._menumcwrapper.addChild(this._menumc);
            this.submenuy = Math.round(this._root.menubarheight + this.txt.y) + this._root.submenuspacing;
            this.submenuarea.mouseEnabled = true;
            this.submenuarea.alpha = 0;
            this.submenubg.mouseEnabled = false;
            this.submenubg.y = -Math.round(this._root.menubarheight / 2 - this._menu.mainmenuheight / 2) + this._root.menubarheight + 1;
            this.submenubg.x = -this._root.submenupadding;
            var loc2:*=org.libspark.betweenas3.BetweenAS3.to(this._menumc, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            var loc3:*=org.libspark.betweenas3.BetweenAS3.delay(loc2, (this._ivar + 1) * 0.1);
            this.t_fade = org.libspark.betweenas3.BetweenAS3.parallel(loc2, loc3);
            this.t_fade.onComplete = this.isFadedIn;
            this.t_fade.play();
            this._menu.mainmenu_array.push(this);
            this.addSubmenu();
            this.addEvents();
            return;
        }

        internal function checkMouse(arg1:flash.events.Event):void
        {
            if (!this.submenuarea.hitTestPoint(this._root.mouseX, this._root.mouseY, true)) 
            {
                if (!this.over) 
                {
                    this.menu_out();
                }
            }
            return;
        }

        internal function isFadedIn():void
        {
            var loc1:*;
            var loc2:*=((loc1 = this._menu).mainmenufadedin + 1);
            loc1.mainmenufadedin = loc2;
            return;
        }

        public function mouse_over(arg1:flash.events.MouseEvent):void
        {
            this.over = true;
            if (this._menu.selectedmenu != this) 
            {
                if (this.t_color != null) 
                {
                    this.t_color.stop();
                }
                this.t_color = org.libspark.betweenas3.BetweenAS3.to(this.txt, {"transform":{"colorTransform":{"redOffset":this.selectrgb["red"], "greenOffset":this.selectrgb["green"], "blueOffset":this.selectrgb["blue"]}}}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.t_color.play();
            }
            if (this.submenupresent) 
            {
                this._menumc.useHandCursor = false;
                this.mainmenuarea.useHandCursor = false;
                this.submenuarea.height = this.submenuheighttarg;
                if (this.submenuarea.hasEventListener(flash.events.Event.ENTER_FRAME)) 
                {
                    this.submenuarea.removeEventListener(flash.events.Event.ENTER_FRAME, this.checkMouse);
                    this.submenuarea.addEventListener(flash.events.Event.ENTER_FRAME, this.checkMouse);
                }
                else 
                {
                    this.submenuarea.addEventListener(flash.events.Event.ENTER_FRAME, this.checkMouse);
                }
                this._menu.showSubMenu(this);
            }
            else if (this._menu.selectedmenu == this) 
            {
                this._menumc.useHandCursor = false;
                this.mainmenuarea.useHandCursor = false;
            }
            else 
            {
                this._menumc.useHandCursor = true;
                this.mainmenuarea.useHandCursor = true;
            }
            return;
        }

        internal function addEvents():void
        {
            this._menumc.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mouse_over);
            this._menumc.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mouse_out);
            this._menumc.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click);
            return;
        }

        public function mouse_out(arg1:flash.events.MouseEvent):void
        {
            this.over = false;
            if (!(this._menu.selectedmenu == this) && !(this._menu.parentselected == this)) 
            {
                if (this.t_color != null) 
                {
                    this.t_color.stop();
                }
                this.t_color = org.libspark.betweenas3.BetweenAS3.to(this.txt, {"transform":{"colorTransform":{"redOffset":this.idlergb["red"], "greenOffset":this.idlergb["green"], "blueOffset":this.idlergb["blue"]}}}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.t_color.play();
            }
            return;
        }

        public function mouse_out_f():void
        {
            if (this.t_color != null) 
            {
                this.t_color.stop();
            }
            this.t_color = org.libspark.betweenas3.BetweenAS3.to(this.txt, {"transform":{"colorTransform":{"redOffset":this.idlergb["red"], "greenOffset":this.idlergb["green"], "blueOffset":this.idlergb["blue"]}}}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.t_color.play();
            return;
        }

        public function mouse_over_f():void
        {
            if (this.t_color != null) 
            {
                this.t_color.stop();
            }
            this.t_color = org.libspark.betweenas3.BetweenAS3.to(this.txt, {"transform":{"colorTransform":{"redOffset":this.selectrgb["red"], "greenOffset":this.selectrgb["green"], "blueOffset":this.selectrgb["blue"]}}}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.t_color.play();
            return;
        }

        internal function addSubmenu():void
        {
            var loc1:*=0;
            var loc2:*=null;
            if (this._root.menudata_array[this._ivar]["smamount"] != 0) 
            {
                this.submenupresent = true;
                loc1 = 0;
                while (loc1 < this._root.menudata_array[this._ivar]["smamount"]) 
                {
                    this._menumcwrapper.addChild(new submenu(this._root, this._menu, this, loc1, this._ivar));
                    ++loc1;
                }
                this.submenuwidth = Math.round(this._menumcwrapper.width + this._root.submenupadding * 2);
                this.submenuheighttarg = this.submenuheight + Math.round(this.txt.y) + this._root.submenuspacing;
                this.submenubg.graphics.beginFill(this._root.submenubgcolor);
                this.submenubg.graphics.drawRect(0, 0, this.submenuwidth, this.submenuheighttarg);
                this.submenubg.graphics.endFill();
                this.submenubg.height = 0;
                this.submenubg.alpha = this._root.submenubgalpha;
                loc2 = new dropshadow(this._root, this.submenubg, this._root.submenubgshadowdistance, 90, 0, this._root.submenubgshadowopacity, this._root.submenubgshadowstrength, this._root.submenubgshadowstrength, 1, 1);
                this.submenuarea.graphics.beginFill(16711680);
                this.submenuarea.graphics.drawRect(0, 0, this.submenuwidth, 1);
                this.submenuarea.graphics.endFill();
                this.submenuarea.x = -this._root.submenupadding;
                this.submenuarea.y = -Math.round(this._root.menubarheight / 2 - this._menu.mainmenuheight / 2) + 1 + this._root.menubarheight;
            }
            return;
        }

        internal function menu_out():void
        {
            if (this.submenupresent) 
            {
                this.submenuarea.height = 0;
                if (this.submenuarea.hasEventListener(flash.events.Event.ENTER_FRAME)) 
                {
                    this.submenuarea.removeEventListener(flash.events.Event.ENTER_FRAME, this.checkMouse);
                }
                this._menu.hideSubMenu(this);
            }
            return;
        }

        public function mouse_click(arg1:flash.events.MouseEvent):void
        {
            var e:flash.events.MouseEvent;

            var loc1:*;
            e = arg1;
            if (this._menu.selectedmenu != this) 
            {
                if (this.clicklink == "" && !this.submenupresent) 
                {
                    if (this._menu.selectedmenu != null) 
                    {
                        this._menu.selectedmenu._menumc.mouseEnabled = true;
                        if (this._menu.selectedtype == "main") 
                        {
                            this._menu.selectedmenu.mainmenuarea.mouseEnabled = true;
                        }
                        this._menu.selectedmenu.mouse_out_f();
                        if (this._menu.parentselected != null) 
                        {
                            this._menu.parentselected.mouse_out_f();
                            this._menu.parentselected = null;
                        }
                    }
                    this._menu.selectedtype = "main";
                    this._menu.selectedmenu = this;
                    this._menu.selectModule();
                    this._menumc.useHandCursor = false;
                    this.mainmenuarea.useHandCursor = false;
                }
                else 
                {
                    try 
                    {
                        flash.net.navigateToURL(new flash.net.URLRequest(this.clicklink), this.clicktarget);
                    }
                    catch (e:Error)
                    {
                    };
                }
            }
            return;
        }

        public var submenuheight:int=0;

        public var modulepath:String;

        public var moduleheight:int;

        public var t_subm:org.libspark.betweenas3.tweens.ITween;

        public var clicktarget:String;

        public var submenubg:flash.display.Sprite;

        public var mainmenuarea:flash.display.Sprite;

        internal var submenuarea:flash.display.Sprite;

        public var modulealign:String;

        internal var indent:int=0;

        public var submenu_array:Array;

        public var submenuy:int=0;

        public var imagepath:String;

        public var submenupresent:Boolean=false;

        internal var _menu:flash.display.MovieClip;

        internal var _menumcwrapper:flash.display.MovieClip;

        internal var _root:flash.display.MovieClip;

        internal var myFormat:flash.text.TextFormat;

        internal var idlergb:Object;

        internal var colorTransform:flash.geom.ColorTransform;

        public var t_move:org.libspark.betweenas3.tweens.ITween;

        internal var selectrgb:Object;

        public var slidedown:Boolean=false;

        public var _menumc:flash.display.MovieClip;

        public var modulexmlpath:String;

        public var modulewidth:int;

        public var over:Boolean=false;

        internal var t_color:org.libspark.betweenas3.tweens.ITween;

        public var deeplink:String;

        internal var t_fade:org.libspark.betweenas3.tweens.ITween;

        public var submenuheighttarg:int=0;

        internal var submenuwidth:int=0;

        internal var txt:flash.text.TextField;

        public var clicklink:String;

        public var menuxsave:int;

        public var _ivar:int;
    }
}
