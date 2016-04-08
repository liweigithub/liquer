package gallerylib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class creategallery extends flash.display.MovieClip
    {
        public function creategallery(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            this.categorywrap = new flash.display.MovieClip();
            this.categorycontainer = new flash.display.MovieClip();
            this.categorymask = new flash.display.Sprite();
            this.categorybg = new flash.display.Sprite();
            this.thumbcontainer = new flash.display.MovieClip();
            this.descriptioncontainer = new flash.display.MovieClip();
            this.txt = new flash.text.TextField();
            this.categorybuttons = new Array();
            this.leftbig_mc = new flash.display.MovieClip();
            this.rightbig_mc = new flash.display.MovieClip();
            this.detailleft_mc = new flash.display.MovieClip();
            this.detailright_mc = new flash.display.MovieClip();
            this.leftbg = new flash.display.Sprite();
            this.rightbg = new flash.display.Sprite();
            this.detailleftbg = new flash.display.Sprite();
            this.detailrightbg = new flash.display.Sprite();
            this.leftmc = new lefticon();
            this.rightmc = new righticon();
            this.detailleftmc = new lefticon();
            this.detailrightmc = new righticon();
            super();
            this._stage = arg1;
            this._root = arg2;
            this.catxoffset = this._root.gallerypadding;
            this.descyoffset = this._root.categoryareaheight + this._root.thumbheight * this._root.thumbrows + this._root.thumbspacing * (this._root.thumbrows - 1);
            this.descareaheight = this._root.galleryheight - this.descyoffset - this._root.gallerypadding;
            this.categorymaskwidth = this._root.gallerywidth - this.catxoffset * 2;
            this.categorymask.graphics.beginFill(0);
            this.categorymask.graphics.drawRect(0, -Math.round(this._root.gallerypadding / 2), this.categorymaskwidth, this._root.categoryareaheight);
            this.categorymask.graphics.endFill();
            this.categorymask.mouseEnabled = false;
            var loc1:*;
            this.categorycontainer.alpha = loc1 = 0;
            this.categorymask.alpha = loc1;
            this.categorybg.graphics.beginFill(0);
            this.categorybg.graphics.drawRect(0, 0, 10, 10);
            this.categorybg.graphics.endFill();
            this.categorybg.alpha = 0;
            this.categorybg.y = -this.catxoffset;
            this.categorywrap.x = this.catxoffset;
            this.categorywrap.y = this._root.gallerypadding;
            this.leftbg.graphics.beginFill(this._root.thumbiconbgcolor);
            this.leftbg.graphics.drawRoundRect(-15, -15, 30, 30, 7, 7);
            this.leftbg.graphics.endFill();
            this.rightbg.graphics.beginFill(this._root.thumbiconbgcolor);
            this.rightbg.graphics.drawRoundRect(-15, -15, 30, 30, 7, 7);
            this.rightbg.graphics.endFill();
            this.detailleftbg.graphics.beginFill(this._root.thumbiconbgcolor);
            this.detailleftbg.graphics.drawRoundRect(-15, -15, 30, 30, 7, 7);
            this.detailleftbg.graphics.endFill();
            this.detailrightbg.graphics.beginFill(this._root.thumbiconbgcolor);
            this.detailrightbg.graphics.drawRoundRect(-15, -15, 30, 30, 7, 7);
            this.detailrightbg.graphics.endFill();
            this.colorTrans(this.leftmc, this._root.selectarrowcolor);
            this.colorTrans(this.rightmc, this._root.selectarrowcolor);
            this.colorTrans(this.detailleftmc, this._root.selectarrowcolor);
            this.colorTrans(this.detailrightmc, this._root.selectarrowcolor);
            this.detailrightmc.mouseEnabled = loc1 = false;
            this.detailleftmc.mouseEnabled = loc1 = loc1;
            this.rightmc.mouseEnabled = loc1 = loc1;
            this.leftmc.mouseEnabled = loc1;
            this.detailrightbg.mouseEnabled = loc1 = false;
            this.detailleftbg.mouseEnabled = loc1 = loc1;
            this.rightbg.mouseEnabled = loc1 = loc1;
            this.leftbg.mouseEnabled = loc1;
            this.detailrightbg.buttonMode = loc1 = false;
            this.detailleftbg.buttonMode = loc1 = loc1;
            this.rightbg.buttonMode = loc1 = loc1;
            this.leftbg.buttonMode = loc1;
            this.detailrightmc.buttonMode = loc1 = false;
            this.detailleftmc.buttonMode = loc1 = loc1;
            this.rightmc.buttonMode = loc1 = loc1;
            this.leftmc.buttonMode = loc1;
            this.leftbig_mc.x = this._root.gallerypadding + 15;
            this.detailleft_mc.x = this._root.gallerypadding + 15;
            this.leftbig_mc.y = this._root.galleryheight - Math.round(this.descareaheight / 2);
            this.detailleft_mc.y = this._root.galleryheight - Math.round(this.descareaheight / 2);
            this.leftbig_mc.buttonMode = true;
            this.detailleft_mc.buttonMode = true;
            this.rightbig_mc.x = this._root.gallerywidth - this._root.gallerypadding - 14;
            this.detailright_mc.x = this._root.gallerywidth - this._root.gallerypadding - 14;
            this.rightbig_mc.y = this._root.galleryheight - Math.round(this.descareaheight / 2);
            this.detailright_mc.y = this._root.galleryheight - Math.round(this.descareaheight / 2);
            this.rightbig_mc.buttonMode = true;
            this.detailright_mc.buttonMode = true;
            this.descriptioncontainer.x = this._root.gallerypadding + 40;
            this.descriptioncontainer.y = this._root.galleryheight - this.descareaheight;
            this.descriptioncontainer.tween = this.thumbt;
            this.indent = 10;
            this.txt.multiline = true;
            this.txt.condenseWhite = true;
            this.txt.wordWrap = true;
            this.txt.embedFonts = false;
            this.txt.selectable = false;
            this.txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.txt.width = Math.round(this._root.gallerywidth - this._root.gallerypadding * 2 - 60 - this.indent * 2);
            this.txt.gridFitType = flash.text.GridFitType.SUBPIXEL;
            this.txt.styleSheet = this._root.style;
            this.descriptioncontainer.txtfield = this.txt;
            this.descriptioncontainer.addChild(this.txt);
            addChild(this.categorywrap);
            this.categorywrap.addChild(this.categorycontainer);
            this.categorywrap.addChild(this.categorymask);
            this.categorycontainer.addChild(this.categorybg);
            this.thumbcontainer.x = this._root.gallerypadding;
            this.thumbcontainer.y = this._root.gallerypadding + this._root.categoryareaheight;
            this.leftbig_mc.addChild(this.leftbg);
            this.leftbig_mc.addChild(this.leftmc);
            this.rightbig_mc.addChild(this.rightbg);
            this.rightbig_mc.addChild(this.rightmc);
            this.detailleft_mc.addChild(this.detailleftbg);
            this.detailleft_mc.addChild(this.detailleftmc);
            this.detailright_mc.addChild(this.detailrightbg);
            this.detailright_mc.addChild(this.detailrightmc);
            addChild(this.leftbig_mc);
            addChild(this.rightbig_mc);
            addChild(this.descriptioncontainer);
            addChild(this.thumbcontainer);
            addChild(this.detailleft_mc);
            addChild(this.detailright_mc);
            this.categorycontainer.mask = this.categorymask;
            this.createCategoryButtons();
            this.fadeInFull(this.categorycontainer);
            return;
        }

        public function hidePageNav():void
        {
            this.rightbig_mc.visible = false;
            this.leftbig_mc.visible = false;
            return;
        }

        public function showDetailNav():void
        {
            this.detailright_mc.visible = true;
            this.detailleft_mc.visible = true;
            return;
        }

        public function selectCategory():void
        {
            if (this.category != null) 
            {
                this.hideDescription();
                this.category.removeListeners();
                this.category.removePage();
                this.category = null;
            }
            var loc1:*;
            this.detailright_mc.mouseEnabled = loc1 = false;
            this.detailleft_mc.mouseEnabled = loc1 = loc1;
            this.rightbig_mc.mouseEnabled = loc1 = loc1;
            this.leftbig_mc.mouseEnabled = loc1;
            this.detailright_mc.alpha = loc1 = 0.3;
            this.detailleft_mc.alpha = loc1 = loc1;
            this.rightbig_mc.alpha = loc1 = loc1;
            this.leftbig_mc.alpha = loc1;
            this.detailright_mc.visible = loc1 = false;
            this.detailleft_mc.visible = loc1;
            this.category = new gallerylib.createcategory(this._root, this._stage, this.thumbcontainer, this.activecategory, this, this.descriptioncontainer);
            this.showPageNav();
            return;
        }

        internal function createCategoryButtons():void
        {
            var loc1:*=0;
            while (loc1 < this._root.maxcategory) 
            {
                this.categorybuttons[loc1] = new gallerylib.categorybutton(this._root, this.categorycontainer, loc1, this);
                this.categorycontainerwidth = this.categorycontainer.width;
                this.categorybg.width = this.categorycontainerwidth;
                this.categorybg.height = this.categorycontainer.height;
                if (this._root.categoryscrolltype != "relative") 
                {
                    if (this._root.categoryscrolltype == "fixed") 
                    {
                        if (this.categorycontainerwidth > this.categorymaskwidth && !this.categorycontainer.hasEventListener(flash.events.MouseEvent.MOUSE_MOVE)) 
                        {
                            this.categorycontainer.addEventListener(flash.events.Event.ENTER_FRAME, this.scrollingFixed, false, 0, true);
                        }
                    }
                }
                else if (this.categorycontainerwidth > this.categorymaskwidth && !this.categorycontainer.hasEventListener(flash.events.MouseEvent.MOUSE_MOVE)) 
                {
                    this.categorycontainer.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.scrolling, false, 0, true);
                }
                ++loc1;
            }
            return;
        }

        public function fadeInHalf(arg1:flash.display.MovieClip):void
        {
            var item_t:org.libspark.betweenas3.tweens.ITween;
            var target:flash.display.MovieClip;
            var deleteTween:Function;

            var loc1:*;
            deleteTween = null;
            target = arg1;
            deleteTween = function (arg1:org.libspark.betweenas3.tweens.ITween):void
            {
                arg1 = null;
                return;
            }
            item_t = org.libspark.betweenas3.BetweenAS3.to(target, {"alpha":0.2}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            item_t.onComplete = deleteTween;
            item_t.onCompleteParams = [item_t];
            item_t.play();
            return;
        }

        internal function scrollingFixed(arg1:flash.events.Event):void
        {
            var loc1:*=NaN;
            if (this.categorycontainer.hitTestPoint(this._stage.mouseX, this._stage.mouseY, true)) 
            {
                if (mouseX < this.scrollborderbuffer) 
                {
                    if (this.categorycontainer.x < 0) 
                    {
                        this.categorycontainer.x = this.categorycontainer.x + this._root.categoryscrollspeed;
                    }
                }
                else if (!(mouseX >= this.scrollborderbuffer && this._stage.mouseX <= this.categorymaskwidth - this.scrollborderbuffer)) 
                {
                    if (mouseX > this.categorymaskwidth - this.scrollborderbuffer) 
                    {
                        if (this.categorycontainer.x > this.categorymaskwidth - this.categorycontainerwidth) 
                        {
                            this.categorycontainer.x = this.categorycontainer.x - this._root.categoryscrollspeed;
                        }
                    }
                }
            }
            return;
        }

        public function fadeInFull(arg1:flash.display.MovieClip):void
        {
            var item_t:org.libspark.betweenas3.tweens.ITween;
            var target:flash.display.MovieClip;
            var deleteTween:Function;

            var loc1:*;
            deleteTween = null;
            target = arg1;
            deleteTween = function (arg1:org.libspark.betweenas3.tweens.ITween):void
            {
                arg1 = null;
                return;
            }
            item_t = org.libspark.betweenas3.BetweenAS3.to(target, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            item_t.onComplete = deleteTween;
            item_t.onCompleteParams = [item_t];
            item_t.play();
            return;
        }

        public function colorTrans(arg1:flash.display.MovieClip, arg2:uint):void
        {
            var loc1:*=arg1.transform.colorTransform;
            loc1.color = arg2;
            arg1.transform.colorTransform = loc1;
            return;
        }

        public function allowClicks():void
        {
            this.clickallow = true;
            return;
        }

        public function hideDetailNav():void
        {
            this.detailright_mc.visible = false;
            this.detailleft_mc.visible = false;
            return;
        }

        internal function scrolling(arg1:flash.events.MouseEvent):void
        {
            var loc1:*=NaN;
            var loc2:*=NaN;
            var loc3:*=NaN;
            this.mousex = this.categorycontainer.mouseX;
            if (this.categorymaskwidth - this.scrollborderbuffer < this.mousex) 
            {
                loc1 = this.categorymaskwidth - this.scrollborderbuffer;
            }
            else 
            {
                loc1 = this.mousex;
            }
            if (loc1 > this.scrollborderbuffer) 
            {
                loc2 = (loc1 - this.scrollborderbuffer) / (this.categorymaskwidth - 2 * this.scrollborderbuffer);
            }
            else 
            {
                loc2 = (this.scrollborderbuffer - this.scrollborderbuffer) / (this.categorymaskwidth - 2 * this.scrollborderbuffer);
            }
            loc3 = Math.round(loc2 * (this.categorymaskwidth - this.categorycontainerwidth));
            if (this.catconx != loc3) 
            {
                this.catconx = loc3;
                if (!this.categorycontainer.hasEventListener(flash.events.Event.ENTER_FRAME)) 
                {
                    this.categorycontainer.addEventListener(flash.events.Event.ENTER_FRAME, this.easing, false, 0, true);
                }
            }
            return;
        }

        internal function easing(arg1:flash.events.Event):void
        {
            var loc1:*=NaN;
            if (Math.abs(this.categorycontainer.x - this.catconx) < 1) 
            {
                this.categorycontainer.x = this.catconx;
                this.categorycontainer.removeEventListener(flash.events.Event.ENTER_FRAME, this.easing);
            }
            else 
            {
                loc1 = this.catconx - this.categorycontainer.x;
                this.categorycontainer.x = this.categorycontainer.x + loc1 / this.scrollease;
            }
            return;
        }

        public function showDescription():void
        {
            if (this.thumbt != null) 
            {
                this.thumbt.stop();
            }
            this.thumbt = org.libspark.betweenas3.BetweenAS3.tween(this.descriptioncontainer, {"_blurFilter":{"blurX":0, "blurY":0, "quality":1}, "alpha":1}, {"_blurFilter":{"blurX":this._root.thumbblurstrength, "blurY":this._root.thumbblurstrength, "quality":1}, "alpha":0}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.thumbt.play();
            return;
        }

        public function disallowClicks():void
        {
            this.clickallow = false;
            return;
        }

        public function showPageNav():void
        {
            this.rightbig_mc.visible = true;
            this.leftbig_mc.visible = true;
            return;
        }

        public function clicksAllowedCheck():Boolean
        {
            if (this.clickallow) 
            {
                return true;
            }
            return false;
        }

        public function hideDescription():void
        {
            if (this.thumbt != null) 
            {
                this.thumbt.stop();
            }
            this.thumbt = org.libspark.betweenas3.BetweenAS3.to(this.descriptioncontainer, {"_blurFilter":{"blurX":this._root.thumbblurstrength, "blurY":this._root.thumbblurstrength, "quality":1}, "alpha":0}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.thumbt.play();
            return;
        }

        public var category:Object;

        internal var descyoffset:Number;

        public var categorymaskwidth:Number;

        internal var detailleftbg:flash.display.Sprite;

        internal var indent:Number;

        internal var rightmc:*;

        internal var scrollborderbuffer:Number=150;

        internal var scrollease:Number=5;

        internal var _root:flash.display.MovieClip;

        internal var categorycontainer:flash.display.MovieClip;

        internal var detailrightbg:flash.display.Sprite;

        public var descareaheight:Number;

        public var categorywrap:flash.display.MovieClip;

        internal var categorybg:flash.display.Sprite;

        public var activecategory:Number=0;

        internal var detailrightmc:*;

        public var rightbig_mc:flash.display.MovieClip;

        public var categorybuttons:Array;

        internal var descriptioncontainer:flash.display.MovieClip;

        public var clickallow:Boolean=false;

        internal var catconx:Number=0;

        public var detailleft_mc:flash.display.MovieClip;

        internal var thumbt:org.libspark.betweenas3.tweens.ITween;

        internal var rightbg:flash.display.Sprite;

        public var categorycontainerwidth:Number;

        internal var leftmc:*;

        internal var leftbg:flash.display.Sprite;

        internal var categorymask:flash.display.Sprite;

        public var thumbcontainer:flash.display.MovieClip;

        internal var detailleftmc:*;

        public var catbuttonx:Number=0;

        public var detailright_mc:flash.display.MovieClip;

        internal var mousex:Number;

        internal var mousey:Number;

        internal var catxoffset:Number;

        internal var txt:flash.text.TextField;

        public var leftbig_mc:flash.display.MovieClip;

        internal var _stage:flash.display.Stage;
    }
}
