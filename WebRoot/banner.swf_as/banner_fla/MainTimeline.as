package banner_fla 
{
    import adobe.utils.*;
    import bannerlib.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;
    
    public dynamic class MainTimeline extends flash.display.MovieClip
    {
        public function MainTimeline()
        {
            super();
            addFrameScript(0, this.frame1);
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

        function frame1():*
        {
            this.fontused = "Arial";
            this.activebanner = -1;
            this.xmlLoader = new flash.net.URLLoader();
            return;
        }

        public function xmlLoadingDone(arg1:flash.events.Event):void
        {
            var loc3:*=null;
            var loc4:*=0;
            this.xmlLoader.removeEventListener(flash.events.Event.COMPLETE, this.xmlLoadingDone);
            var loc1:*=new XML(arg1.currentTarget.data);
            this.bannerdata_array = [];
            this.bannerwidth = loc1.attribute("bannerwidth");
            this.bannerheight = loc1.attribute("bannerheight");
            this.imagewidth = loc1.attribute("imagewidth");
            this.imageheight = loc1.attribute("imageheight");
            this.autoplay = loc1.attribute("autoplay");
            this.backgroundpatterncolor = loc1.attribute("backgroundpatterncolor");
            this.backgroundpatternopacity = parseFloat(loc1.attribute("backgroundpatternopacity"));
            this.solidbackgroundcolor = loc1.attribute("solidbackgroundcolor");
            this.solidbackgroundopacity = parseFloat(loc1.attribute("solidbackgroundopacity"));
            this.bannerbackgroundcolor = loc1.attribute("bannerbackgroundcolor");
            this.bannerbackgroundopacity = parseFloat(loc1.attribute("bannerbackgroundopacity"));
            this.selectbuttonspacing = loc1.attribute("selectbuttonspacing");
            this.selectbuttonpaddingleft = loc1.attribute("selectbuttonpaddingleft");
            this.selectbuttonpaddingbottom = loc1.attribute("selectbuttonpaddingbottom");
            this.selectbuttonorientation = loc1.attribute("selectbuttonorientation");
            this.selectbuttonstyle = loc1.attribute("selectbuttonstyle");
            this.playpauseactivated = loc1.attribute("playpauseactivated");
            this.imageshadowopacity = parseFloat(loc1.attribute("imageshadowopacity"));
            this.imageshadowblur = loc1.attribute("imageshadowblur");
            this.imageshadowcolor = loc1.attribute("imageshadowcolor");
            this.imageshadowdistance = loc1.attribute("imageshadowdistance");
            this.imageshadowangle = loc1.attribute("imageshadowangle");
            this.timerpauseonhover = loc1.attribute("timerpauseonhover");
            this.timerbarpos = loc1.attribute("timerbarpos");
            this.timerbarheight = loc1.attribute("timerbarheight");
            this.timerbarcolor = loc1.attribute("timerbarcolor");
            this.timerbaropacity = parseFloat(loc1.attribute("timerbaropacity"));
            this.leftpos = Math.round((this.bannerwidth - this.imagewidth) / 2);
            this.toppos = this.leftpos;
            this.maxbanner = loc1.banner.length();
            var loc2:*=0;
            while (loc2 < loc1.banner.length()) 
            {
                (loc3 = new Object())["textfontsize"] = {};
                loc3["textfontcolor"] = {};
                loc3["textfontopacity"] = {};
                loc3["textbgcolor"] = {};
                loc3["textbgopacity"] = {};
                loc3["textbgpadding"] = {};
                loc3["textanimdirection"] = {};
                loc3["textanimoffset"] = {};
                loc3["textanimtime"] = {};
                loc3["textanimdelay"] = {};
                loc3["textanimfxstrength"] = {};
                loc3["textposx"] = {};
                loc3["textposy"] = {};
                loc3["text"] = {};
                loc3["bannernumber"] = loc2;
                loc3["imageurl"] = loc1.banner.attribute("imageurl")[loc2];
                loc3["imageshowtime"] = loc1.banner.attribute("imageshowtime")[loc2];
                loc3["imageclicklink"] = loc1.banner.attribute("imageclicklink")[loc2];
                loc3["imageclicklinktarget"] = loc1.banner.attribute("imageclicklinktarget")[loc2];
                loc3["animtilenumber"] = loc1.banner.attribute("animtilenumber")[loc2];
                loc3["animtiletime"] = loc1.banner.attribute("animtiletime")[loc2];
                loc3["animtilefadetime"] = loc1.banner.attribute("animtilefadetime")[loc2];
                loc3["animtilefxtime"] = loc1.banner.attribute("animtilefxtime")[loc2];
                loc3["animtilefxstrength"] = loc1.banner.attribute("animtilefxstrength")[loc2];
                loc3["animtiledelay"] = loc1.banner.attribute("animtiledelay")[loc2];
                loc3["animtilepos"] = loc1.banner.attribute("animtilepos")[loc2];
                loc3["animeasingtype"] = loc1.banner.attribute("animeasingtype")[loc2];
                loc4 = 0;
                while (loc4 < loc1.banner[loc2].textbox.length()) 
                {
                    loc3["entrylength"] = loc1.banner[loc2].textbox.length();
                    loc3["textfontsize"][loc4] = loc1.banner[loc2].textbox.attribute("textfontsize")[loc4];
                    loc3["textfontcolor"][loc4] = loc1.banner[loc2].textbox.attribute("textfontcolor")[loc4];
                    loc3["textfontopacity"][loc4] = parseFloat(loc1.banner[loc2].textbox.attribute("textfontopacity")[loc4]);
                    loc3["textbgcolor"][loc4] = loc1.banner[loc2].textbox.attribute("textbgcolor")[loc4];
                    loc3["textbgopacity"][loc4] = parseFloat(loc1.banner[loc2].textbox.attribute("textbgopacity")[loc4]);
                    loc3["textbgpadding"][loc4] = loc1.banner[loc2].textbox.attribute("textbgpadding")[loc4];
                    loc3["textanimdirection"][loc4] = loc1.banner[loc2].textbox.attribute("textanimdirection")[loc4];
                    loc3["textanimoffset"][loc4] = loc1.banner[loc2].textbox.attribute("textanimoffset")[loc4];
                    loc3["textanimtime"][loc4] = loc1.banner[loc2].textbox.attribute("textanimtime")[loc4];
                    loc3["textanimdelay"][loc4] = loc1.banner[loc2].textbox.attribute("textanimdelay")[loc4];
                    loc3["textanimfxstrength"][loc4] = loc1.banner[loc2].textbox.attribute("textanimfxstrength")[loc4];
                    loc3["textposx"][loc4] = loc1.banner[loc2].textbox.attribute("textposx")[loc4];
                    loc3["textposy"][loc4] = loc1.banner[loc2].textbox.attribute("textposy")[loc4];
                    loc3["text"][loc4] = loc1.banner[loc2].textbox[loc4];
                    ++loc4;
                }
                this.bannerdata_array[loc2] = loc3;
                ++loc2;
            }
            addChild(new bannerlib.createpattern(stage, this));
            addChild(new bannerlib.createbanner(stage, this));
            return;
        }

        public function setPos(arg1:int, arg2:int):void
        {
            return;
        }

        public var backgroundpatterncolor:uint;

        public var imageshadowcolor:uint;

        public var xmlLoader:flash.net.URLLoader;

        public var fontused:String;

        public var selectbuttonpaddingbottom:Number;

        public var xmlfile:String;

        public var maxbanner:int;

        public var bannerwidth:Number;

        public var mainroot:flash.display.MovieClip;

        public var timerbaropacity:Number;

        public var imageshadowblur:Number;

        public var backgroundpatternopacity:Number;

        public var selectbuttonpaddingleft:Number;

        public var bannerdata_array:Array;

        public var activebanner:int;

        public var imageshadowdistance:Number;

        public var imageheight:Number;

        public var selectbuttonstyle:String;

        public var timerpauseonhover:String;

        public var playpauseactivated:String;

        public var bannerheight:Number;

        public var selectbuttonspacing:Number;

        public var solidbackgroundopacity:Number;

        public var toppos:Number;

        public var autoplay:String;

        public var bannerbackgroundcolor:uint;

        public var timerbarpos:String;

        public var selectbuttonorientation:String;

        public var solidbackgroundcolor:uint;

        public var timerbarheight:Number;

        public var bannerbackgroundopacity:Number;

        public var imagewidth:Number;

        public var leftpos:Number;

        public var timerbarcolor:uint;

        public var imageshadowopacity:Number;

        public var imageshadowangle:Number;
    }
}
