package alternatebannerlib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.net.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.events.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createbanner extends flash.display.MovieClip
    {
        public function createbanner(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            this.banner = new flash.display.MovieClip();
            this.bannermask = new flash.display.Sprite();
            this.slidemaskmc = new flash.display.MovieClip();
            this.slidemask = new flash.display.Sprite();
            this.circle_fill = new flash.display.Shape();
            this.circle_mask = new flash.display.Shape();
            this.timerbarmc = new flash.display.MovieClip();
            super();
            this._stage = arg1;
            this._root = arg2;
            this.idlergb = this.makeRGB(this._root.navigbuttonidlecolor);
            this.selectrgb = this.makeRGB(this._root.navigbuttonhovercolor);
            if (this._root.autoplay == "false") 
            {
                this.bannerpause = true;
            }
            this.bannermask.graphics.beginFill(0);
            this.bannermask.graphics.drawRect(0, 0, this._root.bannerwidth, this._root.bannerheight);
            this.bannermask.graphics.endFill();
            this.bannermask.mouseEnabled = false;
            this.bannermask.alpha = 0;
            this.slidemask.graphics.beginFill(0);
            this.slidemask.graphics.drawRect(0, 0, 10, 10);
            this.slidemask.graphics.endFill();
            this.slidemask.mouseEnabled = false;
            this.slidemask.alpha = 0;
            this.slidemaskmc.addChild(this.slidemask);
            this.circle_fill.graphics.moveTo(0, 0);
            this.circle_fill.graphics.lineTo(this.circ_radius, 0);
            this.circle_mask.graphics.beginFill(this._root.navigtimercolor, 1);
            this.circle_mask.graphics.drawCircle(0, 0, this.circ_radius);
            this.circle_mask.graphics.drawCircle(0, 0, this.circ_radius - (this.circ_radius - 15));
            this.timerbarmc.addChild(this.circle_fill);
            this.timerbarmc.addChild(this.circle_mask);
            this.circle_mask.mask = this.circle_fill;
            this.timerbarmc.rotation = 270;
            if (this._root.navigleftright != "true") 
            {
                this.timerbarmc.x = Math.round(this._root.bannerwidth / 2);
            }
            else 
            {
                this.timerbarmc.x = Math.round(this._root.bannerwidth / 2) - this._root.navigbuttonspacing - 30;
            }
            this.timerbarmc.y = this._root.bannerheight - this._root.navigbuttonpaddingbottom - 15;
            this.timerbarmc.mouseEnabled = false;
            this.timerbarmc.alpha = 0;
            this.banner.buttonMode = true;
            addChild(this.banner);
            addChild(this.slidemaskmc);
            addChild(this.timerbarmc);
            addChild(this.bannermask);
            this.banner.mask = this.bannermask;
            this.createNavigDots();
            this.loadNextSlide();
            this.banner.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click, false, 0, true);
            this._stage.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.moveIn, false, 0, true);
            this._stage.addEventListener(flash.events.Event.MOUSE_LEAVE, this.mouseLeave, false, 0, true);
            return;
        }

        public function setTimer():void
        {
            if (this.bannerpause) 
            {
                this.resetTimer();
                this.bannerreset = true;
            }
            return;
        }

        internal function fadeInTimer():void
        {
            if (this.timerfade_t != null) 
            {
                this.timerfade_t.stop();
                this.timerfade_t = null;
            }
            this.timerfade_t = org.libspark.betweenas3.BetweenAS3.to(this.timerbarmc, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.timerfade_t.play();
            return;
        }

        public function colorTrans(arg1:flash.display.MovieClip, arg2:uint):void
        {
            var loc1:*=arg1.transform.colorTransform;
            loc1.color = arg2;
            arg1.transform.colorTransform = loc1;
            return;
        }

        public function makeRGB(arg1:Number):Object
        {
            var loc1:*={"red":(arg1 & 16711680) >> 16, "green":(arg1 & 65280) >> 8, "blue":arg1 & 255};
            return loc1;
        }

        internal function checkMouse(arg1:flash.events.Event):void
        {
            if (this._root.bg.solidbg.hitTestPoint(this._stage.mouseX, this._stage.mouseY, false)) 
            {
                if (!this.over) 
                {
                    this.over = true;
                    this.mouse_over(null);
                }
            }
            return;
        }

        public function runTimer():void
        {
            this.resetTimer();
            if (parseInt(this._root.bannerdata_array[this.currentslideid]["entryshowtime"]) != 0) 
            {
                this.timevar = parseInt(this._root.bannerdata_array[this.currentslideid]["entryshowtime"]);
                this.timerbar_t = org.libspark.betweenas3.BetweenAS3.tween(this, {"circ_angle":360}, {"circ_angle":0}, this.timevar);
                this.timerbar_t.onUpdate = this.updateCircle;
                this.timerbar_t.addEventListener(org.libspark.betweenas3.events.TweenEvent.COMPLETE, this.onComplete);
                this.timerbar_t.play();
            }
            return;
        }

        internal function mouseLeave(arg1:flash.events.Event):void
        {
            if (this._stage.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                this._stage.removeEventListener(flash.events.Event.ENTER_FRAME, this.checkMouse);
            }
            if (this.over) 
            {
                this.over = false;
                this.mouse_out(null);
            }
            return;
        }

        internal function setHorizPos():void
        {
            if (this._root.bannerdata_array[this.currentslideid]["entryhorizontalorientation"] != "center") 
            {
                if (this._root.bannerdata_array[this.currentslideid]["entryhorizontalorientation"] != "left") 
                {
                    if (this._root.bannerdata_array[this.currentslideid]["entryhorizontalorientation"] == "right") 
                    {
                        this.slidemaskmc.x = loc1 = this._root.bannerwidth - this._root.bannerdata_array[this.currentslideid]["entrywidth"];
                        this.activeslide.x = loc1;
                    }
                }
                else 
                {
                    this.slidemaskmc.x = loc1 = 0;
                    this.activeslide.x = loc1;
                }
            }
            else 
            {
                var loc1:*;
                this.slidemaskmc.x = loc1 = Math.round(this._root.bannerwidth / 2 - this._root.bannerdata_array[this.currentslideid]["entrywidth"] / 2);
                this.activeslide.x = loc1;
            }
            return;
        }

        public function resetTimer():void
        {
            if (this._root.bannerdata_array[this.currentslideid]["entryclicklink"] == "") 
            {
                this.banner.mouseEnabled = false;
                this.banner.buttonMode = false;
            }
            else 
            {
                this.banner.mouseEnabled = true;
                this.banner.buttonMode = true;
            }
            if (this.timerbar_t != null) 
            {
                if (this.timerbar_t.hasEventListener(org.libspark.betweenas3.events.TweenEvent.COMPLETE)) 
                {
                    this.timerbar_t.removeEventListener(org.libspark.betweenas3.events.TweenEvent.COMPLETE, this.onComplete);
                }
                this.timerbar_t.stop();
            }
            this.circle_fill.graphics.clear();
            this.circle_fill.graphics.moveTo(0, 0);
            this.circle_fill.graphics.lineTo(this.circ_radius, 0);
            return;
        }

        internal function allowClicks2():void
        {
            this.clickallow2 = true;
            return;
        }

        public function resumeTimer():void
        {
            if (!this.timerbar_t.isPlaying && this.bannerpause) 
            {
                this.bannerpause = false;
                if (this.bannerreset) 
                {
                    this.runTimer();
                    this.bannerreset = false;
                }
                else 
                {
                    this.timerbar_t.togglePause();
                }
                this.playbtn.hideBtn();
                this.pausebtn.showBtn();
            }
            return;
        }

        internal function getEasing(arg1:*):*
        {
            var loc1:*=undefined;
            if (arg1 != "Back") 
            {
                if (arg1 != "Bounce") 
                {
                    if (arg1 != "Circ") 
                    {
                        if (arg1 != "Cubic") 
                        {
                            if (arg1 != "Elastic") 
                            {
                                if (arg1 != "Expo") 
                                {
                                    if (arg1 != "Linear") 
                                    {
                                        if (arg1 != "Quad") 
                                        {
                                            if (arg1 != "Quart") 
                                            {
                                                if (arg1 != "Quint") 
                                                {
                                                    if (arg1 == "Sine") 
                                                    {
                                                        loc1 = org.libspark.betweenas3.easing.Sine.easeOut;
                                                    }
                                                }
                                                else 
                                                {
                                                    loc1 = org.libspark.betweenas3.easing.Quint.easeOut;
                                                }
                                            }
                                            else 
                                            {
                                                loc1 = org.libspark.betweenas3.easing.Quart.easeOut;
                                            }
                                        }
                                        else 
                                        {
                                            loc1 = org.libspark.betweenas3.easing.Quad.easeOut;
                                        }
                                    }
                                    else 
                                    {
                                        loc1 = org.libspark.betweenas3.easing.Linear.easeOut;
                                    }
                                }
                                else 
                                {
                                    loc1 = org.libspark.betweenas3.easing.Expo.easeOut;
                                }
                            }
                            else 
                            {
                                loc1 = org.libspark.betweenas3.easing.Elastic.easeOut;
                            }
                        }
                        else 
                        {
                            loc1 = org.libspark.betweenas3.easing.Cubic.easeOut;
                        }
                    }
                    else 
                    {
                        loc1 = org.libspark.betweenas3.easing.Circ.easeOut;
                    }
                }
                else 
                {
                    loc1 = org.libspark.betweenas3.easing.Bounce.easeOut;
                }
            }
            else 
            {
                loc1 = org.libspark.betweenas3.easing.Back.easeOut;
            }
            return loc1;
        }

        internal function mouse_click(arg1:*):void
        {
            var urllinktarget:String;
            var urllinkrequest:flash.net.URLRequest;
            var urllink:String;
            var event:*;

            var loc1:*;
            urllink = null;
            urllinkrequest = null;
            urllinktarget = null;
            event = arg1;
            if (this._root.bannerdata_array[this.currentslideid]["entryclicklink"] != "") 
            {
                urllink = this._root.bannerdata_array[this.currentslideid]["entryclicklink"];
                urllinkrequest = new flash.net.URLRequest(urllink);
                urllinktarget = this._root.bannerdata_array[this.currentslideid]["entryclicklinktarget"];
                try 
                {
                    flash.net.navigateToURL(urllinkrequest, urllinktarget);
                }
                catch (e:Error)
                {
                    trace("ERROR NAVIGATING TO URL");
                }
            }
            return;
        }

        internal function moveInText():void
        {
            this.texttargx = this._root.bannerdata_array[this.currentslideid]["textbackgroundxpos"];
            this.texttargy = this._root.bannerdata_array[this.currentslideid]["textbackgroundypos"];
            var loc1:*=org.libspark.betweenas3.BetweenAS3.to(this.activetext, {"x":this.texttargx, "y":this.texttargy}, this._root.texttransitiontime, this.getEasing(this._root.texteasetype));
            var loc2:*=org.libspark.betweenas3.BetweenAS3.delay(loc1, this._root.texttransitiondelay);
            if (this.activetext_t != null) 
            {
                this.activetext_t.stop();
            }
            this.activetext_t = org.libspark.betweenas3.BetweenAS3.parallel(loc1, loc2);
            this.activetext_t.onComplete = this.allowClicks2;
            this.activetext_t.play();
            return;
        }

        internal function fadeOutTimer():void
        {
            if (this.timerfade_t != null) 
            {
                this.timerfade_t.stop();
                this.timerfade_t = null;
            }
            this.timerfade_t = org.libspark.betweenas3.BetweenAS3.to(this.timerbarmc, {"alpha":0}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.timerfade_t.play();
            return;
        }

        internal function mouse_over(arg1:*):void
        {
            if (this._root.timerpauseonhover == "true") 
            {
                this.pauseTimer();
            }
            if (this._root.navigshowonhover == "true") 
            {
                if (this._root.navigleftright == "true") 
                {
                    this.rightbtn.fadeInBtn();
                    this.leftbtn.fadeInBtn();
                }
                if (this._root.navigplaypause == "true") 
                {
                    this.playbtn.fadeInBtn();
                    this.pausebtn.fadeInBtn();
                    this.fadeInTimer();
                }
            }
            return;
        }

        internal function moveInSlide():void
        {
            this.clickallow = false;
            this.clickallow2 = false;
            if (this._root.bannerdata_array[this.currentslideid]["entryhorizontalorientation"] != "center") 
            {
                if (this._root.bannerdata_array[this.currentslideid]["entryhorizontalorientation"] != "left") 
                {
                    if (this._root.bannerdata_array[this.currentslideid]["entryhorizontalorientation"] == "right") 
                    {
                        this.targx = this._root.bannerwidth - this._root.bannerdata_array[this.currentslideid]["entrywidth"];
                    }
                }
                else 
                {
                    this.targx = 0;
                }
            }
            else 
            {
                this.targx = Math.round(this._root.bannerwidth / 2 - this._root.bannerdata_array[this.currentslideid]["entrywidth"] / 2);
            }
            if (this._root.bannerdata_array[this.currentslideid]["entryverticalorientation"] != "center") 
            {
                if (this._root.bannerdata_array[this.currentslideid]["entryverticalorientation"] != "top") 
                {
                    if (this._root.bannerdata_array[this.currentslideid]["entryverticalorientation"] == "bottom") 
                    {
                        this.targy = this._root.bannerheight - this._root.bannerdata_array[this.currentslideid]["entryheight"];
                    }
                }
                else 
                {
                    this.targy = 0;
                }
            }
            else 
            {
                this.targy = Math.round(this._root.bannerheight / 2 - this._root.bannerdata_array[this.currentslideid]["entryheight"] / 2);
            }
            if (this._root.bannerdata_array[this.currentslideid]["entrytype"] == "video" || this._root.bannerdata_array[this.currentslideid]["entrytype"] == "youtube") 
            {
                this.activeslide.playerx = this.targx;
                this.activeslide.playery = this.targy;
            }
            var loc1:*=org.libspark.betweenas3.BetweenAS3.tween(this.activeslide, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, {"_colorMatrixFilter":{"matrix":[0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0]}}, this._root.entrytransitiontime, this.getEasing(this._root.entryeasetype));
            var loc2:*=org.libspark.betweenas3.BetweenAS3.to(this.activeslide, {"x":this.targx, "y":this.targy}, this._root.entrytransitiontime, this.getEasing(this._root.entryeasetype));
            var loc3:*=org.libspark.betweenas3.BetweenAS3.to(this.activeslide, {"alpha":1}, this._root.entrytransitiontime * 0.65, this.getEasing(this._root.entryeasetype));
            var loc4:*=org.libspark.betweenas3.BetweenAS3.delay(loc3, this._root.entrytransitiontime * 0.35);
            if (this.activeslide_t != null) 
            {
                this.activeslide_t.stop();
            }
            this.activeslide_t = org.libspark.betweenas3.BetweenAS3.parallel(loc1, loc2, loc3, loc4);
            this.activeslide_t.onComplete = this.allowClicks;
            this.activeslide_t.play();
            if (this.slidemask_t != null) 
            {
                this.slidemask_t.stop();
            }
            this.slidemask_t = org.libspark.betweenas3.BetweenAS3.to(this.slidemaskmc, {"x":this.targx, "y":this.targy}, this._root.entrytransitiontime, org.libspark.betweenas3.easing.Sine.easeInOut);
            this.slidemask_t.play();
            return;
        }

        internal function deleteText():void
        {
            if (this.lasttext.stage) 
            {
                this.banner.removeChild(this.lasttext);
            }
            this.lasttext = null;
            return;
        }

        public function loadNextSlide():void
        {
            this.previousslideid = this.currentslideid;
            if (this.currentslideid < (this._root.maxslide - 1)) 
            {
                var loc1:*;
                var loc2:*=((loc1 = this).currentslideid + 1);
                loc1.currentslideid = loc2;
            }
            else 
            {
                this.currentslideid = 0;
            }
            this.addSlide();
            return;
        }

        internal function onComplete(arg1:org.libspark.betweenas3.events.TweenEvent):void
        {
            if (!(this.timerbar_t == null) && this.timerbar_t.hasEventListener(org.libspark.betweenas3.events.TweenEvent.COMPLETE)) 
            {
                this.timerbar_t.removeEventListener(org.libspark.betweenas3.events.TweenEvent.COMPLETE, this.onComplete);
            }
            this.loadNextSlide();
            return;
        }

        internal function moveOutText():void
        {
            if (this._root.textmoveinfrom != "top") 
            {
                if (this._root.textmoveinfrom != "bottom") 
                {
                    if (this._root.textmoveinfrom != "left") 
                    {
                        if (this._root.textmoveinfrom == "right") 
                        {
                            this.texttargx = -this._root.bannerdata_array[this.previousslideid]["textbackgroundwidth"] - 40;
                            this.texttargy = this._root.bannerdata_array[this.previousslideid]["textbackgroundypos"];
                        }
                    }
                    else 
                    {
                        this.texttargx = this._root.bannerwidth + 40;
                        this.texttargy = this._root.bannerdata_array[this.previousslideid]["textbackgroundypos"];
                    }
                }
                else 
                {
                    this.texttargx = this._root.bannerdata_array[this.previousslideid]["textbackgroundxpos"];
                    this.texttargy = -this._root.bannerdata_array[this.previousslideid]["textbackgroundheight"] - 40;
                }
            }
            else 
            {
                this.texttargx = this._root.bannerdata_array[this.previousslideid]["textbackgroundxpos"];
                this.texttargy = this._root.bannerheight + 40;
            }
            if (this.lasttext_t != null) 
            {
                this.lasttext_t.stop();
            }
            this.lasttext_t = org.libspark.betweenas3.BetweenAS3.to(this.lasttext, {"x":this.texttargx, "y":this.texttargy}, this._root.texttransitiontime, this.getEasing(this._root.texteasetype));
            this.lasttext_t.onComplete = this.deleteText;
            this.lasttext_t.play();
            return;
        }

        internal function addSlide():void
        {
            if (!this.bannerfirstrun) 
            {
                if (this._root.bannerdata_array[this.previousslideid]["entrytype"] == "video" || this._root.bannerdata_array[this.previousslideid]["entrytype"] == "youtube") 
                {
                    this.activeslide.pressPause();
                }
                this.lastslide = this.activeslide;
                this.lasttext = this.activetext;
                this.activeslide = null;
                this.activetext = null;
            }
            if (this._root.bannerdata_array[this.currentslideid]["entrytype"] != "image") 
            {
                if (this._root.bannerdata_array[this.currentslideid]["entrytype"] != "video") 
                {
                    if (this._root.bannerdata_array[this.currentslideid]["entrytype"] == "youtube") 
                    {
                        this.activeslide = new alternatebannerlib.createyoutubeplayer(this._stage, this._root, this, this.activeslide, this._root.bannerdata_array[this.currentslideid]["entryurl"], this._root.bannerdata_array[this.currentslideid]["entryvideopreviewimage"], this._root.bannerdata_array[this.currentslideid]["entrywidth"], this._root.bannerdata_array[this.currentslideid]["entryheight"], this._root.bannerdata_array[this.currentslideid]["videoautoplay"], this._root.videoloop, this._root.bannerdata_array[this.currentslideid]["videostartvolume"]);
                    }
                }
                else 
                {
                    this.activeslide = new alternatebannerlib.createvideoplayer(this._stage, this._root, this, this.activeslide, this._root.bannerdata_array[this.currentslideid]["entryurl"], this._root.bannerdata_array[this.currentslideid]["entryvideopreviewimage"], this._root.bannerdata_array[this.currentslideid]["entrywidth"], this._root.bannerdata_array[this.currentslideid]["entryheight"], this._root.bannerdata_array[this.currentslideid]["videoautoplay"], this._root.videoloop, this._root.bannerdata_array[this.currentslideid]["videostartvolume"]);
                }
            }
            else 
            {
                this.activeslide = new alternatebannerlib.image(this._root, this.banner, this.currentslideid, this);
            }
            this.slidemaskmc.width = this._root.bannerdata_array[this.currentslideid]["entrywidth"];
            this.slidemaskmc.height = this._root.bannerdata_array[this.currentslideid]["entryheight"];
            this.activeslide.mask = this.slidemaskmc;
            this.activeslide.alpha = this._root.entryfadefromalpha;
            if (this._root.entrymoveinfrom != "top") 
            {
                if (this._root.entrymoveinfrom != "bottom") 
                {
                    if (this._root.entrymoveinfrom != "left") 
                    {
                        if (this._root.entrymoveinfrom == "right") 
                        {
                            this.slidemaskmc.x = loc1 = this._root.bannerwidth;
                            this.activeslide.x = loc1;
                            this.setVertPos();
                        }
                    }
                    else 
                    {
                        this.slidemaskmc.x = loc1 = -this._root.bannerdata_array[this.currentslideid]["entrywidth"];
                        this.activeslide.x = loc1;
                        this.setVertPos();
                    }
                }
                else 
                {
                    this.slidemaskmc.y = loc1 = this._root.bannerheight;
                    this.activeslide.y = loc1;
                    this.setHorizPos();
                }
            }
            else 
            {
                var loc1:*;
                this.slidemaskmc.y = loc1 = -this._root.bannerdata_array[this.currentslideid]["entryheight"];
                this.activeslide.y = loc1;
                this.setHorizPos();
            }
            this.banner.addChild(this.activeslide);
            this.activetext = new alternatebannerlib.caption(this._root, this.banner, this.currentslideid, this);
            if (this._root.textmoveinfrom != "top") 
            {
                if (this._root.textmoveinfrom != "bottom") 
                {
                    if (this._root.textmoveinfrom != "left") 
                    {
                        if (this._root.textmoveinfrom == "right") 
                        {
                            this.activetext.x = this._root.bannerwidth + 40;
                            this.activetext.y = this._root.bannerdata_array[this.currentslideid]["textbackgroundypos"];
                        }
                    }
                    else 
                    {
                        this.activetext.x = -this._root.bannerdata_array[this.currentslideid]["textbackgroundwidth"] - 40;
                        this.activetext.y = this._root.bannerdata_array[this.currentslideid]["textbackgroundypos"];
                    }
                }
                else 
                {
                    this.activetext.y = this._root.bannerheight + 40;
                    this.activetext.x = this._root.bannerdata_array[this.currentslideid]["textbackgroundxpos"];
                }
            }
            else 
            {
                this.activetext.y = -this._root.bannerdata_array[this.currentslideid]["entryheight"] - 40;
                this.activetext.x = this._root.bannerdata_array[this.currentslideid]["textbackgroundxpos"];
            }
            this.banner.addChild(this.activetext);
            this.addEventListener(flash.events.Event.ENTER_FRAME, this.checkIfLoaded, false, 0, true);
            return;
        }

        internal function setVertPos():void
        {
            if (this._root.bannerdata_array[this.currentslideid]["entryverticalorientation"] != "center") 
            {
                if (this._root.bannerdata_array[this.currentslideid]["entryverticalorientation"] != "top") 
                {
                    if (this._root.bannerdata_array[this.currentslideid]["entryverticalorientation"] == "bottom") 
                    {
                        this.slidemaskmc.y = loc1 = this._root.bannerheight - this._root.bannerdata_array[this.currentslideid]["entryheight"];
                        this.activeslide.y = loc1;
                    }
                }
                else 
                {
                    this.slidemaskmc.y = loc1 = 0;
                    this.activeslide.y = loc1;
                }
            }
            else 
            {
                var loc1:*;
                this.slidemaskmc.y = loc1 = Math.round(this._root.bannerheight / 2 - this._root.bannerdata_array[this.currentslideid]["entryheight"] / 2);
                this.activeslide.y = loc1;
            }
            return;
        }

        internal function checkIfLoaded(arg1:flash.events.Event):void
        {
            if (this.activeslide.loadedvar) 
            {
                this.removeEventListener(flash.events.Event.ENTER_FRAME, this.checkIfLoaded);
                this.moveInSlide();
                this.moveInText();
                if (!this.bannerfirstrun) 
                {
                    this.moveOutSlide();
                    this.moveOutText();
                }
                this.runTimer();
                if (this._root.navigplaypause == "true") 
                {
                    this.playbtn.activateButton();
                    this.pausebtn.activateButton();
                }
                if (this.bannerfirstrun) 
                {
                    this.bannerfirstrun = false;
                    if (this._root.autoplay != "false") 
                    {
                        if (this._root.navigplaypause == "true") 
                        {
                            this.playbtn.hideBtn();
                            this.pausebtn.showBtn();
                        }
                    }
                    else 
                    {
                        this.bannerpause = true;
                        this.timerbar_t.togglePause();
                        if (this._root.navigplaypause == "true") 
                        {
                            this.pausebtn.hideBtn();
                            this.playbtn.showBtn();
                        }
                    }
                }
            }
            return;
        }

        public function loadPreviousSlide():void
        {
            this.previousslideid = this.currentslideid;
            if (this.currentslideid > 0) 
            {
                var loc1:*;
                var loc2:*=((loc1 = this).currentslideid - 1);
                loc1.currentslideid = loc2;
            }
            else if (this.currentslideid == 0) 
            {
                this.currentslideid = (this._root.maxslide - 1);
            }
            this.addSlide();
            return;
        }

        internal function mouse_out(arg1:*):void
        {
            if (this._root.timerpauseonhover == "true") 
            {
                this.resumeTimer();
            }
            if (this._root.navigshowonhover == "true") 
            {
                if (this._root.navigleftright == "true") 
                {
                    this.rightbtn.fadeOutBtn();
                    this.leftbtn.fadeOutBtn();
                }
                if (this._root.navigplaypause == "true") 
                {
                    this.playbtn.fadeOutBtn();
                    this.pausebtn.fadeOutBtn();
                    this.fadeOutTimer();
                }
            }
            return;
        }

        internal function setVertTarg():void
        {
            if (this._root.bannerdata_array[this.previousslideid]["entryverticalorientation"] != "center") 
            {
                if (this._root.bannerdata_array[this.previousslideid]["entryverticalorientation"] != "top") 
                {
                    if (this._root.bannerdata_array[this.previousslideid]["entryverticalorientation"] == "bottom") 
                    {
                        this.targy = this._root.bannerheight - this._root.bannerdata_array[this.previousslideid]["entryheight"];
                    }
                }
                else 
                {
                    this.targy = 0;
                }
            }
            else 
            {
                this.targy = Math.round(this._root.bannerheight / 2 - this._root.bannerdata_array[this.previousslideid]["entryheight"] / 2);
            }
            return;
        }

        public function pauseTimer():void
        {
            if (this.timerbar_t.isPlaying && !this.bannerpause) 
            {
                this.bannerpause = true;
                this.timerbar_t.togglePause();
                this.pausebtn.hideBtn();
                this.playbtn.showBtn();
            }
            return;
        }

        internal function deleteSlide():void
        {
            this.lastslide.unLoad();
            this.banner.removeChild(this.lastslide);
            this.lastslide = null;
            return;
        }

        internal function allowClicks():void
        {
            this.clickallow = true;
            return;
        }

        internal function createNavigDots():void
        {
            if (this._root.navigleftright == "true") 
            {
                this.leftbtn = new alternatebannerlib.leftbutton(this._root, this);
                this.rightbtn = new alternatebannerlib.rightbutton(this._root, this);
            }
            if (this._root.navigplaypause == "true") 
            {
                this.playbtn = new alternatebannerlib.playbutton(this._root, this);
                this.pausebtn = new alternatebannerlib.pausebutton(this._root, this);
                if (this._root.autoplay != "false") 
                {
                    this.playbtn.hideBtn();
                }
                else 
                {
                    this.pausebtn.hideBtn();
                }
            }
            return;
        }

        internal function moveIn(arg1:flash.events.MouseEvent):void
        {
            if (!this._stage.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                this._stage.addEventListener(flash.events.Event.ENTER_FRAME, this.checkMouse, false, 0, true);
            }
            return;
        }

        internal function moveOutSlide():void
        {
            if (this._root.entrymoveinfrom != "top") 
            {
                if (this._root.entrymoveinfrom != "bottom") 
                {
                    if (this._root.entrymoveinfrom != "left") 
                    {
                        if (this._root.entrymoveinfrom == "right") 
                        {
                            this.targx = -this._root.bannerdata_array[this.previousslideid]["entrywidth"];
                            this.setVertTarg();
                        }
                    }
                    else 
                    {
                        this.targx = this._root.bannerwidth;
                        this.setVertTarg();
                    }
                }
                else 
                {
                    this.targy = -this._root.bannerdata_array[this.previousslideid]["entryheight"];
                    this.setHorizTarg();
                }
            }
            else 
            {
                this.targy = this._root.bannerheight;
                this.setHorizTarg();
            }
            var loc1:*=org.libspark.betweenas3.BetweenAS3.tween(this.lastslide, {"_colorMatrixFilter":{"matrix":[0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0]}}, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, this._root.entrytransitiontime * 0.5, this.getEasing(this._root.entryeasetype));
            var loc2:*=org.libspark.betweenas3.BetweenAS3.to(this.lastslide, {"x":this.targx, "y":this.targy}, this._root.entrytransitiontime, this.getEasing(this._root.entryeasetype));
            var loc3:*=org.libspark.betweenas3.BetweenAS3.to(this.lastslide, {"alpha":this._root.entryfadefromalpha}, this._root.entrytransitiontime * 0.65, this.getEasing(this._root.entryeasetype));
            if (this.lastslide_t != null) 
            {
                this.lastslide_t.stop();
            }
            this.lastslide_t = org.libspark.betweenas3.BetweenAS3.parallel(loc1, loc2, loc3);
            this.lastslide_t.onComplete = this.deleteSlide;
            this.lastslide_t.play();
            return;
        }

        internal function updateCircle():void
        {
            var loc2:*=0;
            var loc1:*=this.circ_angle * Math.PI / 180;
            this.circle_fill.graphics.clear();
            this.circle_fill.graphics.moveTo(0, 0);
            this.circle_fill.graphics.beginFill(this._root.navigtimercolor, 1);
            loc2 = 0;
            while (loc2 <= this.circ_angle) 
            {
                this.circle_fill.graphics.lineTo(this.circ_radius * Math.cos(loc2 * Math.PI / 180), (-this.circ_radius) * Math.sin(loc2 * Math.PI / 180));
                ++loc2;
            }
            this.circle_fill.graphics.lineTo(0, 0);
            this.circle_fill.graphics.endFill();
            return;
        }

        internal function setHorizTarg():void
        {
            if (this._root.bannerdata_array[this.previousslideid]["entryhorizontalorientation"] != "center") 
            {
                if (this._root.bannerdata_array[this.previousslideid]["entryhorizontalorientation"] != "left") 
                {
                    if (this._root.bannerdata_array[this.previousslideid]["entryhorizontalorientation"] == "right") 
                    {
                        this.targx = this._root.bannerwidth - this._root.bannerdata_array[this.previousslideid]["entrywidth"];
                    }
                }
                else 
                {
                    this.targx = 0;
                }
            }
            else 
            {
                this.targx = Math.round(this._root.bannerwidth / 2 - this._root.bannerdata_array[this.previousslideid]["entrywidth"] / 2);
            }
            return;
        }

        internal var slidemaskmc:flash.display.MovieClip;

        public var idlergb:Object;

        internal var activetext_t:org.libspark.betweenas3.tweens.ITween;

        internal var bannerfirstrun:Boolean=true;

        internal var lastslide_t:org.libspark.betweenas3.tweens.ITween;

        public var clickallow2:Boolean=false;

        internal var circle_fill:flash.display.Shape;

        internal var activeslide_t:org.libspark.betweenas3.tweens.ITween;

        internal var bannermask:flash.display.Sprite;

        internal var bannerreset:Boolean=false;

        public var pausebtn:*;

        public var playbtn:*;

        internal var timerbar_t:org.libspark.betweenas3.tweens.ITween;

        public var circ_angle:Number;

        internal var banner:flash.display.MovieClip;

        public var previousslideid:int;

        internal var circ_radius:Number=18;

        public var activetext:*;

        internal var slidemask:flash.display.Sprite;

        internal var rightbtn:*;

        internal var _root:flash.display.MovieClip;

        public var lasttext:*;

        internal var timevar:Number;

        internal var texttargx:int;

        public var clickallow:Boolean=false;

        internal var texttargy:int;

        public var selectrgb:Object;

        internal var slidemask_t:org.libspark.betweenas3.tweens.ITween;

        internal var over:Boolean=false;

        public var lastslide:*;

        internal var targy:int;

        public var timerbarmc:flash.display.MovieClip;

        public var currentslideid:int=-1;

        internal var bannerpause:Boolean=false;

        internal var leftbtn:*;

        internal var lasttext_t:org.libspark.betweenas3.tweens.ITween;

        internal var targx:int;

        internal var circle_mask:flash.display.Shape;

        public var activeslide:*;

        internal var timerfade_t:org.libspark.betweenas3.tweens.ITween;

        internal var _stage:flash.display.Stage;
    }
}
