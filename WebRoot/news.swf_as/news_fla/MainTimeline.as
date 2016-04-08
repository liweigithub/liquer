package news_fla 
{
    import adobe.utils.*;
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
    import newslib.*;
    
    public dynamic class MainTimeline extends flash.display.MovieClip
    {
        public function MainTimeline()
        {
            super();
            addFrameScript(0, this.frame1);
            return;
        }

        public function setPos(arg1:int, arg2:int):void
        {
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

        public function xmlLoadingDone(arg1:flash.events.Event):void
        {
            var loc3:*=null;
            this.xmlLoader.removeEventListener(flash.events.Event.COMPLETE, this.xmlLoadingDone);
            var loc1:*=new XML(arg1.currentTarget.data);
            this.newswidth = loc1.teasers.attribute("newswidth");
            this.newsheight = loc1.teasers.attribute("newsheight");
            this.teasersvisible = loc1.teasers.attribute("teasersvisible");
            this.teaserimagewidth = loc1.teasers.attribute("teaserimagewidth");
            this.teaserimageheight = loc1.teasers.attribute("teaserimageheight");
            this.teaserimagepadding = loc1.teasers.attribute("teaserimagepadding");
            this.teaserimagespacing = loc1.teasers.attribute("teaserimagespacing");
            this.teasercaptionbgcolor = loc1.teasers.attribute("teasercaptionbgcolor");
            this.teasercaptionbgopacity = parseFloat(loc1.teasers.attribute("teasercaptionbgopacity"));
            this.teasernavigcolor = loc1.teasers.attribute("teasernavigcolor");
            this.imageshadowopacity = parseFloat(loc1.teasers.attribute("imageshadowopacity"));
            this.imageshadowblur = loc1.teasers.attribute("imageshadowblur");
            this.imageshadowcolor = loc1.teasers.attribute("imageshadowcolor");
            this.imageshadowdistance = loc1.teasers.attribute("imageshadowdistance");
            this.imageshadowangle = loc1.teasers.attribute("imageshadowangle");
            this.solidbackgroundcolor = loc1.teasers.attribute("solidbackgroundcolor");
            this.solidbackgroundopacity = parseFloat(loc1.teasers.attribute("solidbackgroundopacity"));
            this.solidbackgroundrounded = loc1.teasers.attribute("solidbackgroundrounded");
            this.contentbgopacity = parseFloat(loc1.teasers.attribute("contentbgopacity"));
            this.contentbgtexthpadding = loc1.teasers.attribute("contentbgtexthpadding");
            this.contentbgtextvpadding = loc1.teasers.attribute("contentbgtextvpadding");
            this.contentscrollbarcolor = loc1.teasers.attribute("contentscrollbarcolor");
            this.contentscrollbarwidth = loc1.teasers.attribute("contentscrollbarwidth");
            this.contentscrollbarheight = loc1.teasers.attribute("contentscrollbarheight");
            this.contentscrollbarrounded = loc1.teasers.attribute("contentscrollbarrounded");
            this.contentscrollbaropacity = parseFloat(loc1.teasers.attribute("contentscrollbaropacity"));
            this.contentscrollamount = loc1.teasers.attribute("contentscrollamount");
            this.contentscrollease = loc1.teasers.attribute("contentscrollease");
            this.maxteaser = loc1.teasers.teaser.length();
            this.teaserdata_array = [];
            var loc2:*=0;
            while (loc2 < this.maxteaser) 
            {
                (loc3 = new Object())["teasernumber"] = loc2;
                loc3["imageurl"] = loc1.teasers.teaser.attribute("imageurl")[loc2];
                loc3["clicklink"] = loc1.teasers.teaser.attribute("clicklink")[loc2];
                loc3["clicktarget"] = loc1.teasers.teaser.attribute("clicktarget")[loc2];
                loc3["text"] = loc1.teasers.teaser[loc2].teasertext;
                loc3["fulltext"] = loc1.teasers.teaser[loc2].fulltext;
                loc3["textheight"] = loc1.teasers.teaser[loc2].fulltext.attribute("textheight");
                this.teaserdata_array[loc2] = loc3;
                ++loc2;
            }
            addChild(new newslib.createteasers(stage, this));
            return;
        }

        function frame1():*
        {
            this.teaserdata_array = new Array();
            this.xmlLoader = new flash.net.URLLoader();
            this.cssLoader = new flash.net.URLLoader();
            this.style = new flash.text.StyleSheet();
            return;
        }

        public var imageshadowcolor:uint;

        public var xmlLoader:flash.net.URLLoader;

        public var xmlfile:String;

        public var contentscrollbarwidth:int;

        public var teaserimagewidth:int;

        public var contentscrollbaropacity:Number;

        public var imageshadowblur:int;

        public var teaserimagepadding:int;

        public var mainroot:flash.display.MovieClip;

        public var style:flash.text.StyleSheet;

        public var contentscrollbarheight:int;

        public var imageshadowdistance:int;

        public var newsheight:int;

        public var maxteaser:int;

        public var contentscrollbarcolor:uint;

        public var contentscrollbarrounded:int;

        public var contentscrollease:int;

        public var contentbgopacity:Number;

        public var teasernavigcolor:uint;

        public var newswidth:int;

        public var teasercaptionbgopacity:Number;

        public var teaserimagespacing:int;

        public var solidbackgroundopacity:Number;

        public var contentbgtexthpadding:int;

        public var teaserdata_array:Array;

        public var contentscrollamount:int;

        public var solidbackgroundcolor:uint;

        public var contentbgtextvpadding:int;

        public var teaserimageheight:int;

        public var teasersvisible:int;

        public var teasercaptionbgcolor:uint;

        public var imageshadowangle:int;

        public var solidbackgroundrounded:int;

        public var cssLoader:flash.net.URLLoader;

        public var imageshadowopacity:Number;
    }
}
