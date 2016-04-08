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
    
    public class submenu extends flash.display.MovieClip
    {
        public function submenu(arg1:flash.display.MovieClip, arg2:flash.display.MovieClip, arg3:flash.display.MovieClip, arg4:int, arg5:int)
        {
            this._menumc = new flash.display.MovieClip();
            this.colorTransform = new flash.geom.ColorTransform();
            this.txt = new flash.text.TextField();
            this.myFormat = new flash.text.TextFormat();
            super();
            this._root = arg1;
            this._menu = arg2;
            this._mainmenu = arg3;
            this._ivar = arg4;
            this._mainmenuivar = arg5;
            this.idlergb = this._menu.makeRGB(this._root.submenuidlecolor);
            this.selectrgb = this._menu.makeRGB(this._root.submenuselectcolor);
            this.myFormat.font = this._root.menufont;
            this.myFormat.indent = 0;
            this.myFormat.color = this._root.submenuidlecolor;
            this.myFormat.size = this._root.submenufontsize;
            if (this._root.menufontbold == "true") 
            {
                this.myFormat.bold = true;
            }
            this.txt.multiline = false;
            this.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.txt.embedFonts = false;
            this.txt.selectable = false;
            this.txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.txt.text = this._root.menudata_array[this._mainmenuivar]["smheadline"][this._ivar];
            this.txt.setTextFormat(this.myFormat);
            this.txt.mouseEnabled = false;
            this.colorTransform.color = this._root.submenuidlecolor;
            this.txt.transform.colorTransform = this.colorTransform;
            this.deeplink = this._root.menudata_array[this._mainmenuivar]["smdeeplink"][this._ivar];
            this.imagepath = this._root.menudata_array[this._mainmenuivar]["smbackgroundimage"][this._ivar];
            this.modulepath = this._root.menudata_array[this._mainmenuivar]["smmodule"][this._ivar];
            this.modulexmlpath = this._root.menudata_array[this._mainmenuivar]["smmodulexml"][this._ivar];
            this.modulewidth = this._root.menudata_array[this._mainmenuivar]["smmodulewidth"][this._ivar];
            this.moduleheight = this._root.menudata_array[this._mainmenuivar]["smmoduleheight"][this._ivar];
            this.clicklink = this._root.menudata_array[this._mainmenuivar]["smurllink"][this._ivar];
            this.clicktarget = this._root.menudata_array[this._mainmenuivar]["smurltarget"][this._ivar];
            this.modulealign = this._root.menudata_array[this._mainmenuivar]["smmodulealign"][this._ivar];
            this._menumc.alpha = 0;
            this._menumc.mouseEnabled = false;
            this._menumc.buttonMode = false;
            this._menumc.visible = false;
            this._menumc.addChild(this.txt);
            this._menumc.y = this._mainmenu.submenuy - Math.abs(Math.round(this._root.submenuspacing / 2));
            this._mainmenu.submenuy = this._mainmenu.submenuy + (Math.round(this.txt.height) + this._root.submenuspacing);
            this._mainmenu.submenuheight = this._mainmenu.submenuheight + (Math.round(this.txt.height) + this._root.submenuspacing);
            this.addChild(this._menumc);
            this._mainmenu.submenu_array.push(this);
            this.addEvents();
            return;
        }

        internal function addEvents():void
        {
            this._menumc.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mouse_over);
            this._menumc.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mouse_out);
            this._menumc.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click);
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

        public function mouse_over(arg1:flash.events.MouseEvent):void
        {
            if (this._menu.selectedmenu == this) 
            {
                this._menumc.mouseEnabled = false;
            }
            else 
            {
                this._menumc.mouseEnabled = true;
                if (this.t_color != null) 
                {
                    this.t_color.stop();
                }
                this.t_color = org.libspark.betweenas3.BetweenAS3.to(this.txt, {"transform":{"colorTransform":{"redOffset":this.selectrgb["red"], "greenOffset":this.selectrgb["green"], "blueOffset":this.selectrgb["blue"]}}}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.t_color.play();
            }
            return;
        }

        public function fadeOut(arg1:int):void
        {
            this._menumc.mouseEnabled = false;
            this._menumc.buttonMode = false;
            if (this.t_fade != null) 
            {
                this.t_fade.stop();
            }
            var loc1:*=org.libspark.betweenas3.BetweenAS3.to(this._menumc, {"alpha":0}, 0.2, org.libspark.betweenas3.easing.Sine.easeOut);
            var loc2:*=org.libspark.betweenas3.BetweenAS3.delay(loc1, arg1 * 0.03);
            this.t_fade = org.libspark.betweenas3.BetweenAS3.parallel(loc1, loc2);
            this.t_fade.onComplete = this.disable;
            this.t_fade.play();
            return;
        }

        public function mouse_out(arg1:flash.events.MouseEvent):void
        {
            if (this._menu.selectedmenu != this) 
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

        public function fadeIn(arg1:int):void
        {
            this._menumc.visible = true;
            this._menumc.mouseEnabled = true;
            this._menumc.buttonMode = true;
            if (this.t_fade != null) 
            {
                this.t_fade.stop();
            }
            var loc1:*=org.libspark.betweenas3.BetweenAS3.to(this._menumc, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            var loc2:*=org.libspark.betweenas3.BetweenAS3.delay(loc1, arg1 * 0.08);
            this.t_fade = org.libspark.betweenas3.BetweenAS3.parallel(loc1, loc2);
            this.t_fade.play();
            return;
        }

        internal function disable():void
        {
            this._menumc.visible = false;
            return;
        }

        public function mouse_click(arg1:flash.events.MouseEvent):void
        {
            var e:flash.events.MouseEvent;

            var loc1:*;
            e = arg1;
            if (this._menu.selectedmenu != this) 
            {
                if (this.clicklink != "") 
                {
                    try 
                    {
                        flash.net.navigateToURL(new flash.net.URLRequest(this.clicklink), this.clicktarget);
                    }
                    catch (e:Error)
                    {
                    };
                }
                else 
                {
                    if (this._menu.selectedmenu != null) 
                    {
                        this._menu.selectedmenu._menumc.mouseEnabled = true;
                        this._menu.selectedmenu.mouse_out_f();
                    }
                    if (this._menu.parentselected != null) 
                    {
                        this._menu.parentselected.mouse_out_f();
                    }
                    this._menu.parentselected = this._mainmenu;
                    this._menu.parentselected.mouse_over_f();
                    this._menu.selectedtype = "sub";
                    this._menu.selectedmenu = this;
                    this._menu.selectModule();
                    this._menumc.mouseEnabled = false;
                }
            }
            return;
        }

        public var imagepath:String;

        public var clicklink:String;

        public var modulepath:String;

        public var moduleheight:int;

        internal var _mainmenuivar:int;

        public var clicktarget:String;

        public var modulealign:String;

        public var t_move:org.libspark.betweenas3.tweens.ITween;

        internal var _menu:flash.display.MovieClip;

        internal var _root:flash.display.MovieClip;

        internal var myFormat:flash.text.TextFormat;

        internal var colorTransform:flash.geom.ColorTransform;

        public var modulexmlpath:String;

        internal var selectrgb:Object;

        public var _menumc:flash.display.MovieClip;

        internal var t_color:org.libspark.betweenas3.tweens.ITween;

        public var modulewidth:int;

        public var deeplink:String;

        internal var t_fade:org.libspark.betweenas3.tweens.ITween;

        internal var txt:flash.text.TextField;

        internal var _mainmenu:flash.display.MovieClip;

        internal var idlergb:Object;

        public var _ivar:int;
    }
}
