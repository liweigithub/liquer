package welcome_fla 
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
    import welcomelib.*;
    
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

        public function setModuleHeight(arg1:int):void
        {
            this.totalheight = arg1;
            return;
        }

        public function xmlLoadingDone(arg1:flash.events.Event):void
        {
            var loc3:*=null;
            this.xmlLoader.removeEventListener(flash.events.Event.COMPLETE, this.xmlLoadingDone);
            var loc1:*=new XML(arg1.currentTarget.data);
            this.teasercaptionbgcolor = loc1.teasers.attribute("teasercaptionbgcolor");
            this.teasercaptionbgopacity = parseFloat(loc1.teasers.attribute("teasercaptionbgopacity"));
            this.solidbackgroundcolor = loc1.teasers.attribute("solidbackgroundcolor");
            this.backgroundpatterncolor = loc1.teasers.attribute("backgroundpatterncolor");
            this.welcomeshadowopacity = parseFloat(loc1.welcometext.attribute("welcomeshadowopacity"));
            this.reservecaptionbgcolor = loc1.reservetable.attribute("reservecaptionbgcolor");
            this.reserveshadowopacity = parseFloat(loc1.reservetable.attribute("reserveshadowopacity"));
            this.reserveimageurl = loc1.reservetable.attribute("reserveimageurl");
            this.reserveclicklink = loc1.reservetable.attribute("reserveclicklink");
            this.reserveclicktarget = loc1.reservetable.attribute("reserveclicktarget");
            this.testimonialshadowopacity = parseFloat(loc1.testimonial.attribute("testimonialshadowopacity"));
            this.testimonialimageurl = loc1.testimonial.attribute("testimonialimageurl");
            this.welcometext = loc1.welcometext;
            this.reservetabletext = loc1.reservetable;
            this.testimonialtext = loc1.testimonial;
            this.maxteaser = loc1.teasers.teaser.length();
            this.teaserdata_array = [];
            var loc2:*=0;
            while (loc2 < this.maxteaser) 
            {
                (loc3 = new Object())["teasernumber"] = loc2;
                loc3["imageurl"] = loc1.teasers.teaser.attribute("imageurl")[loc2];
                loc3["clicklink"] = loc1.teasers.teaser.attribute("clicklink")[loc2];
                loc3["clicktarget"] = loc1.teasers.teaser.attribute("clicktarget")[loc2];
                loc3["text"] = loc1.teasers.teaser[loc2];
                this.teaserdata_array[loc2] = loc3;
                ++loc2;
            }
            addChild(new welcomelib.createpattern(stage, this));
            addChild(new welcomelib.createteasers(stage, this));
            addChild(new welcomelib.createwelcomeline(stage, this));
            addChild(new welcomelib.reservetable(stage, this));
            addChild(new welcomelib.createtestimonial(stage, this));
            return;
        }

        function frame1():*
        {
            this.xmlLoader = new flash.net.URLLoader();
            this.cssLoader = new flash.net.URLLoader();
            this.style = new flash.text.StyleSheet();
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

        public var backgroundpatterncolor:uint;

        public var xmlLoader:flash.net.URLLoader;

        public var welcometext:String;

        public var xmlfile:String;

        public var mainroot:flash.display.MovieClip;

        public var testimonialshadowopacity:Number;

        public var reserveshadowopacity:Number;

        public var style:flash.text.StyleSheet;

        public var maxteaser:int;

        public var reservetabletext:String;

        public var reserveclicklink:String;

        public var welcomeshadowopacity:Number;

        public var testimonialtext:String;

        public var testimonialimageurl:String;

        public var reservecaptionbgcolor:uint;

        public var wm:Object;

        public var teasercaptionbgopacity:Number;

        public var teaserdata_array:Array;

        public var reserveclicktarget:String;

        public var solidbackgroundcolor:uint;

        public var totalheight:int;

        public var teasercaptionbgcolor:uint;

        public var reserveimageurl:String;

        public var cssLoader:flash.net.URLLoader;
    }
}
