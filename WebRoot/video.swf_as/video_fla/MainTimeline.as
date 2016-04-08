package video_fla 
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
    import videolib.*;
    
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
            this.fontused = "PF Ronda Seven";
            this.fsvar = false;
            this.fsvar_stage = false;
            this.activemute = false;
            this.xmlLoader = new flash.net.URLLoader();
            this.playerx = 0;
            this.playery = 0;
            return;
        }

        public function xmlLoadingDone(arg1:flash.events.Event):void
        {
            this.xmlLoader.removeEventListener(flash.events.Event.COMPLETE, this.xmlLoadingDone);
            var loc1:*=new XML(arg1.currentTarget.data);
            this.youtubemode = loc1.attribute("youtubemode");
            this.videolink = loc1.attribute("videolink");
            this.videopreviewimage = loc1.attribute("videopreviewimage");
            this.videointerfaceoverlay = loc1.attribute("videointerfaceoverlay");
            this.videomoveup = loc1.attribute("videomoveup");
            this.videoautoplay = loc1.attribute("videoautoplay");
            this.videoloop = loc1.attribute("videoloop");
            this.videobuffertime = loc1.attribute("videobuffertime");
            this.videointerfaceupdate = loc1.attribute("videointerfaceupdate");
            this.videostartvolume = parseFloat(loc1.attribute("videostartvolume"));
            this.videoplayerwidth = loc1.attribute("videoplayerwidth");
            this.videoplayerheight = loc1.attribute("videoplayerheight");
            this.videocontrolsvisible = loc1.attribute("videocontrolsvisible");
            this.videocontrolshidetime = loc1.attribute("videocontrolshidetime");
            this.videocontrolsanimationdelays = loc1.attribute("videocontrolsanimationdelays");
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
            if (this.youtubemode != "false") 
            {
                if (this.youtubemode == "true") 
                {
                    this.videop = new videolib.createyoutubeplayer(stage, this, this.videop, this.videolink, this.videopreviewimage, this.videoplayerwidth, this.videoplayerheight, this.videoautoplay, this.videoloop, this.videostartvolume);
                }
            }
            else 
            {
                this.videop = new videolib.createvideoplayer(stage, this, this.videop, this.videolink, this.videopreviewimage, this.videoplayerwidth, this.videoplayerheight, this.videoautoplay, this.videoloop, this.videostartvolume);
            }
            return;
        }

        public function setPos(arg1:int, arg2:int):void
        {
            this.playerx = arg1;
            this.playery = arg2;
            return;
        }

        public var videotooltipbgalpha:Number;

        public var videobigplayarrowcolor:uint;

        public var videotooltipbgcolor:uint;

        public var xmlfile:String;

        public var mainroot:flash.display.MovieClip;

        public var activemute:Boolean;

        public var videocontrolsvisible:String;

        public var videoplayerwidth:Number;

        public var videobuttonbgalpha:Number;

        public var videovolumemutealpha:Number;

        public var videobuttonbgcolor:uint;

        public var videobigplayrounded:Number;

        public var videobuttonspacing:Number;

        public var videobuttonobjcolor:uint;

        public var fsvar:Boolean;

        public var videoseekfontantialiasing:String;

        public var videoplayerheight:Number;

        public var youtubemode:String;

        public var videocontrolshidetime:Number;

        public var videobuttonborderspacing:Number;

        public var videotooltipfontcolor:uint;

        public var videoseekfontsize:Number;

        public var videointerfacebgalpha:Number;

        public var videointerfacebgcolor:uint;

        public var videoseekfontcolor:uint;

        public var videomoveup:String;

        public var videop:Object;

        public var videobuttonbottomspacing:Number;

        public var videointerfaceupdate:Number;

        public var videointerfaceoverlay:String;

        public var videobarbuffercolor:uint;

        public var videocontrolsanimationdelays:Number;

        public var videobarbgcolor:uint;

        public var videopreviewimage:String;

        public var videovolumewidth:Number;

        public var xmlLoader:flash.net.URLLoader;

        public var fontused:String;

        public var videoloop:String;

        public var videobuttonrounded:Number;

        public var videostartvolume:Number;

        public var videotooltipbgrounded:Number;

        public var videobarcolor:uint;

        public var videobarareaheight:Number;

        public var playerx:Number;

        public var playery:Number;

        public var fsvar_stage:Boolean;

        public var videobigplaybgalpha:Number;

        public var videobigplaybgcolor:uint;

        public var videobuffertime:Number;

        public var videobuttonalphahover:String;

        public var videobigplaysize:Number;

        public var videoautoplay:String;

        public var videobarheight:Number;

        public var videovolumebarbgcolor:uint;

        public var videobuttonsize:Number;

        public var videolink:String;

        public var videotooltipfontsize:Number;
    }
}
