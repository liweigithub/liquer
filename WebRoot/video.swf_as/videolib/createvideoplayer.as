package videolib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.system.*;
    import flash.text.*;
    import flash.utils.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createvideoplayer extends flash.display.MovieClip
    {
        public function createvideoplayer(arg1:flash.display.Stage, arg2:flash.display.MovieClip, arg3:Object, arg4:String, arg5:String, arg6:Number, arg7:Number, arg8:String, arg9:String, arg10:Number)
        {
            this.video = new flash.media.Video();
            this.imageLoader = new flash.display.Loader();
            this.imageLoaderContext = new flash.system.LoaderContext(true);
            this.previewimage = new flash.display.MovieClip();
            this.playercontainer = new flash.display.MovieClip();
            this.mc_play = new flash.display.MovieClip();
            this.mc_pause = new flash.display.MovieClip();
            this.mc_seek = new flash.display.MovieClip();
            this.mc_volume = new flash.display.MovieClip();
            this.mc_fullscreen = new flash.display.MovieClip();
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
            this.icon_fullscreen = new video_fullscreen2();
            this.icon_play_ct = this.icon_play.transform.colorTransform;
            this.icon_pause_ct = this.icon_pause.transform.colorTransform;
            this.icon_volume_ct = this.icon_volume.transform.colorTransform;
            this.icon_fullscreen_ct = this.icon_fullscreen.transform.colorTransform;
            this.playermask = new flash.display.Sprite();
            this.bgblock = new flash.display.Sprite();
            this.interface_play = new flash.display.Sprite();
            this.interface_pause = new flash.display.Sprite();
            this.interface_seek = new flash.display.Sprite();
            this.interface_volume = new flash.display.Sprite();
            this.interface_fullscreen = new flash.display.Sprite();
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
            super();
            this._stage = arg1;
            this._root = arg2;
            this._playerobj = arg3;
            this._videolink = arg4;
            this._previewimagelink = arg5;
            this._widthvar = arg6;
            this._heightvar = arg7;
            this._autoplay = arg8;
            this._loop = arg9;
            this._startvolume = arg10;
            if (this._root.videointerfaceoverlay != "true") 
            {
                this._heightvarmod = this._heightvar - this._root.videobuttonsize - this._root.videobuttonbottomspacing * 2;
            }
            else 
            {
                this._heightvarmod = this._heightvar;
            }
            this.volumesave = this._root.videostartvolume / 100;
            this.bgblock.graphics.beginFill(0);
            this.bgblock.graphics.drawRect(0, 0, this._widthvar, this._heightvar);
            this.bgblock.graphics.endFill();
            this.bgblock.alpha = 1;
            this.bgblock.mouseEnabled = true;
            this.playercontainer.alpha = 0;
            this._root.addChild(this.bgblock);
            this._root.addChild(this.playercontainer);
            this.playercontainer.addChild(this.previewimage);
            this.playercontainer.addChild(this.video);
            this.video.width = this._widthvar;
            this.video.height = this._heightvarmod;
            this.playermask.graphics.beginFill(0);
            this.playermask.graphics.drawRect(0, 0, this._widthvar, this._heightvar);
            this.playermask.graphics.endFill();
            this.playermask.alpha = 0;
            this.playermask.mouseEnabled = false;
            this.playercontainer.mask = this.playermask;
            this._root.addChild(this.playermask);
            this.initInterface();
            if (this._autoplay != "false") 
            {
                this._root.mainroot.util.extPause();
                this.loadImage();
                this.initVideo();
                if (this._autoplay != "true") 
                {
                    this.mc_play.visible = true;
                }
                else 
                {
                    this.mc_pause.visible = true;
                }
                var loc1:*;
                this.mc_interfacebg.visible = loc1 = true;
                this.mc_fullscreen.visible = loc1 = loc1;
                this.mc_volume.visible = loc1 = loc1;
                this.mc_seek.visible = loc1;
                flash.utils.setTimeout(this.interfaceFadeIn, 500);
            }
            else 
            {
                this.loadImage();
            }
            if (this._root.videocontrolshidetime != 0) 
            {
                this.addInterfaceTimer();
            }
            this._stage.addEventListener(flash.events.Event.ADDED, this.onStageResize, false, 0, true);
            this._stage.addEventListener(flash.events.Event.RESIZE, this.onStageResize, false, 0, true);
            return;
        }

        internal function loadImage():void
        {
            this.imageLoader.load(new flash.net.URLRequest(this._previewimagelink), this.imageLoaderContext);
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone, false, 0, true);
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
                if (this.preview_t != null) 
                {
                    this.preview_t.stop();
                    this.preview_t = null;
                }
                if (this._root.fsvar) 
                {
                    this.player_t = org.libspark.betweenas3.BetweenAS3.to(this.video, {"y":this.fsup}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.preview_t = org.libspark.betweenas3.BetweenAS3.to(this.previewimage, {"y":this.fsup}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                }
                else 
                {
                    this.player_t = org.libspark.betweenas3.BetweenAS3.to(this.video, {"y":-this._root.videobuttonsize - this._root.videobuttonbottomspacing * 2}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.preview_t = org.libspark.betweenas3.BetweenAS3.to(this.previewimage, {"y":-this._root.videobuttonsize - this._root.videobuttonbottomspacing * 2}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                }
                this.player_t.play();
                this.preview_t.play();
            }
            return;
        }

        internal function initInterface():void
        {
            var loc3:*;
            this.mc_interfacebg.visible = loc3 = false;
            this.mc_fullscreen.visible = loc3 = loc3;
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
            this.interface_fullscreen.graphics.beginFill(this._root.videobuttonbgcolor);
            if (this._root.videobuttonrounded > 0) 
            {
                this.interface_fullscreen.graphics.drawRoundRect(0, 0, this._root.videobuttonsize, this._root.videobuttonsize, this._root.videobuttonrounded, this._root.videobuttonrounded);
            }
            else 
            {
                this.interface_fullscreen.graphics.drawRect(0, 0, this._root.videobuttonsize, this._root.videobuttonsize);
            }
            this.interface_fullscreen.graphics.endFill();
            this.interface_fullscreen.mouseEnabled = false;
            if (this._root.videobuttonalphahover != "false") 
            {
                this.interface_fullscreen.alpha = loc3 = 1;
                this.interface_volume.alpha = loc3 = loc3;
                this.interface_seek.alpha = loc3 = loc3;
                this.interface_pause.alpha = loc3 = loc3;
                this.interface_play.alpha = loc3;
            }
            else 
            {
                this.interface_fullscreen.alpha = loc3 = this._root.videobuttonbgalpha;
                this.interface_volume.alpha = loc3 = loc3;
                this.interface_seek.alpha = loc3 = loc3;
                this.interface_pause.alpha = loc3 = loc3;
                this.interface_play.alpha = loc3;
            }
            this.mc_play.x = this._root.videobuttonborderspacing;
            this.mc_pause.x = this._root.videobuttonborderspacing;
            this.mc_seek.x = this._root.videobuttonsize + this._root.videobuttonspacing + this._root.videobuttonborderspacing;
            this.mc_volume.x = this._root.videobuttonsize + this._root.videobuttonspacing * 2 + this._root.videobuttonborderspacing + this.seekbarwidth;
            this.mc_fullscreen.x = this._root.videovolumewidth + this._root.videobuttonsize + this._root.videobuttonspacing * 3 + this._root.videobuttonborderspacing + this.seekbarwidth;
            this.mc_fullscreen.y = loc3 = this.interfaceypos;
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
            this.mc_fullscreen.addChild(this.interface_fullscreen);
            this.mc_interfacebg.addChild(this.interface_bg);
            if (this._root.videobuttonrounded > 0) 
            {
                this.interface_seek.scale9Grid = new flash.geom.Rectangle(this._root.videobuttonrounded, this._root.videobuttonrounded, this.seekbarwidth - this._root.videobuttonrounded * 2, this._root.videobuttonsize - this._root.videobuttonrounded * 2);
            }
            this.icon_play.x = Math.round(this._root.videobuttonsize / 2 - this.icon_play.width / 2);
            this.icon_pause.x = Math.round(this._root.videobuttonsize / 2 - this.icon_pause.width / 2);
            this.icon_volume.x = Math.round(this._root.videobuttonsize / 2 - this.icon_volume.width / 2);
            this.icon_fullscreen.x = Math.round(this._root.videobuttonsize / 2 - this.icon_fullscreen.width / 2);
            this.icon_play.y = Math.round(this._root.videobuttonsize / 2 - this.icon_play.height / 2);
            this.icon_pause.y = Math.round(this._root.videobuttonsize / 2 - this.icon_pause.height / 2);
            this.icon_volume.y = Math.round(this._root.videobuttonsize / 2 - this.icon_volume.height / 2);
            this.icon_fullscreen.y = Math.round(this._root.videobuttonsize / 2 - this.icon_fullscreen.height / 2);
            this.icon_fullscreen_ct.color = loc3 = this._root.videobuttonobjcolor;
            this.icon_volume_ct.color = loc3 = loc3;
            this.icon_pause_ct.color = loc3 = loc3;
            this.icon_play_ct.color = loc3;
            this.icon_play.transform.colorTransform = this.icon_play_ct;
            this.icon_pause.transform.colorTransform = this.icon_pause_ct;
            this.icon_volume.transform.colorTransform = this.icon_volume_ct;
            this.icon_fullscreen.transform.colorTransform = this.icon_fullscreen_ct;
            this.mc_play.addChild(this.icon_play);
            this.mc_pause.addChild(this.icon_pause);
            this.mc_volume.addChild(this.icon_volume);
            this.mc_fullscreen.addChild(this.icon_fullscreen);
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
            this.txt.embedFonts = true;
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
            this.mc_volumebar.width = this.mc_volumebg.width * this.volumesave;
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
            this.bigplay.y = Math.round(this._heightvarmod / 2 - this.bigplay.height / 2);
            this.bigplay.mouseEnabled = false;
            this.playercontainer.addChild(this.bigplay);
            this.mc_play.buttonMode = true;
            this.mc_pause.buttonMode = true;
            this.mc_fullscreen.buttonMode = true;
            this.icon_volume.buttonMode = true;
            this.playercontainer.addChild(this.mc_interfacebg);
            this.playercontainer.addChild(this.mc_play);
            this.playercontainer.addChild(this.mc_pause);
            this.playercontainer.addChild(this.mc_seek);
            this.playercontainer.addChild(this.mc_volume);
            this.playercontainer.addChild(this.mc_fullscreen);
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
            this._root.mainroot.videoactive = true;
            this.mc_play.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_play_overf, false, 0, true);
            this.mc_play.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_play_outf, false, 0, true);
            this.mc_play.addEventListener(flash.events.MouseEvent.CLICK, this.mc_play_clickf);
            this.mc_pause.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_pause_overf, false, 0, true);
            this.mc_pause.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_pause_outf, false, 0, true);
            this.mc_pause.addEventListener(flash.events.MouseEvent.CLICK, this.mc_pause_clickf);
            this.mc_fullscreen.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_fullscreen_overf, false, 0, true);
            this.mc_fullscreen.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_fullscreen_outf, false, 0, true);
            this.mc_fullscreen.addEventListener(flash.events.MouseEvent.CLICK, this.mc_fullscreen_clickf);
            this.icon_volume.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_volume_overf, false, 0, true);
            this.icon_volume.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_volume_outf, false, 0, true);
            this.icon_volume.addEventListener(flash.events.MouseEvent.CLICK, this.mc_volume_clickf, false, 0, true);
            this._stage.addEventListener(flash.events.Event.FULLSCREEN, this.fullScreenMode, false, 0, true);
            this._stage.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.mouseRelease, false, 0, true);
            this._stage.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.moveIn, false, 0, true);
            this._stage.addEventListener(flash.events.Event.MOUSE_LEAVE, this.mouseLeave, false, 0, true);
            this.mc_volumebg.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.volumeScrubFunction, false, 0, true);
            this.mc_seekbg.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.seekScrubFunction, false, 0, true);
            this.mc_seekbg.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.showTooltip, false, 0, true);
            this.mc_seekbg.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.hideTooltip, false, 0, true);
            this.previewimage.addEventListener(flash.events.MouseEvent.CLICK, this.playPause, false, 0, true);
            this.previewimage.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.playPauseIn, false, 0, true);
            this.previewimage.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.playPauseOut, false, 0, true);
            this.updatetimer = new flash.utils.Timer(this._root.videointerfaceupdate);
            this.updatetimer.addEventListener(flash.events.TimerEvent.TIMER, this.updateFunction, false, 0, true);
            this.updatetimer.start();
            return;
        }

        internal function mc_pause_clickf(arg1:flash.events.MouseEvent):void
        {
            this.pressPause();
            return;
        }

        internal function addInterfaceTimer():void
        {
            if (this._root.videocontrolshidetime != 0) 
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
                this.interfacetimer = new flash.utils.Timer(this._root.videocontrolshidetime * 1000, 1);
                this.interfacetimer.addEventListener(flash.events.TimerEvent.TIMER_COMPLETE, this.moveOut, false, 0, true);
                this.interfacetimer.start();
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

        internal function playerFull():void
        {
            if (this._root.videomoveup == "true") 
            {
                if (this.player_t != null) 
                {
                    this.player_t.stop();
                    this.player_t = null;
                }
                if (this.preview_t != null) 
                {
                    this.preview_t.stop();
                    this.preview_t = null;
                }
                if (this._root.fsvar) 
                {
                    this.player_t = org.libspark.betweenas3.BetweenAS3.to(this.video, {"y":this.fsdown}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.preview_t = org.libspark.betweenas3.BetweenAS3.to(this.previewimage, {"y":this.fsdown}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                }
                else 
                {
                    this.player_t = org.libspark.betweenas3.BetweenAS3.to(this.video, {"y":0}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.preview_t = org.libspark.betweenas3.BetweenAS3.to(this.previewimage, {"y":0}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                }
                this.player_t.play();
                this.preview_t.play();
            }
            return;
        }

        internal function pressPlay():void
        {
            this.bigplayFadeOut();
            this._root.mainroot.util.extPause();
            if (this._autoplay == "false" && !this.videoinit) 
            {
                this.initVideo();
                this.mc_play.visible = false;
                this.mc_pause.visible = true;
                this.pausevar = false;
            }
            else if (this.pausevar) 
            {
                this.mc_play.visible = false;
                this.mc_pause.visible = true;
                this.pausevar = false;
                this.imageFadeOut();
                this.videoFadeIn();
                this.netstream.resume();
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

        internal function mc_fullscreen_clickf(arg1:flash.events.MouseEvent):void
        {
            if (this._stage.displayState != flash.display.StageDisplayState.NORMAL) 
            {
                if (this._stage.displayState == flash.display.StageDisplayState.FULL_SCREEN && this._root.fsvar) 
                {
                    this._stage.displayState = flash.display.StageDisplayState.NORMAL;
                    this.fsOff();
                }
                else if (this._stage.displayState == flash.display.StageDisplayState.FULL_SCREEN && !this._root.fsvar) 
                {
                    this.fsOn();
                }
            }
            else 
            {
                this._stage.displayState = flash.display.StageDisplayState.FULL_SCREEN;
                this.fsOn();
            }
            return;
        }

        internal function mc_fullscreen_overf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_fullscreen_out != null) 
            {
                this.mc_fullscreen_out.stop();
            }
            if (this._root.videobuttonalphahover != "false") 
            {
                this.mc_fullscreen_over = org.libspark.betweenas3.BetweenAS3.to(this.interface_fullscreen, {"alpha":this._root.videobuttonbgalpha}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            else 
            {
                this.mc_fullscreen_over = org.libspark.betweenas3.BetweenAS3.to(this.interface_fullscreen, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            this.mc_fullscreen_over.play();
            return;
        }

        internal function mc_play_clickf(arg1:flash.events.MouseEvent):void
        {
            this.pressPlay();
            return;
        }

        internal function mouseLeave(arg1:flash.events.Event):void
        {
            if (this._stage.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                this._stage.removeEventListener(flash.events.Event.ENTER_FRAME, this.checkMouse);
            }
            if (this.interfacetimer == null) 
            {
                this.addInterfaceTimer();
            }
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

        internal function volumeScrubFunction(arg1:flash.events.MouseEvent):void
        {
            this.volumescrub = true;
            this.mute = false;
            this.icon_volume.alpha = 1;
            this.mc_volumebar.addEventListener(flash.events.Event.ENTER_FRAME, this.volumeScrubFunctionFrame, false, 0, true);
            return;
        }

        internal function volumeSet(arg1:Number):void
        {
            var loc1:*=undefined;
            if (this.videoinit) 
            {
                loc1 = new flash.media.SoundTransform(arg1);
                this.netstream.soundTransform = loc1;
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

        internal function onMeta(arg1:Object):void
        {
            var loc1:*=NaN;
            var loc2:*=NaN;
            this.videoinit = true;
            this.metaObj = arg1;
            this.video.width = this._widthvar;
            this.video.height = this._heightvarmod;
            if (this._root.fsvar) 
            {
                loc1 = this.video.width / this.video.height;
                loc2 = this.video.height / this.video.width;
                if (this._heightvar / this._widthvar < loc2) 
                {
                    this.video.height = this._heightvarmod;
                    this.video.width = Math.round(loc1 * this.video.height);
                }
                else 
                {
                    this.video.width = this._stage.stageWidth;
                    this.video.height = Math.round(loc2 * this.video.width);
                }
                this.playermask.width = this._stage.stageWidth + this.playercontainer.x;
                this.playermask.height = this._stage.stageHeight + this.playercontainer.y;
            }
            else 
            {
                loc1 = arg1.width / arg1.height;
                loc2 = arg1.height / arg1.width;
                if (this._heightvarmod / this._widthvar < loc2) 
                {
                    this.video.height = this._heightvarmod;
                    this.video.width = Math.round(loc1 * this.video.height);
                }
                else 
                {
                    this.video.width = this._widthvar;
                    this.video.height = Math.round(loc2 * this.video.width);
                }
                this.video.x = Math.round(this._widthvar / 2 - this.video.width / 2);
                this.video.y = Math.round(this._heightvarmod / 2 - this.video.height / 2);
            }
            if (this.mute) 
            {
                this.volumeSet(0);
            }
            else 
            {
                this.volumeSet(this.volumesave);
                this.mc_volumebar.width = this.mc_volumebg.width * this.volumesave;
            }
            this.netstream.resume();
            this.videoFadeIn();
            this.addSeekTooltip();
            return;
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

        internal function fullScreenMode(arg1:flash.events.FullScreenEvent):void
        {
            if (this._root.mainroot.videoactive) 
            {
                if (!arg1.fullScreen) 
                {
                    this.fsOff();
                }
            }
            return;
        }

        internal function removePlayer():void
        {
            this._root.removeChild(this.playercontainer);
            this._root.removeChild(this.playermask);
            this._playerobj = null;
            return;
        }

        internal function playPauseOut(arg1:flash.events.MouseEvent):void
        {
            if (this.pausevar) 
            {
                if (this.bigplay_t != null) 
                {
                    this.bigplay_t.stop();
                }
                this.bigplay_t = org.libspark.betweenas3.BetweenAS3.to(this.bigplay, {"alpha":this._root.videobigplaybgalpha}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
                this.bigplay_t.play();
            }
            return;
        }

        internal function imageLoadingDone(arg1:flash.events.Event):void
        {
            this.imageLoader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone);
            this.playercontainer.alpha = 1;
            this.previewimage.alpha = 0;
            this.previewimage.buttonMode = true;
            this.previewimage.addChild(this.imageLoader.content);
            this.previewimage.width = this._widthvar;
            this.previewimage.height = this._heightvar;
            this.previewimage.x = this.video.x;
            this.previewimage.y = this.video.y;
            if (this._autoplay == "false") 
            {
                this.imageFadeIn();
                this.bigplayFadeIn();
                var loc1:*;
                this.mc_interfacebg.visible = loc1 = true;
                this.mc_fullscreen.visible = loc1 = loc1;
                this.mc_volume.visible = loc1 = loc1;
                this.mc_seek.visible = loc1 = loc1;
                this.mc_play.visible = loc1;
                flash.utils.setTimeout(this.interfaceFadeIn, 500);
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

        internal function mc_fullscreen_outf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_fullscreen_over != null) 
            {
                this.mc_fullscreen_over.stop();
            }
            if (this._root.videobuttonalphahover != "false") 
            {
                this.mc_fullscreen_out = org.libspark.betweenas3.BetweenAS3.to(this.interface_fullscreen, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            else 
            {
                this.mc_fullscreen_out = org.libspark.betweenas3.BetweenAS3.to(this.interface_fullscreen, {"alpha":this._root.videobuttonbgalpha}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            this.mc_fullscreen_out.play();
            return;
        }

        internal function moveIn(arg1:flash.events.MouseEvent):void
        {
            if (!this._stage.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                this._stage.addEventListener(flash.events.Event.ENTER_FRAME, this.checkMouse, false, 0, true);
            }
            if (this.ishow_t == null) 
            {
                this.interfaceFadeIn();
                this.addInterfaceTimer();
            }
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
            if (this._root.fsvar) 
            {
                this.interfacebgyposup_fs = this._stage.stageHeight - this.playercontainer.y - this._root.videobuttonsize - this._root.videobuttonbottomspacing * 2 - this._root.playery;
                this.tooltip.y = this.interfacebgyposup_fs - Math.round(this.tooltipbg.height / 2) - 8 + this._root.videobuttonbottomspacing;
            }
            this.playercontainer.addChild(this.tooltip);
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

        internal function volumeScrubFunctionFrame(arg1:flash.events.Event):void
        {
            if (this.mc_volumebg.hitTestPoint(this._stage.mouseX, this._stage.mouseY, false)) 
            {
                this.mc_volumebar.width = Math.round(this.mc_volume.mouseX - this.mc_volumebar.x);
            }
            return;
        }

        internal function initVideo():void
        {
            this.video.alpha = 0;
            this.video.smoothing = true;
            this.netconnect = new flash.net.NetConnection();
            this.netconnect.addEventListener(flash.events.NetStatusEvent.NET_STATUS, this.netStat, false, 0, true);
            this.netconnect.connect(null);
            this.netstream = new flash.net.NetStream(this.netconnect);
            this.netstream.addEventListener(flash.events.NetStatusEvent.NET_STATUS, this.netStat, false, 0, true);
            this.netstream.client = {"onMetaData":this.onMeta};
            this.netstream.bufferTime = this._root.videobuffertime;
            this.video.attachNetStream(this.netstream);
            this.netstream.play(this._videolink);
            this.netstream.pause();
            return;
        }

        internal function fsOff():void
        {
            this._root.fsvar = false;
            this._root.mainroot.module.activateMask();
            this._root.mainroot.util.showUtil();
            this._root.mainroot.menuobj.menuOn();
            this._root.mainroot.logo.logoOn();
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
            if (this.videoinit) 
            {
                this.mc_seekbar.alpha = 0;
                this.mc_seekbg.alpha = 0;
                this.mc_seekbuffer.alpha = 0;
            }
            this.interface_seek.width = this.seekbarwidth;
            this.mc_seekbg.width = this.seekbarwidth - Math.round(this.txt.width) - 30;
            this.mc_interfacebg.width = this._widthvar;
            this.txt.x = Math.round(this.seekbarwidth - this.txt.width) - 10;
            this.mc_play.x = this._root.videobuttonborderspacing;
            this.mc_pause.x = this._root.videobuttonborderspacing;
            this.mc_seek.x = this._root.videobuttonsize + this._root.videobuttonspacing + this._root.videobuttonborderspacing;
            this.mc_volume.x = this._root.videobuttonsize + this._root.videobuttonspacing * 2 + this._root.videobuttonborderspacing + this.seekbarwidth;
            this.mc_fullscreen.x = this._root.videovolumewidth + this._root.videobuttonsize + this._root.videobuttonspacing * 3 + this._root.videobuttonborderspacing + this.seekbarwidth;
            this.mc_interfacebg.x = 0;
            this.mc_interfacebg.y = this.interfacebgyposup;
            var loc1:*;
            this.mc_fullscreen.y = loc1 = this.interfaceyposup;
            this.mc_volume.y = loc1 = loc1;
            this.mc_seek.y = loc1 = loc1;
            this.mc_pause.y = loc1 = loc1;
            this.mc_play.y = loc1;
            this.video.x = this.xsave;
            this.video.y = this.ysave;
            this.bgblock.width = loc1 = this._widthvar;
            this.playermask.width = loc1;
            this.bgblock.height = loc1 = this._heightvar;
            this.playermask.height = loc1;
            this.video.width = this.wsave;
            this.video.height = this.hsave;
            this.previewimage.width = this.video.width;
            this.previewimage.height = this.video.height;
            this.previewimage.x = this.video.x;
            this.previewimage.y = this.video.y;
            this.playerShrink();
            this.bgblock.x = loc1 = 0;
            this.playermask.x = loc1;
            this.bgblock.y = loc1 = 0;
            this.playermask.y = loc1;
            this.tooltip.y = this.interfaceyposup - Math.round(this.tooltipbg.height / 2) - 8;
            this.bigplay.x = Math.round(this._widthvar / 2 - this.bigplay.width / 2);
            this.bigplay.y = Math.round(this._heightvarmod / 2 - this.bigplay.height / 2);
            if (this.mc_fullscreen_over != null) 
            {
                this.mc_fullscreen_over.stop();
            }
            if (this._root.videobuttonalphahover != "false") 
            {
                this.mc_fullscreen_out = org.libspark.betweenas3.BetweenAS3.to(this.interface_fullscreen, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            else 
            {
                this.mc_fullscreen_out = org.libspark.betweenas3.BetweenAS3.to(this.interface_fullscreen, {"alpha":this._root.videobuttonbgalpha}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            this.mc_fullscreen_out.play();
            return;
        }

        internal function interfaceFadeIn():void
        {
            var loc1:*=null;
            var loc2:*=null;
            var loc3:*=null;
            var loc4:*=null;
            if (this._root.videocontrolsvisible != "false") 
            {
                if (this._root.fsvar) 
                {
                    this.mc_play_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_play, {"y":this.interfaceyposup_fs}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.mc_pause_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_pause, {"y":this.interfaceyposup_fs}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.mc_seek_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_seek, {"y":this.interfaceyposup_fs}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.mc_volume_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_volume, {"y":this.interfaceyposup_fs}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.mc_fullscreen_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_fullscreen, {"y":this.interfaceyposup_fs}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.mc_interfacebg_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_interfacebg, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                }
                else 
                {
                    this.mc_play_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_play, {"y":this.interfaceyposup}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.mc_pause_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_pause, {"y":this.interfaceyposup}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.mc_seek_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_seek, {"y":this.interfaceyposup}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.mc_volume_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_volume, {"y":this.interfaceyposup}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.mc_fullscreen_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_fullscreen, {"y":this.interfaceyposup}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                    this.mc_interfacebg_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_interfacebg, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                }
                loc1 = org.libspark.betweenas3.BetweenAS3.delay(this.mc_seek_t, this._root.videocontrolsanimationdelays);
                loc2 = org.libspark.betweenas3.BetweenAS3.delay(this.mc_volume_t, this._root.videocontrolsanimationdelays * 2);
                loc3 = org.libspark.betweenas3.BetweenAS3.delay(this.mc_fullscreen_t, this._root.videocontrolsanimationdelays * 3);
                loc4 = org.libspark.betweenas3.BetweenAS3.delay(this.mc_interfacebg_t, this._root.videocontrolsanimationdelays * 6);
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
                this.ishow_t = org.libspark.betweenas3.BetweenAS3.parallel(this.mc_play_t, this.mc_pause_t, this.mc_seek_t, loc1, this.mc_volume_t, loc2, this.mc_fullscreen_t, loc3, this.mc_interfacebg_t, loc4);
                this.ishow_t.play();
            }
            else 
            {
                var loc5:*;
                this.mc_fullscreen.visible = loc5 = false;
                this.mc_volume.visible = loc5 = loc5;
                this.mc_seek.visible = loc5 = loc5;
                this.mc_pause.visible = loc5 = loc5;
                this.mc_play.visible = loc5 = loc5;
                this.mc_interfacebg.visible = loc5;
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

        internal function pressPause():void
        {
            if (!this.pausevar) 
            {
                this._root.mainroot.util.extPlay();
                this.mc_play.visible = true;
                this.mc_pause.visible = false;
                this.pausevar = true;
                this.netstream.pause();
                this.bigplayFadeIn();
            }
            return;
        }

        function netStat(arg1:flash.events.NetStatusEvent):void
        {
            var loc1:*=arg1.info.code;
            switch (loc1) 
            {
                case "NetStream.Play.Stop":
                {
                    if (this._loop != "false") 
                    {
                        this.netstream.seek(0);
                    }
                    else 
                    {
                        this.netstream.pause();
                        this.netstream.seek(0);
                        this.mc_play.visible = true;
                        this.mc_pause.visible = false;
                        this.pausevar = true;
                        this.imageFadeIn();
                        this.videoFadeOut();
                        this.bigplayFadeIn();
                    }
                    break;
                }
            }
            return;
        }

        internal function fsOn():void
        {
            this._root.fsvar = true;
            this._root.mainroot.module.deactivateMask();
            this._root.mainroot.util.hideUtil();
            this._root.mainroot.menuobj.menuOff();
            this._root.mainroot.logo.logoOff();
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
            this.seekbarwidthfs = Math.round(this._stage.stageWidth - 3 * this._root.videobuttonspacing - 2 * this._root.videobuttonborderspacing - 2 * this._root.videobuttonsize - this._root.videovolumewidth);
            this.interface_seek.width = this.seekbarwidthfs;
            this.mc_seekbg.width = this.seekbarwidthfs - Math.round(this.txt.width) - 30;
            this.mc_interfacebg.width = Math.round(this._stage.stageWidth);
            this.interfaceypos_fs = this._stage.stageHeight - this.playercontainer.y - this._root.playery;
            this.interfaceyposup_fs = this._stage.stageHeight - this.playercontainer.y - this._root.videobuttonsize - this._root.videobuttonbottomspacing - this._root.playery;
            this.interfacebgyposup_fs = this._stage.stageHeight - this.playercontainer.y - this._root.videobuttonsize - this._root.videobuttonbottomspacing * 2 - this._root.playery;
            this.txt.x = Math.round(this.seekbarwidthfs - this.txt.width) - 10;
            this.mc_play.x = -this.playercontainer.x + this._root.videobuttonborderspacing - this._root.playerx;
            this.mc_pause.x = -this.playercontainer.x + this._root.videobuttonborderspacing - this._root.playerx;
            this.mc_seek.x = -this.playercontainer.x + this._root.videobuttonsize + this._root.videobuttonspacing + this._root.videobuttonborderspacing - this._root.playerx;
            this.mc_volume.x = -this.playercontainer.x + this._root.videobuttonsize + this._root.videobuttonspacing * 2 + this._root.videobuttonborderspacing + this.seekbarwidthfs - this._root.playerx;
            this.mc_fullscreen.x = -this.playercontainer.x + this._root.videovolumewidth + this._root.videobuttonsize + this._root.videobuttonspacing * 3 + this._root.videobuttonborderspacing + this.seekbarwidthfs - this._root.playerx;
            this.mc_interfacebg.x = -this.playercontainer.x - this._root.playerx;
            var loc3:*;
            this.mc_fullscreen.y = loc3 = this.interfaceyposup_fs;
            this.mc_volume.y = loc3 = loc3;
            this.mc_seek.y = loc3 = loc3;
            this.mc_pause.y = loc3 = loc3;
            this.mc_play.y = loc3;
            this.mc_interfacebg.y = this.interfacebgyposup_fs;
            this.xsave = this.video.x;
            this.ysave = this.video.y;
            this.wsave = this.video.width;
            this.hsave = this.video.height;
            this.bgblock.x = loc3 = -this.playercontainer.x - this._root.playerx;
            this.playermask.x = loc3 = loc3;
            this.video.x = loc3;
            this.bgblock.y = loc3 = -this.playercontainer.y - this._root.playery;
            this.playermask.y = loc3 = loc3;
            this.video.y = loc3;
            this.bgblock.width = loc3 = this._stage.stageWidth + this.playercontainer.x;
            this.playermask.width = loc3;
            this.bgblock.height = loc3 = this._stage.stageHeight + this.playercontainer.y;
            this.playermask.height = loc3;
            var loc1:*=this.video.width / this.video.height;
            var loc2:*=this.video.height / this.video.width;
            if (this._heightvarmod / this._widthvar < loc2) 
            {
                if (this._root.videointerfaceoverlay != "true") 
                {
                    this.video.height = this._stage.stageHeight - this._root.videobuttonsize - this._root.videobuttonbottomspacing * 2;
                }
                else 
                {
                    this.video.height = this._stage.stageHeight;
                }
                this.video.width = Math.round(loc1 * this.video.height);
                this.video.y = -this._root.playery - this.playercontainer.y;
                this.fsup = -this._root.videobuttonsize - this._root.videobuttonbottomspacing * 2 - this._root.playery - this.playercontainer.y;
                this.fsdown = -this._root.playery - this.playercontainer.y;
            }
            else 
            {
                this.video.width = this._stage.stageWidth;
                if (this._root.videointerfaceoverlay != "true") 
                {
                    this.video.height = Math.round(loc2 * this.video.width) - this._root.videobuttonsize - this._root.videobuttonbottomspacing * 2;
                    this.video.y = Math.round((this._stage.stageHeight - this._root.videobuttonsize - this._root.videobuttonbottomspacing * 2) / 2 - this.video.height / 2) - this._root.playery - this.playercontainer.y;
                }
                else 
                {
                    this.video.height = Math.round(loc2 * this.video.width);
                    this.video.y = Math.round(this._stage.stageHeight / 2 - this.video.height / 2) - this._root.playery - this.playercontainer.y;
                }
                this.fsup = Math.round(this._stage.stageHeight / 2 - this.video.height / 2) - this._root.videobuttonsize - this._root.videobuttonbottomspacing * 2 - this._root.playery - this.playercontainer.y;
                this.fsdown = Math.round(this._stage.stageHeight / 2 - this.video.height / 2) - this._root.playery - this.playercontainer.y;
            }
            this.previewimage.width = this.video.width;
            this.previewimage.height = this.video.height;
            this.previewimage.x = this.video.x;
            this.previewimage.y = this.video.y;
            this.playerShrink();
            this.tooltip.y = this.interfacebgyposup_fs - Math.round(this.tooltipbg.height / 2) - 8 + this._root.videobuttonbottomspacing;
            this.bigplay.x = -this._root.playerx + Math.round(this._stage.stageWidth / 2 - this.bigplay.width / 2);
            this.bigplay.y = -this._root.playery + Math.round(this._stage.stageHeight / 2 - this.bigplay.height / 2);
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
                this.seekscrub = true;
                this.mc_seekbar.addEventListener(flash.events.Event.ENTER_FRAME, this.seekScrubFunctionFrame, false, 0, true);
            }
            return;
        }

        internal function mouseRelease(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_volumebar.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                this.volumescrub = false;
                this.mc_volumebar.removeEventListener(flash.events.Event.ENTER_FRAME, this.volumeScrubFunctionFrame);
            }
            if (this.mc_seekbar.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                this.seekscrub = false;
                this.mc_seekbar.removeEventListener(flash.events.Event.ENTER_FRAME, this.seekScrubFunctionFrame);
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

        internal function interfaceFadeOut():void
        {
            if (this._root.fsvar) 
            {
                this.mc_play_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_play, {"y":this.interfaceypos_fs}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.mc_pause_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_pause, {"y":this.interfaceypos_fs}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.mc_seek_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_seek, {"y":this.interfaceypos_fs}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.mc_volume_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_volume, {"y":this.interfaceypos_fs}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.mc_fullscreen_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_fullscreen, {"y":this.interfaceypos_fs}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.mc_interfacebg_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_interfacebg, {"alpha":0}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            }
            else 
            {
                this.mc_play_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_play, {"y":this.interfaceypos}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.mc_pause_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_pause, {"y":this.interfaceypos}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.mc_seek_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_seek, {"y":this.interfaceypos}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.mc_volume_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_volume, {"y":this.interfaceypos}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.mc_fullscreen_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_fullscreen, {"y":this.interfaceypos}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.mc_interfacebg_t = org.libspark.betweenas3.BetweenAS3.to(this.mc_interfacebg, {"alpha":0}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            }
            var loc1:*=org.libspark.betweenas3.BetweenAS3.delay(this.mc_play_t, this._root.videocontrolsanimationdelays * 4);
            var loc2:*=org.libspark.betweenas3.BetweenAS3.delay(this.mc_pause_t, this._root.videocontrolsanimationdelays * 4);
            var loc3:*=org.libspark.betweenas3.BetweenAS3.delay(this.mc_seek_t, this._root.videocontrolsanimationdelays * 3);
            var loc4:*=org.libspark.betweenas3.BetweenAS3.delay(this.mc_volume_t, this._root.videocontrolsanimationdelays * 2);
            var loc5:*=org.libspark.betweenas3.BetweenAS3.delay(this.mc_fullscreen_t, this._root.videocontrolsanimationdelays);
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
            this.ihide_t = org.libspark.betweenas3.BetweenAS3.parallel(this.mc_play_t, loc1, this.mc_pause_t, loc2, this.mc_seek_t, loc3, this.mc_volume_t, loc4, this.mc_fullscreen_t, loc5, this.mc_interfacebg_t);
            this.ihide_t.play();
            return;
        }

        internal function moveOut(arg1:flash.events.TimerEvent):void
        {
            this.interfaceFadeOut();
            return;
        }

        internal function mc_volume_clickf(arg1:flash.events.MouseEvent):void
        {
            if (this.mute) 
            {
                this.mute = false;
                this.volumeSet(this.volumesave);
                this.mc_volumebar.width = this.mc_volumebg.width * this.volumesave;
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
                if (this.seekscrub) 
                {
                    this.netstream.seek(Math.round(this.mc_seekbar.width * this.metaObj.duration / this.mc_seekbg.width));
                }
                else 
                {
                    if (this.mc_seekbar.alpha == 0) 
                    {
                        this.mc_seekbar.alpha = 1;
                        this.mc_seekbg.alpha = 1;
                        this.mc_seekbuffer.alpha = 1;
                    }
                    this.mc_seekbar.width = Math.round(this.netstream.time * this.mc_seekbg.width / this.metaObj.duration);
                }
                this.txt.text = this.timeFormat(this.netstream.time) + " | " + this.timeFormat(this.metaObj.duration);
                this.txt.setTextFormat(this.tformat);
                this.mc_seekbuffer.width = this.netstream.bytesLoaded * this.mc_seekbg.width / this.netstream.bytesTotal;
            }
            if (this.volumescrub) 
            {
                this.volumesave = this.mc_volumebar.width / this.mc_volumebg.width;
                this.volumeSet(this.volumesave);
            }
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

        public function killPlayer():void
        {
            if (this._stage.hasEventListener(flash.events.Event.RESIZE)) 
            {
                this._stage.removeEventListener(flash.events.Event.RESIZE, this.onStageResize);
            }
            if (this._stage.hasEventListener(flash.events.Event.FULLSCREEN)) 
            {
                this._stage.removeEventListener(flash.events.Event.FULLSCREEN, this.fullScreenMode);
            }
            if (this._stage.hasEventListener(flash.events.MouseEvent.MOUSE_UP)) 
            {
                this._stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.mouseRelease);
            }
            if (this._stage.hasEventListener(flash.events.Event.MOUSE_LEAVE)) 
            {
                this._stage.removeEventListener(flash.events.Event.MOUSE_LEAVE, this.mouseLeave);
            }
            if (this._stage.hasEventListener(flash.events.MouseEvent.MOUSE_MOVE)) 
            {
                this._stage.removeEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.moveIn);
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
            if (this.mc_fullscreen.hasEventListener(flash.events.MouseEvent.MOUSE_OVER)) 
            {
                this.mc_fullscreen.removeEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_fullscreen_overf);
            }
            if (this.mc_fullscreen.hasEventListener(flash.events.MouseEvent.MOUSE_OUT)) 
            {
                this.mc_fullscreen.removeEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_fullscreen_outf);
            }
            if (this.mc_fullscreen.hasEventListener(flash.events.MouseEvent.CLICK)) 
            {
                this.mc_fullscreen.removeEventListener(flash.events.MouseEvent.CLICK, this.mc_fullscreen_clickf);
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
            if (this.previewimage.hasEventListener(flash.events.MouseEvent.CLICK)) 
            {
                this.previewimage.removeEventListener(flash.events.MouseEvent.CLICK, this.playPause);
            }
            if (this.previewimage.hasEventListener(flash.events.MouseEvent.MOUSE_OVER)) 
            {
                this.previewimage.removeEventListener(flash.events.MouseEvent.MOUSE_OVER, this.playPauseIn);
            }
            if (this.previewimage.hasEventListener(flash.events.MouseEvent.MOUSE_OUT)) 
            {
                this.previewimage.removeEventListener(flash.events.MouseEvent.MOUSE_OUT, this.playPauseOut);
            }
            if (this.mc_volumebar.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                this.mc_volumebar.removeEventListener(flash.events.Event.ENTER_FRAME, this.volumeScrubFunctionFrame);
            }
            if (this.mc_seekbar.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                this.mc_seekbar.removeEventListener(flash.events.Event.ENTER_FRAME, this.seekScrubFunctionFrame);
            }
            if (this.interfacetimer.hasEventListener(flash.events.TimerEvent.TIMER_COMPLETE)) 
            {
                this.interfacetimer.removeEventListener(flash.events.TimerEvent.TIMER_COMPLETE, this.moveOut);
            }
            if (!(this.netconnect == null) && this.netconnect.hasEventListener(flash.events.NetStatusEvent.NET_STATUS)) 
            {
                this.netconnect.removeEventListener(flash.events.NetStatusEvent.NET_STATUS, this.netStat);
            }
            if (!(this.netstream == null) && this.netstream.hasEventListener(flash.events.NetStatusEvent.NET_STATUS)) 
            {
                this.netstream.removeEventListener(flash.events.NetStatusEvent.NET_STATUS, this.netStat);
            }
            if (this.updatetimer.hasEventListener(flash.events.TimerEvent.TIMER)) 
            {
                this.updatetimer.removeEventListener(flash.events.TimerEvent.TIMER, this.updateFunction);
            }
            if (this.videoinit) 
            {
                this.netstream.close();
            }
            if (this.container_t != null) 
            {
                this.container_t.stop();
            }
            this.container_t = org.libspark.betweenas3.BetweenAS3.to(this.playercontainer, {"alpha":0}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            this.container_t.onComplete = this.removePlayer;
            this.container_t.play();
            return;
        }

        internal function playPauseIn(arg1:flash.events.MouseEvent):void
        {
            if (this.pausevar) 
            {
                if (this.bigplay_t != null) 
                {
                    this.bigplay_t.stop();
                }
                this.bigplay_t = org.libspark.betweenas3.BetweenAS3.to(this.bigplay, {"alpha":1}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
                this.bigplay_t.play();
            }
            return;
        }

        internal function tooltipScrub(arg1:flash.events.Event):void
        {
            if (this.mc_seekbg.hitTestPoint(this._stage.mouseX, this._stage.mouseY, false)) 
            {
                this.tooltip.x = this._stage.mouseX - this.playercontainer.x - this._root.playerx;
                if (this._root.fsvar) 
                {
                    this.tooltiptxt.text = this.timeFormat(Math.round((this.tooltip.x + this._root.playerx - this._root.videobuttonspacing - this._root.videobuttonborderspacing - this._root.videobuttonsize - 10) / this.mc_seekbg.width * this.metaObj.duration));
                }
                else 
                {
                    this.tooltiptxt.text = this.timeFormat(Math.round((this.tooltip.x - this._root.videobuttonspacing - this._root.videobuttonborderspacing - this._root.videobuttonsize - 10) / this.mc_seekbg.width * this.metaObj.duration));
                }
                this.tooltiptxt.setTextFormat(this.tooltipformat);
            }
            return;
        }

        internal function onStageResize(arg1:flash.events.Event):void
        {
            if (this._root.fsvar) 
            {
                var loc1:*;
                this.bgblock.x = loc1 = -this._root.playerx;
                this.playermask.x = loc1;
                this.bgblock.y = loc1 = -this._root.playery;
                this.playermask.y = loc1;
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

        internal var previewimage:flash.display.MovieClip;

        internal var player_t:org.libspark.betweenas3.tweens.ITween;

        internal var mc_fullscreen_out:org.libspark.betweenas3.tweens.ITween;

        internal var interface_play:flash.display.Sprite;

        internal var netconnect:flash.net.NetConnection;

        internal var icon_pause:flash.display.MovieClip;

        internal var metaObj:Object;

        internal var bigplayicon:flash.display.Shape;

        internal var seekscrub:Boolean=false;

        internal var playercontainer:flash.display.MovieClip;

        internal var _autoplay:String;

        internal var mc_pause_t:org.libspark.betweenas3.tweens.ITween;

        internal var mc_play_t:org.libspark.betweenas3.tweens.ITween;

        internal var fsdown:Number;

        internal var _playerobj:Object;

        internal var interfaceypos_fs:Number;

        internal var mc_fullscreen_t:org.libspark.betweenas3.tweens.ITween;

        internal var _widthvar:Number;

        internal var mc_seekbuffer:flash.display.MovieClip;

        internal var mc_seekbar:flash.display.MovieClip;

        internal var interface_bg:flash.display.Sprite;

        internal var mc_volume_out:org.libspark.betweenas3.tweens.ITween;

        internal var interfacebgyposup_fs:Number;

        internal var interface_volume:flash.display.Sprite;

        internal var mc_volume_t:org.libspark.betweenas3.tweens.ITween;

        internal var mc_interfacebg_t:org.libspark.betweenas3.tweens.ITween;

        internal var tooltip:flash.display.MovieClip;

        internal var mc_fullscreen:flash.display.MovieClip;

        internal var interface_volumebg:flash.display.Sprite;

        internal var bigplay_t:org.libspark.betweenas3.tweens.ITween;

        internal var videoinit:Boolean=false;

        internal var interface_volumebar:flash.display.Sprite;

        internal var mc_seek_t:org.libspark.betweenas3.tweens.ITween;

        internal var tooltip_t:org.libspark.betweenas3.tweens.ITween;

        internal var icon_play:flash.display.MovieClip;

        internal var icon_fullscreen:flash.display.MovieClip;

        internal var mc_pause:flash.display.MovieClip;

        internal var interface_seekarea:flash.display.Sprite;

        internal var playermask:flash.display.Sprite;

        internal var imageLoader:flash.display.Loader;

        internal var mc_volumebar:flash.display.MovieClip;

        internal var seekbarwidth:Number;

        internal var volumescrub:Boolean=false;

        internal var ishow_t:org.libspark.betweenas3.tweens.ITween;

        internal var netstream:flash.net.NetStream;

        internal var _heightvar:Number;

        internal var mc_interfacebg:flash.display.MovieClip;

        internal var mc_volumebg:flash.display.MovieClip;

        internal var seekbarwidthfs:Number;

        internal var tformat:flash.text.TextFormat;

        internal var _previewimagelink:String;

        internal var interface_volumearea:flash.display.Sprite;

        internal var bgblock:flash.display.Sprite;

        internal var icon_volume_ct:flash.geom.ColorTransform;

        internal var pausevar:Boolean=false;

        internal var mute:Boolean=false;

        internal var updatetimer:flash.utils.Timer;

        internal var ysave:Number;

        internal var interface_pause:flash.display.Sprite;

        internal var _videolink:String;

        internal var interface_seekbuffer:flash.display.Sprite;

        internal var mc_seek:flash.display.MovieClip;

        internal var _loop:String;

        internal var mc_seekbg:flash.display.MovieClip;

        internal var tooltipbg:flash.display.Sprite;

        internal var tooltiptxt:flash.text.TextField;

        internal var interfaceyposup:Number;

        internal var mc_pause_out:org.libspark.betweenas3.tweens.ITween;

        internal var fsup:Number;

        internal var interface_seekbar:flash.display.Sprite;

        internal var icon_play_ct:flash.geom.ColorTransform;

        internal var volumesave:Number;

        internal var icon_fullscreen_ct:flash.geom.ColorTransform;

        internal var bigplay:flash.display.MovieClip;

        internal var mc_play_over:org.libspark.betweenas3.tweens.ITween;

        internal var _startvolume:Number;

        internal var interfaceyposup_fs:Number;

        internal var icon_volume:flash.display.MovieClip;

        internal var _heightvarmod:Number;

        internal var bigplaybtn:flash.display.Sprite;

        internal var interfacetimer:flash.utils.Timer;

        internal var mc_volume_over:org.libspark.betweenas3.tweens.ITween;

        internal var mc_play:flash.display.MovieClip;

        internal var container_t:org.libspark.betweenas3.tweens.ITween;

        internal var video_t:org.libspark.betweenas3.tweens.ITween;

        internal var mc_play_out:org.libspark.betweenas3.tweens.ITween;

        internal var tooltipformat:flash.text.TextFormat;

        internal var preview_t:org.libspark.betweenas3.tweens.ITween;

        internal var interface_seek:flash.display.Sprite;

        internal var _root:flash.display.MovieClip;

        internal var icon_pause_ct:flash.geom.ColorTransform;

        internal var previewimage_t:org.libspark.betweenas3.tweens.ITween;

        internal var ihide_t:org.libspark.betweenas3.tweens.ITween;

        internal var mc_pause_over:org.libspark.betweenas3.tweens.ITween;

        internal var txt:flash.text.TextField;

        internal var video:flash.media.Video;

        internal var interfacebgyposup:Number;

        internal var mc_fullscreen_over:org.libspark.betweenas3.tweens.ITween;

        internal var mc_volume:flash.display.MovieClip;

        internal var hsave:Number;

        internal var tooltiparrow:flash.display.Shape;

        internal var imageLoaderContext:flash.system.LoaderContext;

        internal var interface_seekbg:flash.display.Sprite;

        internal var interfaceypos:Number;

        internal var xsave:Number;

        internal var interface_fullscreen:flash.display.Sprite;

        internal var wsave:Number;

        internal var _stage:flash.display.Stage;
    }
}
