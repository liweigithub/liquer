package contentpage_fla 
{
    import adobe.utils.*;
    import contentpagelib.*;
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

        public function xmlLoadingDone(arg1:flash.events.Event):void
        {
            var loc3:*=null;
            var loc4:*=0;
            this.xmlLoader.removeEventListener(flash.events.Event.COMPLETE, this.xmlLoadingDone);
            var loc1:*=new XML(arg1.currentTarget.data);
            this.bannerdata_array = [];
            this.banneractive = loc1.creativebanner.attribute("banneractive");
            this.bannerwidth = loc1.creativebanner.attribute("bannerwidth");
            this.bannerheight = loc1.creativebanner.attribute("bannerheight");
            this.imagewidth = loc1.creativebanner.attribute("imagewidth");
            this.imageheight = loc1.creativebanner.attribute("imageheight");
            this.autoplay = loc1.creativebanner.attribute("autoplay");
            this.backgroundpatterncolor = loc1.creativebanner.attribute("backgroundpatterncolor");
            this.backgroundpatternopacity = parseFloat(loc1.creativebanner.attribute("backgroundpatternopacity"));
            this.solidbackgroundcolor = loc1.creativebanner.attribute("solidbackgroundcolor");
            this.solidbackgroundopacity = parseFloat(loc1.creativebanner.attribute("solidbackgroundopacity"));
            this.bannerbackgroundcolor = loc1.creativebanner.attribute("bannerbackgroundcolor");
            this.bannerbackgroundopacity = parseFloat(loc1.creativebanner.attribute("bannerbackgroundopacity"));
            this.selectbuttonspacing = loc1.creativebanner.attribute("selectbuttonspacing");
            this.selectbuttonpaddingleft = loc1.creativebanner.attribute("selectbuttonpaddingleft");
            this.selectbuttonpaddingbottom = loc1.creativebanner.attribute("selectbuttonpaddingbottom");
            this.selectbuttonorientation = loc1.creativebanner.attribute("selectbuttonorientation");
            this.selectbuttonstyle = loc1.creativebanner.attribute("selectbuttonstyle");
            this.playpauseactivated = loc1.creativebanner.attribute("playpauseactivated");
            this.imageshadowopacity = parseFloat(loc1.creativebanner.attribute("imageshadowopacity"));
            this.imageshadowblur = loc1.creativebanner.attribute("imageshadowblur");
            this.imageshadowcolor = loc1.creativebanner.attribute("imageshadowcolor");
            this.imageshadowdistance = loc1.creativebanner.attribute("imageshadowdistance");
            this.imageshadowangle = loc1.creativebanner.attribute("imageshadowangle");
            this.timerpauseonhover = loc1.creativebanner.attribute("timerpauseonhover");
            this.timerbarpos = loc1.creativebanner.attribute("timerbarpos");
            this.timerbarheight = loc1.creativebanner.attribute("timerbarheight");
            this.timerbarcolor = loc1.creativebanner.attribute("timerbarcolor");
            this.timerbaropacity = parseFloat(loc1.creativebanner.attribute("timerbaropacity"));
            this.leftpos = Math.round((this.bannerwidth - this.imagewidth) / 2);
            this.toppos = this.leftpos;
            this.maxbanner = loc1.creativebanner.banner.length();
            var loc2:*=0;
            while (loc2 < loc1.creativebanner.banner.length()) 
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
                loc3["imageurl"] = loc1.creativebanner.banner.attribute("imageurl")[loc2];
                loc3["imageshowtime"] = loc1.creativebanner.banner.attribute("imageshowtime")[loc2];
                loc3["imageclicklink"] = loc1.creativebanner.banner.attribute("imageclicklink")[loc2];
                loc3["imageclicklinktarget"] = loc1.creativebanner.banner.attribute("imageclicklinktarget")[loc2];
                loc3["animtilenumber"] = loc1.creativebanner.banner.attribute("animtilenumber")[loc2];
                loc3["animtiletime"] = loc1.creativebanner.banner.attribute("animtiletime")[loc2];
                loc3["animtilefadetime"] = loc1.creativebanner.banner.attribute("animtilefadetime")[loc2];
                loc3["animtilefxtime"] = loc1.creativebanner.banner.attribute("animtilefxtime")[loc2];
                loc3["animtilefxstrength"] = loc1.creativebanner.banner.attribute("animtilefxstrength")[loc2];
                loc3["animtiledelay"] = loc1.creativebanner.banner.attribute("animtiledelay")[loc2];
                loc3["animtilepos"] = loc1.creativebanner.banner.attribute("animtilepos")[loc2];
                loc3["animeasingtype"] = loc1.creativebanner.banner.attribute("animeasingtype")[loc2];
                loc4 = 0;
                while (loc4 < loc1.creativebanner.banner[loc2].textbox.length()) 
                {
                    loc3["entrylength"] = loc1.creativebanner.banner[loc2].textbox.length();
                    loc3["textfontsize"][loc4] = loc1.creativebanner.banner[loc2].textbox.attribute("textfontsize")[loc4];
                    loc3["textfontcolor"][loc4] = loc1.creativebanner.banner[loc2].textbox.attribute("textfontcolor")[loc4];
                    loc3["textfontopacity"][loc4] = parseFloat(loc1.creativebanner.banner[loc2].textbox.attribute("textfontopacity")[loc4]);
                    loc3["textbgcolor"][loc4] = loc1.creativebanner.banner[loc2].textbox.attribute("textbgcolor")[loc4];
                    loc3["textbgopacity"][loc4] = parseFloat(loc1.creativebanner.banner[loc2].textbox.attribute("textbgopacity")[loc4]);
                    loc3["textbgpadding"][loc4] = loc1.creativebanner.banner[loc2].textbox.attribute("textbgpadding")[loc4];
                    loc3["textanimdirection"][loc4] = loc1.creativebanner.banner[loc2].textbox.attribute("textanimdirection")[loc4];
                    loc3["textanimoffset"][loc4] = loc1.creativebanner.banner[loc2].textbox.attribute("textanimoffset")[loc4];
                    loc3["textanimtime"][loc4] = loc1.creativebanner.banner[loc2].textbox.attribute("textanimtime")[loc4];
                    loc3["textanimdelay"][loc4] = loc1.creativebanner.banner[loc2].textbox.attribute("textanimdelay")[loc4];
                    loc3["textanimfxstrength"][loc4] = loc1.creativebanner.banner[loc2].textbox.attribute("textanimfxstrength")[loc4];
                    loc3["textposx"][loc4] = loc1.creativebanner.banner[loc2].textbox.attribute("textposx")[loc4];
                    loc3["textposy"][loc4] = loc1.creativebanner.banner[loc2].textbox.attribute("textposy")[loc4];
                    loc3["text"][loc4] = loc1.creativebanner.banner[loc2].textbox[loc4];
                    ++loc4;
                }
                this.bannerdata_array[loc2] = loc3;
                ++loc2;
            }
            this.contentheight = loc1.contenttext.attribute("contentheight");
            this.contenttopdistance = loc1.contenttext.attribute("contenttopdistance");
            this.contentbgtexthpadding = loc1.contenttext.attribute("contentbgtexthpadding");
            this.contentbgtextvpadding = loc1.contenttext.attribute("contentbgtextvpadding");
            this.contentbgcolor = loc1.contenttext.attribute("contentbgcolor");
            this.contentbgopacity = parseFloat(loc1.contenttext.attribute("contentbgopacity"));
            this.contentbgrounded = loc1.contenttext.attribute("contentbgrounded");
            this.contentscrollbarcolor = loc1.contenttext.attribute("contentscrollbarcolor");
            this.contentscrollbarwidth = loc1.contenttext.attribute("contentscrollbarwidth");
            this.contentscrollbarheight = loc1.contenttext.attribute("contentscrollbarheight");
            this.contentscrollbarrounded = loc1.contenttext.attribute("contentscrollbarrounded");
            this.contentscrollbaropacity = parseFloat(loc1.contenttext.attribute("contentscrollbaropacity"));
            this.contentscrollamount = loc1.contenttext.attribute("contentscrollamount");
            this.contentscrollease = loc1.contenttext.attribute("contentscrollease");
            this.textfieldheight = loc1.contenttext.attribute("textfieldheight");
            this.contenttext = loc1.contenttext;
            if (this.banneractive == "true") 
            {
                addChild(new contentpagelib.createpattern(stage, this));
                addChild(new contentpagelib.createbanner(stage, this));
            }
            this.ct = new contentpagelib.createtext(stage, this);
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
            this.cssLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function (arg1:flash.events.IOErrorEvent):void
            {
                return;
            }, false, 0, true)
            this.cssLoader.addEventListener(flash.events.Event.COMPLETE, this.cssLoadingDone);
            this.cssLoader.load(new flash.net.URLRequest("xml/styles.css"));
            return;
        }

        function frame1():*
        {
            this.fontused = "Arial";
            this.activebanner = -1;
            this.xmlLoader = new flash.net.URLLoader();
            this.cssLoader = new flash.net.URLLoader();
            this.style = new flash.text.StyleSheet();
            return;
        }

        public function setPos(arg1:int, arg2:int):void
        {
            return;
        }

        public function setSpace(arg1:int):void
        {
            this.verticalspace = arg1;
            return;
        }

        public function cssLoadingDone(arg1:flash.events.Event):void
        {
            var e:flash.events.Event;

            var loc1:*;
            e = arg1;
            this.cssLoader.removeEventListener(flash.events.Event.COMPLETE, this.cssLoadingDone);
            this.style.parseCSS(this.cssLoader.data);
            this.xmlLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function (arg1:flash.events.IOErrorEvent):void
            {
                return;
            }, false, 0, true)
            this.xmlLoader.addEventListener(flash.events.Event.COMPLETE, this.xmlLoadingDone);
            this.xmlLoader.load(new flash.net.URLRequest(this.xmlfile));
            return;
        }

        public var xmlfile:String;

        public var contentscrollbarwidth:int;

        public var bannerwidth:Number;

        public var mainroot:flash.display.MovieClip;

        public var imageshadowblur:Number;

        public var contenttext:String;

        public var backgroundpatternopacity:Number;

        public var imageshadowdistance:Number;

        public var contenttopdistance:int;

        public var banneractive:String;

        public var contentscrollbarheight:int;

        public var contentscrollbarrounded:int;

        public var imageheight:Number;

        public var selectbuttonstyle:String;

        public var bannerbackgroundcolor:uint;

        public var imagewidth:Number;

        public var verticalspace:int;

        public var bannerheight:Number;

        public var textfieldheight:int;

        public var selectbuttonspacing:Number;

        public var timerbarheight:Number;

        public var contentscrollamount:int;

        public var autoplay:String;

        public var contentbgrounded:int;

        public var imageshadowopacity:Number;

        public var bannerbackgroundopacity:Number;

        public var backgroundpatterncolor:uint;

        public var contentscrollease:int;

        public var timerbarcolor:uint;

        public var contentbgtexthpadding:int;

        public var imageshadowangle:Number;

        public var ct:Object;

        public var fontused:String;

        public var contentbgtextvpadding:int;

        public var maxbanner:int;

        public var imageshadowcolor:uint;

        public var timerbaropacity:Number;

        public var contentbgcolor:uint;

        public var selectbuttonpaddingleft:Number;

        public var contentscrollbaropacity:Number;

        public var bannerdata_array:Array;

        public var activebanner:int;

        public var contentscrollbarcolor:uint;

        public var style:flash.text.StyleSheet;

        public var xmlLoader:flash.net.URLLoader;

        public var timerpauseonhover:String;

        public var contentbgopacity:Number;

        public var playpauseactivated:String;

        public var solidbackgroundopacity:Number;

        public var teaserdata_array:Array;

        public var toppos:Number;

        public var contentheight:int;

        public var timerbarpos:String;

        public var selectbuttonorientation:String;

        public var solidbackgroundcolor:uint;

        public var leftpos:Number;

        public var selectbuttonpaddingbottom:Number;

        public var cssLoader:flash.net.URLLoader;
    }
}
