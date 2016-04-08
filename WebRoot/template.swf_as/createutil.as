package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createutil extends flash.display.MovieClip
    {
        public function createutil(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            var loc4:*=null;
            var loc5:*=null;
            var loc6:*=null;
            var loc7:*=null;
            var loc8:*=null;
            var loc9:*=null;
            this.music = new musicicon();
            this.fullscreen = new fullscreenicon();
            this.mutei = new muteicon();
            this.musicmc = new flash.display.MovieClip();
            this.fullscreenmc = new flash.display.MovieClip();
            this.mutemc = new flash.display.MovieClip();
            this.musicplayerholder = new flash.display.MovieClip();
            this.musicplayermc = new flash.display.MovieClip();
            this.solidbg = new flash.display.Sprite();
            this.pixel = new flash.display.Sprite();
            this.bg = new flash.display.Sprite();
            this.mc_volume = new flash.display.MovieClip();
            this.mc_volumebg = new flash.display.MovieClip();
            this.mc_volumebar = new flash.display.MovieClip();
            this.mc_interfacebg = new flash.display.MovieClip();
            this.mc_close = new flash.display.MovieClip();
            this.mc_play = new flash.display.MovieClip();
            this.mc_pause = new flash.display.MovieClip();
            this.icon_volume = new music_volume();
            this.icon_close = new music_close();
            this.icon_play = new music_play();
            this.icon_pause = new music_pause();
            this.icon_volume_ct = this.icon_volume.transform.colorTransform;
            this.icon_close_ct = this.icon_volume.transform.colorTransform;
            this.icon_play_ct = this.icon_play.transform.colorTransform;
            this.icon_pause_ct = this.icon_pause.transform.colorTransform;
            this.interface_volume = new flash.display.Sprite();
            this.interface_volumebg = new flash.display.Sprite();
            this.interface_volumebar = new flash.display.Sprite();
            this.interface_play = new flash.display.Sprite();
            this.interface_pause = new flash.display.Sprite();
            this.interface_close = new flash.display.Sprite();
            this.songs = new Array();
            super();
            this._stage = arg1;
            this._root = arg2;
            this.music.x = Math.round(this.music.width);
            this.fullscreen.x = Math.round(this.fullscreen.width);
            this.colorTrans(this.music, this._root.musicfullscreencolor);
            this.colorTrans(this.fullscreen, this._root.musicfullscreencolor);
            this.colorTrans(this.mutei, this._root.musicfullscreencolor);
            this.musicmc.addChild(this.music);
            this.fullscreenmc.addChild(this.fullscreen);
            this.mutemc.addChild(this.mutei);
            var loc10:*;
            this.mutemc.alpha = loc10 = 0;
            this.fullscreenmc.alpha = loc10 = loc10;
            this.musicmc.alpha = loc10;
            this.mutemc.mouseEnabled = loc10 = true;
            this.fullscreenmc.mouseEnabled = loc10 = loc10;
            this.musicmc.mouseEnabled = loc10;
            this.mutemc.buttonMode = loc10 = true;
            this.fullscreenmc.buttonMode = loc10 = loc10;
            this.musicmc.buttonMode = loc10;
            this.volumesave = loc10 = this._root.musicstartvolume;
            this.startvolume = loc10;
            this._stage.addChild(this);
            if (this._root.musicactivated == "true") 
            {
                this.addChild(this.musicmc);
                this.addChild(this.mutemc);
            }
            this.addChild(this.fullscreenmc);
            if (this._root.musicactivated == "true") 
            {
                org.libspark.betweenas3.BetweenAS3.apply(this.musicmc, {"_blurFilter":{"blurX":5, "blurY":5, "quality":1}});
                loc4 = org.libspark.betweenas3.BetweenAS3.to(this.musicmc, {"alpha":this._root.musicfullscreenopacity}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
                loc5 = org.libspark.betweenas3.BetweenAS3.to(this.musicmc, {"_blurFilter":{"blurX":0, "blurY":0, "quality":1}}, 1, org.libspark.betweenas3.easing.Sine.easeOut);
                (loc6 = org.libspark.betweenas3.BetweenAS3.parallel(loc4, loc5)).play();
                org.libspark.betweenas3.BetweenAS3.apply(this.mutemc, {"_blurFilter":{"blurX":5, "blurY":5, "quality":1}});
                loc7 = org.libspark.betweenas3.BetweenAS3.to(this.mutemc, {"alpha":this._root.musicfullscreenopacity}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
                loc8 = org.libspark.betweenas3.BetweenAS3.to(this.mutemc, {"_blurFilter":{"blurX":0, "blurY":0, "quality":1}}, 1, org.libspark.betweenas3.easing.Sine.easeOut);
                (loc9 = org.libspark.betweenas3.BetweenAS3.parallel(loc7, loc8)).play();
            }
            org.libspark.betweenas3.BetweenAS3.apply(this.fullscreenmc, {"_blurFilter":{"blurX":5, "blurY":5, "quality":1}});
            var loc1:*=org.libspark.betweenas3.BetweenAS3.to(this.fullscreenmc, {"alpha":this._root.musicfullscreenopacity}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
            var loc2:*=org.libspark.betweenas3.BetweenAS3.to(this.fullscreenmc, {"_blurFilter":{"blurX":0, "blurY":0, "quality":1}}, 1, org.libspark.betweenas3.easing.Sine.easeOut);
            var loc3:*;
            (loc3 = org.libspark.betweenas3.BetweenAS3.parallel(loc1, loc2)).play();
            if (this._root.musicactivated != "true") 
            {
                this.musicplayermask = new flash.display.Sprite();
                this.musicplayerholder.visible = false;
                this.musicplayermask.visible = false;
                this._stage.addChildAt(this.musicplayerholder, 5);
                this._stage.addChildAt(this.musicplayermask, 6);
            }
            else 
            {
                this.musicmc.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.m_mouse_over);
                this.musicmc.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.m_mouse_out);
                this.musicmc.addEventListener(flash.events.MouseEvent.CLICK, this.m_mouse_press);
                this.mutemc.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_mute_overf);
                this.mutemc.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_mute_outf);
                this.mutemc.addEventListener(flash.events.MouseEvent.CLICK, this.mc_mute_clickf);
                this.initMusicPlayer();
            }
            this.fullscreenmc.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.f_mouse_over);
            this.fullscreenmc.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.f_mouse_out);
            this.fullscreenmc.addEventListener(flash.events.MouseEvent.CLICK, this.startFullscreen);
            this._stage.addEventListener(flash.events.Event.FULLSCREEN, this.fullScreenMode);
            this._stage.addEventListener(flash.events.Event.ADDED, this.onStageResize, false, 0, true);
            this._stage.addEventListener(flash.events.Event.RESIZE, this.onStageResize);
            return;
        }

        public function hideUtil():void
        {
            this.musicplayerholder.visible = false;
            this.musicmc.visible = false;
            this.fullscreenmc.visible = false;
            this.mutemc.visible = false;
            return;
        }

        internal function initMusicPlayer():void
        {
            this.maskheight = this._root.musiclength * this._root.musicentryheight + this._root.musicvolumeheight + this._root.musicplayerpadding * 2;
            this.maskwidth = this._root.musicplayerwidth + this._root.musicplayerpadding * 2;
            var loc1:*=0;
            this.musicplayermask = new flash.display.Sprite();
            this.musicplayermask.graphics.beginFill(0);
            this.musicplayermask.graphics.drawRect(0, 0, this.maskwidth, this.maskheight);
            this.musicplayermask.graphics.endFill();
            this.musicplayermask.mouseEnabled = false;
            this.musicplayermc.x = this._root.musicplayerpadding;
            this.musicplayermc.y = this._root.musicplayerpadding + this._root.musicvolumeheight;
            this.musicplayerholder.mouseEnabled = false;
            this.musicplayerholder.mask = this.musicplayermask;
            this.solidbg.graphics.beginFill(this._root.footerbgcolor);
            this.solidbg.graphics.drawRect(0, 0, this.maskwidth, this.maskheight);
            this.solidbg.graphics.endFill();
            this.pixel.graphics.beginFill(this._root.footerpixelcolor, 1);
            this.pixel.graphics.drawRect(0, 0, 1, 1);
            this.pixel.graphics.drawRect(1, 1, 1, 1);
            this.pixel.graphics.endFill();
            this.bgTile = new flash.display.BitmapData(2, 2, true, this._root.footerpixelcolor);
            this.bgTile.draw(this.pixel);
            this.bg.alpha = this._root.footerpixelopacity;
            this.bg.graphics.beginBitmapFill(this.bgTile, null, true, false);
            this.bg.graphics.drawRect(0, 0, this.maskwidth, this.maskheight);
            this.bg.graphics.endFill();
            this.musicplayerholder.addChild(this.solidbg);
            this.musicplayerholder.addChild(this.bg);
            this.musicplayerholder.addChild(this.musicplayermc);
            var loc2:*=0;
            while (loc2 < this._root.musiclength) 
            {
                this.songs[loc2] = new song(this._root, this._stage, this.musicplayermc, loc2, loc1, this);
                loc1 = loc1 + this._root.musicentryheight;
                ++loc2;
            }
            this.createVolume();
            this.createPlayPause();
            this.createClose();
            this.addPlayerListeners();
            var loc3:*;
            this.musicplayermask.x = loc3 = this._stage.stageWidth;
            this.musicplayerholder.x = loc3;
            this._stage.addChildAt(this.musicplayerholder, 5);
            this._stage.addChildAt(this.musicplayermask, 6);
            return;
        }

        internal function volumeScrubFunction(arg1:flash.events.MouseEvent):void
        {
            if (this.isplaying) 
            {
                this.mute = false;
                this.mc_volume.alpha = 1;
                this.mutei.gotoAndStop(1);
                this.mc_volumebar.addEventListener(flash.events.Event.ENTER_FRAME, this.volumeScrubFunctionFrame, false, 0, true);
            }
            return;
        }

        internal function m_mouse_press(arg1:*):void
        {
            if (this.t_player != null) 
            {
                this.t_player.stop();
            }
            if (this.playeropen) 
            {
                this.playeropen = false;
                this.musicplayerholder.mouseEnabled = false;
                this.t_player = org.libspark.betweenas3.BetweenAS3.to(this.musicplayermask, {"y":this._stage.stageHeight - this._root.footerheight}, 0.8, org.libspark.betweenas3.easing.Expo.easeInOut);
            }
            else 
            {
                this.playeropen = true;
                this.musicplayerholder.mouseEnabled = true;
                this.t_player = org.libspark.betweenas3.BetweenAS3.to(this.musicplayermask, {"y":this._stage.stageHeight - this.maskheight - this._root.footerheight}, 0.8, org.libspark.betweenas3.easing.Expo.easeInOut);
            }
            this.t_player.play();
            return;
        }

        internal function mc_close_clickf(arg1:flash.events.MouseEvent):void
        {
            this.m_mouse_press(null);
            return;
        }

        internal function mc_pause_clickf(arg1:flash.events.MouseEvent):void
        {
            if (this.isplaying) 
            {
                if (!this.pausevar) 
                {
                    this.pausevar = true;
                    this.activepausevar = true;
                    this.mc_play.visible = true;
                    this.mc_pause.visible = false;
                    this.songresumepos = this.channel.position;
                    this.channel.stop();
                    this.mutei.gotoAndStop(2);
                }
            }
            return;
        }

        public function playSong():void
        {
            var loc1:*;
            this.soundRequest = new flash.net.URLRequest(this._root.musicdata_array[this.activesongid]["urllink"]);
            this.sound = new flash.media.Sound();
            this.channel = new flash.media.SoundChannel();
            this.stransform = new flash.media.SoundTransform(1, 0);
            this.sound.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function (arg1:flash.events.IOErrorEvent):void
            {
                return;
            }, false, 0, true)
            this.sound.load(this.soundRequest);
            if (this.mute) 
            {
                this.stransform.volume = 0;
            }
            else 
            {
                this.stransform.volume = this.volumesave;
            }
            this.startPlay();
            return;
        }

        internal function playNextSong(arg1:flash.events.Event):void
        {
            if (this.activesongid < (this._root.musiclength - 1)) 
            {
                var loc1:*;
                var loc2:*=((loc1 = this).activesongid + 1);
                loc1.activesongid = loc2;
            }
            else if (this.activesongid == (this._root.musiclength - 1)) 
            {
                this.activesongid = 0;
            }
            this.songs[this.activesongid].selectEntry();
            return;
        }

        public function stopSong():void
        {
            var loc1:*;
            try 
            {
                if (this.sound.hasEventListener(flash.events.Event.COMPLETE)) 
                {
                    this.sound.removeEventListener(flash.events.Event.COMPLETE, this.startPlay);
                }
                this.channel.stop();
                this.sound.close();
            }
            catch (e:Error)
            {
            };
            this.soundRequest = null;
            this.sound = null;
            this.channel = null;
            this.stransform = null;
            this.isplaying = false;
            return;
        }

        internal function createVolume():void
        {
            this.interface_volume.graphics.beginFill(this._root.musicentrybgcolor);
            this.interface_volume.graphics.drawRect(0, 0, this._root.musicplayerwidth, this._root.musicvolumeheight);
            this.interface_volume.graphics.endFill();
            this.interface_volume.mouseEnabled = false;
            this.icon_volume.x = 10;
            this.icon_volume.y = Math.round(this._root.musicvolumeheight / 2 - this.icon_volume.height / 2);
            this.icon_volume_ct.color = this._root.musiciconcolor;
            this.icon_volume.transform.colorTransform = this.icon_volume_ct;
            this.interface_volumebg.graphics.beginFill(this._root.musicvolumebgcolor);
            this.interface_volumebg.graphics.drawRect(0, 0, 1, 5);
            this.interface_volumebg.graphics.endFill();
            this.interface_volumebg.mouseEnabled = false;
            this.interface_volumebar.graphics.beginFill(this._root.musicvolumecolor);
            this.interface_volumebar.graphics.drawRect(0, 0, 1, 5);
            this.interface_volumebar.graphics.endFill();
            this.interface_volumebar.mouseEnabled = false;
            this.mc_volume.addChild(this.interface_volume);
            this.mc_volume.addChild(this.icon_volume);
            this.mc_volumebg.addChild(this.interface_volumebg);
            this.mc_volumebar.addChild(this.interface_volumebar);
            this.mc_volumebar.mouseEnabled = false;
            this.mc_volumebg.mouseEnabled = true;
            this.mc_volumebg.buttonMode = true;
            this.icon_volume.buttonMode = true;
            this.mc_volume.addChild(this.mc_volumebg);
            this.mc_volume.addChild(this.mc_volumebar);
            this.mc_volumebg.width = this._root.musicplayerwidth - 30 - this.icon_volume.width - this._root.musicvolumeheight * 2;
            this.mc_volumebar.width = Math.round(this.mc_volumebg.width * this.startvolume);
            var loc1:*;
            this.mc_volume.y = loc1 = this._root.musicplayerpadding;
            this.mc_volume.x = loc1;
            this.mc_volumebar.x = loc1 = this._root.musicplayerpadding + 25;
            this.mc_volumebg.x = loc1;
            this.mc_volumebar.y = loc1 = Math.round(this._root.musicvolumeheight / 2 - this.mc_volumebar.height / 2) + this._root.musicplayerpadding;
            this.mc_volumebg.y = loc1;
            this.musicplayerholder.addChild(this.mc_volume);
            this.musicplayerholder.addChild(this.mc_volumebg);
            this.musicplayerholder.addChild(this.mc_volumebar);
            return;
        }

        internal function m_mouse_over(arg1:*):void
        {
            if (this.t_music != null) 
            {
                this.t_music.stop();
            }
            this.t_music = org.libspark.betweenas3.BetweenAS3.to(this.musicmc, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.t_music.play();
            return;
        }

        internal function createClose():void
        {
            this.interface_close.graphics.beginFill(this._root.musicbuttoncolor);
            this.interface_close.graphics.drawRect(0, 0, this._root.musicvolumeheight, this._root.musicvolumeheight);
            this.interface_close.graphics.endFill();
            this.interface_close.mouseEnabled = false;
            this.icon_close.x = Math.round(this._root.musicvolumeheight / 2 - this.icon_close.width / 2);
            this.icon_close.y = Math.round(this._root.musicvolumeheight / 2 - this.icon_close.height / 2);
            this.icon_close_ct.color = this._root.musiciconcolor;
            this.icon_close.transform.colorTransform = this.icon_volume_ct;
            this.mc_close.addChild(this.interface_close);
            this.mc_close.addChild(this.icon_close);
            this.mc_close.x = this._root.musicplayerwidth - this._root.musicvolumeheight + this._root.musicplayerpadding;
            this.mc_close.y = this._root.musicplayerpadding;
            this.mc_close.buttonMode = true;
            this.mc_close.alpha = 0.4;
            this.musicplayerholder.addChild(this.mc_close);
            return;
        }

        internal function volumeScrubFunctionFrame(arg1:flash.events.Event):void
        {
            if (this.mc_volumebg.hitTestPoint(this._stage.mouseX, this._stage.mouseY, false)) 
            {
                this.mc_volumebar.width = Math.round(this.mc_volume.mouseX - this.mc_volumebar.x) + this._root.musicplayerpadding;
                this.volumesave = this.mc_volumebar.width / this.mc_volumebg.width;
                this.volumeSet(this.volumesave);
            }
            return;
        }

        internal function colorTrans(arg1:flash.display.MovieClip, arg2:uint):void
        {
            var loc1:*=arg1.transform.colorTransform;
            loc1.color = arg2;
            arg1.transform.colorTransform = loc1;
            return;
        }

        internal function mc_close_outf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_close_over != null) 
            {
                this.mc_close_over.stop();
            }
            this.mc_close_out = org.libspark.betweenas3.BetweenAS3.to(this.mc_close, {"alpha":0.4}, 0.7, org.libspark.betweenas3.easing.Expo.easeOut);
            this.mc_close_out.play();
            return;
        }

        internal function f_mouse_out(arg1:*):void
        {
            if (this.t_fullscreen != null) 
            {
                this.t_fullscreen.stop();
            }
            this.t_fullscreen = org.libspark.betweenas3.BetweenAS3.to(this.fullscreenmc, {"alpha":this._root.musicfullscreenopacity}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.t_fullscreen.play();
            return;
        }

        internal function mc_play_clickf(arg1:flash.events.MouseEvent):void
        {
            if (this.isplaying) 
            {
                if (this.pausevar) 
                {
                    this.pausevar = false;
                    this.activepausevar = false;
                    this.mc_play.visible = false;
                    this.mc_pause.visible = true;
                    this.channel = this.sound.play(this.songresumepos);
                    this.volumeSet(this.volumesave);
                    this.mutei.gotoAndStop(1);
                }
            }
            return;
        }

        internal function addPlayerListeners():void
        {
            this.mc_close.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_close_overf, false, 0, true);
            this.mc_close.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_close_outf, false, 0, true);
            this.mc_close.addEventListener(flash.events.MouseEvent.CLICK, this.mc_close_clickf);
            this.mc_play.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_play_overf, false, 0, true);
            this.mc_play.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_play_outf, false, 0, true);
            this.mc_play.addEventListener(flash.events.MouseEvent.CLICK, this.mc_play_clickf);
            this.mc_pause.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_pause_overf, false, 0, true);
            this.mc_pause.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_pause_outf, false, 0, true);
            this.mc_pause.addEventListener(flash.events.MouseEvent.CLICK, this.mc_pause_clickf);
            this.icon_volume.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mc_volume_overf, false, 0, true);
            this.icon_volume.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mc_volume_outf, false, 0, true);
            this.icon_volume.addEventListener(flash.events.MouseEvent.CLICK, this.mc_volume_clickf);
            this._stage.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.mouseRelease);
            this.mc_volumebg.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.volumeScrubFunction);
            return;
        }

        public function extPause():void
        {
            if (this._root.musicactivated == "true" && !this.activepausevar) 
            {
                this.pausevar = true;
                this.mc_play.visible = true;
                this.mc_pause.visible = false;
                this.songresumepos = this.channel.position;
                this.channel.stop();
            }
            return;
        }

        internal function m_mouse_out(arg1:*):void
        {
            if (this.t_music != null) 
            {
                this.t_music.stop();
            }
            this.t_music = org.libspark.betweenas3.BetweenAS3.to(this.musicmc, {"alpha":this._root.musicfullscreenopacity}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.t_music.play();
            return;
        }

        internal function mc_play_overf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_play_out != null) 
            {
                this.mc_play_out.stop();
            }
            this.mc_play_over = org.libspark.betweenas3.BetweenAS3.to(this.mc_play, {"alpha":1}, 0.7, org.libspark.betweenas3.easing.Expo.easeOut);
            this.mc_play_over.play();
            return;
        }

        internal function createPlayPause():void
        {
            this.interface_play.graphics.beginFill(this._root.musicbuttoncolor);
            this.interface_play.graphics.drawRect(0, 0, this._root.musicvolumeheight, this._root.musicvolumeheight);
            this.interface_play.graphics.endFill();
            this.interface_play.mouseEnabled = false;
            this.interface_pause.graphics.beginFill(this._root.musicbuttoncolor);
            this.interface_pause.graphics.drawRect(0, 0, this._root.musicvolumeheight, this._root.musicvolumeheight);
            this.interface_pause.graphics.endFill();
            this.interface_pause.mouseEnabled = false;
            this.icon_play.x = Math.round(this._root.musicvolumeheight / 2 - this.icon_play.width / 2);
            this.icon_play.y = Math.round(this._root.musicvolumeheight / 2 - this.icon_play.height / 2);
            this.icon_play_ct.color = this._root.musiciconcolor;
            this.icon_play.transform.colorTransform = this.icon_play_ct;
            this.icon_pause.x = Math.round(this._root.musicvolumeheight / 2 - this.icon_pause.width / 2);
            this.icon_pause.y = Math.round(this._root.musicvolumeheight / 2 - this.icon_pause.height / 2);
            this.icon_pause_ct.color = this._root.musiciconcolor;
            this.icon_pause.transform.colorTransform = this.icon_pause_ct;
            this.mc_play.addChild(this.interface_play);
            this.mc_play.addChild(this.icon_play);
            this.mc_pause.addChild(this.interface_pause);
            this.mc_pause.addChild(this.icon_pause);
            var loc1:*;
            this.mc_pause.x = loc1 = (this._root.musicplayerwidth - this._root.musicvolumeheight * 2 + this._root.musicplayerpadding - 1);
            this.mc_play.x = loc1;
            this.mc_pause.y = loc1 = this._root.musicplayerpadding;
            this.mc_play.y = loc1;
            this.mc_pause.buttonMode = loc1 = true;
            this.mc_play.buttonMode = loc1;
            this.mc_pause.alpha = loc1 = 0.4;
            this.mc_play.alpha = loc1;
            this.mc_play.visible = false;
            this.pausevar = false;
            this.activepausevar = false;
            this.songs[0].selectEntry();
            this.musicplayerholder.addChild(this.mc_play);
            this.musicplayerholder.addChild(this.mc_pause);
            return;
        }

        internal function mc_pause_overf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_pause_out != null) 
            {
                this.mc_pause_out.stop();
            }
            this.mc_pause_over = org.libspark.betweenas3.BetweenAS3.to(this.mc_pause, {"alpha":1}, 0.7, org.libspark.betweenas3.easing.Expo.easeOut);
            this.mc_pause_over.play();
            return;
        }

        internal function mc_mute_clickf(arg1:flash.events.MouseEvent):void
        {
            if (this.isplaying) 
            {
                if (this.pausevar) 
                {
                    this.pausevar = false;
                    this.activepausevar = false;
                    this.mc_play.visible = false;
                    this.mc_pause.visible = true;
                    this.channel = this.sound.play(this.songresumepos);
                    this.volumeSet(this.volumesave);
                    this.mutei.gotoAndStop(1);
                }
                else if (!this.pausevar) 
                {
                    this.pausevar = true;
                    this.activepausevar = true;
                    this.mc_play.visible = true;
                    this.mc_pause.visible = false;
                    this.songresumepos = this.channel.position;
                    this.channel.stop();
                    this.mutei.gotoAndStop(2);
                }
            }
            return;
        }

        public function showUtil():void
        {
            this.musicplayerholder.visible = true;
            this.musicmc.visible = true;
            this.fullscreenmc.visible = true;
            this.mutemc.visible = true;
            return;
        }

        internal function mc_play_outf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_play_over != null) 
            {
                this.mc_play_over.stop();
            }
            this.mc_play_out = org.libspark.betweenas3.BetweenAS3.to(this.mc_play, {"alpha":0.4}, 0.7, org.libspark.betweenas3.easing.Expo.easeOut);
            this.mc_play_out.play();
            return;
        }

        internal function mouseRelease(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_volumebar.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                this.mc_volumebar.removeEventListener(flash.events.Event.ENTER_FRAME, this.volumeScrubFunctionFrame);
            }
            return;
        }

        internal function f_mouse_over(arg1:*):void
        {
            if (this.t_fullscreen != null) 
            {
                this.t_fullscreen.stop();
            }
            this.t_fullscreen = org.libspark.betweenas3.BetweenAS3.to(this.fullscreenmc, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.t_fullscreen.play();
            return;
        }

        internal function mc_mute_overf(arg1:flash.events.MouseEvent):void
        {
            if (this.t_mute != null) 
            {
                this.t_mute.stop();
            }
            this.t_mute = org.libspark.betweenas3.BetweenAS3.to(this.mutemc, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.t_mute.play();
            return;
        }

        internal function startPlay():void
        {
            this.isplaying = true;
            this.channel = this.sound.play(0);
            this.channel.soundTransform = this.stransform;
            if (this.channel.hasEventListener(flash.events.Event.SOUND_COMPLETE)) 
            {
                this.channel.removeEventListener(flash.events.Event.SOUND_COMPLETE, this.playNextSong);
            }
            this.channel.addEventListener(flash.events.Event.SOUND_COMPLETE, this.playNextSong);
            return;
        }

        internal function mc_volume_clickf(arg1:flash.events.MouseEvent):void
        {
            if (this.isplaying) 
            {
                if (this.mute) 
                {
                    this.mute = false;
                    this.volumeSet(this.volumesave);
                    this.mc_volumebar.width = Math.round(this.mc_volumebg.width * this.volumesave);
                    this.mc_volume.alpha = 1;
                    this.mutei.gotoAndStop(1);
                }
                else 
                {
                    this.mute = true;
                    this.volumeSet(0);
                    this.mc_volumebar.width = 0;
                    this.mc_volume.alpha = 0.4;
                    this.mutei.gotoAndStop(2);
                }
            }
            return;
        }

        internal function mc_volume_overf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_volume_out != null) 
            {
                this.mc_volume_out.stop();
            }
            this.mc_volume_over = org.libspark.betweenas3.BetweenAS3.to(this.icon_volume, {"alpha":0.4}, 0.7, org.libspark.betweenas3.easing.Expo.easeOut);
            this.mc_volume_over.play();
            return;
        }

        internal function mc_volume_outf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_volume_over != null) 
            {
                this.mc_volume_over.stop();
            }
            this.mc_volume_out = org.libspark.betweenas3.BetweenAS3.to(this.icon_volume, {"alpha":1}, 0.7, org.libspark.betweenas3.easing.Expo.easeOut);
            this.mc_volume_out.play();
            return;
        }

        internal function mc_pause_outf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_pause_over != null) 
            {
                this.mc_pause_over.stop();
            }
            this.mc_pause_out = org.libspark.betweenas3.BetweenAS3.to(this.mc_pause, {"alpha":0.4}, 0.7, org.libspark.betweenas3.easing.Expo.easeOut);
            this.mc_pause_out.play();
            return;
        }

        internal function mc_mute_outf(arg1:flash.events.MouseEvent):void
        {
            if (this.t_mute != null) 
            {
                this.t_mute.stop();
            }
            this.t_mute = org.libspark.betweenas3.BetweenAS3.to(this.mutemc, {"alpha":this._root.musicfullscreenopacity}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.t_mute.play();
            return;
        }

        internal function fullScreenMode(arg1:flash.events.FullScreenEvent):void
        {
            if (arg1.fullScreen) 
            {
                this._root.fsvar_stage = true;
            }
            else 
            {
                this._root.fsvar_stage = false;
            }
            return;
        }

        public function unPause():void
        {
            this.pausevar = false;
            this.mc_play.visible = false;
            this.mc_pause.visible = true;
            this.mutei.gotoAndStop(1);
            return;
        }

        internal function startFullscreen(arg1:flash.events.MouseEvent):void
        {
            if (this._stage.displayState != flash.display.StageDisplayState.NORMAL) 
            {
                this._stage.displayState = flash.display.StageDisplayState.NORMAL;
                this._root.fsvar_stage = false;
            }
            else 
            {
                this._stage.displayState = flash.display.StageDisplayState.FULL_SCREEN;
                this._root.fsvar_stage = true;
            }
            return;
        }

        internal function volumeSet(arg1:Number):void
        {
            this.stransform.volume = arg1;
            this.channel.soundTransform = this.stransform;
            return;
        }

        internal function mc_close_overf(arg1:flash.events.MouseEvent):void
        {
            if (this.mc_close_out != null) 
            {
                this.mc_close_out.stop();
            }
            this.mc_close_over = org.libspark.betweenas3.BetweenAS3.to(this.mc_close, {"alpha":1}, 0.7, org.libspark.betweenas3.easing.Expo.easeOut);
            this.mc_close_over.play();
            return;
        }

        public function extPlay():void
        {
            if (this._root.musicactivated == "true" && !this.activepausevar) 
            {
                this.pausevar = false;
                this.mc_play.visible = false;
                this.mc_pause.visible = true;
                this.channel = this.sound.play(this.songresumepos);
                this.volumeSet(this.volumesave);
                this.mc_volumebar.width = Math.round(this.mc_volumebg.width * this.volumesave);
                this.mc_volume.alpha = 1;
            }
            return;
        }

        internal function onStageResize(arg1:flash.events.Event):void
        {
            this.fullscreenmc.x = Math.round(this._stage.stageWidth / 2 + this._root.templatewidth / 2 - this._root.footerpadding * 2 - this.fullscreenmc.width) - this._root.musicfullscreenrightpadding;
            this.fullscreenmc.y = Math.round(this._stage.stageHeight - this._root.footerheight / 2 - this.fullscreenmc.height / 2) - this._root.musicfullscreenbottompadding;
            if (this._root.musicactivated == "true") 
            {
                this.musicmc.x = this.fullscreenmc.x - Math.round(this.musicmc.width) - 5;
                this.mutemc.x = this.musicmc.x - Math.round(this.mutemc.width) + 12;
                this.musicmc.y = Math.round(this._stage.stageHeight - this._root.footerheight / 2 - this.musicmc.height / 2) - this._root.musicfullscreenbottompadding;
                this.mutemc.y = Math.round(this._stage.stageHeight - this._root.footerheight / 2 - this.musicmc.height / 2) - this._root.musicfullscreenbottompadding + 5;
                var loc1:*;
                this.musicplayermask.x = loc1 = Math.round(this._stage.stageWidth / 2 + this._root.templatewidth / 2) - this._root.footerpadding - this._root.musicplayerwidth - this._root.musicplayerpadding * 2;
                this.musicplayerholder.x = loc1;
                this.musicplayerholder.y = this._stage.stageHeight - this.maskheight - this._root.footerheight;
                if (this.playeropen) 
                {
                    this.musicplayermask.y = this._stage.stageHeight - this.maskheight - this._root.footerheight;
                }
                else 
                {
                    this.musicplayermask.y = this._stage.stageHeight - this._root.footerheight;
                }
            }
            return;
        }

        internal var stransform:flash.media.SoundTransform;

        internal var maskwidth:int;

        internal var musicplayermc:flash.display.MovieClip;

        internal var icon_pause_ct:flash.geom.ColorTransform;

        internal var mc_volumebg:flash.display.MovieClip;

        internal var t_fullscreen:org.libspark.betweenas3.tweens.ITween;

        internal var mutemc:flash.display.MovieClip;

        internal var interface_pause:flash.display.Sprite;

        public var pausevar:Boolean;

        public var musicplayerholder:flash.display.MovieClip;

        public var activesongid:int=0;

        internal var mutei:flash.display.MovieClip;

        internal var interface_close:flash.display.Sprite;

        internal var interface_play:flash.display.Sprite;

        internal var musicmc:flash.display.MovieClip;

        public var activepausevar:Boolean;

        internal var icon_volume_ct:flash.geom.ColorTransform;

        internal var soundRequest:flash.net.URLRequest;

        internal var channel:flash.media.SoundChannel;

        internal var pixel:flash.display.Sprite;

        internal var t_mute:org.libspark.betweenas3.tweens.ITween;

        internal var startvolume:Number;

        internal var mc_pause:flash.display.MovieClip;

        internal var fullscreenmc:flash.display.MovieClip;

        internal var songresumepos:Number;

        internal var bgTile:flash.display.BitmapData;

        internal var mc_close:flash.display.MovieClip;

        internal var icon_play_ct:flash.geom.ColorTransform;

        internal var volumesave:Number;

        internal var maskheight:int;

        internal var t_music:org.libspark.betweenas3.tweens.ITween;

        internal var mc_interfacebg:flash.display.MovieClip;

        internal var mc_play_over:org.libspark.betweenas3.tweens.ITween;

        internal var sound:flash.media.Sound;

        internal var icon_volume:flash.display.MovieClip;

        internal var mute:Boolean=false;

        public var activesong:flash.display.MovieClip;

        internal var playeropen:Boolean=false;

        internal var mc_pause_out:org.libspark.betweenas3.tweens.ITween;

        internal var icon_pause:flash.display.MovieClip;

        internal var icon_close:flash.display.MovieClip;

        internal var music:musicicon;

        internal var icon_close_ct:flash.geom.ColorTransform;

        internal var mc_volume_over:org.libspark.betweenas3.tweens.ITween;

        internal var solidbg:flash.display.Sprite;

        internal var fullscreen:fullscreenicon;

        internal var mc_close_over:org.libspark.betweenas3.tweens.ITween;

        internal var _root:flash.display.MovieClip;

        internal var musicplayermask:flash.display.Sprite;

        public var isplaying:Boolean=false;

        internal var interface_volumebar:flash.display.Sprite;

        internal var mc_pause_over:org.libspark.betweenas3.tweens.ITween;

        internal var interface_volumebg:flash.display.Sprite;

        internal var icon_play:flash.display.MovieClip;

        internal var mc_play:flash.display.MovieClip;

        internal var bg:flash.display.Sprite;

        internal var mc_volume:flash.display.MovieClip;

        internal var interface_volume:flash.display.Sprite;

        internal var mc_play_out:org.libspark.betweenas3.tweens.ITween;

        internal var mc_volumebar:flash.display.MovieClip;

        internal var mc_volume_out:org.libspark.betweenas3.tweens.ITween;

        internal var t_player:org.libspark.betweenas3.tweens.ITween;

        internal var mc_close_out:org.libspark.betweenas3.tweens.ITween;

        internal var songs:Array;

        internal var _stage:flash.display.Stage;
    }
}
