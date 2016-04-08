package alternatebannerlib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    
    public class banner extends flash.display.MovieClip
    {
        public function banner()
        {
            var init:Function;

            var loc1:*;
            init = null;
            this.xmlLoader = new flash.net.URLLoader();
            super();
            init = function (arg1:flash.events.Event):void
            {
                removeEventListener(flash.events.Event.ADDED_TO_STAGE, init);
                stage.align = "TL";
                stage.scaleMode = "noScale";
                return;
            }
            this.rootvar = this;
            this.fontused = "PF Ronda Seven";
            this.videomoveup = "false";
            this.videoloop = "false";
            this.videocontrolsanimationdelays = 0;
            this.videointerfaceupdate = 8;
            addEventListener(flash.events.Event.ADDED_TO_STAGE, init);
            return;
        }

        function xmlLoadingDone(arg1:flash.events.Event):void
        {
            var loc3:*=null;
            this.xmlLoader.removeEventListener(flash.events.Event.COMPLETE, this.xmlLoadingDone);
            var loc1:*=new XML(arg1.currentTarget.data);
            this.bannerdata_array = [];
            this.bannerwidth = loc1.attribute("bannerwidth");
            this.bannerheight = loc1.attribute("bannerheight");
            this.autoplay = loc1.attribute("autoplay");
            this.timerpauseonhover = loc1.attribute("timerpauseonhover");
            this.navigshowonhover = loc1.attribute("navigshowonhover");
            this.navigplaypause = loc1.attribute("navigplaypause");
            this.navigleftright = loc1.attribute("navigleftright");
            this.navigbuttonspacing = loc1.attribute("navigbuttonspacing");
            this.navigbuttonpaddingbottom = loc1.attribute("navigbuttonpaddingbottom");
            this.navigbuttonopacity = parseFloat(loc1.attribute("navigbuttonopacity"));
            this.navigbuttonidlecolor = loc1.attribute("navigbuttonidlecolor");
            this.navigbuttonhovercolor = loc1.attribute("navigbuttonhovercolor");
            this.navigbuttonshadowcolor = loc1.attribute("navigbuttonshadowcolor");
            this.navigbuttonshadowopacity = parseFloat(loc1.attribute("navigbuttonshadowopacity"));
            this.navigbuttonshadowdistance = loc1.attribute("navigbuttonshadowdistance");
            this.navigbuttonshadowangle = loc1.attribute("navigbuttonshadowangle");
            this.navigbuttonshadowsize = loc1.attribute("navigbuttonshadowsize");
            this.navigbuttonshadowstrength = loc1.attribute("navigbuttonshadowstrength");
            this.navigtimercolor = loc1.attribute("navigtimercolor");
            this.solidbackgroundcolor = loc1.attribute("solidbackgroundcolor");
            this.solidbackgroundopacity = parseFloat(loc1.attribute("solidbackgroundopacity"));
            this.entrymoveinfrom = loc1.attribute("entrymoveinfrom");
            this.entrytransitiontime = parseFloat(loc1.attribute("entrytransitiontime"));
            this.entryeasetype = loc1.attribute("entryeasetype");
            this.entryfadefromalpha = parseFloat(loc1.attribute("entryfadefromalpha"));
            this.textmoveinfrom = loc1.attribute("textmoveinfrom");
            this.texteasetype = loc1.attribute("texteasetype");
            this.texttransitiontime = parseFloat(loc1.attribute("texttransitiontime"));
            this.texttransitiondelay = parseFloat(loc1.attribute("texttransitiondelay"));
            this.preloadercolor = loc1.attribute("preloadercolor");
            this.preloaderheight = loc1.attribute("preloaderheight");
            this.preloaderopacity = parseFloat(loc1.attribute("preloaderopacity"));
            this.videobigplaysize = loc1.attribute("videobigplaysize");
            this.videobigplayrounded = loc1.attribute("videobigplayrounded");
            this.videobigplayarrowcolor = loc1.attribute("videobigplayarrowcolor");
            this.videobigplaybgcolor = loc1.attribute("videobigplaybgcolor");
            this.videobigplaybgalpha = parseFloat(loc1.attribute("videobigplaybgalpha"));
            this.videobuttonbgcolor = loc1.attribute("videobuttonbgcolor");
            this.videobuttonobjcolor = loc1.attribute("videobuttonobjcolor");
            this.videobuttonsize = loc1.attribute("videobuttonsize");
            this.videobuttonrounded = loc1.attribute("videobuttonrounded");
            this.videobuttonbgalpha = parseFloat(loc1.attribute("videobuttonbgalpha"));
            this.videobuttonalphahover = loc1.attribute("videobuttonalphahover");
            this.videobuttonspacing = loc1.attribute("videobuttonspacing");
            this.videobuttonborderspacing = loc1.attribute("videobuttonborderspacing");
            this.videobuttonbottomspacing = loc1.attribute("videobuttonbottomspacing");
            this.videobarheight = loc1.attribute("videobarheight");
            this.videobarareaheight = loc1.attribute("videobarareaheight");
            this.videobarbgcolor = loc1.attribute("videobarbgcolor");
            this.videobarcolor = loc1.attribute("videobarcolor");
            this.videobarbuffercolor = loc1.attribute("videobarbuffercolor");
            this.videovolumewidth = loc1.attribute("videovolumewidth");
            this.videovolumebarbgcolor = loc1.attribute("videovolumebarbgcolor");
            this.videovolumemutealpha = loc1.attribute("videovolumemutealpha");
            this.videoseekfontantialiasing = loc1.attribute("videoseekfontantialiasing");
            this.videoseekfontcolor = loc1.attribute("videoseekfontcolor");
            this.videoseekfontsize = loc1.attribute("videoseekfontsize");
            this.videotooltipbgcolor = loc1.attribute("videotooltipbgcolor");
            this.videotooltipbgrounded = loc1.attribute("videotooltipbgrounded");
            this.videotooltipbgalpha = parseFloat(loc1.attribute("videotooltipbgalpha"));
            this.videotooltipfontcolor = loc1.attribute("videotooltipfontcolor");
            this.videotooltipfontsize = loc1.attribute("videotooltipfontsize");
            this.videointerfacebgcolor = loc1.attribute("videointerfacebgcolor");
            this.videointerfacebgalpha = parseFloat(loc1.attribute("videointerfacebgalpha"));
            this.maxslide = loc1.slide.length();
            var loc2:*=0;
            while (loc2 < this.maxslide) 
            {
                (loc3 = new Object())["entrytype"] = loc1.slide.attribute("entrytype")[loc2];
                loc3["entryvideopreviewimage"] = loc1.slide.attribute("entryvideopreviewimage")[loc2];
                loc3["entryurl"] = loc1.slide.attribute("entryurl")[loc2];
                loc3["entrywidth"] = loc1.slide.attribute("entrywidth")[loc2];
                loc3["entryheight"] = loc1.slide.attribute("entryheight")[loc2];
                loc3["entryhorizontalorientation"] = loc1.slide.attribute("entryhorizontalorientation")[loc2];
                loc3["entryverticalorientation"] = loc1.slide.attribute("entryverticalorientation")[loc2];
                loc3["entryshowtime"] = loc1.slide.attribute("entryshowtime")[loc2];
                loc3["entryclicklink"] = loc1.slide.attribute("entryclicklink")[loc2];
                loc3["entryclicklinktarget"] = loc1.slide.attribute("entryclicklinktarget")[loc2];
                loc3["videoautoplay"] = loc1.slide.attribute("videoautoplay")[loc2];
                loc3["videostartvolume"] = loc1.slide.attribute("videostartvolume")[loc2];
                loc3["videocontrolsvisible"] = loc1.slide.attribute("videocontrolsvisible")[loc2];
                loc3["videocontrolshidetime"] = loc1.slide.attribute("videocontrolshidetime")[loc2];
                loc3["videointerfaceoverlay"] = loc1.slide.attribute("videointerfaceoverlay")[loc2];
                loc3["textbackgroundxpos"] = loc1.slide.attribute("textbackgroundxpos")[loc2];
                loc3["textbackgroundypos"] = loc1.slide.attribute("textbackgroundypos")[loc2];
                loc3["textpaddingtop"] = loc1.slide.attribute("textpaddingtop")[loc2];
                loc3["textpaddingleft"] = loc1.slide.attribute("textpaddingleft")[loc2];
                loc3["textpaddingright"] = loc1.slide.attribute("textpaddingright")[loc2];
                loc3["textbackgroundwidth"] = loc1.slide.attribute("textbackgroundwidth")[loc2];
                loc3["textbackgroundheight"] = loc1.slide.attribute("textbackgroundheight")[loc2];
                loc3["textbackgroundrotation"] = loc1.slide.attribute("textbackgroundrotation")[loc2];
                loc3["textbackgroundcolor"] = loc1.slide.attribute("textbackgroundcolor")[loc2];
                loc3["textbackgroundopacity"] = parseFloat(loc1.slide.attribute("textbackgroundopacity")[loc2]);
                loc3["textbackgroundshadowcolor"] = loc1.slide.attribute("textbackgroundshadowcolor")[loc2];
                loc3["textbackgroundshadowopacity"] = parseFloat(loc1.slide.attribute("textbackgroundshadowopacity")[loc2]);
                loc3["textbackgroundshadowdistance"] = loc1.slide.attribute("textbackgroundshadowdistance")[loc2];
                loc3["textbackgroundshadowangle"] = loc1.slide.attribute("textbackgroundshadowangle")[loc2];
                loc3["textbackgroundshadowsize"] = loc1.slide.attribute("textbackgroundshadowsize")[loc2];
                loc3["textbackgroundshadowstrength"] = loc1.slide.attribute("textbackgroundshadowstrength")[loc2];
                loc3["captiontext"] = loc1.slide[loc2];
                this.bannerdata_array[loc2] = loc3;
                ++loc2;
            }
            this.bg = new alternatebannerlib.createpattern(stage, this.rootvar);
            addChild(new alternatebannerlib.createbanner(stage, this.rootvar));
            return;
        }

        public function setVar(arg1:String, arg2:flash.display.MovieClip):void
        {
            var mroot:flash.display.MovieClip;
            var xmlf:String;

            var loc1:*;
            xmlf = arg1;
            mroot = arg2;
            this.xmlfile = xmlf;
            this.mainroot = mroot;
            this.xmlLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function (arg1:flash.events.IOErrorEvent):void
            {
                return;
            }, false, 0, true)
            this.xmlLoader.addEventListener(flash.events.Event.COMPLETE, this.xmlLoadingDone);
            this.xmlLoader.load(new flash.net.URLRequest(this.xmlfile));
            return;
        }

        public function setPos(arg1:int, arg2:int):void
        {
            return;
        }

        public var videotooltipfontsize:Number;

        public var texttransitiontime:Number;

        public var videotooltipbgalpha:Number;

        public var videobigplayarrowcolor:uint;

        public var navigbuttonshadowstrength:int;

        public var videotooltipbgcolor:uint;

        public var videovolumebarbgcolor:uint;

        public var bannerwidth:int;

        public var navigleftright:String;

        public var preloaderheight:int;

        public var videocontrolsvisible:String;

        public var mainroot:flash.display.MovieClip;

        public var xmlfile:String;

        public var videobuttonbgalpha:Number;

        public var videovolumemutealpha:Number;

        public var videobuttonbgcolor:uint;

        public var videobuttonspacing:Number;

        public var videobuttonobjcolor:uint;

        public var videoseekfontantialiasing:String;

        public var videocontrolshidetime:Number;

        public var videobigplayrounded:Number;

        public var bg:*;

        public var videobuttonborderspacing:Number;

        public var videotooltipfontcolor:uint;

        public var textmoveinfrom:String;

        public var xmlLoader:flash.net.URLLoader;

        public var entrymoveinfrom:String;

        public var bannerheight:int;

        public var navigbuttonshadowsize:int;

        public var videoseekfontsize:Number;

        public var videoseekfontcolor:uint;

        public var autoplay:String;

        public var videomoveup:String;

        public var navigbuttonpaddingbottom:int;

        public var videointerfacebgalpha:Number;

        public var videobuttonbottomspacing:Number;

        public var videointerfaceupdate:Number;

        public var texteasetype:String;

        public var navigbuttonshadowcolor:uint;

        public var videointerfacebgcolor:uint;

        public var videobarbuffercolor:uint;

        public var navigbuttonidlecolor:uint;

        public var navigtimercolor:uint;

        public var texttransitiondelay:Number;

        public var videocontrolsanimationdelays:Number;

        public var videobarbgcolor:uint;

        public var rootvar:flash.display.MovieClip;

        public var fontused:String;

        public var entrytransitiontime:Number;

        public var videoloop:String;

        public var videobuttonrounded:Number;

        public var entryeasetype:String;

        public var videotooltipbgrounded:Number;

        public var videobarareaheight:Number;

        public var preloadercolor:uint;

        public var bannerdata_array:Array;

        public var videobarcolor:uint;

        public var videovolumewidth:Number;

        public var navigbuttonopacity:Number;

        public var videobigplaybgcolor:uint;

        public var videobigplaybgalpha:Number;

        public var navigbuttonshadowdistance:int;

        public var videobuttonalphahover:String;

        public var timerpauseonhover:String;

        public var maxslide:int;

        public var videobuffertime:Number;

        public var entryfadefromalpha:Number;

        public var navigbuttonshadowopacity:Number;

        public var solidbackgroundopacity:Number;

        public var videobigplaysize:Number;

        public var preloaderopacity:Number;

        public var videobarheight:Number;

        public var navigbuttonhovercolor:uint;

        public var navigbuttonshadowangle:int;

        public var navigplaypause:String;

        public var solidbackgroundcolor:uint;

        public var videobuttonsize:Number;

        public var navigbuttonspacing:int;

        public var navigshowonhover:String;
    }
}
