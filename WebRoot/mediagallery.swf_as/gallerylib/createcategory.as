package gallerylib 
{
    import flash.display.*;
    import flash.events.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createcategory extends flash.display.MovieClip
    {
        public function createcategory(arg1:flash.display.MovieClip, arg2:flash.display.Stage, arg3:flash.display.MovieClip, arg4:Number, arg5:flash.display.MovieClip, arg6:flash.display.MovieClip)
        {
            this.thumbs = new Array();
            super();
            this._root = arg1;
            this._stage = arg2;
            this._container = arg3;
            this._ivar = arg4;
            this._gallery = arg5;
            this._description = arg6;
            this.tr = this._root.thumbrows;
            this.tc = this._root.thumbcolumns;
            this.sp = this._root.thumbspacing;
            this.tw = this._root.thumbwidth;
            this.th = this._root.thumbheight;
            this.maxthumbsonpage = this.tr * this.tc;
            this.entryamount = this._root.gallerydata_array[this._ivar]["entryamount"];
            this.pageamount = Math.ceil(this._root.gallerydata_array[this._ivar]["entryamount"] / this.maxthumbsonpage);
            this.rb_active = false;
            this.lb_active = false;
            if (this.pageamount > 1) 
            {
                this.activateRB();
            }
            else 
            {
                this.deactivateRB();
            }
            this.loadPage(this.activepage);
            this.addListeners();
            return;
        }

        public function deactivateLB_detail():void
        {
            this._gallery.detailleft_mc.mouseEnabled = false;
            this.lb_active_detail = false;
            if (this.lb_t_detail != null) 
            {
                this.lb_t_detail.stop();
            }
            this.lb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailleft_mc, {"alpha":0.3}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.lb_t_detail.play();
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
                this.lb_t = org.libspark.betweenas3.BetweenAS3.to(this._gallery.leftbig_mc, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.lb_t.play();
            }
            else 
            {
                if (this.lb_t != null) 
                {
                    this.lb_t.stop();
                }
                this.lb_t = org.libspark.betweenas3.BetweenAS3.to(this._gallery.leftbig_mc, {"alpha":0.3}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.lb_t.play();
            }
            return;
        }

        internal function addListeners():void
        {
            this._gallery.leftbig_mc.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.lb_over, false, 0, true);
            this._gallery.leftbig_mc.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.lb_out, false, 0, true);
            this._gallery.leftbig_mc.addEventListener(flash.events.MouseEvent.CLICK, this.lb_click, false, 0, true);
            this._gallery.rightbig_mc.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.rb_over, false, 0, true);
            this._gallery.rightbig_mc.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.rb_out, false, 0, true);
            this._gallery.rightbig_mc.addEventListener(flash.events.MouseEvent.CLICK, this.rb_click, false, 0, true);
            this._gallery.detailleft_mc.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.lb_over_detail, false, 0, true);
            this._gallery.detailleft_mc.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.lb_out_detail, false, 0, true);
            this._gallery.detailleft_mc.addEventListener(flash.events.MouseEvent.CLICK, this.lb_click_detail, false, 0, true);
            this._gallery.detailright_mc.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.rb_over_detail, false, 0, true);
            this._gallery.detailright_mc.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.rb_out_detail, false, 0, true);
            this._gallery.detailright_mc.addEventListener(flash.events.MouseEvent.CLICK, this.rb_click_detail, false, 0, true);
            return;
        }

        public function loadPrevious():void
        {
            this.thumbs[(this.activethumbivar - this.minvar - 1)].loadEntry();
            return;
        }

        public function removePage():void
        {
            var loc1:*=0;
            if (this.thumbs.length != 0) 
            {
                loc1 = 0;
                while (loc1 < this.thumbs.length) 
                {
                    this.thumbs[loc1].killLoader();
                    this.thumbs[loc1].killVideo();
                    this.thumbs[loc1] = null;
                    ++loc1;
                }
            }
            while (this._gallery.thumbcontainer.numChildren) 
            {
                this._gallery.thumbcontainer.removeChildAt(0);
            }
            return;
        }

        public function lb_click_detail(arg1:*):void
        {
            if (this.lb_active_detail && this._gallery.clicksAllowedCheck()) 
            {
                this.previousEntry();
                this._gallery.disallowClicks();
            }
            return;
        }

        public function deactivateRB_detail():void
        {
            this._gallery.detailright_mc.mouseEnabled = false;
            this.rb_active_detail = false;
            if (this.rb_t_detail != null) 
            {
                this.rb_t_detail.stop();
            }
            this.rb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailright_mc, {"alpha":0.3}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.rb_t_detail.play();
            return;
        }

        internal function lb_over(arg1:*):void
        {
            if (this.lb_active) 
            {
                if (this.lb_t != null) 
                {
                    this.lb_t.stop();
                }
                this.lb_t = org.libspark.betweenas3.BetweenAS3.to(this._gallery.leftbig_mc, {"alpha":0.6}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.lb_t.play();
            }
            return;
        }

        internal function deactivateLB():void
        {
            this._gallery.leftbig_mc.mouseEnabled = false;
            this.lb_active = false;
            if (this.lb_t != null) 
            {
                this.lb_t.stop();
            }
            this.lb_t = org.libspark.betweenas3.BetweenAS3.to(this._gallery.leftbig_mc, {"alpha":0.3}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.lb_t.play();
            return;
        }

        public function removeListeners():void
        {
            if (this._gallery.leftbig_mc.hasEventListener(flash.events.MouseEvent.MOUSE_OVER)) 
            {
                this._gallery.leftbig_mc.removeEventListener(flash.events.MouseEvent.MOUSE_OVER, this.lb_over);
            }
            if (this._gallery.leftbig_mc.hasEventListener(flash.events.MouseEvent.MOUSE_OUT)) 
            {
                this._gallery.leftbig_mc.removeEventListener(flash.events.MouseEvent.MOUSE_OUT, this.lb_out);
            }
            if (this._gallery.leftbig_mc.hasEventListener(flash.events.MouseEvent.CLICK)) 
            {
                this._gallery.leftbig_mc.removeEventListener(flash.events.MouseEvent.CLICK, this.lb_click);
            }
            if (this._gallery.rightbig_mc.hasEventListener(flash.events.MouseEvent.MOUSE_OVER)) 
            {
                this._gallery.rightbig_mc.removeEventListener(flash.events.MouseEvent.MOUSE_OVER, this.rb_over);
            }
            if (this._gallery.rightbig_mc.hasEventListener(flash.events.MouseEvent.MOUSE_OUT)) 
            {
                this._gallery.rightbig_mc.removeEventListener(flash.events.MouseEvent.MOUSE_OUT, this.rb_out);
            }
            if (this._gallery.rightbig_mc.hasEventListener(flash.events.MouseEvent.CLICK)) 
            {
                this._gallery.rightbig_mc.removeEventListener(flash.events.MouseEvent.CLICK, this.rb_click);
            }
            if (this._gallery.detailleft_mc.hasEventListener(flash.events.MouseEvent.MOUSE_OVER)) 
            {
                this._gallery.detailleft_mc.removeEventListener(flash.events.MouseEvent.MOUSE_OVER, this.lb_over_detail);
            }
            if (this._gallery.detailleft_mc.hasEventListener(flash.events.MouseEvent.MOUSE_OUT)) 
            {
                this._gallery.detailleft_mc.removeEventListener(flash.events.MouseEvent.MOUSE_OUT, this.lb_out_detail);
            }
            if (this._gallery.detailleft_mc.hasEventListener(flash.events.MouseEvent.CLICK)) 
            {
                this._gallery.detailleft_mc.removeEventListener(flash.events.MouseEvent.CLICK, this.lb_click_detail);
            }
            if (this._gallery.detailright_mc.hasEventListener(flash.events.MouseEvent.MOUSE_OVER)) 
            {
                this._gallery.detailright_mc.removeEventListener(flash.events.MouseEvent.MOUSE_OVER, this.rb_over_detail);
            }
            if (this._gallery.detailright_mc.hasEventListener(flash.events.MouseEvent.MOUSE_OUT)) 
            {
                this._gallery.detailright_mc.removeEventListener(flash.events.MouseEvent.MOUSE_OUT, this.rb_out_detail);
            }
            if (this._gallery.detailright_mc.hasEventListener(flash.events.MouseEvent.CLICK)) 
            {
                this._gallery.detailright_mc.removeEventListener(flash.events.MouseEvent.CLICK, this.rb_click_detail);
            }
            return;
        }

        public function checkIfPrevious():Boolean
        {
            if (this.activepage == 1 && this.activethumbivar == 0) 
            {
                return false;
            }
            return true;
        }

        internal function rb_over_detail(arg1:*):void
        {
            if (this.rb_active_detail && this._gallery.clicksAllowedCheck()) 
            {
                if (this.rb_t_detail != null) 
                {
                    this.rb_t_detail.stop();
                }
                this.rb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailright_mc, {"alpha":0.6}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.rb_t_detail.play();
            }
            return;
        }

        public function lastEntry():void
        {
            this.thumbs[(this.thumbsonpage - 1)].loadEntry();
            return;
        }

        internal function activateRB():void
        {
            this._gallery.rightbig_mc.mouseEnabled = true;
            this.rb_active = true;
            if (this.rb_t != null) 
            {
                this.rb_t.stop();
            }
            this.rb_t = org.libspark.betweenas3.BetweenAS3.to(this._gallery.rightbig_mc, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.rb_t.play();
            return;
        }

        internal function rb_over(arg1:*):void
        {
            if (this.rb_active) 
            {
                if (this.rb_t != null) 
                {
                    this.rb_t.stop();
                }
                this.rb_t = org.libspark.betweenas3.BetweenAS3.to(this._gallery.rightbig_mc, {"alpha":0.6}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.rb_t.play();
            }
            return;
        }

        public function nextEntry():void
        {
            if (this._gallery.clicksAllowedCheck()) 
            {
                if (this.activethumbivar + 1 < this.maxvar) 
                {
                    this.selectnext = true;
                    this.activethumb.bigRemover();
                }
                else if (this.activethumbivar + 1 == this.maxvar) 
                {
                    this.selectfirst = true;
                    this.rb_click(null);
                }
            }
            return;
        }

        internal function checkIfAllLoaded(arg1:flash.events.Event):void
        {
            if (this.thumbsloaded == this.thumbsonpage) 
            {
                this.removeEventListener(flash.events.Event.ENTER_FRAME, this.checkIfAllLoaded);
                this._gallery.allowClicks();
            }
            return;
        }

        public function lb_click(arg1:*):void
        {
            if (this.lb_active && this.activepage > 1 && this._gallery.clicksAllowedCheck()) 
            {
                this._gallery.disallowClicks();
                this.removePage();
                var loc1:*;
                var loc2:*=((loc1 = this).activepage - 1);
                loc1.activepage = loc2;
                this.loadPage(this.activepage);
                if (!this.rb_active) 
                {
                    this.activateRB();
                }
                if (this.activepage == 1) 
                {
                    this.deactivateLB();
                }
                this._gallery.showPageNav();
                this._gallery.hideDescription();
            }
            return;
        }

        public function rb_click_detail(arg1:*):void
        {
            if (this.rb_active_detail && this._gallery.clicksAllowedCheck()) 
            {
                this.nextEntry();
                this._gallery.disallowClicks();
            }
            return;
        }

        internal function loadPage(arg1:int):void
        {
            var loc2:*=0;
            this.xpos = 0;
            this.ypos = 0;
            this.count = 0;
            this.rowcount = 0;
            this.thumbsloaded = 0;
            this.thumbs = [];
            this.addEventListener(flash.events.Event.ENTER_FRAME, this.checkIfAllLoaded, false, 0, true);
            this.minvar = (arg1 - 1) * this.maxthumbsonpage;
            this.entriesleft = this.entryamount - (arg1 - 1) * this.maxthumbsonpage;
            if (this.entriesleft < this.maxthumbsonpage) 
            {
                this.maxvar = this.minvar + this.entriesleft;
            }
            else 
            {
                this.maxvar = this.minvar + this.maxthumbsonpage;
            }
            this.thumbsonpage = this.maxvar - this.minvar;
            var loc1:*=this.minvar;
            while (loc1 < this.maxvar) 
            {
                if (loc1 > (this.maxthumbsonpage - 1)) 
                {
                    loc2 = loc1 - this.maxthumbsonpage * (arg1 - 1);
                }
                else 
                {
                    loc2 = loc1;
                }
                this.thumbs[loc2] = new gallerylib.thumb(this._root, this._stage, this._container, loc1, this._ivar, this, this.xpos, this.ypos, this._gallery, this._description);
                if (this.count < (this.tc - 1)) 
                {
                    var loc3:*;
                    var loc4:*=((loc3 = this).count + 1);
                    loc3.count = loc4;
                    this.xpos = this.xpos + (this.tw + this.sp);
                }
                else 
                {
                    loc4 = ((loc3 = this).rowcount + 1);
                    loc3.rowcount = loc4;
                    this.count = 0;
                    this.xpos = 0;
                }
                this.ypos = (this.th + this.sp) * this.rowcount;
                ++loc1;
            }
            return;
        }

        public function firstEntry():void
        {
            this.thumbs[0].loadEntry();
            return;
        }

        public function activateRB_detail():void
        {
            this._gallery.detailright_mc.mouseEnabled = true;
            this.rb_active_detail = true;
            if (this.rb_t_detail != null) 
            {
                this.rb_t_detail.stop();
            }
            this.rb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailright_mc, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.rb_t_detail.play();
            return;
        }

        internal function activateLB():void
        {
            this._gallery.leftbig_mc.mouseEnabled = true;
            this.lb_active = true;
            if (this.lb_t != null) 
            {
                this.lb_t.stop();
            }
            this.lb_t = org.libspark.betweenas3.BetweenAS3.to(this._gallery.leftbig_mc, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.lb_t.play();
            return;
        }

        internal function deactivateRB():void
        {
            this._gallery.rightbig_mc.mouseEnabled = false;
            this.rb_active = false;
            if (this.rb_t != null) 
            {
                this.rb_t.stop();
            }
            this.rb_t = org.libspark.betweenas3.BetweenAS3.to(this._gallery.rightbig_mc, {"alpha":0.3}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.rb_t.play();
            return;
        }

        public function rb_click(arg1:*):void
        {
            if (this.rb_active && this.activepage < this.pageamount && this._gallery.clicksAllowedCheck()) 
            {
                this._gallery.disallowClicks();
                this.removePage();
                var loc1:*;
                var loc2:*=((loc1 = this).activepage + 1);
                loc1.activepage = loc2;
                this.loadPage(this.activepage);
                if (!this.lb_active) 
                {
                    this.activateLB();
                }
                if (this.activepage == this.pageamount) 
                {
                    this.deactivateRB();
                }
                this._gallery.showPageNav();
                this._gallery.hideDescription();
            }
            return;
        }

        public function previousEntry():void
        {
            if (this._gallery.clicksAllowedCheck()) 
            {
                if (this.activethumbivar > this.minvar) 
                {
                    this.selectprevious = true;
                    this.activethumb.bigRemover();
                }
                else if (this.activethumbivar == this.minvar) 
                {
                    this.selectlast = true;
                    this.lb_click(null);
                }
            }
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
                this.rb_t = org.libspark.betweenas3.BetweenAS3.to(this._gallery.rightbig_mc, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.rb_t.play();
            }
            else 
            {
                if (this.rb_t != null) 
                {
                    this.rb_t.stop();
                }
                this.rb_t = org.libspark.betweenas3.BetweenAS3.to(this._gallery.rightbig_mc, {"alpha":0.3}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.rb_t.play();
            }
            return;
        }

        internal function lb_out_detail(arg1:*):void
        {
            if (this._gallery.clicksAllowedCheck()) 
            {
                if (this.lb_active_detail) 
                {
                    if (this.lb_t_detail != null) 
                    {
                        this.lb_t_detail.stop();
                    }
                    this.lb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailleft_mc, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                    this.lb_t_detail.play();
                }
                else 
                {
                    if (this.lb_t_detail != null) 
                    {
                        this.lb_t_detail.stop();
                    }
                    this.lb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailleft_mc, {"alpha":0.3}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                    this.lb_t_detail.play();
                }
            }
            return;
        }

        public function setDetailNav():void
        {
            if (this.checkIfNext()) 
            {
                this.activateRB_detail();
            }
            else 
            {
                this.deactivateRB_detail();
            }
            if (this.checkIfPrevious()) 
            {
                this.activateLB_detail();
            }
            else 
            {
                this.deactivateLB_detail();
            }
            return;
        }

        internal function rb_out_detail(arg1:*):void
        {
            if (this._gallery.clicksAllowedCheck()) 
            {
                if (this.rb_active_detail) 
                {
                    if (this.rb_t_detail != null) 
                    {
                        this.rb_t_detail.stop();
                    }
                    this.rb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailright_mc, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                    this.rb_t_detail.play();
                }
                else 
                {
                    if (this.rb_t_detail != null) 
                    {
                        this.rb_t_detail.stop();
                    }
                    this.rb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailright_mc, {"alpha":0.3}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                    this.rb_t_detail.play();
                }
            }
            return;
        }

        internal function lb_over_detail(arg1:*):void
        {
            if (this.lb_active_detail && this._gallery.clicksAllowedCheck()) 
            {
                if (this.lb_t_detail != null) 
                {
                    this.lb_t_detail.stop();
                }
                this.lb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailleft_mc, {"alpha":0.6}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.lb_t_detail.play();
            }
            return;
        }

        public function activateLB_detail():void
        {
            this._gallery.detailleft_mc.mouseEnabled = true;
            this.lb_active_detail = true;
            if (this.lb_t_detail != null) 
            {
                this.lb_t_detail.stop();
            }
            this.lb_t_detail = org.libspark.betweenas3.BetweenAS3.to(this._gallery.detailleft_mc, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.lb_t_detail.play();
            return;
        }

        public function checkIfNext():Boolean
        {
            if (this.activepage == this.pageamount && this.activethumbivar + 1 == this.maxvar) 
            {
                return false;
            }
            return true;
        }

        public function loadNext():void
        {
            this.thumbs[this.activethumbivar - this.minvar + 1].loadEntry();
            return;
        }

        internal var tr:Number;

        internal var tw:Number;

        public var thumbsonpage:Number;

        internal var rowcount:Number;

        public var selectlast:Boolean=false;

        internal var activepage:Number=1;

        internal var entriesleft:Number;

        public var minvar:Number;

        internal var _container:flash.display.MovieClip;

        internal var lb_active_detail:Boolean;

        public var thumbsloaded:Number=0;

        internal var maxthumbsonpage:Number;

        public var activethumb:*;

        internal var pageamount:Number;

        internal var count:Number;

        public var rb_t_detail:org.libspark.betweenas3.tweens.ITween;

        internal var _gallery:flash.display.MovieClip;

        public var activethumbivar:Number;

        internal var rb_t:org.libspark.betweenas3.tweens.ITween;

        public var lb_t_detail:org.libspark.betweenas3.tweens.ITween;

        public var selectfirst:Boolean=false;

        internal var ypos:Number;

        internal var _description:flash.display.MovieClip;

        internal var _root:flash.display.MovieClip;

        public var maxvar:Number;

        public var imagezoomed:Boolean=false;

        internal var entryamount:Number;

        internal var sp:Number;

        public var thumbs:Array;

        internal var tc:Number;

        internal var th:Number;

        internal var rb_active_detail:Boolean;

        internal var xpos:Number;

        internal var lb_t:org.libspark.betweenas3.tweens.ITween;

        internal var lb_active:Boolean;

        public var selectprevious:Boolean=false;

        internal var rb_active:Boolean;

        public var selectnext:Boolean=false;

        public var detailmode:Boolean=false;

        internal var _ivar:Number;

        internal var _stage:flash.display.Stage;
    }
}
