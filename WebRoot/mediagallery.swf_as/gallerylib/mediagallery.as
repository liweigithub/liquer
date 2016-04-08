package gallerylib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.text.*;
    
    public class mediagallery extends flash.display.MovieClip
    {
        public function mediagallery()
        {
            this.cssLoader = new flash.net.URLLoader();
            this.style = new flash.text.StyleSheet();
            this.xmlLoader = new flash.net.URLLoader();
            super();
            this.rootvar = this;
            return;
        }

        function xmlLoadingDone(arg1:flash.events.Event):void
        {
            var loc3:*=null;
            var loc4:*=0;
            this.xmlLoader.removeEventListener(flash.events.Event.COMPLETE, this.xmlLoadingDone);
            var loc1:*=new XML(arg1.currentTarget.data);
            this.gallerydata_array = [];
            this.gallerywidth = loc1.attribute("gallerywidth");
            this.galleryheight = loc1.attribute("galleryheight");
            this.gallerypadding = loc1.attribute("gallerypadding");
            this.thumbwidth = loc1.attribute("thumbwidth");
            this.thumbheight = loc1.attribute("thumbheight");
            this.thumbspacing = loc1.attribute("thumbspacing");
            this.thumbrows = loc1.attribute("thumbrows");
            this.thumbcolumns = loc1.attribute("thumbcolumns");
            this.thumbscaleup = parseFloat(loc1.attribute("thumbscaleup"));
            this.thumbfxstrength = loc1.attribute("thumbfxstrength");
            this.thumbblurstrength = loc1.attribute("thumbblurstrength");
            this.thumbshadowstrength = loc1.attribute("thumbshadowstrength");
            this.thumbshadowopacity = loc1.attribute("thumbshadowopacity");
            this.thumbiconcolor = loc1.attribute("thumbiconcolor");
            this.thumbiconbgcolor = loc1.attribute("thumbiconbgcolor");
            this.thumbiconopacity = parseFloat(loc1.attribute("thumbiconopacity"));
            this.solidbackgroundcolor = loc1.attribute("solidbackgroundcolor");
            this.solidbackgroundopacity = parseFloat(loc1.attribute("solidbackgroundopacity"));
            this.solidbackgroundrounded = loc1.attribute("solidbackgroundrounded");
            this.preloadoverlaycolor = loc1.attribute("preloadoverlaycolor");
            this.preloadoverlayopacity = parseFloat(loc1.attribute("preloadoverlayopacity"));
            this.selectarrowcolor = loc1.attribute("selectarrowcolor");
            this.selectarrowshadowopacity = parseFloat(loc1.attribute("selectarrowshadowopacity"));
            this.nextpreviousareawidth = loc1.attribute("nextpreviousareawidth");
            this.categoryscrolltype = loc1.attribute("categoryscrolltype");
            this.categoryscrollbuffer = loc1.attribute("categoryscrollbuffer");
            this.categoryscrollspeed = loc1.attribute("categoryscrollspeed");
            this.categoryareaheight = loc1.attribute("categoryareaheight");
            this.categoryfontsize = loc1.attribute("categoryfontsize");
            this.categoryspacing = loc1.attribute("categoryspacing");
            this.categoryidleopacity = parseFloat(loc1.attribute("categoryidleopacity"));
            this.categoryselectcolor = loc1.attribute("categoryselectcolor");
            this.categoryshadowopacity = parseFloat(loc1.attribute("categoryshadowopacity"));
            this.categoryfont = loc1.attribute("categoryfont");
            this.descriptionfont = loc1.attribute("descriptionfont");
            this.videoplayerfont = loc1.attribute("videoplayerfont");
            this.videointerfaceoverlay = loc1.attribute("videointerfaceoverlay");
            this.videomoveup = loc1.attribute("videomoveup");
            this.videoautoplay = loc1.attribute("videoautoplay");
            this.videoloop = loc1.attribute("videoloop");
            this.videostartvolume = loc1.attribute("videostartvolume");
            this.videoplayerwidth = loc1.attribute("videoplayerwidth");
            this.videoplayerheight = loc1.attribute("videoplayerheight");
            this.videocontrolsvisible = loc1.attribute("videocontrolsvisible");
            this.videocontrolshidetime = loc1.attribute("videocontrolshidetime");
            this.videocontrolsanimationdelays = parseFloat(loc1.attribute("videocontrolsanimationdelays"));
            this.videobigplaysize = loc1.attribute("videobigplaysize");
            this.videobigplayrounded = loc1.attribute("videobigplayrounded");
            this.videobigplayarrowcolor = loc1.attribute("videobigplayarrowcolor");
            this.videobigplaybgcolor = loc1.attribute("videobigplaybgcolor");
            this.videobigplaybgalpha = parseFloat(loc1.attribute("videobigplaybgalpha"));
            this.videobuttonbgcolor = loc1.attribute("videobuttonbgcolor");
            this.videobuttonbgalpha = parseFloat(loc1.attribute("videobuttonbgalpha"));
            this.videobuttonalphahover = loc1.attribute("videobuttonalphahover");
            this.videobuttonobjcolor = loc1.attribute("videobuttonobjcolor");
            this.videobuttonsize = loc1.attribute("videobuttonsize");
            this.videobuttonrounded = loc1.attribute("videobuttonrounded");
            this.videobuttonspacing = loc1.attribute("videobuttonspacing");
            this.videobuttonborderspacing = loc1.attribute("videobuttonborderspacing");
            this.videobuttonbottomspacing = loc1.attribute("videobuttonbottomspacing");
            this.videobarheight = loc1.attribute("videobarheight");
            this.videobarareaheight = loc1.attribute("videobarareaheight");
            this.videobarbgcolor = loc1.attribute("videobarbgcolor");
            this.videobarbuffercolor = loc1.attribute("videobarbuffercolor");
            this.videobarcolor = loc1.attribute("videobarcolor");
            this.videovolumewidth = loc1.attribute("videovolumewidth");
            this.videovolumebarbgcolor = loc1.attribute("videovolumebarbgcolor");
            this.videovolumemutealpha = parseFloat(loc1.attribute("videovolumemutealpha"));
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
            this.maxcategory = loc1.category.length();
            var loc2:*=0;
            while (loc2 < this.maxcategory) 
            {
                (loc3 = new Object())["categorynumber"] = loc2;
                loc3["title"] = loc1.category.attribute("title")[loc2];
                loc3["entrytype"] = {};
                loc3["entrylink"] = {};
                loc3["entrythumblink"] = {};
                loc3["videopreviewimage"] = {};
                loc3["text"] = {};
                loc4 = 0;
                while (loc4 < loc1.category[loc2].entry.length()) 
                {
                    loc3["entryamount"] = loc1.category[loc2].entry.length();
                    loc3["entrytype"][loc4] = loc1.category[loc2].entry.attribute("entrytype")[loc4];
                    loc3["entrylink"][loc4] = loc1.category[loc2].entry.attribute("entrylink")[loc4];
                    loc3["entrythumblink"][loc4] = loc1.category[loc2].entry.attribute("entrythumblink")[loc4];
                    loc3["videopreviewimage"][loc4] = loc1.category[loc2].entry.attribute("videopreviewimage")[loc4];
                    loc3["text"][loc4] = loc1.category[loc2].entry[loc4];
                    ++loc4;
                }
                this.gallerydata_array[loc2] = loc3;
                ++loc2;
            }
            addChild(new gallerylib.createpattern(stage, this.rootvar));
            addChild(new gallerylib.creategallery(stage, this.rootvar));
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

        public function setPos(arg1:int, arg2:int):void
        {
            this.playerx = arg1;
            this.playery = arg2;
            return;
        }

        function cssLoadingDone(arg1:flash.events.Event):void
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

        public var categoryscrolltype:String;

        public var thumbiconbgcolor:uint;

        public var videobigplayarrowcolor:uint;

        public var videotooltipbgcolor:uint;

        public var videotooltipbgalpha:Number;

        public var xmlfile:String;

        public var videocontrolsvisible:String;

        public var categoryselectcolor:uint;

        public var videoplayerwidth:Number;

        public var videobuttonbgalpha:Number;

        public var videovolumemutealpha:Number;

        public var videobuttonbgcolor:uint;

        public var videobigplayrounded:Number;

        public var videobuttonspacing:Number;

        public var xmlLoader:flash.net.URLLoader;

        public var videobuttonobjcolor:uint;

        public var fsvar:Boolean=false;

        public var videoseekfontantialiasing:String;

        public var videocontrolshidetime:Number;

        public var videoplayerheight:Number;

        public var thumbcolumns:Number;

        public var mainroot:flash.display.MovieClip;

        public var videobuttonborderspacing:Number;

        public var categoryscrollbuffer:int;

        public var videotooltipfontcolor:uint;

        public var categoryfont:String;

        public var videop:Object;

        public var gallerydata_array:Array;

        public var videoseekfontsize:Number;

        public var descriptionfont:String;

        public var videomoveup:String;

        public var thumbfxstrength:Number;

        public var videointerfacebgalpha:Number;

        public var videoplayerfont:String;

        public var videoseekfontcolor:uint;

        public var maxcategory:int;

        public var categoryareaheight:Number;

        public var videointerfaceoverlay:String;

        public var videobuttonbottomspacing:Number;

        public var thumbiconcolor:uint;

        public var thumbheight:Number;

        public var selectarrowshadowopacity:Number;

        public var gallerypadding:Number;

        public var videointerfacebgcolor:uint;

        public var videocontrolsanimationdelays:Number;

        public var categoryspacing:Number;

        public var solidbackgroundrounded:int;

        public var thumbblurstrength:Number;

        public var videovolumewidth:Number;

        public var galleryheight:Number;

        public var videobarbgcolor:uint;

        public var videobarbuffercolor:uint;

        public var preloadoverlayopacity:Number;

        public var preloadoverlaycolor:uint;

        public var videoloop:String;

        public var videobuttonrounded:Number;

        public var videostartvolume:Number;

        public var videotooltipbgrounded:Number;

        public var videobarcolor:uint;

        public var thumbspacing:Number;

        public var thumbrows:Number;

        public var thumbwidth:Number;

        public var videobarareaheight:Number;

        public var gallerywidth:Number;

        public var nextpreviousareawidth:Number;

        public var thumbshadowstrength:Number;

        public var categoryshadowopacity:Number;

        public var videobigplaybgalpha:Number;

        public var videobigplaybgcolor:uint;

        public var playerx:Number=0;

        public var videobuffertime:Number=3;

        public var style:flash.text.StyleSheet;

        public var videobuttonalphahover:String;

        public var categoryfontsize:Number;

        public var thumbscaleup:Number;

        public var playery:Number=0;

        public var thumbshadowopacity:Number;

        public var solidbackgroundopacity:Number;

        public var videobigplaysize:Number;

        public var rootvar:flash.display.MovieClip;

        public var thumbiconopacity:Number;

        public var videoautoplay:String;

        public var videobarheight:Number;

        public var videovolumebarbgcolor:uint;

        public var categoryscrollspeed:int;

        public var solidbackgroundcolor:uint;

        public var videobuttonsize:Number;

        public var selectarrowcolor:uint;

        public var categoryidleopacity:Number;

        public var cssLoader:flash.net.URLLoader;

        public var videotooltipfontsize:Number;
    }
}
