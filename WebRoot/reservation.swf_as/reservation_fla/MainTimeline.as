package reservation_fla 
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
    import reservationlib.*;
    
    public dynamic class MainTimeline extends flash.display.MovieClip
    {
        public function MainTimeline()
        {
            super();
            addFrameScript(0, this.frame1);
            return;
        }

        function frame1():*
        {
            this.fielddata_array = new Array();
            this.xmlLoader = new flash.net.URLLoader();
            this.cssLoader = new flash.net.URLLoader();
            this.style = new flash.text.StyleSheet();
            return;
        }

        public function setPos(arg1:int, arg2:int):void
        {
            return;
        }

        public function xmlLoadingDone(arg1:flash.events.Event):void
        {
            var loc3:*=null;
            this.xmlLoader.removeEventListener(flash.events.Event.COMPLETE, this.xmlLoadingDone);
            var loc1:*=new XML(arg1.currentTarget.data);
            this.formwidth = loc1.attribute("formwidth");
            this.formheight = loc1.attribute("formheight");
            this.mailphpurl = loc1.attribute("mailphpurl");
            this.imageurl = loc1.attribute("imageurl");
            this.imagelink = loc1.attribute("imagelink");
            this.imagetarget = loc1.attribute("imagetarget");
            this.imagewidth = loc1.attribute("imagewidth");
            this.imageheight = loc1.attribute("imageheight");
            this.imagepadding = loc1.attribute("imagepadding");
            this.imageshadowopacity = parseFloat(loc1.attribute("imageshadowopacity"));
            this.imageshadowblur = loc1.attribute("imageshadowblur");
            this.imageshadowcolor = loc1.attribute("imageshadowcolor");
            this.imageshadowdistance = loc1.attribute("imageshadowdistance");
            this.imageshadowangle = loc1.attribute("imageshadowangle");
            this.imagesolidbackgroundcolor = loc1.attribute("imagesolidbackgroundcolor");
            this.imagesolidbackgroundopacity = parseFloat(loc1.attribute("imagesolidbackgroundopacity"));
            this.imagesolidbackgroundrounded = loc1.attribute("imagesolidbackgroundrounded");
            this.fieldbgcolor = loc1.attribute("fieldbgcolor");
            this.fieldbgopacity = parseFloat(loc1.attribute("fieldbgopacity"));
            this.fieldbgrounded = loc1.attribute("fieldbgrounded");
            this.fieldfontcolor = loc1.attribute("fieldfontcolor");
            this.fieldfontsize = loc1.attribute("fieldfontsize");
            this.btnfontcolor = loc1.attribute("btnfontcolor");
            this.btnfontsize = loc1.attribute("btnfontsize");
            this.btnbgcolor = loc1.attribute("btnbgcolor");
            this.fonttype = loc1.attribute("fonttype");
            this.infobgcolor = loc1.attribute("infobgcolor");
            this.infobgopacity = parseFloat(loc1.attribute("infobgopacity"));
            this.errorbgcolor = loc1.attribute("errorbgcolor");
            this.errorbgopacity = parseFloat(loc1.attribute("errorbgopacity"));
            this.errorfontcolor = loc1.attribute("errorfontcolor");
            this.errorfontsize = loc1.attribute("errorfontsize");
            this.infotext = loc1.infotext;
            this.requiredtext = loc1.formfields.attribute("requiredtext");
            this.finishedtext = loc1.formfields.attribute("finishedtext");
            this.notfinishedtext = loc1.formfields.attribute("notfinishedtext");
            this.submitbuttontext = loc1.formfields.attribute("submitbuttontext");
            this.maxfield = loc1.formfields.field.length();
            this.fielddata_array = [];
            var loc2:*=0;
            while (loc2 < this.maxfield) 
            {
                (loc3 = new Object())["teasernumber"] = loc2;
                loc3["fieldtitle"] = loc1.formfields.field.attribute("fieldtitle")[loc2];
                loc3["fieldrequired"] = loc1.formfields.field.attribute("fieldrequired")[loc2];
                loc3["fieldvar"] = loc1.formfields.field.attribute("fieldvar")[loc2];
                loc3["fielderror"] = loc1.formfields.field.attribute("fielderror")[loc2];
                this.fielddata_array[loc2] = loc3;
                ++loc2;
            }
            addChild(new reservationlib.createform(stage, this));
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

        public var fieldbgcolor:uint;

        public var fielddata_array:Array;

        public var fieldbgrounded:int;

        public var imagesolidbackgroundrounded:int;

        public var xmlLoader:flash.net.URLLoader;

        public var imageshadowcolor:uint;

        public var btnfontcolor:uint;

        public var xmlfile:String;

        public var maxfield:int;

        public var errorbgopacity:Number;

        public var imageshadowblur:int;

        public var finishedtext:String;

        public var btnfontsize:int;

        public var style:flash.text.StyleSheet;

        public var imagetarget:String;

        public var imageurl:String;

        public var errorbgcolor:uint;

        public var infobgopacity:Number;

        public var fieldfontcolor:uint;

        public var imageshadowdistance:int;

        public var imageheight:int;

        public var imagesolidbackgroundcolor:uint;

        public var formwidth:int;

        public var mainroot:flash.display.MovieClip;

        public var fieldfontsize:int;

        public var imagewidth:int;

        public var requiredtext:String;

        public var infobgcolor:uint;

        public var imagelink:String;

        public var imagepadding:int;

        public var infotext:String;

        public var btnbgcolor:uint;

        public var errorfontsize:int;

        public var fonttype:String;

        public var formheight:int;

        public var errorfontcolor:uint;

        public var imagesolidbackgroundopacity:Number;

        public var mailphpurl:String;

        public var notfinishedtext:String;

        public var cssLoader:flash.net.URLLoader;

        public var imageshadowopacity:Number;

        public var imageshadowangle:int;

        public var fieldbgopacity:Number;

        public var submitbuttontext:String;
    }
}
