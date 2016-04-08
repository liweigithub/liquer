package newslib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createteasers extends flash.display.MovieClip
    {
        public function createteasers(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            this.teasercontainer = new flash.display.MovieClip();
            this.teasermask = new flash.display.Sprite();
            this.leftbg = new flash.display.Sprite();
            this.rightbg = new flash.display.Sprite();
            this.licon = new lefticon();
            this.ricon = new righticon();
            this.leftbig_mc = new flash.display.MovieClip();
            this.rightbig_mc = new flash.display.MovieClip();
            this.navigleft_ct = this.leftbig_mc.transform.colorTransform;
            this.navigright_ct = this.rightbig_mc.transform.colorTransform;
            this.teasers = new Array();
            super();
            this._stage = arg1;
            this._root = arg2;
            var loc1:*=this._root.newswidth;
            var loc2:*=this._root.newsheight - 80;
            this.teasermask.graphics.beginFill(0);
            this.teasermask.graphics.drawRect(0, 0, loc1, loc2);
            this.teasermask.graphics.endFill();
            this.teasermask.x = 0;
            this.teasermask.y = 40;
            this.teasermask.mouseEnabled = false;
            this.teasermask.alpha = 0;
            this.navigleft_ct.color = this._root.teasernavigcolor;
            this.licon.transform.colorTransform = this.navigleft_ct;
            this.navigright_ct.color = this._root.teasernavigcolor;
            this.ricon.transform.colorTransform = this.navigright_ct;
            this.leftbg.graphics.beginFill(this._root.solidbackgroundcolor);
            this.leftbg.graphics.drawRoundRect(-15, -15, 30, 30, 7, 7);
            this.leftbg.graphics.endFill();
            this.rightbg.graphics.beginFill(this._root.solidbackgroundcolor);
            this.rightbg.graphics.drawRoundRect(-15, -15, 30, 30, 7, 7);
            this.rightbg.graphics.endFill();
            var loc3:*;
            this.ricon.mouseEnabled = loc3 = false;
            this.licon.mouseEnabled = loc3 = loc3;
            this.rightbg.mouseEnabled = loc3 = loc3;
            this.leftbg.mouseEnabled = loc3;
            this.leftbig_mc.addChild(this.leftbg);
            this.leftbig_mc.addChild(this.licon);
            this.rightbig_mc.addChild(this.rightbg);
            this.rightbig_mc.addChild(this.ricon);
            this.rightbig_mc.alpha = loc3 = 0.1;
            this.leftbig_mc.alpha = loc3;
            this.rightbig_mc.x = loc3 = Math.round(this._root.newswidth / 2);
            this.leftbig_mc.x = loc3;
            this.leftbig_mc.y = 15;
            this.rightbig_mc.y = this._root.newsheight - 15;
            this.teasercontainer.x = this.teasermask.x;
            this.teasercontainer.y = this.teasermask.y;
            this.teasercontainer.mask = this.teasermask;
            addChild(this.teasercontainer);
            addChild(this.teasermask);
            this.loadTeasers();
            if (this._root.maxteaser > this._root.teasersvisible) 
            {
                this.rightbig_mc.buttonMode = loc3 = true;
                this.leftbig_mc.buttonMode = loc3;
                this.rightbig_mc.mouseEnabled = loc3 = false;
                this.leftbig_mc.mouseEnabled = loc3;
                addChild(this.leftbig_mc);
                addChild(this.rightbig_mc);
                this.activateRB();
                this.addListeners();
            }
            return;
        }

        internal function loadTeasers():void
        {
            var loc1:*=0;
            while (loc1 < this._root.maxteaser) 
            {
                this.teasers[loc1] = new newslib.teaser(this._root, this._stage, this.teasercontainer, loc1, this.ypos, this);
                this.ypos = this.ypos + (this._root.teaserimageheight + this._root.teaserimagepadding * 2 + this._root.teaserimagespacing);
                ++loc1;
            }
            return;
        }

        internal function lb_out(arg1:*):void
        {
            if (this.lb_active) 
            {
                if (this.lb_t != null) 
                {
                    this.lb_t.stop();
                }
                this.lb_t = org.libspark.betweenas3.BetweenAS3.to(this.leftbig_mc, {"alpha":0.5}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.lb_t.play();
            }
            else 
            {
                if (this.lb_t != null) 
                {
                    this.lb_t.stop();
                }
                this.lb_t = org.libspark.betweenas3.BetweenAS3.to(this.leftbig_mc, {"alpha":0.1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.lb_t.play();
            }
            return;
        }

        public function rb_click(arg1:*):void
        {
            if (this.rb_active && this.allow) 
            {
                if (this.activeentry < this._root.maxteaser - this._root.teasersvisible) 
                {
                    var loc1:*;
                    var loc2:*=((loc1 = this).activeentry + 1);
                    loc1.activeentry = loc2;
                    if (this.container_t != null) 
                    {
                        this.container_t.stop();
                    }
                    this.container_t = org.libspark.betweenas3.BetweenAS3.to(this.teasercontainer, {"y":-this.teasers[this.activeentry]._yvar + 40}, 0.7, org.libspark.betweenas3.easing.Expo.easeInOut);
                    this.container_t.play();
                }
                if (this.activeentry == this._root.maxteaser - this._root.teasersvisible) 
                {
                    this.deactivateRB();
                }
                if (this.activeentry > 0) 
                {
                    if (!this.lb_active) 
                    {
                        this.activateLB();
                    }
                }
            }
            return;
        }

        internal function deactivateLB():void
        {
            this.leftbig_mc.mouseEnabled = false;
            this.lb_active = false;
            if (this.lb_t != null) 
            {
                this.lb_t.stop();
            }
            this.lb_t = org.libspark.betweenas3.BetweenAS3.to(this.leftbig_mc, {"alpha":0.1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.lb_t.play();
            return;
        }

        internal function rb_over(arg1:*):void
        {
            if (this.rb_active && this.allow) 
            {
                if (this.rb_t != null) 
                {
                    this.rb_t.stop();
                }
                this.rb_t = org.libspark.betweenas3.BetweenAS3.to(this.rightbig_mc, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.rb_t.play();
            }
            return;
        }

        internal function lb_over(arg1:*):void
        {
            if (this.lb_active && this.allow) 
            {
                if (this.lb_t != null) 
                {
                    this.lb_t.stop();
                }
                this.lb_t = org.libspark.betweenas3.BetweenAS3.to(this.leftbig_mc, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.lb_t.play();
            }
            return;
        }

        public function lb_click(arg1:*):void
        {
            if (this.lb_active && this.allow) 
            {
                if (this.activeentry > 0) 
                {
                    var loc1:*;
                    var loc2:*=((loc1 = this).activeentry - 1);
                    loc1.activeentry = loc2;
                    if (this.container_t != null) 
                    {
                        this.container_t.stop();
                    }
                    this.container_t = org.libspark.betweenas3.BetweenAS3.to(this.teasercontainer, {"y":-this.teasers[this.activeentry]._yvar + 40}, 0.7, org.libspark.betweenas3.easing.Expo.easeInOut);
                    this.container_t.play();
                }
                if (this.activeentry == 0) 
                {
                    this.deactivateLB();
                }
                if (this.activeentry < this._root.maxteaser) 
                {
                    if (!this.rb_active) 
                    {
                        this.activateRB();
                    }
                }
            }
            return;
        }

        internal function addListeners():void
        {
            this.leftbig_mc.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.lb_over, false, 0, true);
            this.leftbig_mc.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.lb_out, false, 0, true);
            this.leftbig_mc.addEventListener(flash.events.MouseEvent.CLICK, this.lb_click, false, 0, true);
            this.rightbig_mc.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.rb_over, false, 0, true);
            this.rightbig_mc.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.rb_out, false, 0, true);
            this.rightbig_mc.addEventListener(flash.events.MouseEvent.CLICK, this.rb_click, false, 0, true);
            return;
        }

        public function allowClick():void
        {
            this.allow = true;
            return;
        }

        internal function deactivateRB():void
        {
            this.rightbig_mc.mouseEnabled = false;
            this.rb_active = false;
            if (this.rb_t != null) 
            {
                this.rb_t.stop();
            }
            this.rb_t = org.libspark.betweenas3.BetweenAS3.to(this.rightbig_mc, {"alpha":0.1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.rb_t.play();
            return;
        }

        public function disallowClick():void
        {
            this.allow = false;
            return;
        }

        internal function activateLB():void
        {
            this.leftbig_mc.mouseEnabled = true;
            this.lb_active = true;
            if (this.lb_t != null) 
            {
                this.lb_t.stop();
            }
            this.lb_t = org.libspark.betweenas3.BetweenAS3.to(this.leftbig_mc, {"alpha":0.5}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.lb_t.play();
            return;
        }

        internal function rb_out(arg1:*):void
        {
            if (this.rb_active) 
            {
                if (this.rb_t != null) 
                {
                    this.rb_t.stop();
                }
                this.rb_t = org.libspark.betweenas3.BetweenAS3.to(this.rightbig_mc, {"alpha":0.5}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.rb_t.play();
            }
            else 
            {
                if (this.rb_t != null) 
                {
                    this.rb_t.stop();
                }
                this.rb_t = org.libspark.betweenas3.BetweenAS3.to(this.rightbig_mc, {"alpha":0.1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.rb_t.play();
            }
            return;
        }

        internal function activateRB():void
        {
            this.rightbig_mc.mouseEnabled = true;
            this.rb_active = true;
            if (this.rb_t != null) 
            {
                this.rb_t.stop();
            }
            this.rb_t = org.libspark.betweenas3.BetweenAS3.to(this.rightbig_mc, {"alpha":0.5}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.rb_t.play();
            return;
        }

        internal var leftbig_mc:flash.display.MovieClip;

        internal var _stage:flash.display.Stage;

        internal var navigleft_ct:flash.geom.ColorTransform;

        internal var leftbg:flash.display.Sprite;

        internal var teasers:Array;

        internal var rb_t:org.libspark.betweenas3.tweens.ITween;

        public var activeentry:int=0;

        internal var teasercontainer:flash.display.MovieClip;

        internal var container_t:org.libspark.betweenas3.tweens.ITween;

        internal var ypos:int=0;

        internal var rightbg:flash.display.Sprite;

        internal var _root:flash.display.MovieClip;

        public var allow:Boolean=true;

        internal var licon:*;

        internal var teasersloaded:Number=0;

        internal var ricon:*;

        internal var lb_active:Boolean=false;

        internal var lb_t:org.libspark.betweenas3.tweens.ITween;

        internal var rb_active:Boolean=false;

        internal var rightbig_mc:flash.display.MovieClip;

        internal var navigright_ct:flash.geom.ColorTransform;

        internal var teasermask:flash.display.Sprite;
    }
}
