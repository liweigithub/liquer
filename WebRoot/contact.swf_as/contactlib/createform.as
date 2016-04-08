package contactlib 
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
            this.solidbg = new flash.display.Sprite();
            this.infobg = new flash.display.Sprite();
            this.namebg = new flash.display.Sprite();
            this.emailbg = new flash.display.Sprite();
            this.messagebg = new flash.display.Sprite();
            this.sendbuttonbg = new flash.display.Sprite();
            this.errorbg = new flash.display.Sprite();
            this.inputFormat = new flash.text.TextFormat();
            this.btnFormat = new flash.text.TextFormat();
            this.errorFormat = new flash.text.TextFormat();
            this.info_txt = new flash.text.TextField();
            this.name_txt = new flash.text.TextField();
            this.email_txt = new flash.text.TextField();
            this.message_txt = new flash.text.TextField();
            this.error_txt = new flash.text.TextField();
            this.btn_txt = new flash.text.TextField();
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
            this.namebg.graphics.beginFill(this._root.fieldbgcolor);
            if (this._root.fieldbgrounded != 0) 
            {
                this.namebg.graphics.drawRoundRect(0, 0, this._root.formwidth - this._root.imagewidth - 2 * this._root.imagepadding - 10, 25, this._root.fieldbgrounded, this._root.fieldbgrounded);
            }
            else 
            {
                this.namebg.graphics.drawRect(0, 0, this._root.formwidth - this._root.imagewidth - 2 * this._root.imagepadding - 10, 25);
            }
            this.namebg.graphics.endFill();
            this.namebg.alpha = this._root.fieldbgopacity;
            this.namebg.mouseEnabled = false;
            this.namebg.x = this.infobg.x;
            this.namebg.y = this.infobg.y + this.infobg.height + 10;
            this.emailbg.graphics.beginFill(this._root.fieldbgcolor);
            if (this._root.fieldbgrounded != 0) 
            {
                this.emailbg.graphics.drawRoundRect(0, 0, this._root.formwidth - this._root.imagewidth - 2 * this._root.imagepadding - 10, 25, this._root.fieldbgrounded, this._root.fieldbgrounded);
            }
            else 
            {
                this.emailbg.graphics.drawRect(0, 0, this._root.formwidth - this._root.imagewidth - 2 * this._root.imagepadding - 10, 25);
            }
            this.emailbg.graphics.endFill();
            this.emailbg.alpha = this._root.fieldbgopacity;
            this.emailbg.mouseEnabled = false;
            this.emailbg.x = this.infobg.x;
            this.emailbg.y = this.namebg.y + this.namebg.height + 10;
            this.messagebg.graphics.beginFill(this._root.fieldbgcolor);
            if (this._root.fieldbgrounded != 0) 
            {
                this.messagebg.graphics.drawRoundRect(0, 0, this._root.formwidth - this._root.imagewidth - 2 * this._root.imagepadding - 10, 164, this._root.fieldbgrounded, this._root.fieldbgrounded);
            }
            else 
            {
                this.messagebg.graphics.drawRect(0, 0, this._root.formwidth - this._root.imagewidth - 2 * this._root.imagepadding - 10, 164);
            }
            this.messagebg.graphics.endFill();
            this.messagebg.alpha = this._root.fieldbgopacity;
            this.messagebg.mouseEnabled = false;
            this.messagebg.x = this.infobg.x;
            this.messagebg.y = this.emailbg.y + this.emailbg.height + 10;
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
            this.sendbuttonbg.x = this.messagebg.x + this.messagebg.width - 160;
            this.sendbuttonbg.y = this.messagebg.y + this.messagebg.height + 10;
            this.errorbg.graphics.beginFill(this._root.errorbgcolor);
            if (this._root.fieldbgrounded != 0) 
            {
                this.errorbg.graphics.drawRoundRect(0, 0, this.messagebg.width - this.sendbuttonbg.width - 20, 30, this._root.fieldbgrounded, this._root.fieldbgrounded);
            }
            else 
            {
                this.errorbg.graphics.drawRect(0, 0, this.messagebg.width - this.sendbuttonbg.width - 20, 30);
            }
            this.errorbg.graphics.endFill();
            this.errorbg.alpha = 0;
            this.errorbg.mouseEnabled = false;
            this.errorbg.x = this.infobg.x;
            this.errorbg.y = this.sendbuttonbg.y;
            var loc1:*=0;
            this.inputFormat.font = this._root.fonttype;
            this.inputFormat.indent = loc1;
            this.inputFormat.color = this._root.fieldfontcolor;
            this.inputFormat.size = this._root.fieldfontsize;
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
            this.name_txt.multiline = false;
            this.name_txt.type = flash.text.TextFieldType.INPUT;
            this.name_txt.autoSize = flash.text.TextFieldAutoSize.NONE;
            this.name_txt.embedFonts = false;
            this.name_txt.selectable = true;
            this.name_txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.name_txt.text = this._root.namefield;
            this.name_txt.setTextFormat(this.inputFormat);
            this.name_txt.width = this.info_txt.width;
            this.name_txt.height = Math.round(this._root.fieldfontsize * 1.5);
            this.name_txt.x = this._root.imagewidth + 2 * this._root.imagepadding + 20;
            this.name_txt.y = Math.round(this.infobg.y + this.infobg.height + 10 + this.namebg.height / 2 - this.name_txt.height / 2);
            this.name_txt.mouseEnabled = true;
            this.email_txt.multiline = false;
            this.email_txt.type = flash.text.TextFieldType.INPUT;
            this.email_txt.autoSize = flash.text.TextFieldAutoSize.NONE;
            this.email_txt.embedFonts = false;
            this.email_txt.selectable = true;
            this.email_txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.email_txt.text = this._root.emailfield;
            this.email_txt.setTextFormat(this.inputFormat);
            this.email_txt.width = this.info_txt.width;
            this.email_txt.height = Math.round(this._root.fieldfontsize * 1.5);
            this.email_txt.x = this._root.imagewidth + 2 * this._root.imagepadding + 20;
            this.email_txt.y = Math.round(this.namebg.y + this.namebg.height + 10 + this.namebg.height / 2 - this.email_txt.height / 2);
            this.email_txt.mouseEnabled = true;
            this.message_txt.multiline = true;
            this.message_txt.type = flash.text.TextFieldType.INPUT;
            this.message_txt.autoSize = flash.text.TextFieldAutoSize.NONE;
            this.message_txt.embedFonts = false;
            this.message_txt.selectable = true;
            this.message_txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.message_txt.text = this._root.messagefield;
            this.message_txt.setTextFormat(this.inputFormat);
            this.message_txt.width = this.info_txt.width;
            this.message_txt.height = 130;
            this.message_txt.x = this._root.imagewidth + 2 * this._root.imagepadding + 20;
            this.message_txt.y = Math.round(this.emailbg.y + this.emailbg.height + 15);
            this.message_txt.mouseEnabled = true;
            this.btn_txt.multiline = false;
            this.btn_txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.btn_txt.embedFonts = false;
            this.btn_txt.selectable = false;
            this.btn_txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.btn_txt.text = this._root.submitbutton;
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
            addChild(this.solidbg);
            addChild(this.infobg);
            addChild(this.info_txt);
            addChild(this.namebg);
            addChild(this.name_txt);
            addChild(this.emailbg);
            addChild(this.email_txt);
            addChild(this.messagebg);
            addChild(this.message_txt);
            addChild(this.sendbuttonbg);
            addChild(this.btn_txt);
            addChild(this.errorbg);
            addChild(this.error_txt);
            this.name_txt.addEventListener(flash.events.FocusEvent.FOCUS_IN, this.name_focusin, false, 0, true);
            this.name_txt.addEventListener(flash.events.FocusEvent.FOCUS_OUT, this.name_focusout, false, 0, true);
            this.email_txt.addEventListener(flash.events.FocusEvent.FOCUS_IN, this.email_focusin, false, 0, true);
            this.email_txt.addEventListener(flash.events.FocusEvent.FOCUS_OUT, this.email_focusout, false, 0, true);
            this.message_txt.addEventListener(flash.events.FocusEvent.FOCUS_IN, this.message_focusin, false, 0, true);
            this.message_txt.addEventListener(flash.events.FocusEvent.FOCUS_OUT, this.message_focusout, false, 0, true);
            this.sendbuttonbg.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.onMouseOut, false, 0, true);
            this.sendbuttonbg.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.onMouseOver, false, 0, true);
            this.sendbuttonbg.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click, false, 0, true);
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

        internal function message_focusout(arg1:flash.events.FocusEvent):void
        {
            if (this.message_t != null) 
            {
                this.message_t.stop();
            }
            this.message_t = org.libspark.betweenas3.BetweenAS3.to(this.messagebg, {"alpha":this._root.fieldbgopacity}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.message_t.play();
            if (this.message_txt.text == " " || this.message_txt.text == "") 
            {
                this.message_txt.text = this._root.messagefield;
                this.message_txt.setTextFormat(this.inputFormat);
            }
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

        internal function leaveFS():void
        {
            if (this._stage.displayState == flash.display.StageDisplayState.FULL_SCREEN) 
            {
                this._stage.displayState = flash.display.StageDisplayState.NORMAL;
                this._root.mainroot.fsvar_stage = false;
            }
            return;
        }

        internal function name_focusout(arg1:flash.events.FocusEvent):void
        {
            if (this.name_t != null) 
            {
                this.name_t.stop();
            }
            this.name_t = org.libspark.betweenas3.BetweenAS3.to(this.namebg, {"alpha":this._root.fieldbgopacity}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.name_t.play();
            if (this.name_txt.text == " " || this.name_txt.text == "") 
            {
                this.name_txt.text = this._root.namefield;
                this.name_txt.setTextFormat(this.inputFormat);
            }
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

        internal function name_focusin(arg1:flash.events.FocusEvent):void
        {
            if (this.name_t != null) 
            {
                this.name_t.stop();
            }
            this.name_t = org.libspark.betweenas3.BetweenAS3.to(this.namebg, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.name_t.play();
            if (this.name_txt.text == this._root.namefield) 
            {
                this.name_txt.setSelection(this.name_txt.text.length, this.name_txt.text.length);
                this.name_txt.text = "";
                this.name_txt.setTextFormat(this.inputFormat);
            }
            this.leaveFS();
            return;
        }

        internal function mailSender():void
        {
            var mailComplete:Function;
            var variables:flash.net.URLVariables;
            var mailReq:flash.net.URLRequest;
            var mailLoader:flash.net.URLLoader;

            var loc1:*;
            mailComplete = null;
            mailComplete = function (arg1:flash.events.Event):*
            {
                error_txt.text = _root.messagesend;
                error_txt.setTextFormat(errorFormat);
                return;
            }
            variables = new flash.net.URLVariables();
            variables.nametxt = this.name_txt.text;
            variables.emailtxt = this.email_txt.text;
            variables.messagetxt = this.message_txt.text;
            mailReq = new flash.net.URLRequest(this._root.mailphpurl);
            mailReq.method = flash.net.URLRequestMethod.POST;
            mailReq.data = variables;

            flash.net.navigateToURL(mailReq,"_blank");
            /**
            mailLoader = new flash.net.URLLoader();
            mailLoader.dataFormat = flash.net.URLLoaderDataFormat.VARIABLES;
            mailLoader.addEventListener(flash.events.Event.COMPLETE, mailComplete, false, 0, true);
            try 
            {
                mailLoader.load(mailReq);
            }
            catch (error:Error)
            {
                error_txt.text = _root.senderror;
                error_txt.setTextFormat(errorFormat);
            }
            **/
            return;
        }

        internal function email_focusin(arg1:flash.events.FocusEvent):void
        {
            if (this.email_t != null) 
            {
                this.email_t.stop();
            }
            this.email_t = org.libspark.betweenas3.BetweenAS3.to(this.emailbg, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.email_t.play();
            if (this.email_txt.text == this._root.emailfield) 
            {
                this.email_txt.setSelection(this.email_txt.text.length, this.email_txt.text.length);
                this.email_txt.text = "";
                this.email_txt.setTextFormat(this.inputFormat);
            }
            this.leaveFS();
            return;
        }

        internal function email_focusout(arg1:flash.events.FocusEvent):void
        {
            if (this.email_t != null) 
            {
                this.email_t.stop();
            }
            this.email_t = org.libspark.betweenas3.BetweenAS3.to(this.emailbg, {"alpha":this._root.fieldbgopacity}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.email_t.play();
            if (this.email_txt.text == " " || this.email_txt.text == "") 
            {
                this.email_txt.text = this._root.emailfield;
                this.email_txt.setTextFormat(this.inputFormat);
            }
            return;
        }

        internal function message_focusin(arg1:flash.events.FocusEvent):void
        {
            if (this.message_t != null) 
            {
                this.message_t.stop();
            }
            this.message_t = org.libspark.betweenas3.BetweenAS3.to(this.messagebg, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.message_t.play();
            if (this.message_txt.text == this._root.messagefield) 
            {
                this.message_txt.setSelection(this.message_txt.text.length, this.message_txt.text.length);
                this.message_txt.text = "";
                this.message_txt.setTextFormat(this.inputFormat);
            }
            this.leaveFS();
            return;
        }

        internal function mouse_click(arg1:*):void
        {
            if (!this.emailsend) 
            {
                this.testForm();
            }
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

        internal function testForm():void
        {
            var testEmail:Function;
            var emailvar:String;
            var namevar:String;
            var msgvar:String;

            var loc1:*;
            testEmail = function (arg1:String):*
            {
                if (arg1.length >= 7) 
                {
                    if (arg1.indexOf("@") > 0) 
                    {
                        if (arg1.indexOf("@") + 2 < arg1.lastIndexOf(".")) 
                        {
                            if (arg1.lastIndexOf(".") < arg1.length - 2) 
                            {
                                return true;
                            }
                        }
                    }
                }
                return false;
            }
            this.error_txt.text = "";
            this.error_txt.setTextFormat(this.errorFormat);
            namevar = this.name_txt.text;
            emailvar = this.email_txt.text;
            msgvar = this.message_txt.text;
            if (!(msgvar == "") && !(msgvar == this._root.messagefield) && !(emailvar == "") && !(emailvar == this._root.emailfield) && testEmail(emailvar) && !(namevar == "") && !(namevar == this._root.namefield)) 
            {
                this.emailsend = true;
                this.sendbuttonbg.alpha = 0.3;
                this.sendbuttonbg.buttonMode = false;
                this.sendbuttonbg.mouseEnabled = false;
                this.mailSender();
            }
            if (msgvar == "" || msgvar == this._root.messagefield) 
            {
                this.error_txt.text = this._root.messageerror;
                this.error_txt.setTextFormat(this.errorFormat);
            }
            if (emailvar == "" || emailvar == this._root.emailfield) 
            {
                this.error_txt.text = this._root.emailerror;
                this.error_txt.setTextFormat(this.errorFormat);
            }
            else if (!(emailvar == "") && !testEmail(emailvar)) 
            {
                this.error_txt.text = this._root.emailerror;
                this.error_txt.setTextFormat(this.errorFormat);
            }
            if (namevar == "" || namevar == this._root.namefield) 
            {
                this.error_txt.text = this._root.nameerror;
                this.error_txt.setTextFormat(this.errorFormat);
            }
            if (this.error_t != null) 
            {
                this.error_t.stop();
            }
            this.error_t = org.libspark.betweenas3.BetweenAS3.tween(this.errorbg, {"alpha":this._root.errorbgopacity}, {"alpha":0}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.error_t.play();
            return;
        }

        internal function imageLoad():void
        {
            this.imageLoader.load(new flash.net.URLRequest(this.iurl));
            this.imageLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.imageLoadingDone, false, 0, true);
            return;
        }

        internal var emailsend:Boolean=false;

        internal var solidbg:flash.display.Sprite;

        internal var imagemc:flash.display.MovieClip;

        internal var error_txt:flash.text.TextField;

        internal var name_txt:flash.text.TextField;

        internal var name_t:org.libspark.betweenas3.tweens.ITween;

        internal var _root:flash.display.MovieClip;

        internal var message_txt:flash.text.TextField;

        internal var message_t:org.libspark.betweenas3.tweens.ITween;

        internal var errorbg:flash.display.Sprite;

        internal var imageLoader:flash.display.Loader;

        internal var urllinkrequest:flash.net.URLRequest;

        internal var btn_t:org.libspark.betweenas3.tweens.ITween;

        internal var btn_txt:flash.text.TextField;

        internal var email_txt:flash.text.TextField;

        internal var sendbuttonbg:flash.display.Sprite;

        internal var image_t:org.libspark.betweenas3.tweens.ITween;

        internal var email_t:org.libspark.betweenas3.tweens.ITween;

        internal var info_txt:flash.text.TextField;

        internal var emailbg:flash.display.Sprite;

        internal var iurl:String;

        internal var inputFormat:flash.text.TextFormat;

        internal var messagebg:flash.display.Sprite;

        internal var namebg:flash.display.Sprite;

        internal var infobg:flash.display.Sprite;

        internal var errormc:flash.display.MovieClip;

        internal var errorFormat:flash.text.TextFormat;

        internal var btnFormat:flash.text.TextFormat;

        internal var error_t:org.libspark.betweenas3.tweens.ITween;

        internal var _stage:flash.display.Stage;
    }
}
