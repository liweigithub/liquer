package newslib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createtext extends flash.display.MovieClip
    {
        public function createtext(arg1:flash.display.Stage, arg2:flash.display.MovieClip, arg3:int, arg4:flash.display.MovieClip)
        {
            this.txt = new flash.text.TextField();
            this.txt_mc = new flash.display.MovieClip();
            this.solidbg = new flash.display.Sprite();
            this.txtmask = new flash.display.Sprite();
            this.scrollbar = new flash.display.Sprite();
            this.closeiconbg = new flash.display.Sprite();
            this.closeiconmc = new flash.display.MovieClip();
            this.closeiconvar = new closeicon();
            this.close_ct = this.closeiconvar.transform.colorTransform;
            super();
            this._stage = arg1;
            this._root = arg2;
            this._ivar = arg3;
            this._teaser = arg4;
            this.scrollamount = this._root.contentscrollamount;
            this.ease = this._root.contentscrollease;
            this.solidbg.graphics.beginFill(this._root.solidbackgroundcolor);
            if (this._root.solidbackgroundrounded != 0) 
            {
                this.solidbg.graphics.drawRoundRect(0, 0, this._root.newswidth, this._root.newsheight - 80, this._root.solidbackgroundrounded, this._root.solidbackgroundrounded);
            }
            else 
            {
                this.solidbg.graphics.drawRect(0, 0, this._root.newswidth, this._root.newsheight - 80);
            }
            this.solidbg.graphics.endFill();
            this.solidbg.alpha = this._root.contentbgopacity;
            this.txtmask.graphics.beginFill(this._root.solidbackgroundcolor);
            this.txtmask.graphics.drawRect(0, 0, this._root.newswidth, this._root.newsheight - 80 - this._root.contentbgtextvpadding * 2);
            this.txtmask.graphics.endFill();
            this.txtmask.alpha = 0;
            this.closeiconbg.graphics.beginFill(this._root.solidbackgroundcolor);
            this.closeiconbg.graphics.drawRoundRect(-15, -15, 30, 30, 7, 7);
            this.closeiconbg.graphics.endFill();
            this.close_ct.color = this._root.teasernavigcolor;
            this.closeiconvar.transform.colorTransform = this.close_ct;
            this.closeiconmc.addChild(this.closeiconbg);
            this.closeiconmc.addChild(this.closeiconvar);
            this.closeiconmc.buttonMode = true;
            this.closeiconmc.mouseEnabled = true;
            this.closeiconmc.x = this._root.newswidth - 15;
            this.closeiconmc.y = -25;
            this.scrollbar.graphics.beginFill(this._root.contentscrollbarcolor);
            if (this._root.contentscrollbarrounded != 0) 
            {
                this.scrollbar.graphics.drawRoundRect(0, 0, this._root.contentscrollbarwidth, this._root.contentscrollbarheight, this._root.contentscrollbarrounded, this._root.contentscrollbarrounded);
            }
            else 
            {
                this.scrollbar.graphics.drawRect(0, 0, this._root.contentscrollbarwidth, this._root.contentscrollbarheight);
            }
            this.scrollbar.graphics.endFill();
            this.scrollbar.buttonMode = true;
            this.txt.multiline = true;
            this.txt.condenseWhite = true;
            this.txt.wordWrap = true;
            this.txt.embedFonts = false;
            this.txt.selectable = true;
            this.txt.mouseWheelEnabled = true;
            this.txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.txt.autoSize = flash.text.TextFieldAutoSize.NONE;
            this.txt.gridFitType = flash.text.GridFitType.PIXEL;
            this.txt.width = this._root.newswidth - this._root.contentbgtexthpadding * 2 - this._root.contentscrollbarwidth - 10;
            this.txt.height = this._root.teaserdata_array[this._ivar]["textheight"];
            this.txt.styleSheet = this._root.style;
            this.txt.htmlText = this._root.teaserdata_array[this._ivar]["fulltext"];
            this.txt_mc.addChild(this.txt);
            this.solidbg.y = 0;
            this.txt_mc.y = this._root.contentbgtextvpadding;
            if (this.txtmask.height < (this.txt_mc.height - 1)) 
            {
                this.scrollbar.alpha = this._root.contentscrollbaropacity;
            }
            else 
            {
                this.scrollbar.alpha = 0;
                this.scrollbar.visible = false;
            }
            this.solidbg.x = 0;
            this.txt_mc.x = this._root.contentbgtexthpadding;
            this.txtmask.x = 0;
            this.txtmask.y = this.txt_mc.y;
            this.scrollbar.x = this.txt_mc.x + this.txt.width + 10;
            this.scrollbar.y = this.txt_mc.y;
            this.txt_mc.mask = this.txtmask;
            addChild(this.solidbg);
            addChild(this.txt_mc);
            addChild(this.txtmask);
            addChild(this.scrollbar);
            addChild(this.closeiconmc);
            this.y = 40;
            this.closeiconmc.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.close_over, false, 0, true);
            this.closeiconmc.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.close_out, false, 0, true);
            this.closeiconmc.addEventListener(flash.events.MouseEvent.CLICK, this.close_click, false, 0, true);
            this.scrollbar.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mouse_over, false, 0, true);
            this.scrollbar.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mouse_out, false, 0, true);
            this.initScroll();
            return;
        }

        internal function close_click(arg1:*):void
        {
            if (!this.closed) 
            {
                this.closed = true;
                this._teaser.killText();
            }
            return;
        }

        internal function mouse_out(arg1:*):void
        {
            if (this.t_scrollbar != null) 
            {
                this.t_scrollbar.stop();
            }
            this.t_scrollbar = org.libspark.betweenas3.BetweenAS3.to(this.scrollbar, {"alpha":this._root.contentscrollbaropacity}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            this.t_scrollbar.play();
            return;
        }

        internal function scrollPress(arg1:flash.events.MouseEvent):void
        {
            this.scrollbar.startDrag(false, this.bounds);
            this.scrollbar.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.onVerticalScroll, false, 0, true);
            this._stage.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.onVerticalScroll, false, 0, true);
            return;
        }

        internal function close_out(arg1:*):void
        {
            if (this.closei_t != null) 
            {
                this.closei_t.stop();
            }
            this.closei_t = org.libspark.betweenas3.BetweenAS3.to(this.closeiconmc, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.closei_t.play();
            return;
        }

        public function killListeners():void
        {
            this.closeiconmc.removeEventListener(flash.events.MouseEvent.MOUSE_OVER, this.close_over);
            this.closeiconmc.removeEventListener(flash.events.MouseEvent.MOUSE_OUT, this.close_out);
            this.closeiconmc.removeEventListener(flash.events.MouseEvent.CLICK, this.close_click);
            this.scrollbar.removeEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mouse_over);
            this.scrollbar.removeEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mouse_out);
            return;
        }

        internal function moveVertical(arg1:flash.events.Event):void
        {
            var loc1:*=(this.scrollbar.y - this.originaly) / this.scrollval;
            var loc2:*=this.originaly - (this.txt_mc.height - this.txtmask.height) * loc1;
            var loc3:*;
            var loc4:*=(loc3 = loc2 - this.txt_mc.y) / this.ease;
            this.txt_mc.y = this.txt_mc.y + loc4;
            if (Math.abs(this.txt_mc.y - loc2) < 1) 
            {
                this.txt_mc.removeEventListener(flash.events.Event.ENTER_FRAME, this.moveVertical);
                this.txt_mc.y = loc2;
            }
            return;
        }

        internal function scrollUp(arg1:flash.events.MouseEvent):void
        {
            this.scrollbar.stopDrag();
            if (this.scrollbar.hasEventListener(flash.events.MouseEvent.MOUSE_MOVE)) 
            {
                this.scrollbar.removeEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.onVerticalScroll);
            }
            if (this._stage.hasEventListener(flash.events.MouseEvent.MOUSE_MOVE)) 
            {
                this._stage.removeEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.onVerticalScroll);
            }
            return;
        }

        internal function initScroll():void
        {
            if (this.txtmask.height < (this.txt_mc.height - 1)) 
            {
                this.scrollbar.visible = true;
                if (this._root.banneractive != "true") 
                {
                    this.scrollbar.y = loc1 = this._root.contentbgtextvpadding;
                    this.txt_mc.y = loc1;
                }
                else 
                {
                    var loc1:*;
                    this.scrollbar.y = loc1 = this._root.bannerheight + this._root.contenttopdistance + this._root.contentbgtextvpadding;
                    this.txt_mc.y = loc1;
                }
                this.scrollval = this.txtmask.height - this.scrollbar.height;
                this.originaly = this.scrollbar.y;
                this.bounds = new flash.geom.Rectangle(this.scrollbar.x, this.originaly, 0, this.scrollval);
                this.removeScrollListeners();
                this.scrollbar.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.scrollPress, false, 0, true);
                this.scrollbar.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.scrollUp, true, 0, true);
                this._stage.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.scrollUp, false, 0, true);
                this._stage.addEventListener(flash.events.MouseEvent.MOUSE_WHEEL, this.onMWheel, false, 0, true);
            }
            else 
            {
                this.scrollbar.visible = false;
                this.removeScrollListeners();
            }
            return;
        }

        internal function close_over(arg1:*):void
        {
            if (this.closei_t != null) 
            {
                this.closei_t.stop();
            }
            this.closei_t = org.libspark.betweenas3.BetweenAS3.to(this.closeiconmc, {"alpha":0.6}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.closei_t.play();
            return;
        }

        internal function onVerticalScroll(arg1:flash.events.MouseEvent):void
        {
            if (!this.txt_mc.hasEventListener(flash.events.Event.ENTER_FRAME)) 
            {
                this.txt_mc.addEventListener(flash.events.Event.ENTER_FRAME, this.moveVertical, false, 0, true);
            }
            return;
        }

        internal function onMWheel(arg1:flash.events.MouseEvent):*
        {
            this.onVerticalScroll(null);
            if (arg1.delta > 0) 
            {
                this.scrollbar.stopDrag();
                if (this.scrollbar.y > this.originaly && this.scrollbar.y - this.originaly < this.scrollamount) 
                {
                    this.scrollbar.y = this.scrollbar.y - Math.floor(this.scrollbar.y - this.originaly);
                }
                else if (this.scrollbar.y > this.originaly && this.scrollbar.y - this.originaly >= this.scrollamount) 
                {
                    this.scrollbar.y = this.scrollbar.y - this.scrollamount;
                }
            }
            else 
            {
                this.scrollbar.stopDrag();
                if (this.scrollbar.y < this.txtmask.y + this.txtmask.height - this.scrollbar.height && this.txtmask.y + this.txtmask.height - this.scrollbar.y - this.scrollbar.height < this.scrollamount) 
                {
                    this.scrollbar.y = this.scrollbar.y + Math.floor(this.txtmask.y + this.txtmask.height - this.scrollbar.y - this.scrollbar.height);
                }
                else if (this.scrollbar.y < this.txtmask.y + this.txtmask.height - this.scrollbar.height && this.txtmask.y + this.txtmask.height - this.scrollbar.y - this.scrollbar.height >= this.scrollamount) 
                {
                    this.scrollbar.y = this.scrollbar.y + this.scrollamount;
                }
            }
            return;
        }

        public function removeScrollListeners():void
        {
            if (this.scrollbar.hasEventListener(flash.events.MouseEvent.MOUSE_DOWN)) 
            {
                this.scrollbar.removeEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.scrollPress);
            }
            if (this.scrollbar.hasEventListener(flash.events.MouseEvent.MOUSE_UP)) 
            {
                this.scrollbar.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.scrollUp);
            }
            if (this._stage.hasEventListener(flash.events.MouseEvent.MOUSE_UP)) 
            {
                this._stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.scrollUp);
            }
            if (this._stage.hasEventListener(flash.events.MouseEvent.MOUSE_WHEEL)) 
            {
                this._stage.removeEventListener(flash.events.MouseEvent.MOUSE_WHEEL, this.onMWheel);
            }
            return;
        }

        internal function mouse_over(arg1:*):void
        {
            if (this.t_scrollbar != null) 
            {
                this.t_scrollbar.stop();
            }
            this.t_scrollbar = org.libspark.betweenas3.BetweenAS3.to(this.scrollbar, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Expo.easeOut);
            this.t_scrollbar.play();
            return;
        }

        internal var _ivar:int;

        internal var closeiconvar:*;

        internal var close_ct:flash.geom.ColorTransform;

        internal var t_scrollbar:org.libspark.betweenas3.tweens.ITween;

        internal var scrollbar:flash.display.Sprite;

        internal var closei_t:org.libspark.betweenas3.tweens.ITween;

        internal var bounds:flash.geom.Rectangle;

        internal var solidbg:flash.display.Sprite;

        public var closeiconmc:flash.display.MovieClip;

        internal var originaly:int;

        internal var _root:flash.display.MovieClip;

        internal var scrollval:int;

        internal var txtmask:flash.display.Sprite;

        internal var scrollamount:int;

        internal var ease:int;

        internal var _teaser:flash.display.MovieClip;

        internal var txt:flash.text.TextField;

        internal var closed:Boolean=false;

        internal var closeiconbg:flash.display.Sprite;

        public var txt_mc:flash.display.MovieClip;

        internal var _stage:flash.display.Stage;
    }
}
