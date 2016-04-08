package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.text.*;
    
    public class template extends flash.display.MovieClip
    {
        public function template()
        {
            var loadCheck:Function;
            var xmlOptionsLoadingDone:Function;
            var xmlMenuLoadingDone:Function;
            var cssLoadingDone:Function;

            var loc1:*;
            loadCheck = null;
            cssLoadingDone = null;
            xmlOptionsLoadingDone = null;
            xmlMenuLoadingDone = null;
            this.socialdata_array = new Array();
            this.musicdata_array = new Array();
            this.menudata_array = new Array();
            this.cssLoader = new flash.net.URLLoader();
            this.style = new flash.text.StyleSheet();
            this.xmlOptionsLoader = new flash.net.URLLoader();
            this.xmlMenuLoader = new flash.net.URLLoader();
            super();
            loadCheck = function (arg1:flash.events.Event):void
            {
                if (cssloaded && optionsloaded && menuloaded) 
                {
                    removeEventListener(flash.events.Event.ENTER_FRAME, loadCheck);
                    initTemplate();
                }
                return;
            }
            cssLoadingDone = function (arg1:flash.events.Event):void
            {
                cssLoader.removeEventListener(flash.events.Event.COMPLETE, cssLoadingDone);
                style.parseCSS(cssLoader.data);
                cssloaded = true;
                return;
            }
            xmlOptionsLoadingDone = function (arg1:flash.events.Event):void
            {
                var loc3:*=null;
                var loc4:*=null;
                xmlOptionsLoader.removeEventListener(flash.events.Event.COMPLETE, xmlOptionsLoadingDone);
                optionsxmldata = new XML(arg1.currentTarget.data);
                websitetitle = optionsxmldata.general.attribute("websitetitle");
                headerminheight = optionsxmldata.general.attribute("headerminheight");
                headermaxheight = optionsxmldata.general.attribute("headermaxheight");
                headerbgcolor1 = optionsxmldata.general.attribute("headerbgcolor1");
                headerbgcolor2 = optionsxmldata.general.attribute("headerbgcolor2");
                headerbgalpha = parseFloat(optionsxmldata.general.attribute("headerbgalpha"));
                headerbgglarealpha = parseFloat(optionsxmldata.general.attribute("headerbgglarealpha"));
                bodybgcolor = optionsxmldata.general.attribute("bodybgcolor");
                bodybgalpha = parseFloat(optionsxmldata.general.attribute("bodybgalpha"));
                templatewidth = optionsxmldata.general.attribute("templatewidth");
                templateheight = optionsxmldata.general.attribute("templateheight");
                logourl = optionsxmldata.general.attribute("logourl");
                logoorientation = optionsxmldata.general.attribute("logoorientation");
                logoheight = optionsxmldata.general.attribute("logoheight");
                logopadding = optionsxmldata.general.attribute("logopadding");
                logoclicklink = optionsxmldata.general.attribute("logoclicklink");
                logoclicktarget = optionsxmldata.general.attribute("logoclicktarget");
                menufont = optionsxmldata.general.attribute("menufont");
                textfont = optionsxmldata.general.attribute("textfont");
                menufontbold = optionsxmldata.general.attribute("menufontbold");
                menualign = optionsxmldata.general.attribute("menualign");
                menubarcolor1 = optionsxmldata.general.attribute("menubarcolor1");
                menubarcolor2 = optionsxmldata.general.attribute("menubarcolor2");
                menubarshadowdistance = optionsxmldata.general.attribute("menubarshadowdistance");
                menubarshadowstrength = optionsxmldata.general.attribute("menubarshadowstrength");
                menubarshadowopacity = parseFloat(optionsxmldata.general.attribute("menubarshadowopacity"));
                menubarcolor = optionsxmldata.general.attribute("menubarcolor");
                menubaralpha = parseFloat(optionsxmldata.general.attribute("menubaralpha"));
                menubarheight = optionsxmldata.general.attribute("menubarheight");
                menubarpadding = optionsxmldata.general.attribute("menubarpadding");
                menufontsize = optionsxmldata.general.attribute("menufontsize");
                menuspacing = optionsxmldata.general.attribute("menuspacing");
                menuidlecolor = optionsxmldata.general.attribute("menuidlecolor");
                menuselectcolor = optionsxmldata.general.attribute("menuselectcolor");
                menushadowstrength = optionsxmldata.general.attribute("menushadowstrength");
                menushadowopacity = parseFloat(optionsxmldata.general.attribute("menushadowopacity"));
                menushadowdistance = optionsxmldata.general.attribute("menushadowdistance");
                submenubgcolor = optionsxmldata.general.attribute("submenubgcolor");
                submenubgalpha = parseFloat(optionsxmldata.general.attribute("submenubgalpha"));
                submenufontsize = optionsxmldata.general.attribute("submenufontsize");
                submenupadding = optionsxmldata.general.attribute("submenupadding");
                submenuspacing = optionsxmldata.general.attribute("submenuspacing");
                submenuidlecolor = optionsxmldata.general.attribute("submenuidlecolor");
                submenuselectcolor = optionsxmldata.general.attribute("submenuselectcolor");
                submenubgshadowstrength = optionsxmldata.general.attribute("submenubgshadowstrength");
                submenubgshadowopacity = parseFloat(optionsxmldata.general.attribute("submenubgshadowopacity"));
                submenubgshadowdistance = optionsxmldata.general.attribute("submenubgshadowdistance");
                moduletoppadding = optionsxmldata.general.attribute("moduletoppadding");
                footerheight = optionsxmldata.general.attribute("footerheight");
                footerpadding = optionsxmldata.general.attribute("footerpadding");
                footerbgopacity = parseFloat(optionsxmldata.general.attribute("footerbgopacity"));
                footerbgcolor = optionsxmldata.general.attribute("footerbgcolor");
                footerpixelopacity = parseFloat(optionsxmldata.general.attribute("footerpixelopacity"));
                footerpixelcolor = optionsxmldata.general.attribute("footerpixelcolor");
                footershadowdistance = optionsxmldata.general.attribute("footershadowdistance");
                footershadowstrength = optionsxmldata.general.attribute("footershadowstrength");
                footershadowopacity = parseFloat(optionsxmldata.general.attribute("footershadowopacity"));
                footertextshadowdistance = optionsxmldata.general.attribute("footertextshadowdistance");
                footertextshadowstrength = optionsxmldata.general.attribute("footertextshadowstrength");
                footertextshadowopacity = parseFloat(optionsxmldata.general.attribute("footertextshadowopacity"));
                musicfullscreenrightpadding = optionsxmldata.general.attribute("musicfullscreenrightpadding");
                musicfullscreenbottompadding = optionsxmldata.general.attribute("musicfullscreenbottompadding");
                musicfullscreencolor = optionsxmldata.general.attribute("musicfullscreencolor");
                musicfullscreenopacity = parseFloat(optionsxmldata.general.attribute("musicfullscreenopacity"));
                socialleftpadding = optionsxmldata.socialentries.attribute("socialleftpadding");
                socialbottompadding = optionsxmldata.socialentries.attribute("socialbottompadding");
                socialbgcolor = optionsxmldata.socialentries.attribute("socialbgcolor");
                socialbgrounded = optionsxmldata.socialentries.attribute("socialbgrounded");
                socialtextcolor = optionsxmldata.socialentries.attribute("socialtextcolor");
                socialtextsize = optionsxmldata.socialentries.attribute("socialtextsize");
                socialtextshadowalpha = parseFloat(optionsxmldata.socialentries.attribute("socialtextshadowalpha"));
                socialtextshadowblur = optionsxmldata.socialentries.attribute("socialtextshadowblur");
                socialtextshadowcolor = optionsxmldata.socialentries.attribute("socialtextshadowcolor");
                sociallogosize = optionsxmldata.socialentries.attribute("sociallogosize");
                sociallogospacing = optionsxmldata.socialentries.attribute("sociallogospacing");
                sociallength = optionsxmldata.socialentries.socialentry.length();
                var loc1:*=0;
                while (loc1 < sociallength) 
                {
                    (loc3 = new Object())["socialnumber"] = loc1;
                    loc3["iconlink"] = optionsxmldata.socialentries.socialentry.attribute("iconlink")[loc1];
                    loc3["urllink"] = optionsxmldata.socialentries.socialentry.attribute("urllink")[loc1];
                    loc3["urltarget"] = optionsxmldata.socialentries.socialentry.attribute("urltarget")[loc1];
                    loc3["text"] = optionsxmldata.socialentries.socialentry[loc1];
                    socialdata_array[loc1] = loc3;
                    ++loc1;
                }
                musicactivated = optionsxmldata.musicentries.attribute("musicactivated");
                musicvolumecolor = optionsxmldata.musicentries.attribute("musicvolumecolor");
                musicvolumebgcolor = optionsxmldata.musicentries.attribute("musicvolumebgcolor");
                musiciconcolor = optionsxmldata.musicentries.attribute("musiciconcolor");
                musicbuttoncolor = optionsxmldata.musicentries.attribute("musicbuttoncolor");
                musicstartvolume = parseFloat(optionsxmldata.musicentries.attribute("musicstartvolume"));
                musicplayerwidth = optionsxmldata.musicentries.attribute("musicplayerwidth");
                musicplayerpadding = optionsxmldata.musicentries.attribute("musicplayerpadding");
                musicvolumeheight = optionsxmldata.musicentries.attribute("musicvolumeheight");
                musicentryheight = optionsxmldata.musicentries.attribute("musicentryheight");
                musicentryfontsize = optionsxmldata.musicentries.attribute("musicentryfontsize");
                musicentryfontcolor = optionsxmldata.musicentries.attribute("musicentryfontcolor");
                musicentrybgcolor = optionsxmldata.musicentries.attribute("musicentrybgcolor");
                musicentrybgopacity = parseFloat(optionsxmldata.musicentries.attribute("musicentrybgopacity"));
                musiclength = optionsxmldata.musicentries.song.length();
                var loc2:*=0;
                while (loc2 < musiclength) 
                {
                    (loc4 = new Object())["tracknumber"] = loc2;
                    loc4["urllink"] = optionsxmldata.musicentries.song.attribute("urllink")[loc2];
                    loc4["text"] = optionsxmldata.musicentries.song[loc2];
                    musicdata_array[loc2] = loc4;
                    ++loc2;
                }
                footertext = optionsxmldata.footertext;
                optionsloaded = true;
                return;
            }
            xmlMenuLoadingDone = function (arg1:flash.events.Event):void
            {
                var loc2:*=null;
                var loc3:*=0;
                xmlMenuLoader.removeEventListener(flash.events.Event.COMPLETE, xmlMenuLoadingDone);
                menuxmldata = new XML(arg1.currentTarget.data);
                mainmenulength = menuxmldata.mainmenu.length();
                var loc1:*=0;
                while (loc1 < mainmenulength) 
                {
                    loc2 = new Object();
                    loc2["mmnumber"] = loc1;
                    loc2["headline"] = menuxmldata.mainmenu.attribute("headline")[loc1];
                    loc2["deeplink"] = menuxmldata.mainmenu.attribute("deeplink")[loc1];
                    loc2["module"] = menuxmldata.mainmenu.attribute("module")[loc1];
                    loc2["modulexml"] = menuxmldata.mainmenu.attribute("modulexml")[loc1];
                    loc2["modulealign"] = menuxmldata.mainmenu.attribute("modulealign")[loc1];
                    loc2["modulewidth"] = menuxmldata.mainmenu.attribute("modulewidth")[loc1];
                    loc2["moduleheight"] = menuxmldata.mainmenu.attribute("moduleheight")[loc1];
                    loc2["backgroundimage"] = menuxmldata.mainmenu.attribute("backgroundimage")[loc1];
                    loc2["urllink"] = menuxmldata.mainmenu.attribute("urllink")[loc1];
                    loc2["urltarget"] = menuxmldata.mainmenu.attribute("urltarget")[loc1];
                    if (menuxmldata.mainmenu[loc1].submenu.length() > 0) 
                    {
                        loc2["smamount"] = menuxmldata.mainmenu[loc1].submenu.length();
                    }
                    else 
                    {
                        loc2["smamount"] = 0;
                    }
                    loc2["smnumber"] = {};
                    loc2["smheadline"] = {};
                    loc2["smdeeplink"] = {};
                    loc2["smmodule"] = {};
                    loc2["smmodulexml"] = {};
                    loc2["smmodulealign"] = {};
                    loc2["smmodulewidth"] = {};
                    loc2["smmoduleheight"] = {};
                    loc2["smbackgroundimage"] = {};
                    loc2["smurllink"] = {};
                    loc2["smurltarget"] = {};
                    loc3 = 0;
                    while (loc3 < menuxmldata.mainmenu[loc1].submenu.length()) 
                    {
                        loc2["smnumber"][loc3] = loc3;
                        loc2["smheadline"][loc3] = menuxmldata.mainmenu[loc1].submenu.attribute("headline")[loc3];
                        loc2["smdeeplink"][loc3] = menuxmldata.mainmenu[loc1].submenu.attribute("deeplink")[loc3];
                        loc2["smmodule"][loc3] = menuxmldata.mainmenu[loc1].submenu.attribute("module")[loc3];
                        loc2["smmodulexml"][loc3] = menuxmldata.mainmenu[loc1].submenu.attribute("modulexml")[loc3];
                        loc2["smmodulealign"][loc3] = menuxmldata.mainmenu[loc1].submenu.attribute("modulealign")[loc3];
                        loc2["smmodulewidth"][loc3] = menuxmldata.mainmenu[loc1].submenu.attribute("modulewidth")[loc3];
                        loc2["smmoduleheight"][loc3] = menuxmldata.mainmenu[loc1].submenu.attribute("moduleheight")[loc3];
                        loc2["smbackgroundimage"][loc3] = menuxmldata.mainmenu[loc1].submenu.attribute("backgroundimage")[loc3];
                        loc2["smurllink"][loc3] = menuxmldata.mainmenu[loc1].submenu.attribute("urllink")[loc3];
                        loc2["smurltarget"][loc3] = menuxmldata.mainmenu[loc1].submenu.attribute("urltarget")[loc3];
                        ++loc3;
                    }
                    menudata_array[loc1] = loc2;
                    ++loc1;
                }
                menuloaded = true;
                return;
            }
            this.rootvar = this;
            stage.align = "TL";
            stage.scaleMode = "noScale";
            this.optionsxmlfile = "xml/options.xml";
            this.menuxmlfile = "xml/menu.xml";
            this.cssfile = "xml/styles.css";
            this.cssLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function (arg1:flash.events.IOErrorEvent):void
            {
                return;
            }, false, 0, true)
            this.cssLoader.addEventListener(flash.events.Event.COMPLETE, cssLoadingDone);
            this.cssLoader.load(new flash.net.URLRequest(this.cssfile));
            this.xmlOptionsLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function (arg1:flash.events.IOErrorEvent):void
            {
                return;
            }, false, 0, true)
            this.xmlOptionsLoader.addEventListener(flash.events.Event.COMPLETE, xmlOptionsLoadingDone);
            this.xmlOptionsLoader.load(new flash.net.URLRequest(this.optionsxmlfile));
            this.xmlMenuLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function (arg1:flash.events.IOErrorEvent):void
            {
                return;
            }, false, 0, true)
            this.xmlMenuLoader.addEventListener(flash.events.Event.COMPLETE, xmlMenuLoadingDone);
            this.xmlMenuLoader.load(new flash.net.URLRequest(this.menuxmlfile));
            addEventListener(flash.events.Event.ENTER_FRAME, loadCheck);
            return;
        }

        internal function initTemplate():void
        {
            this.bg = new createbg(stage, this.rootvar);
            this.footer = new createfooter(stage, this.rootvar);
            addChild(new createsocial(stage, this.rootvar));
            this.util = new createutil(stage, this.rootvar);
            this.menuobj = new createmenu(stage, this.rootvar);
            this.logo = new createlogo(stage, this.rootvar);
            this.module = new createmodule(stage, this.rootvar);
            return;
        }

        public var musiciconcolor:uint;

        public var logopadding:int;

        internal var menuxmldata:XML;

        public var musicplayerpadding:int;

        public var headerminheight:int;

        public var activeimage:String;

        public var footerpadding:int;

        public var menuspacing:int;

        public var templateheight:int;

        internal var optionsloaded:Boolean=false;

        public var musicfullscreenrightpadding:int;

        internal var menuloaded:Boolean=false;

        public var menufont:String;

        public var socialbgcolor:uint;

        public var menudata_array:Array;

        public var musicbuttoncolor:uint;

        public var menushadowdistance:int;

        public var logoclicklink:String;

        public var musicentrybgcolor:uint;

        public var submenubgshadowdistance:int;

        public var musicplayerwidth:int;

        public var footerbgcolor:uint;

        public var bg:Object;

        public var bodybgalpha:Number;

        public var bodybgcolor:uint;

        public var footertextshadowdistance:int;

        public var menubarshadowdistance:int;

        public var musicfullscreenopacity:Number;

        public var module:Object;

        public var footerpixelcolor:uint;

        public var menubarheight:int;

        public var headerbgglarealpha:Number;

        public var menubarcolor2:uint;

        public var submenubgshadowstrength:int;

        public var menushadowstrength:int;

        public var moduletoppadding:int;

        public var logoclicktarget:String;

        public var logoheight:int;

        public var sociallength:int;

        public var sociallogosize:int;

        public var menubarcolor1:uint;

        public var websitetitle:String;

        public var footertextshadowopacity:Number;

        public var footerheight:int;

        public var footertextshadowstrength:int;

        public var sociallogospacing:int;

        public var socialleftpadding:int;

        public var socialdata_array:Array;

        public var menubarshadowstrength:int;

        public var musicstartvolume:Number;

        public var musicentryheight:int;

        public var submenuselectcolor:uint;

        public var footerbgopacity:Number;

        public var textfont:String;

        public var rootvar:flash.display.MovieClip;

        public var menualign:String;

        public var headerbgalpha:Number;

        public var menubarshadowopacity:Number;

        public var socialtextsize:int;

        public var socialtextshadowblur:int;

        public var menuselectcolor:uint;

        public var menufontsize:int;

        public var footershadowopacity:Number;

        public var menuobj:Object;

        public var socialbottompadding:int;

        public var menubarpadding:int;

        public var headerbgcolor1:uint;

        public var videoactive:Boolean=false;

        public var musicvolumecolor:uint;

        public var logoorientation:String;

        public var submenubgshadowopacity:Number;

        public var headerbgcolor2:uint;

        public var musiclength:int;

        public var musicentryfontsize:int;

        public var footertext:String;

        public var submenuidlecolor:uint;

        public var musicactivated:String;

        public var musicentrybgopacity:Number;

        public var musicdata_array:Array;

        public var musicvolumeheight:int;

        public var submenufontsize:int;

        public var footershadowdistance:int;

        internal var xmlOptionsLoader:flash.net.URLLoader;

        public var mainmenulength:int;

        public var socialtextcolor:uint;

        public var menubaralpha:Number;

        public var templatewidth:int;

        public var menubarcolor:uint;

        public var menuidlecolor:uint;

        public var submenupadding:int;

        public var footer:Object;

        public var headermaxheight:int;

        public var musicentryfontcolor:uint;

        public var util:Object;

        public var logo:Object;

        public var style:flash.text.StyleSheet;

        public var menufontbold:String;

        internal var optionsxmlfile:String;

        public var fsvar_stage:Boolean=false;

        public var submenubgalpha:Number;

        public var footershadowstrength:int;

        public var submenubgcolor:uint;

        public var musicfullscreencolor:uint;

        public var submenuspacing:int;

        internal var xmlMenuLoader:flash.net.URLLoader;

        internal var menuxmlfile:String;

        internal var cssloaded:Boolean=false;

        public var firstrun:Boolean=true;

        public var musicvolumebgcolor:uint;

        public var footerpixelopacity:Number;

        internal var optionsxmldata:XML;

        public var logourl:String;

        public var musicfullscreenbottompadding:int;

        public var socialtextshadowcolor:uint;

        public var socialtextshadowalpha:Number;

        public var menushadowopacity:Number;

        public var headerheight:int;

        public var socialbgrounded:int;

        internal var cssLoader:flash.net.URLLoader;

        internal var cssfile:String;
    }
}
