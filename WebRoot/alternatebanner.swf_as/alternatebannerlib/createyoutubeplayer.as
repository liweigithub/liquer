package alternatebannerlib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.system.*;
    import flash.text.*;
    import flash.utils.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createyoutubeplayer extends flash.display.MovieClip
    {
        public function createyoutubeplayer(arg1:flash.display.Stage, arg2:flash.display.MovieClip, arg3:flash.display.MovieClip, arg4:Object, arg5:String, arg6:String, arg7:Number, arg8:Number, arg9:String, arg10:String, arg11:Number)
        {
            this.videoavailablequality = new Array();
            this.lowQualityArray = new Array();
            this.playercontainer = new flash.display.MovieClip();
            this.video = new flash.display.MovieClip();
            this.loader = new flash.display.Loader();
            this.imageLoader = new flash.display.Loader();
            this.imageLoaderContext = new flash.system.LoaderContext(true);
            this.previewimage = new flash.display.MovieClip();
            this.mc_play = new flash.display.MovieClip();
            this.mc_pause = new flash.display.MovieClip();
            this.mc_seek = new flash.display.MovieClip();
            this.mc_volume = new flash.display.MovieClip();
            this.mc_hd = new flash.display.MovieClip();
            this.mc_seekbg = new flash.display.MovieClip();
            this.mc_seekbuffer = new flash.display.MovieClip();
            this.mc_seekbar = new flash.display.MovieClip();
            this.mc_volumebg = new flash.display.MovieClip();
            this.mc_volumebar = new flash.display.MovieClip();
            this.mc_interfacebg = new flash.display.MovieClip();
            this.bigplay = new flash.display.MovieClip();
            this.tooltip = new flash.display.MovieClip();
            this.icon_play = new video_play2();
            this.icon_pause = new video_pause2();
            this.icon_volume = new video_volume2();
            this.icon_hd = new video_hd();
            this.icon_play_ct = this.icon_play.transform.colorTransform;
            this.icon_pause_ct = this.icon_pause.transform.colorTransform;
            this.icon_volume_ct = this.icon_volume.transform.colorTransform;
            this.icon_hd_ct = this.icon_hd.transform.colorTransform;
            this.playermask = new flash.display.Sprite();
            this.bgblock = new flash.display.Sprite();
            this.interface_play = new flash.display.Sprite();
            this.interface_pause = new flash.display.Sprite();
            this.interface_seek = new flash.display.Sprite();
            this.interface_volume = new flash.display.Sprite();
            this.interface_hd = new flash.display.Sprite();
            this.interface_bg = new flash.display.Sprite();
            this.interface_seekbg = new flash.display.Sprite();
            this.interface_seekarea = new flash.display.Sprite();
            this.interface_seekbuffer = new flash.display.Sprite();
            this.interface_seekbar = new flash.display.Sprite();
            this.interface_volumebg = new flash.display.Sprite();
            this.interface_volumearea = new flash.display.Sprite();
            this.interface_volumebar = new flash.display.Sprite();
            this.bigplaybtn = new flash.display.Sprite();
            this.tooltipbg = new flash.display.Sprite();
            this.tooltiparrow = new flash.display.Shape();
            this.bigplayicon = new flash.display.Shape();
            this.tformat = new flash.text.TextFormat();
            this.tooltipformat = new flash.text.TextFormat();
            this.txt = new flash.text.TextField();
            this.tooltiptxt = new flash.text.TextField();
            this.preshape = new flash.display.Sprite();
            this.preloadermc = new flash.display.MovieClip();
            super();
            this._stage = arg1;
            this._root = arg2;
            this._banner = arg3;
            this._playerobj = arg4;
            this._videolink = arg5;
            this._previewimagelink = arg6;
            this._widthvar = arg7;
            this._heightvar = arg8;
            this._autoplay = arg9;
            this._loop = arg10;
            this._startvolume = arg11;
            flash.system.Security.allowDomain("www.youtube.com");
            flash.system.Security.allowDomain("youtube.com");
            flash.system.Security.allowDomain("s.ytimg.com");
            flash.system.Security.allowDomain("i.ytimg.com");
            this.volumesave = this._startvolume;
            this.bgblock.graphics.beginFill(0);
            this.bgblock.graphics.drawRect(0, 0, this._widthvar, this._heightvar);
            this.bgblock.graphics.endFill();
            this.bgblock.alpha = 1;
            this.bgblock.mouseEnabled = true;
            this.addChild(this.bgblock);
            this.addChild(this.playercontainer);
            this.playercontainer.addChild(this.video);
            this.previewimage.mouseEnabled = false;
            this.playercontainer.addChild(this.previewimage);
            this.playermask.graphics.beginFill(16777215);
            this.playermask.graphics.drawRect(0, 0, this._widthvar, this._heightvar);
            this.playermask.graphics.endFill();
            this.playermask.alpha = 0;
            this.playermask.mouseEnabled = false;
            this.playercontainer.mask = this.playermask;
            this.addChild(this.playermask);
            this.preshape.graphics.beginFill(this._root.preloadercolor);
            this.preshape.graphics.drawRect(0, 0, 10, 10);
            this.preshape.graphics.endFill();
            this.preshape.mouseEnabled = false;
            this.preshape.alpha = this._root.preloaderopacity;
            this.preloadermc.addChild(this.preshape);
            this.preloadermc.width = 0;
            this.preloadermc.height = this._root.preloaderheight;
            this.preloadermc.alpha = 0;
            this._root.addChild(this.preloadermc);
            this.loadImage();
            return;
        }

        internal function playerFull():void
        {
            if (this._root.videomoveup == "true") 
            {
                if (this.player_t != null) 
                {
                    this.player_t.stop();
                    this.player_t = null;
                }
                this.player_t = org.libspark.betweenas3.BetweenAS3.to(this.player, {"y":0}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.player_t.play();
            }
            return;
        }

        internal function onPlayerReady(arg1:flash.events.Event):void
        {
            this.player = this.loader.content;
            if (this._root.bannerdata_array[this._banner.currentslideid]["videointerfaceoverlay"] != "true") 
            {
                this.player.setSize(this._widthvar, this._heightvar - this._root.videobuttonsize - this._root.videobuttonbottomspacing * 2);
            }
            else 
            {
                this.player.setSize(this._widthvar, this._heightvar);
            }
            this.player.buttonMode = true;
            this.player.useHandCursor = true;
            this.initInterface();
            if (this._autoplay != "false") 
            {
                this.mc_pause.visible = true;
                this.loadVideo();
            }
            else 
            {
                this.mc_play.visible = true;
            }
            var loc1:*;
            this.mc_interfacebg.visible = loc1 = true;
            this.mc_hd.visible = loc1 = loc1;
            this.mc_volume.visible = loc1 = loc1;
            this.mc_seek.visible = loc1;
            flash.utils.setTimeout(this.interfaceFadeIn, 500);
            if (this._root.bannerdata_array[this._banner.currentslideid]["videocontrolshidetime"] != 0) 
            {
                this.addInterfaceTimer();
            }
            this.addSeekTooltip();
            this.addUpdateTimer();
            this.addButtonEventListeners();
            return;
        }

        internal function initInterface():void
        {
            var loc3:*;
            this.mc_interfacebg.visible = loc3 = false;
            this.mc_hd.visible = loc3 = loc3;
            this.mc_volume.visible = loc3 = loc3;
            this.mc_seek.visible = loc3 = loc3;
            this.mc_pause.visible = loc3 = loc3;
            this.mc_play.visible = loc3;
            this.seekbarwidth = Math.round(this._widthvar - 3 * this._root.videobuttonspacing - 2 * this._root.videobuttonborderspacing - 2 * this._root.videobuttonsize - this._root.videovolumewidth);
            this.interfaceyposup = this._heightvar - this._root.videobuttonsize - this._root.videobuttonbottomspacing;
            this.interfaceypos = this._heightvar;
            this.interface_bg.graphics.beginFill(this._root.videointerfacebgcolor);
            this.interface_bg.graphics.drawRect(0, 0, 1, this._root.videobuttonsize + this._root.videobuttonbottomspacing * 2);
            this.interface_bg.graphics.endFill();
            this.interface_bg.alpha = this._root.videointerfacebgalpha;
            this.interface_bg.mouseEnabled = false;
            this.interface_play.graphics.beginFill(this._root.videobuttonbgcolor);
            if (this._root.videobuttonrounded > 0) 
            {
                this.interface_play.graphics.drawRoundRect(0, 0, this._root.videobuttonsize, this._root.videobuttonsize, this._root.videobuttonrounded, this._root.videobuttonrounded);
            }
            else 
            {
                this.interface_play.graphics.drawRect(0, 0, this._root.videobuttonsize, this._root.videobuttonsize);
            }
            this.interface_play.graphics.endFill();
            this.interface_play.mouseEnabled = false;
            this.interface_pause.graphics.beginFill(this._root.videobuttonbgcolor);
            if (this._root.videobuttonrounded > 0) 
            {
                this.interface_pause.graphics.drawRoundRect(0, 0, this._root.videobuttonsize, this._root.videobuttonsize, this._root.videobuttonrounded, this._root.videobuttonrounded);
            }
            else 
            {
                this.interface_pause.graphics.drawRect(0, 0, this._root.videobuttonsize, this._root.videobuttonsize);
            }
            this.interface_pause.graphics.endFill();
            this.interface_pause.mouseEnabled = false;
            this.interface_seek.graphics.beginFill(this._root.videobuttonbgcolor);
            if (this._root.videobuttonrounded > 0) 
            {
                this.interface_seek.graphics.drawRoundRect(0, 0, this.seekbarwidth, this._root.videobuttonsize, this._root.videobuttonrounded, this._root.videobuttonrounded);
            }
            else 
            {
                this.interface_seek.graphics.drawRect(0, 0, this.seekbarwidth, this._root.videobuttonsize);
            }
            this.interface_seek.graphics.endFill();
            this.interface_seek.mouseEnabled = false;
            this.interface_volume.graphics.beginFill(this._root.videobuttonbgcolor);
            if (this._root.videobuttonrounded > 0) 
            {
                this.interface_volume.graphics.drawRoundRect(0, 0, this._root.videovolumewidth, this._root.videobuttonsize, this._root.videobuttonrounded, this._root.videobuttonrounded);
            }
            else 
            {
                this.interface_volume.graphics.drawRect(0, 0, this._root.videovolumewidth, this._root.videobuttonsize);
            }
            this.interface_volume.graphics.endFill();
            this.interface_volume.mouseEnabled = false;
            this.interface_hd.graphics.beginFill(this._root.videobuttonbgcolor);
            if (this._root.videobuttonrounded > 0) 
            {
                this.interface_hd.graphics.drawRoundRect(0, 0, this._root.videobuttonsize, this._root.videobuttonsize, this._root.videobuttonrounded, this._root.videobuttonrounded);
            }
            else 
            {
                this.interface_hd.graphics.drawRect(0, 0, this._root.videobuttonsize, this._root.videobuttonsize);
            }
            this.interface_hd.graphics.endFill();
            this.interface_hd.mouseEnabled = false;
            if (this._root.videobuttonalphahover != "false") 
            {
                this.interface_hd.alpha = loc3 = 1;
                this.interface_volume.alpha = loc3 = loc3;
                this.interface_seek.alpha = loc3 = loc3;
                this.interface_pause.alpha = loc3 = loc3;
                this.interface_play.alpha = loc3;
            }
            else 
            {
                this.interface_hd.alpha = loc3 = this._root.videobuttonbgalpha;
                this.interface_volume.alpha = loc3 = loc3;
                this.interface_seek.alpha = loc3 = loc3;
                this.interface_pause.alpha = loc3 = loc3;
                this.interface_play.alpha = loc3;
            }
            this.mc_play.x = this._root.videobuttonborderspacing;
            this.mc_pause.x = this._root.videobuttonborderspacing;
            this.mc_seek.x = this._root.videobuttonsize + this._root.videobuttonspacing + this._root.videobuttonborderspacing;
            this.mc_volume.x = this._root.videobuttonsize + this._root.videobuttonspacing * 2 + this._root.videobuttonborderspacing + this.seekbarwidth;
            this.mc_hd.x = this._root.videovolumewidth + this._root.videobuttonsize + this._root.videobuttonspacing * 3 + this._root.videobuttonborderspacing + this.seekbarwidth;
            this.mc_hd.y = loc3 = this.interfaceypos;
            this.mc_volume.y = loc3 = loc3;
            this.mc_seek.y = loc3 = loc3;
            this.mc_pause.y = loc3 = loc3;
            this.mc_play.y = loc3;
            this.mc_interfacebg.x = 0;
            this.interfacebgyposup = this._heightvar - this._root.videobuttonsize - this._root.videobuttonbottomspacing * 2;
            this.mc_interfacebg.y = this.interfacebgyposup;
            this.mc_interfacebg.alpha = 0;
            this.mc_play.addChild(this.interface_play);
            this.mc_pause.addChild(this.interface_pause);
            this.mc_seek.addChild(this.interface_seek);
            this.mc_volume.addChild(this.interface_volume);
            this.mc_hd.addChild(this.interface_hd);
            this.mc_interfacebg.addChild(this.interface_bg);
            if (this._root.videobuttonrounded > 0) 
            {
                this.interface_seek.scale9Grid = new flash.geom.Rectangle(this._root.videobuttonrounded, this._root.videobuttonrounded, this.seekbarwidth - this._root.videobuttonrounded * 2, this._root.videobuttonsize - this._root.videobuttonrounded * 2);
            }
            this.icon_play.x = Math.round(this._root.videobuttonsize / 2 - this.icon_play.width / 2);
            this.icon_pause.x = Math.round(this._root.videobuttonsize / 2 - this.icon_pause.width / 2);
            this.icon_volume.x = Math.round(this._root.videobuttonsize / 2 - this.icon_volume.width / 2);
            this.icon_hd.x = Math.round(this._root.videobuttonsize / 2 - this.icon_hd.width / 2);
            this.icon_play.y = Math.round(this._root.videobuttonsize / 2 - this.icon_play.height / 2);
            this.icon_pause.y = Math.round(this._root.videobuttonsize / 2 - this.icon_pause.height / 2);
            this.icon_volume.y = Math.round(this._root.videobuttonsize / 2 - this.icon_volume.height / 2);
            this.icon_hd.y = Math.round(this._root.videobuttonsize / 2 - this.icon_hd.height / 2);
            this.icon_hd_ct.color = loc3 = this._root.videobuttonobjcolor;
            this.icon_volume_ct.color = loc3 = loc3;
            this.icon_pause_ct.color = loc3 = loc3;
            this.icon_play_ct.color = loc3;
            this.icon_play.transform.colorTransform = this.icon_play_ct;
            this.icon_pause.transform.colorTransform = this.icon_pause_ct;
            this.icon_volume.transform.colorTransform = this.icon_volume_ct;
            this.icon_hd.transform.colorTransform = this.icon_hd_ct;
            this.mc_play.addChild(this.icon_play);
            this.mc_pause.addChild(this.icon_pause);
            this.mc_volume.addChild(this.icon_volume);
            this.icon_hd.alpha = 0.25;
            this.mc_hd.addChild(this.icon_hd);
            this.interface_seekbg.graphics.beginFill(this._root.videobarbgcolor);
            this.interface_seekbg.graphics.drawRect(0, 0, 1, this._root.videobarheight);
            this.interface_seekbg.graphics.endFill();
            this.interface_seekbuffer.mouseEnabled = false;
            this.interface_seekarea.graphics.beginFill(this._root.videobarbgcolor);
            this.interface_seekarea.graphics.drawRect(0, 0, 1, this._root.videobarareaheight);
            this.interface_seekarea.graphics.endFill();
            this.interface_seekarea.y = -Math.round(this._root.videobarareaheight / 2);
            this.interface_seekarea.alpha = 0;
            this.interface_seekbuffer.graphics.beginFill(this._root.videobarbuffercolor);
            this.interface_seekbuffer.graphics.drawRect(0, 0, 1, this._root.videobarheight);
            this.interface_seekbuffer.graphics.endFill();
            this.interface_seekbuffer.mouseEnabled = false;
            this.interface_seekbar.graphics.beginFill(this._root.videobarcolor);
            this.interface_seekbar.graphics.drawRect(0, 0, 1, this._root.videobarheight);
            this.interface_seekbar.graphics.endFill();
            this.interface_seekbar.mouseEnabled = false;
            this.interface_volumebg.graphics.beginFill(this._root.videovolumebarbgcolor);
            this.interface_volumebg.graphics.drawRect(0, 0, 1, this._root.videobarheight);
            this.interface_volumebg.graphics.endFill();
            this.interface_volumebg.mouseEnabled = false;
            this.interface_volumearea.graphics.beginFill(this._root.videobarbgcolor);
            this.interface_volumearea.graphics.drawRect(0, 0, 1, this._root.videobarareaheight);
            this.interface_volumearea.graphics.endFill();
            this.interface_volumearea.y = -Math.round(this._root.videobarareaheight / 2);
            this.interface_volumearea.alpha = 0;
            this.interface_volumebar.graphics.beginFill(this._root.videobarcolor);
            this.interface_volumebar.graphics.drawRect(0, 0, 1, this._root.videobarheight);
            this.interface_volumebar.graphics.endFill();
            this.interface_volumebar.mouseEnabled = false;
            this.tformat.font = this._root.fontused;
            this.tformat.color = this._root.videoseekfontcolor;
            this.tformat.size = this._root.videoseekfontsize;
            this.txt.embedFonts = false;
            this.txt.selectable = false;
            if (this._root.videoseekfontantialiasing == "true") 
            {
                this.txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            }
            this.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.txt.gridFitType = flash.text.GridFitType.PIXEL;
            this.txt.text = "00:00 | 00:00";
            this.txt.setTextFormat(this.tformat);
            this.txt.x = Math.round(this.seekbarwidth - this.txt.width) - 10;
            this.txt.y = (Math.round(this._root.videobuttonsize / 2 - this.txt.height / 2) - 1);
            this.txt.mouseEnabled = false;
            this.mc_seekbg.addChild(this.interface_seekbg);
            this.mc_seekbg.addChild(this.interface_seekarea);
            this.mc_seekbuffer.addChild(this.interface_seekbuffer);
            this.mc_seekbar.addChild(this.interface_seekbar);
            this.mc_volumebg.addChild(this.interface_volumebg);
            this.mc_volumebg.addChild(this.interface_volumearea);
            this.mc_volumebar.addChild(this.interface_volumebar);
            this.mc_seekbar.mouseEnabled = false;
            this.mc_seekbuffer.mouseEnabled = false;
            this.mc_volumebar.mouseEnabled = false;
            this.mc_seekbg.mouseEnabled = true;
            this.mc_volumebg.mouseEnabled = true;
            this.mc_seekbg.buttonMode = true;
            this.mc_volumebg.buttonMode = true;
            this.mc_seekbuffer.x = loc3 = 10;
            this.mc_seekbar.x = loc3 = loc3;
            this.mc_seekbg.x = loc3;
            this.mc_seekbuffer.y = loc3 = Math.round(this._root.videobuttonsize / 2 - this.mc_seekbar.height / 2);
            this.mc_seekbar.y = loc3 = loc3;
            this.mc_seekbg.y = loc3;
            this.mc_volumebar.x = loc3 = 25;
            this.mc_volumebg.x = loc3;
            this.mc_volumebar.y = loc3 = Math.round(this._root.videobuttonsize / 2 - this.mc_volumebar.height / 2);
            this.mc_volumebg.y = loc3;
            this.mc_seekbg.width = this.seekbarwidth - Math.round(this.txt.width) - 30;
            this.mc_volumebg.width = this._root.videovolumewidth - 35;
            this.mc_volumebar.width = Math.round(this.mc_volumebg.width * this.volumesave / 100);
            this.mc_interfacebg.width = this._widthvar;
            this.mc_seek.addChild(this.mc_seekbg);
            this.mc_seek.addChild(this.mc_seekbuffer);
            this.mc_seek.addChild(this.mc_seekbar);
            this.mc_seek.addChild(this.txt);
            this.mc_volume.addChild(this.mc_volumebg);
            this.mc_volume.addChild(this.mc_volumebar);
            this.bigplay.alpha = 0;
            var loc1:*=Math.round(this._root.videobigplaysize / 3);
            var loc2:*=Math.round(this._root.videobigplaysize / 6);
            this.bigplayicon.graphics.beginFill(this._root.videobigplayarrowcolor);
            this.bigplayicon.graphics.moveTo(loc2, 0);
            this.bigplayicon.graphics.lineTo(loc1, loc1);
            this.bigplayicon.graphics.lineTo(0, loc1);
            this.bigplayicon.graphics.lineTo(loc2, 0);
            this.bigplayicon.alpha = 1;
            this.bigplayicon.height = Math.round(this._root.videobigplaysize / 4);
            this.bigplayicon.y = Math.round(this._root.videobigplaysize / 3);
            this.bigplayicon.x = Math.round(this._root.videobigplaysize / 2 + this.bigplayicon.height / 2);
            this.bigplayicon.rotation = 90;
            this.bigplaybtn.graphics.beginFill(this._root.videobigplaybgcolor);
            this.bigplaybtn.graphics.drawRoundRect(0, 0, this._root.videobigplaysize, this._root.videobigplaysize, this._root.videobigplayrounded, this._root.videobigplayrounded);
            this.bigplaybtn.graphics.endFill();
            this.bigplaybtn.mouseEnabled = false;
            this.bigplaybtn.alpha = 1;
            this.bigplay.addChild(this.bigplaybtn);
            this.bigplay.addChild(this.bigplayicon);
            this.bigplay.x = Math.round(this._widthvar / 2 - this.bigplay.width / 2);
            this.bigplay.y = Math.round(this._heightvar / 2 - this.bigplay.height / 2);
            this.bigplay.mouseEnabled = false;
            this.playercontainer.addChild(this.bigplay);
            this.mc_play.buttonMode = true;
            this.mc_pause.buttonMode = true;
            this.icon_volume.buttonMode = true;
            this.playercontainer.addChild(this.mc_interfacebg);
            this.playercontainer.addChild(this.mc_play);
            this.playercontainer.addChild(this.mc_pause);
            this.playercontainer.addChild(this.mc_seek);
            this.playercontainer.addChild(this.mc_volume);
            this.playercontainer.addChild(this.mc_hd);
            if (this._autoplay != "true") 
            {
                this.mc_pause.visible = false;
                this.pausevar = true;
            }
            else 
            {
                this.mc_play.visible = false;
                this.pausevar = false;
            }
            return;
        }

        internal function bigplayFadeOut():void
        {
            if (this.bigplay_t != null) 
            {
                this.bigplay_t.stop();
            }
            this.bigplay_t = org.libspark.betweenas3.BetweenAS3.to(this.bigplay, {"alpha":0}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
            this.bigplay_t.play();
            return;
        }

        internal function scrubStop():void
        {
            if (this.mc_volumebar.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                this.volumescrub = false;
                this.mc_volumebar.removeEventListener(flash.events.Event.ENTER_FRAME, this.volumeScrubFunctionFrame);
            }
            if (this.mc_seekbar.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                if (!this.pausevar) 
                {
                    this.player.playVideo();
                }
                this.mc_seekbar.removeEventListener(flash.events.Event.ENTER_FRAME, this.seekScrubFunctionFrame);
                this.seekscrub = false;
                this.mc_seekbar.width = Math.round(this.mc_seek.mouseX - this.mc_seekbar.x);
                this.seekvalue = Math.round(this.mc_seekbar.width * this.videoduration / this.mc_seekbg.width);
                this.player.seekTo(this.seekvalue, true);
                if (this.videoinit && this.pausevar && this.videoended) 
                {
                    this.mc_play.visible = false;
                    this.mc_pause.visible = true;
                    this.pausevar = false;
                    this.imageFadeOut();
                    this.bigplayFadeOut();
                    this.videoFadeIn();
                    this.player.playVideo();
                }
            }
            return;
        }

        internal function hideTooltip(arg1:flash.events.MouseEvent):void
        {
            if (this.videoinit) 
            {
                if (this.tooltip.hasEventListener(flash.events.Event.ENTER_FRAME)) 
                {
                    this.tooltip.removeEventListener(flash.events.Event.ENTER_FRAME, this.tooltipScrub);
                    if (this.tooltip_t != null) 
                    {
                        this.tooltip_t.stop();
                    }
                    this.tooltip_t = org.libspark.betweenas3.BetweenAS3.to(this.tooltip, {"alpha":0}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                    this.tooltip_t.play();
                }
            }
            return;
        }

        internal function mc_hd_outf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_hd_over != null) 
            {
                this.mc_hd_over.stop();
            }
            if (this._root.videobuttonalphahover != "false") 
            {
                this.mc_hd_out = org.libspark.betweenas3.BetweenAS3.to(this.interface_hd, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            else 
            {
                this.mc_hd_out = org.libspark.betweenas3.BetweenAS3.to(this.interface_hd, {"alpha":this._root.videobuttonbgalpha}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            this.mc_hd_out.play();
            return;
        }

        internal function imageLoadingDone(arg1:flash.events.Event):void
        {
            if (this.preloaderfade_t != null) 
            {
                this.preloaderfade_t.stop();
            }
            this.preloaderfade_t = org.libspark.betweenas3.BetweenAS3.to(this.preloadermc, {"alpha":0}, 1, org.libspark.betweenas3.easing.Expo.easeIn);
            this.preloaderfade_t.onComplete = this.deletePreloader;
            this.preloaderfade_t.play();
            this.imageLoader.contentLoaderInfo.removeEventListener(flash.events.ProgressEvent.PROGRESS, this.loadProgress);
            this.imageLoader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone);
            this.playercontainer.alpha = 1;
            this.previewimage.alpha = 0;
            var loc1:*=new flash.display.BitmapData(this.imageLoader.content.width, this.imageLoader.content.height);
            loc1.draw(this.imageLoader.content);
            var loc2:*=new flash.display.Bitmap(loc1, "auto", true);
            this.previewimage.addChild(loc2);
            this.previewimage.width = this._widthvar;
            this.previewimage.height = this._heightvar;
            this.previewimage.x = this.video.x;
            this.previewimage.y = this.video.y;
            if (this._autoplay == "false") 
            {
                this.imageFadeIn();
                this.bigplayFadeIn();
            }
            this.loadPlayer();
            return;
        }

        internal function addUpdateTimer():void
        {
            this.updatetimer = new flash.utils.Timer(this._root.videointerfaceupdate);
            this.updatetimer.addEventListener(flash.events.TimerEvent.TIMER, this.updateFunction, false, 0, true);
            this.updatetimer.start();
            return;
        }

        internal function pressPlay():void
        {
            this.bigplayFadeOut();
            if (this._autoplay == "false" && !this.videoinit) 
            {
                this.loadVideo();
            }
            else if (this.pausevar) 
            {
                this.mc_play.visible = false;
                this.mc_pause.visible = true;
                this.pausevar = false;
                this.player.playVideo();
                this.imageFadeOut();
                this.videoFadeIn();
            }
            return;
        }

        internal function onLoaderInit(arg1:flash.events.Event):void
        {
            this.loadedvar = true;
            this.video.addChild(this.loader);
            this.loader.content.addEventListener("onReady", this.onPlayerReady, false, 0, true);
            this.loader.content.addEventListener("onStateChange", this.onPlayerStateChange, false, 0, true);
            return;
        }

        internal function mc_play_clickf(arg1:flash.events.MouseEvent):void
        {
            this.pressPlay();
            return;
        }

        internal function checkMouse(arg1:flash.events.Event):void
        {
            if (this.mc_interfacebg.hitTestPoint(this._stage.mouseX, this._stage.mouseY, false)) 
            {
                if (this.interfacetimer != null) 
                {
                    if (this.interfacetimer.hasEventListener(flash.events.TimerEvent.TIMER_COMPLETE)) 
                    {
                        this.interfacetimer.removeEventListener(flash.events.TimerEvent.TIMER_COMPLETE, this.moveOut);
                    }
                    this.interfacetimer.stop();
                    this.interfacetimer = null;
                }
            }
            else if (this.interfacetimer == null) 
            {
                this.addInterfaceTimer();
            }
            return;
        }

        internal function deactivateHD():void
        {
            this.player.setPlaybackQuality(this.lowQuality);
            this.videohdmode = false;
            this.icon_hd_ct.color = this._root.videobuttonobjcolor;
            this.icon_hd.transform.colorTransform = this.icon_hd_ct;
            return;
        }

        internal function addSeekTooltip():void
        {
            var loc1:*=5;
            this.tooltipformat.font = this._root.fontused;
            this.tooltipformat.indent = loc1;
            this.tooltipformat.color = this._root.videotooltipfontcolor;
            this.tooltipformat.size = this._root.videotooltipfontsize;
            this.tooltiptxt.multiline = false;
            this.tooltiptxt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.tooltiptxt.embedFonts = true;
            this.tooltiptxt.selectable = false;
            if (this._root.videoseekfontantialiasing == "true") 
            {
                this.tooltiptxt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            }
            this.tooltiptxt.text = "00:00";
            this.tooltiptxt.setTextFormat(this.tooltipformat);
            this.tooltiptxt.x = Math.round(-this.tooltiptxt.width / 2 - loc1 / 2);
            this.tooltiptxt.y = -Math.round(this.tooltiptxt.height / 2);
            this.tooltiptxt.mouseEnabled = false;
            this.tooltipbg.graphics.beginFill(this._root.videotooltipbgcolor);
            this.tooltipbg.graphics.drawRoundRect(-Math.round((this.tooltiptxt.width + loc1) / 2), -Math.round((this.tooltiptxt.height + loc1) / 2), Math.round(this.tooltiptxt.width + loc1), Math.round(this.tooltiptxt.height + loc1), this._root.videotooltipbgrounded, this._root.videotooltipbgrounded);
            this.tooltipbg.graphics.endFill();
            this.tooltipbg.alpha = this._root.videotooltipbgalpha;
            this.tooltipbg.mouseEnabled = false;
            var loc2:*=10;
            var loc3:*=5;
            this.tooltiparrow.graphics.beginFill(this._root.videotooltipbgcolor);
            this.tooltiparrow.graphics.moveTo(loc3, 0);
            this.tooltiparrow.graphics.lineTo(loc2, loc2);
            this.tooltiparrow.graphics.lineTo(0, loc2);
            this.tooltiparrow.graphics.lineTo(loc3, 0);
            this.tooltiparrow.alpha = this._root.videotooltipbgalpha;
            this.tooltiparrow.height = 8;
            this.tooltiparrow.y = Math.round(this.tooltipbg.height - this.tooltiparrow.height / 2);
            this.tooltiparrow.x = Math.round(this.tooltiparrow.width / 2);
            this.tooltiparrow.rotation = 180;
            this.tooltip.mouseEnabled = false;
            this.tooltip.addChild(this.tooltipbg);
            this.tooltip.addChild(this.tooltiparrow);
            this.tooltip.addChild(this.tooltiptxt);
            this.tooltip.alpha = 0;
            this.tooltip.y = this.interfaceyposup - Math.round(this.tooltipbg.height / 2) - 8;
            this.playercontainer.addChild(this.tooltip);
            return;
        }

        internal function loadImage():void
        {
            this.imageLoader.load(new flash.net.URLRequest(this._previewimagelink), this.imageLoaderContext);
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone, false, 0, true);
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.ProgressEvent.PROGRESS, this.loadProgress, false, 0, true);
            return;
        }

        internal function addButtonEventListeners():void
        {
            this.mc_play.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_play_overf, false, 0, true);
            this.mc_play.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_play_outf, false, 0, true);
            this.mc_play.addEventListener(flash.events.MouseEvent.CLICK, this.mc_play_clickf);
            this.mc_pause.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_pause_overf, false, 0, true);
            this.mc_pause.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_pause_outf, false, 0, true);
            this.mc_pause.addEventListener(flash.events.MouseEvent.CLICK, this.mc_pause_clickf);
            this.icon_volume.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_volume_overf, false, 0, true);
            this.icon_volume.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_volume_outf, false, 0, true);
            this.icon_volume.addEventListener(flash.events.MouseEvent.CLICK, this.mc_volume_clickf, false, 0, true);
            this.player.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.mouseRelease, false, 0, true);
            this._stage.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.mouseReleaseScrub, false, 0, true);
            this.player.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.moveIn, false, 0, true);
            this._stage.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.moveIn, false, 0, true);
            this._stage.addEventListener(flash.events.Event.MOUSE_LEAVE, this.mouseLeave, false, 0, true);
            this.mc_volumebg.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.volumeScrubFunction, false, 0, true);
            this.mc_seekbg.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.seekScrubFunction, false, 0, true);
            this.mc_seekbg.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.showTooltip, false, 0, true);
            this.mc_seekbg.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.hideTooltip, false, 0, true);
            return;
        }

        internal function bigplayFadeIn():void
        {
            if (this.bigplay_t != null) 
            {
                this.bigplay_t.stop();
            }
            this.bigplay_t = org.libspark.betweenas3.BetweenAS3.to(this.bigplay, {"alpha":this._root.videobigplaybgalpha}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
            this.bigplay_t.play();
            return;
        }

        internal function volumeScrubFunction(arg1:flash.events.MouseEvent):void
        {
            this.volumescrub = true;
            this.mute = false;
            this.icon_volume.alpha = 1;
            this.mc_volumebar.addEventListener(flash.events.Event.ENTER_FRAME, this.volumeScrubFunctionFrame, false, 0, true);
            return;
        }

        internal function deletePreloader():void
        {
            this._root.removeChild(this.preloadermc);
            return;
        }

        internal function mc_volume_overf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_volume_out != null) 
            {
                this.mc_volume_out.stop();
            }
            if (this._root.videobuttonalphahover != "false") 
            {
                this.mc_volume_over = org.libspark.betweenas3.BetweenAS3.to(this.interface_volume, {"alpha":this._root.videobuttonbgalpha}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            else 
            {
                this.mc_volume_over = org.libspark.betweenas3.BetweenAS3.to(this.interface_volume, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            this.mc_volume_over.play();
            return;
        }

        internal function addInterfaceTimer():void
        {
            if (this._root.bannerdata_array[this._banner.currentslideid]["videocontrolshidetime"] != 0) 
            {
                if (this.interfacetimer != null) 
                {
                    if (this.interfacetimer.hasEventListener(flash.events.TimerEvent.TIMER_COMPLETE)) 
                    {
                        this.interfacetimer.removeEventListener(flash.events.TimerEvent.TIMER_COMPLETE, this.moveOut);
                    }
                    this.interfacetimer.stop();
                    this.interfacetimer = null;
                }
                this.interfacetimer = new flash.utils.Timer(this._root.bannerdata_array[this._banner.currentslideid]["videocontrolshidetime"] * 1000, 1);
                this.interfacetimer.addEventListener(flash.events.TimerEvent.TIMER_COMPLETE, this.moveOut);
                this.interfacetimer.start();
            }
            return;
        }

        internal function moveIn(arg1:flash.events.MouseEvent):void
        {
            if (!this.video.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                this.video.addEventListener(flash.events.Event.ENTER_FRAME, this.checkMouse, false, 0, true);
            }
            if (this.ishow_t == null) 
            {
                this.interfaceFadeIn();
                this.addInterfaceTimer();
            }
            return;
        }

        internal function showTooltip(arg1:flash.events.MouseEvent):void
        {
            if (this.videoinit) 
            {
                if (!this.tooltip.hasEventListener(flash.events.Event.ENTER_FRAME)) 
                {
                    this.tooltip.addEventListener(flash.events.Event.ENTER_FRAME, this.tooltipScrub, false, 0, true);
                    if (this.tooltip_t != null) 
                    {
                        this.tooltip_t.stop();
                    }
                    this.tooltip_t = org.libspark.betweenas3.BetweenAS3.to(this.tooltip, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                    this.tooltip_t.play();
                }
            }
            return;
        }

        internal function volumeSet(arg1:Number):void
        {
            if (this.videoinit) 
            {
                this.player.setVolume(arg1);
            }
            return;
        }

        internal function timeFormat(arg1:int):String
        {
            var loc1:*=Math.round(arg1);
            var loc2:*=0;
            if (loc1 > 0) 
            {
                while (loc1 > 59) 
                {
                    ++loc2;
                    loc1 = loc1 - 60;
                }
                return String((loc2 < 10 ? "0" : "") + loc2 + ":" + (loc1 < 10 ? "0" : "") + loc1);
            }
            return "00:00";
        }

        internal function videoFadeOut():void
        {
            if (this.video_t != null) 
            {
                this.video_t.stop();
            }
            this.video_t = org.libspark.betweenas3.BetweenAS3.to(this.video, {"alpha":0}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            this.video_t.play();
            return;
        }

        internal function mc_pause_clickf(arg1:flash.events.MouseEvent):void
        {
            this.pressPause();
            return;
        }

        internal function playerShrink():void
        {
            if (this._root.videomoveup == "true") 
            {
                if (this.player_t != null) 
                {
                    this.player_t.stop();
                    this.player_t = null;
                }
                this.player_t = org.libspark.betweenas3.BetweenAS3.to(this.player, {"y":-this._root.videobuttonsize - this._root.videobuttonbottomspacing * 2}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.player_t.play();
            }
            return;
        }

        internal function seekScrubFunctionFrame(arg1:flash.events.Event):void
        {
            if (this.mc_seekbg.hitTestPoint(this._stage.mouseX, this._stage.mouseY, false)) 
            {
                this.mc_seekbar.width = Math.round(this.mc_seek.mouseX - this.mc_seekbar.x);
            }
            return;
        }

        internal function activateHD():void
        {
            this.player.setPlaybackQuality(this.highestQuality);
            this.videohdmode = true;
            this.icon_hd_ct.color = this._root.videobarcolor;
            this.icon_hd.transform.colorTransform = this.icon_hd_ct;
            return;
        }

        internal function mc_hd_clickf(arg1:flash.events.MouseEvent):void
        {
            if (this.videohdmode) 
            {
                this.deactivateHD();
            }
            else 
            {
                this.activateHD();
            }
            return;
        }

        internal function playPause(arg1:flash.events.MouseEvent):void
        {
            if (this.pausevar) 
            {
                this.pressPlay();
            }
            else 
            {
                this.pressPause();
            }
            return;
        }

        internal function mouseLeave(arg1:flash.events.Event):void
        {
            if (this.video.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                this.video.removeEventListener(flash.events.Event.ENTER_FRAME, this.checkMouse);
            }
            if (this.interfacetimer == null) 
            {
                this.addInterfaceTimer();
            }
            return;
        }

        internal function loadVideo():void
        {
            this.pausevar = false;
            this.mc_play.visible = false;
            this.mc_pause.visible = true;
            this.player.loadVideoById(this._videolink);
            return;
        }

        public function unLoad():void
        {
            if (this._stage.hasEventListener(flash.events.MouseEvent.MOUSE_UP)) 
            {
                this._stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.mouseReleaseScrub);
            }
            if (this.player.hasEventListener(flash.events.MouseEvent.MOUSE_UP)) 
            {
                this.player.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.mouseRelease);
            }
            if (this._stage.hasEventListener(flash.events.Event.MOUSE_LEAVE)) 
            {
                this._stage.removeEventListener(flash.events.Event.MOUSE_LEAVE, this.mouseLeave);
            }
            if (this._stage.hasEventListener(flash.events.MouseEvent.MOUSE_MOVE)) 
            {
                this._stage.removeEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.moveIn);
            }
            if (this.player.hasEventListener(flash.events.MouseEvent.MOUSE_MOVE)) 
            {
                this.player.removeEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.moveIn);
            }
            if (this.mc_play.hasEventListener(flash.events.MouseEvent.MOUSE_OVER)) 
            {
                this.mc_play.removeEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_play_overf);
            }
            if (this.mc_play.hasEventListener(flash.events.MouseEvent.MOUSE_OUT)) 
            {
                this.mc_play.removeEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_play_outf);
            }
            if (this.mc_play.hasEventListener(flash.events.MouseEvent.CLICK)) 
            {
                this.mc_play.removeEventListener(flash.events.MouseEvent.CLICK, this.mc_play_clickf);
            }
            if (this.mc_pause.hasEventListener(flash.events.MouseEvent.MOUSE_OVER)) 
            {
                this.mc_pause.removeEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_pause_overf);
            }
            if (this.mc_pause.hasEventListener(flash.events.MouseEvent.MOUSE_OUT)) 
            {
                this.mc_pause.removeEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_pause_outf);
            }
            if (this.mc_pause.hasEventListener(flash.events.MouseEvent.CLICK)) 
            {
                this.mc_pause.removeEventListener(flash.events.MouseEvent.CLICK, this.mc_pause_clickf);
            }
            if (this.mc_hd.hasEventListener(flash.events.MouseEvent.MOUSE_OVER)) 
            {
                this.mc_hd.removeEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_hd_overf);
            }
            if (this.mc_hd.hasEventListener(flash.events.MouseEvent.MOUSE_OUT)) 
            {
                this.mc_hd.removeEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_hd_outf);
            }
            if (this.mc_hd.hasEventListener(flash.events.MouseEvent.CLICK)) 
            {
                this.mc_hd.removeEventListener(flash.events.MouseEvent.CLICK, this.mc_hd_clickf);
            }
            if (this.icon_volume.hasEventListener(flash.events.MouseEvent.MOUSE_OVER)) 
            {
                this.icon_volume.removeEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_volume_overf);
            }
            if (this.icon_volume.hasEventListener(flash.events.MouseEvent.MOUSE_OUT)) 
            {
                this.icon_volume.removeEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_volume_outf);
            }
            if (this.icon_volume.hasEventListener(flash.events.MouseEvent.CLICK)) 
            {
                this.icon_volume.removeEventListener(flash.events.MouseEvent.CLICK, this.mc_volume_clickf);
            }
            if (this.mc_volumebg.hasEventListener(flash.events.MouseEvent.MOUSE_DOWN)) 
            {
                this.mc_volumebg.removeEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.volumeScrubFunction);
            }
            if (this.mc_seekbg.hasEventListener(flash.events.MouseEvent.MOUSE_DOWN)) 
            {
                this.mc_seekbg.removeEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.seekScrubFunction);
            }
            if (this.mc_seekbg.hasEventListener(flash.events.MouseEvent.MOUSE_OVER)) 
            {
                this.mc_seekbg.removeEventListener(flash.events.MouseEvent.MOUSE_OVER, this.showTooltip);
            }
            if (this.mc_seekbg.hasEventListener(flash.events.MouseEvent.MOUSE_OUT)) 
            {
                this.mc_seekbg.removeEventListener(flash.events.MouseEvent.MOUSE_OUT, this.hideTooltip);
            }
            if (this.mc_volumebar.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                this.mc_volumebar.removeEventListener(flash.events.Event.ENTER_FRAME, this.volumeScrubFunctionFrame);
            }
            if (this.mc_seekbar.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                this.mc_seekbar.removeEventListener(flash.events.Event.ENTER_FRAME, this.seekScrubFunctionFrame);
            }
            if (this._root.bannerdata_array[this._banner.currentslideid]["videocontrolshidetime"] != 0) 
            {
                if (this.interfacetimer.hasEventListener(flash.events.TimerEvent.TIMER_COMPLETE)) 
                {
                    this.interfacetimer.removeEventListener(flash.events.TimerEvent.TIMER_COMPLETE, this.moveOut);
                }
            }
            if (this.updatetimer.hasEventListener(flash.events.TimerEvent.TIMER)) 
            {
                this.updatetimer.removeEventListener(flash.events.TimerEvent.TIMER, this.updateFunction);
            }
            this.player.destroy();
            this.removeChild(this.playercontainer);
            this.removeChild(this.playermask);
            this._playerobj = null;
            return;
        }

        internal function videoFadeIn():void
        {
            if (this.video_t != null) 
            {
                this.video_t.stop();
            }
            this.video_t = org.libspark.betweenas3.BetweenAS3.to(this.video, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            this.video_t.play();
            return;
        }

        internal function checkVideoQuality():Boolean
        {
            this.videoquality = this.player.getPlaybackQuality();
            if (this.videoquality.search("hd") != -1) 
            {
                return true;
            }
            return false;
        }

        internal function checkAvailableVideoQuality():void
        {
            var loc1:*=0;
            this.videoavailablequality = this.player.getAvailableQualityLevels();
            this.highestQuality = this.videoavailablequality[0];
            if (this.highestQuality.search("hd") == -1) 
            {
                this.mc_hd.buttonMode = false;
                this.mc_hd.mouseEnabled = false;
            }
            else 
            {
                this.mc_hd.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_hd_overf, false, 0, true);
                this.mc_hd.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_hd_outf, false, 0, true);
                this.mc_hd.addEventListener(flash.events.MouseEvent.CLICK, this.mc_hd_clickf, false, 0, true);
                this.mc_hd.buttonMode = true;
                this.mc_hd.mouseEnabled = true;
                this.icon_hd.alpha = 1;
                this.videohdmode = false;
                loc1 = 0;
                while (loc1 < this.videoavailablequality.length) 
                {
                    if (this.videoavailablequality[loc1] != "large") 
                    {
                        if (this.videoavailablequality[loc1] != "medium") 
                        {
                            if (this.videoavailablequality[loc1] == "small") 
                            {
                                this.lowQualityArray.push(this.videoavailablequality[loc1]);
                            }
                        }
                        else 
                        {
                            this.lowQualityArray.push(this.videoavailablequality[loc1]);
                        }
                    }
                    else 
                    {
                        this.lowQualityArray.push(this.videoavailablequality[loc1]);
                    }
                    ++loc1;
                }
                if (this.lowQualityArray.length == 0) 
                {
                    this.lowQuality = "default";
                }
                else 
                {
                    this.lowQuality = this.lowQualityArray[0];
                }
            }
            return;
        }

        internal function volumeScrubFunctionFrame(arg1:flash.events.Event):void
        {
            if (this.mc_volumebg.hitTestPoint(this._stage.mouseX, this._stage.mouseY, false)) 
            {
                this.mc_volumebar.width = Math.round(this.mc_volume.mouseX - this.mc_volumebar.x);
            }
            return;
        }

        internal function imageFadeOut():void
        {
            if (this.previewimage_t != null) 
            {
                this.previewimage_t.stop();
            }
            this.previewimage_t = org.libspark.betweenas3.BetweenAS3.to(this.previewimage, {"alpha":0}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            this.previewimage_t.play();
            return;
        }

        internal function interfaceFadeIn():void
        {
            var loc1:*=null;
            var loc2:*=null;
            var loc3:*=null;
            var loc4:*=null;
            if (this._root.bannerdata_array[this._banner.currentslideid]["videocontrolsvisible"] != "false") 
            {
                this.mc_play_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_play, {"y":this.interfaceyposup}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.mc_pause_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_pause, {"y":this.interfaceyposup}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.mc_seek_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_seek, {"y":this.interfaceyposup}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.mc_volume_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_volume, {"y":this.interfaceyposup}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.mc_hd_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_hd, {"y":this.interfaceyposup}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.mc_interfacebg_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_interfacebg, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                loc1 = org.libspark.betweenas3.BetweenAS3.delay(this.mc_seek_t, this._root.videocontrolsanimationdelays);
                loc2 = org.libspark.betweenas3.BetweenAS3.delay(this.mc_volume_t, this._root.videocontrolsanimationdelays * 2);
                loc3 = org.libspark.betweenas3.BetweenAS3.delay(this.mc_hd_t, this._root.videocontrolsanimationdelays * 3);
                loc4 = org.libspark.betweenas3.BetweenAS3.delay(this.mc_interfacebg_t, this._root.videocontrolsanimationdelays);
                loc1.onComplete = this.playerShrink;
                if (this.ihide_t != null) 
                {
                    this.ihide_t.stop();
                    this.ihide_t = null;
                }
                if (this.ishow_t != null) 
                {
                    this.ishow_t.stop();
                    this.ishow_t = null;
                }
                this.ishow_t = org.libspark.betweenas3.BetweenAS3.parallel(this.mc_play_t, this.mc_pause_t, this.mc_seek_t, loc1, this.mc_volume_t, loc2, this.mc_hd_t, loc3, this.mc_interfacebg_t, loc4);
                this.ishow_t.play();
            }
            else 
            {
                var loc5:*;
                this.mc_hd.visible = loc5 = false;
                this.mc_volume.visible = loc5 = loc5;
                this.mc_seek.visible = loc5 = loc5;
                this.mc_pause.visible = loc5 = loc5;
                this.mc_play.visible = loc5 = loc5;
                this.mc_interfacebg.visible = loc5;
            }
            return;
        }

        public function pressPause():void
        {
            if (!this.pausevar) 
            {
                this.mc_play.visible = true;
                this.mc_pause.visible = false;
                this.pausevar = true;
                this.player.pauseVideo();
                this.bigplayFadeIn();
            }
            return;
        }

        internal function loadProgress(arg1:flash.events.ProgressEvent):void
        {
            var loc1:*=arg1.bytesLoaded / arg1.bytesTotal;
            if (this.preloader_t != null) 
            {
                this.preloader_t.stop();
            }
            this.preloader_t = org.libspark.betweenas3.BetweenAS3.to(this.preloadermc, {"alpha":1, "width":loc1 * this._root.bannerwidth}, 0.2, org.libspark.betweenas3.easing.Sine.easeOut);
            this.preloader_t.play();
            return;
        }

        internal function moveOut(arg1:flash.events.TimerEvent):void
        {
            this.interfaceFadeOut();
            return;
        }

        internal function mc_hd_overf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_hd_out != null) 
            {
                this.mc_hd_out.stop();
            }
            if (this._root.videobuttonalphahover != "false") 
            {
                this.mc_hd_over = org.libspark.betweenas3.BetweenAS3.to(this.interface_hd, {"alpha":this._root.videobuttonbgalpha}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            else 
            {
                this.mc_hd_over = org.libspark.betweenas3.BetweenAS3.to(this.interface_hd, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            this.mc_hd_over.play();
            return;
        }

        internal function mc_pause_overf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_pause_out != null) 
            {
                this.mc_pause_out.stop();
            }
            if (this._root.videobuttonalphahover != "false") 
            {
                this.mc_pause_over = org.libspark.betweenas3.BetweenAS3.to(this.interface_pause, {"alpha":this._root.videobuttonbgalpha}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            else 
            {
                this.mc_pause_over = org.libspark.betweenas3.BetweenAS3.to(this.interface_pause, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            this.mc_pause_over.play();
            return;
        }

        internal function mc_play_outf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_play_over != null) 
            {
                this.mc_play_over.stop();
            }
            if (this._root.videobuttonalphahover != "false") 
            {
                this.mc_play_out = org.libspark.betweenas3.BetweenAS3.to(this.interface_play, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            else 
            {
                this.mc_play_out = org.libspark.betweenas3.BetweenAS3.to(this.interface_play, {"alpha":this._root.videobuttonbgalpha}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            this.mc_play_out.play();
            return;
        }

        internal function seekScrubFunction(arg1:flash.events.MouseEvent):void
        {
            if (this.videoinit) 
            {
                this.player.pauseVideo();
                this.seekscrub = true;
                this.mc_seekbar.addEventListener(flash.events.Event.ENTER_FRAME, this.seekScrubFunctionFrame, false, 0, true);
            }
            return;
        }

        internal function mc_play_overf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_play_out != null) 
            {
                this.mc_play_out.stop();
            }
            if (this._root.videobuttonalphahover != "false") 
            {
                this.mc_play_over = org.libspark.betweenas3.BetweenAS3.to(this.interface_play, {"alpha":this._root.videobuttonbgalpha}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            else 
            {
                this.mc_play_over = org.libspark.betweenas3.BetweenAS3.to(this.interface_play, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            this.mc_play_over.play();
            return;
        }

        internal function mouseRelease(arg1:flash.events.MouseEvent):void
        {
            if (!this.mc_interfacebg.hitTestPoint(this._stage.mouseX, this._stage.mouseY, false)) 
            {
                if (this.pausevar) 
                {
                    this.pressPlay();
                }
                else 
                {
                    this.pressPause();
                }
                this.scrubStop();
            }
            return;
        }

        internal function loadPlayer():void
        {
            this.loader.contentLoaderInfo.addEventListener(flash.events.Event.INIT, this.onLoaderInit, false, 0, true);
            this.loader.load(new flash.net.URLRequest("http://www.youtube.com/apiplayer?version=3"));
            return;
        }

        internal function interfaceFadeOut():void
        {
            this.mc_play_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_play, {"y":this.interfaceypos}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.mc_pause_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_pause, {"y":this.interfaceypos}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.mc_seek_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_seek, {"y":this.interfaceypos}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.mc_volume_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_volume, {"y":this.interfaceypos}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.mc_hd_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_hd, {"y":this.interfaceypos}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.mc_interfacebg_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_interfacebg, {"alpha":0}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            var loc1:*=org.libspark.betweenas3.BetweenAS3.delay(this.mc_play_t, this._root.videocontrolsanimationdelays * 5);
            var loc2:*=org.libspark.betweenas3.BetweenAS3.delay(this.mc_pause_t, this._root.videocontrolsanimationdelays * 5);
            var loc3:*=org.libspark.betweenas3.BetweenAS3.delay(this.mc_seek_t, this._root.videocontrolsanimationdelays * 4);
            var loc4:*=org.libspark.betweenas3.BetweenAS3.delay(this.mc_volume_t, this._root.videocontrolsanimationdelays * 3);
            var loc5:*=org.libspark.betweenas3.BetweenAS3.delay(this.mc_hd_t, this._root.videocontrolsanimationdelays * 2);
            var loc6:*=org.libspark.betweenas3.BetweenAS3.delay(this.mc_interfacebg_t, this._root.videocontrolsanimationdelays * 2);
            this.playerFull();
            if (this.ihide_t != null) 
            {
                this.ihide_t.stop();
                this.ihide_t = null;
            }
            if (this.ishow_t != null) 
            {
                this.ishow_t.stop();
                this.ishow_t = null;
            }
            this.ihide_t = org.libspark.betweenas3.BetweenAS3.parallel(this.mc_play_t, loc1, this.mc_pause_t, loc2, this.mc_seek_t, loc3, this.mc_volume_t, loc4, this.mc_hd_t, loc5, this.mc_interfacebg_t, loc6);
            this.ihide_t.play();
            return;
        }

        internal function mc_volume_outf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_volume_over != null) 
            {
                this.mc_volume_over.stop();
            }
            if (this._root.videobuttonalphahover != "false") 
            {
                this.mc_volume_out = org.libspark.betweenas3.BetweenAS3.to(this.interface_volume, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            else 
            {
                this.mc_volume_out = org.libspark.betweenas3.BetweenAS3.to(this.interface_volume, {"alpha":this._root.videobuttonbgalpha}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            this.mc_volume_out.play();
            return;
        }

        internal function mouseReleaseScrub(arg1:flash.events.MouseEvent):void
        {
            this.scrubStop();
            return;
        }

        internal function mc_pause_outf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_pause_over != null) 
            {
                this.mc_pause_over.stop();
            }
            if (this._root.videobuttonalphahover != "false") 
            {
                this.mc_pause_out = org.libspark.betweenas3.BetweenAS3.to(this.interface_pause, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            else 
            {
                this.mc_pause_out = org.libspark.betweenas3.BetweenAS3.to(this.interface_pause, {"alpha":this._root.videobuttonbgalpha}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            this.mc_pause_out.play();
            return;
        }

        internal function mc_volume_clickf(arg1:flash.events.MouseEvent):void
        {
            if (this.mute) 
            {
                this.mute = false;
                this.volumeSet(this.volumesave);
                this.mc_volumebar.width = Math.round(this.mc_volumebg.width * this.volumesave / 100);
                this.icon_volume.alpha = 1;
            }
            else 
            {
                this.mute = true;
                this.volumeSet(0);
                this.mc_volumebar.width = 0;
                this.icon_volume.alpha = this._root.videovolumemutealpha;
            }
            return;
        }

        internal function updateFunction(arg1:flash.events.TimerEvent):void
        {
            if (this.videoinit) 
            {
                this.videocurrenttime = this.player.getCurrentTime();
                this.videoloaded = this.player.getVideoBytesLoaded();
                this.videototal = this.player.getVideoBytesTotal();
                if (this.seekscrub) 
                {
                    this.player.mute();
                    this.mc_seekbar.width = Math.round(this.mc_seek.mouseX - this.mc_seekbar.x);
                    this.seekvalue = Math.round(this.mc_seekbar.width * this.videoduration / this.mc_seekbg.width);
                    this.player.seekTo(this.seekvalue, true);
                }
                else 
                {
                    this.player.unMute();
                    if (this.mc_seekbar.alpha == 0) 
                    {
                        this.mc_seekbar.alpha = 1;
                        this.mc_seekbg.alpha = 1;
                        this.mc_seekbuffer.alpha = 1;
                    }
                    this.mc_seekbar.width = Math.round(this.videocurrenttime * this.mc_seekbg.width / this.videoduration);
                }
                this.txt.text = this.timeFormat(this.videocurrenttime) + " | " + this.timeFormat(this.videoduration);
                this.txt.setTextFormat(this.tformat);
                this.mc_seekbuffer.width = Math.round(this.videoloaded * this.mc_seekbg.width / this.videototal);
            }
            if (this.volumescrub) 
            {
                this.volumesave = Math.round(this.mc_volumebar.width / this.mc_volumebg.width * 100);
                this.volumeSet(this.volumesave);
            }
            return;
        }

        internal function onPlayerStateChange(arg1:flash.events.Event):void
        {
            var loc1:*=Object(arg1).data;
            switch (loc1) 
            {
                case 0:
                {
                    this.videoended = true;
                    if (this._loop != "false") 
                    {
                        this.player.seekTo(0);
                    }
                    else 
                    {
                        this.player.stopVideo();
                        this.mc_play.visible = true;
                        this.mc_pause.visible = false;
                        this.pausevar = true;
                        this.imageFadeIn();
                        this.videoFadeOut();
                        this.bigplayFadeIn();
                        this._banner.loadNextSlide();
                    }
                    break;
                }
                case 1:
                {
                    this.videoended = false;
                    if (!this.videoinit) 
                    {
                        this.videoinit = true;
                        this.volumeSet(this.volumesave);
                        this.imageFadeOut();
                        this.videoduration = this.player.getDuration();
                        this.checkAvailableVideoQuality();
                    }
                    break;
                }
                case 2:
                {
                    break;
                }
                case 5:
                {
                    break;
                }
            }
            return;
        }

        internal function tooltipScrub(arg1:flash.events.Event):void
        {
            if (this.mc_seekbg.hitTestPoint(this._stage.mouseX, this._stage.mouseY, false)) 
            {
                this.tooltip.x = this._stage.mouseX - this.playercontainer.x - this.playerx;
                this.tooltiptxt.text = this.timeFormat(Math.round((this.tooltip.x - this._root.videobuttonspacing - this._root.videobuttonborderspacing - this._root.videobuttonsize - 10) / this.mc_seekbg.width * this.videoduration));
                this.tooltiptxt.setTextFormat(this.tooltipformat);
            }
            return;
        }

        internal function imageFadeIn():void
        {
            if (this.previewimage_t != null) 
            {
                this.previewimage_t.stop();
            }
            this.previewimage_t = org.libspark.betweenas3.BetweenAS3.to(this.previewimage, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            this.previewimage_t.play();
            return;
        }

        internal var player_t:org.libspark.betweenas3.tweens.ITween;

        internal var bigplayicon:flash.display.Shape;

        internal var icon_pause:flash.display.MovieClip;

        internal var seekscrub:Boolean=false;

        internal var playercontainer:flash.display.MovieClip;

        internal var mc_pause_t:org.libspark.betweenas3.tweens.ITween;

        internal var _autoplay:String;

        internal var mc_interfacebg_t:org.libspark.betweenas3.tweens.ITween;

        internal var videohdmode:Boolean;

        internal var preshape:flash.display.Sprite;

        internal var player:Object;

        internal var interface_volume:flash.display.Sprite;

        internal var mc_seekbar:flash.display.MovieClip;

        internal var _playerobj:Object;

        internal var mc_volume_out:org.libspark.betweenas3.tweens.ITween;

        internal var mc_hd_t:org.libspark.betweenas3.tweens.ITween;

        internal var _widthvar:Number;

        internal var mc_seekbuffer:flash.display.MovieClip;

        public var loadedvar:Boolean=false;

        internal var mc_play_t:org.libspark.betweenas3.tweens.ITween;

        internal var lowQuality:String;

        internal var videoduration:Number;

        internal var interface_bg:flash.display.Sprite;

        internal var mc_volume_t:org.libspark.betweenas3.tweens.ITween;

        internal var videoended:Boolean=false;

        internal var _heightvar:Number;

        internal var interface_volumebg:flash.display.Sprite;

        internal var bigplay_t:org.libspark.betweenas3.tweens.ITween;

        internal var preloader_t:org.libspark.betweenas3.tweens.ITween;

        internal var tooltip:flash.display.MovieClip;

        internal var videoinit:Boolean=false;

        internal var mc_pause:flash.display.MovieClip;

        internal var lowQualityArray:Array;

        internal var seekbarwidth:Number;

        internal var loader:flash.display.Loader;

        internal var mc_seek_t:org.libspark.betweenas3.tweens.ITween;

        internal var mc_interfacebg:flash.display.MovieClip;

        internal var tooltip_t:org.libspark.betweenas3.tweens.ITween;

        internal var icon_play:flash.display.MovieClip;

        internal var mute:Boolean=false;

        internal var interface_volumebar:flash.display.Sprite;

        internal var updatetimer:flash.utils.Timer;

        internal var videoquality:String;

        internal var mc_pause_out:org.libspark.betweenas3.tweens.ITween;

        internal var interface_seekarea:flash.display.Sprite;

        internal var playermask:flash.display.Sprite;

        internal var imageLoader:flash.display.Loader;

        internal var mc_volumebar:flash.display.MovieClip;

        internal var volumescrub:Boolean=false;

        internal var ishow_t:org.libspark.betweenas3.tweens.ITween;

        internal var icon_hd_ct:flash.geom.ColorTransform;

        internal var bigplay:flash.display.MovieClip;

        internal var _startvolume:Number;

        internal var mc_volumebg:flash.display.MovieClip;

        internal var tformat:flash.text.TextFormat;

        internal var _previewimagelink:String;

        internal var interface_volumearea:flash.display.Sprite;

        internal var bgblock:flash.display.Sprite;

        internal var pausevar:Boolean=false;

        internal var videoloaded:Number;

        internal var ysave:Number;

        internal var icon_volume_ct:flash.geom.ColorTransform;

        internal var seekvaluebuffer:Number;

        internal var interface_seekbuffer:flash.display.Sprite;

        internal var interface_pause:flash.display.Sprite;

        internal var mc_seek:flash.display.MovieClip;

        internal var _loop:String;

        internal var _videolink:String;

        internal var mc_seekbg:flash.display.MovieClip;

        internal var mc_hd:flash.display.MovieClip;

        internal var tooltipbg:flash.display.Sprite;

        internal var preloaderfade_t:org.libspark.betweenas3.tweens.ITween;

        internal var tooltiptxt:flash.text.TextField;

        internal var _banner:flash.display.MovieClip;

        internal var interface_seekbar:flash.display.Sprite;

        internal var icon_play_ct:flash.geom.ColorTransform;

        internal var volumesave:Number;

        internal var mc_play_out:org.libspark.betweenas3.tweens.ITween;

        internal var mc_hd_out:org.libspark.betweenas3.tweens.ITween;

        internal var icon_pause_ct:flash.geom.ColorTransform;

        internal var mc_play_over:org.libspark.betweenas3.tweens.ITween;

        internal var ihide_t:org.libspark.betweenas3.tweens.ITween;

        internal var videocurrenttime:Number;

        internal var icon_volume:flash.display.MovieClip;

        internal var txt:flash.text.TextField;

        internal var bigplaybtn:flash.display.Sprite;

        internal var videototal:Number;

        internal var interfacetimer:flash.utils.Timer;

        internal var video:flash.display.MovieClip;

        internal var mc_volume_over:org.libspark.betweenas3.tweens.ITween;

        public var playerx:int;

        public var playery:int;

        internal var imageLoaderContext:flash.system.LoaderContext;

        internal var tooltipformat:flash.text.TextFormat;

        internal var highestQuality:String;

        internal var interfaceyposup:Number;

        internal var interface_seek:flash.display.Sprite;

        internal var video_t:org.libspark.betweenas3.tweens.ITween;

        internal var _root:flash.display.MovieClip;

        internal var icon_hd:flash.display.MovieClip;

        internal var interface_seekbg:flash.display.Sprite;

        internal var previewimage_t:org.libspark.betweenas3.tweens.ITween;

        internal var interface_hd:flash.display.Sprite;

        internal var preloadermc:flash.display.MovieClip;

        internal var mc_pause_over:org.libspark.betweenas3.tweens.ITween;

        internal var seekbar_t:org.libspark.betweenas3.tweens.ITween;

        internal var mc_play:flash.display.MovieClip;

        internal var interfacebgyposup:Number;

        internal var mc_hd_over:org.libspark.betweenas3.tweens.ITween;

        internal var videoavailablequality:Array;

        internal var mc_volume:flash.display.MovieClip;

        internal var tooltiparrow:flash.display.Shape;

        internal var interface_play:flash.display.Sprite;

        internal var interfaceypos:Number;

        internal var xsave:Number;

        internal var seekvalue:Number;

        internal var previewimage:flash.display.MovieClip;

        internal var _stage:flash.display.Stage;
    }
}
