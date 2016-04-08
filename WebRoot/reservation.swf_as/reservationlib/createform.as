package reservationlib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.text.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createform extends flash.display.MovieClip
    {
        public function createform(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            this.imageLoader = new flash.display.Loader();
            this.errormc = new flash.display.MovieClip();
            this.imagemc = new flash.display.MovieClip();
            this.fieldholder = new flash.display.MovieClip();
            this.solidbg = new flash.display.Sprite();
            this.infobg = new flash.display.Sprite();
            this.sendbuttonbg = new flash.display.Sprite();
            this.errorbg = new flash.display.Sprite();
            this.btnFormat = new flash.text.TextFormat();
            this.errorFormat = new flash.text.TextFormat();
            this.info_txt = new flash.text.TextField();
            this.error_txt = new flash.text.TextField();
            this.btn_txt = new flash.text.TextField();
            this.formfields = new Array();
            super();
            this._stage = arg1;
            this._root = arg2;
            this.solidbg.graphics.beginFill(this._root.imagesolidbackgroundcolor);
            if (this._root.imagesolidbackgroundrounded != 0) 
            {
                this.solidbg.graphics.drawRoundRect(0, 0, this._root.imagewidth + 2 * this._root.imagepadding, this._root.imageheight + 2 * this._root.imagepadding, this._root.imagesolidbackgroundrounded, this._root.imagesolidbackgroundrounded);
            }
            else 
            {
                this.solidbg.graphics.drawRect(0, 0, this._root.imagewidth + 2 * this._root.imagepadding, this._root.imageheight + 2 * this._root.imagepadding);
            }
            this.solidbg.graphics.endFill();
            this.solidbg.mouseEnabled = false;
            this.solidbg.alpha = this._root.imagesolidbackgroundopacity;
            this.infobg.graphics.beginFill(this._root.infobgcolor);
            if (this._root.fieldbgrounded != 0) 
            {
                this.infobg.graphics.drawRoundRect(0, 0, this._root.formwidth - this._root.imagewidth - 2 * this._root.imagepadding - 10, 200, this._root.fieldbgrounded, this._root.fieldbgrounded);
            }
            else 
            {
                this.infobg.graphics.drawRect(0, 0, this._root.formwidth - this._root.imagewidth - 2 * this._root.imagepadding - 10, 200);
            }
            this.infobg.graphics.endFill();
            this.infobg.alpha = this._root.infobgopacity;
            this.infobg.mouseEnabled = false;
            this.infobg.x = this._root.imagewidth + 2 * this._root.imagepadding + 10;
            this.infobg.y = 0;
            this.sendbuttonbg.graphics.beginFill(this._root.btnbgcolor);
            if (this._root.fieldbgrounded != 0) 
            {
                this.sendbuttonbg.graphics.drawRoundRect(0, 0, 160, 30, this._root.fieldbgrounded, this._root.fieldbgrounded);
            }
            else 
            {
                this.sendbuttonbg.graphics.drawRect(0, 0, 160, 30);
            }
            this.sendbuttonbg.graphics.endFill();
            this.sendbuttonbg.alpha = 0.7;
            this.sendbuttonbg.mouseEnabled = true;
            this.sendbuttonbg.buttonMode = true;
            this.sendbuttonbg.x = this._root.formwidth - 160;
            this.sendbuttonbg.y = this._root.formheight - 30;
            this.errorbg.graphics.beginFill(this._root.errorbgcolor);
            if (this._root.fieldbgrounded != 0) 
            {
                this.errorbg.graphics.drawRoundRect(0, 0, this._root.formwidth - this._root.imagewidth - this._root.imagepadding * 2 - this.sendbuttonbg.width - 20, 30, this._root.fieldbgrounded, this._root.fieldbgrounded);
            }
            else 
            {
                this.errorbg.graphics.drawRect(0, 0, this._root.formwidth - this._root.imagewidth - this._root.imagepadding * 2 - this.sendbuttonbg.width - 20, 30);
            }
            this.errorbg.graphics.endFill();
            this.errorbg.alpha = 0;
            this.errorbg.mouseEnabled = false;
            this.errorbg.x = this.infobg.x;
            this.errorbg.y = this.sendbuttonbg.y;
            var loc1:*=0;
            this.btnFormat.font = this._root.fonttype;
            this.btnFormat.indent = loc1;
            this.btnFormat.color = this._root.btnfontcolor;
            this.btnFormat.size = this._root.btnfontsize;
            this.errorFormat.font = this._root.fonttype;
            this.errorFormat.indent = loc1;
            this.errorFormat.color = this._root.errorfontcolor;
            this.errorFormat.align = "center";
            this.errorFormat.size = this._root.errorfontsize;
            this.info_txt.multiline = true;
            this.info_txt.condenseWhite = true;
            this.info_txt.wordWrap = true;
            this.info_txt.embedFonts = false;
            this.info_txt.selectable = false;
            this.info_txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.info_txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.info_txt.gridFitType = flash.text.GridFitType.SUBPIXEL;
            this.info_txt.width = this._root.formwidth - this._root.imagewidth - 2 * this._root.imagepadding - 50;
            this.info_txt.styleSheet = this._root.style;
            this.info_txt.htmlText = this._root.infotext;
            this.info_txt.x = this._root.imagewidth + 2 * this._root.imagepadding + 30;
            this.info_txt.y = this._root.imagepadding;
            this.info_txt.mouseEnabled = true;
            this.btn_txt.multiline = false;
            this.btn_txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.btn_txt.embedFonts = false;
            this.btn_txt.selectable = false;
            this.btn_txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.btn_txt.text = this._root.submitbuttontext;
            this.btn_txt.setTextFormat(this.btnFormat);
            this.btn_txt.x = Math.round(this.sendbuttonbg.x + this.sendbuttonbg.width / 2 - this.btn_txt.width / 2);
            this.btn_txt.y = Math.round(this.sendbuttonbg.y + this.sendbuttonbg.height / 2 - this.btn_txt.height / 2);
            this.btn_txt.mouseEnabled = false;
            this.error_txt.multiline = false;
            this.error_txt.embedFonts = false;
            this.error_txt.selectable = false;
            this.error_txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.error_txt.width = this.errorbg.width;
            this.error_txt.text = "";
            this.error_txt.setTextFormat(this.errorFormat);
            this.error_txt.x = this.errorbg.x;
            this.error_txt.y = Math.round(this.errorbg.y + this.errorbg.height / 2 - 9);
            this.error_txt.mouseEnabled = false;
            this.iurl = this._root.imageurl;
            this.imageLoad();
            this.fieldholder.x = this.infobg.x;
            this.fieldholder.y = this.infobg.height + 20;
            addChild(this.solidbg);
            addChild(this.infobg);
            addChild(this.info_txt);
            addChild(this.sendbuttonbg);
            addChild(this.btn_txt);
            addChild(this.errorbg);
            addChild(this.error_txt);
            addChild(this.fieldholder);
            this.sendbuttonbg.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.onMouseOut, false, 0, true);
            this.sendbuttonbg.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.onMouseOver, false, 0, true);
            this.sendbuttonbg.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click, false, 0, true);
            this.createFields();
            return;
        }

        internal function imageLoadingDone(arg1:flash.events.Event):void
        {
            this.imageLoader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone);
            this.imagemc.alpha = 0;
            var loc2:*;
            this.imagemc.y = loc2 = this._root.imagepadding;
            this.imagemc.x = loc2;
            this.imagemc.buttonMode = true;
            this.imagemc.mouseEnabled = true;
            this.imagemc.addChild(this.imageLoader.content);
            addChild(this.imagemc);
            var loc1:*=new dropshadow(this._root, this.imageLoader.content, this._root.imageshadowdistance, this._root.imageshadowangle, this._root.imageshadowcolor, this._root.imageshadowopacity, this._root.imageshadowblur, this._root.imageshadowblur, 1, 3);
            this.image_t = org.libspark.betweenas3.BetweenAS3.to(this.imagemc, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.image_t.play();
            this.imagemc.addEventListener(flash.events.MouseEvent.CLICK, this.image_click, false, 0, true);
            return;
        }

        internal function onMouseOver(arg1:flash.events.MouseEvent):*
        {
            if (this.btn_t != null) 
            {
                this.btn_t.stop();
            }
            this.btn_t = org.libspark.betweenas3.BetweenAS3.to(this.sendbuttonbg, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            this.btn_t.play();
            return;
        }

        internal function image_click(arg1:*):void
        {
            var urltarget:String;
            var urllink:String;
            var event:*;
            var req:flash.net.URLRequest;

            var loc1:*;
            event = arg1;
            urllink = this._root.imagelink;
            urltarget = this._root.imagetarget;
            req = new flash.net.URLRequest(urllink);
            try 
            {
                flash.net.navigateToURL(req, urltarget);
            }
            catch (e:Error)
            {
                trace("Could not navigate to URL!");
            }
            return;
        }

        internal function checkField(arg1:Object):*
        {
            var loc1:*=arg1.field_txt.text;
            if (loc1 == "" || loc1 == arg1.fieldtitle) 
            {
                this.error_txt.text = arg1.fielderror;
                this.error_txt.setTextFormat(this.errorFormat);
                if (this.error_t != null) 
                {
                    this.error_t.stop();
                }
                this.error_t = org.libspark.betweenas3.BetweenAS3.tween(this.errorbg, {"alpha":this._root.errorbgopacity}, {"alpha":0}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
                this.error_t.play();
                this.ok = false;
            }
            return;
        }

        internal function createFields():void
        {
            this.fieldwidth = Math.round((this._root.formwidth - this._root.imagewidth - 2 * this._root.imagepadding - 10) / 2) - 5;
            var loc1:*=0;
            var loc2:*=0;
            var loc3:*=1;
            while (loc3 < this._root.maxfield + 1) 
            {
                this.formfields[loc3] = new reservationlib.formfield(this._stage, this._root, this.fieldholder, (loc3 - 1), this, loc1, loc2);
                if (loc3 % 2 == 0) 
                {
                    loc1 = 0;
                    loc2 = loc2 + 35;
                }
                else 
                {
                    loc1 = this.fieldwidth + 10;
                }
                ++loc3;
            }
            this.error_txt.text = this._root.requiredtext;
            this.error_txt.setTextFormat(this.errorFormat);
            this.error_t = org.libspark.betweenas3.BetweenAS3.tween(this.errorbg, {"alpha":this._root.errorbgopacity}, {"alpha":0}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.error_t.play();
            return;
        }

        internal function mailSender():void
        {
            var mailReq:flash.net.URLRequest;
            var i:int;
            var mailComplete:Function;
            var mailLoader:flash.net.URLLoader;
            var fieldid:String;
            var variables:flash.net.URLVariables;
            var fieldcontent:String;

            var loc1:*;
            mailComplete = null;
            fieldid = null;
            fieldcontent = null;
            mailComplete = function (arg1:flash.events.Event):*
            {
                error_txt.text = _root.finishedtext;
                error_txt.setTextFormat(errorFormat);
                return;
            }
            variables = new flash.net.URLVariables();
            i = 0;
            while (i < this._root.maxfield) 
            {
                fieldid = this.formfields[i + 1].fieldvar;
                fieldcontent = this.formfields[i + 1].field_txt.text;
                if (fieldcontent == this.formfields[i + 1].fieldtitle) 
                {
                    variables[fieldid] = "";
                }
                else 
                {
                    variables[fieldid] = fieldcontent;
                }
                ++i;
            }
            mailReq = new flash.net.URLRequest(this._root.mailphpurl);
            mailReq.method = flash.net.URLRequestMethod.POST;
            mailReq.data = variables;
            
			 flash.net.navigateToURL(mailReq,"_blank");
			/**
            mailLoader = new flash.net.URLLoader();
            mailLoader.dataFormat = flash.net.URLLoaderDataFormat.TEXT;
            mailLoader.addEventListener(flash.events.Event.COMPLETE, mailComplete, false, 0, true);
            try 
            {
                mailLoader.load(mailReq);
            }
            catch (error:Error)
            {
                error_txt.text = _root.notfinishedtext;
                error_txt.setTextFormat(errorFormat);
            }**/
			
            return;
        }

        internal function imageLoad():void
        {
            this.imageLoader.load(new flash.net.URLRequest(this.iurl));
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone, false, 0, true);
            return;
        }

        internal function onMouseOut(arg1:flash.events.MouseEvent):*
        {
            if (this.btn_t != null) 
            {
                this.btn_t.stop();
            }
            this.btn_t = org.libspark.betweenas3.BetweenAS3.to(this.sendbuttonbg, {"alpha":0.7}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            this.btn_t.play();
            return;
        }

        internal function mouse_click(arg1:*):void
        {
            if (!this.emailsend) 
            {
                this.ok = true;
                this.testForm();
            }
            return;
        }

        internal function testForm():void
        {
            this.error_txt.text = "";
            this.error_txt.setTextFormat(this.errorFormat);
            var loc1:*=0;
            while (loc1 < this._root.maxfield) 
            {
                if (this.formfields[loc1 + 1].fieldrequired == "true") 
                {
                    this.checkField(this.formfields[loc1 + 1]);
                }
                ++loc1;
            }
            if (this.ok) 
            {
                this.emailsend = true;
                this.sendbuttonbg.alpha = 0.3;
                this.sendbuttonbg.buttonMode = false;
                this.sendbuttonbg.mouseEnabled = false;
                this.mailSender();
            }
            return;
        }

        internal var errormc:flash.display.MovieClip;

        internal var errorFormat:flash.text.TextFormat;

        internal var emailsend:Boolean=false;

        internal var fieldholder:flash.display.MovieClip;

        internal var solidbg:flash.display.Sprite;

        internal var imagemc:flash.display.MovieClip;

        internal var error_txt:flash.text.TextField;

        internal var _root:flash.display.MovieClip;

        internal var errorbg:flash.display.Sprite;

        internal var imageLoader:flash.display.Loader;

        internal var btn_t:org.libspark.betweenas3.tweens.ITween;

        public var formfields:Array;

        internal var urllinkrequest:flash.net.URLRequest;

        internal var infobg:flash.display.Sprite;

        internal var ok:Boolean=true;

        internal var info_txt:flash.text.TextField;

        internal var btn_txt:flash.text.TextField;

        internal var sendbuttonbg:flash.display.Sprite;

        internal var iurl:String;

        internal var image_t:org.libspark.betweenas3.tweens.ITween;

        internal var btnFormat:flash.text.TextFormat;

        public var fieldwidth:int;

        internal var error_t:org.libspark.betweenas3.tweens.ITween;

        internal var _stage:flash.display.Stage;
    }
}
