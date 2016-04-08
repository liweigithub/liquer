package gallerylib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class categorybutton extends flash.display.MovieClip
    {
        public function categorybutton(arg1:flash.display.MovieClip, arg2:flash.display.MovieClip, arg3:Number, arg4:flash.display.MovieClip)
        {
            this.btn = new flash.display.MovieClip();
            this.myFormat = new flash.text.TextFormat();
            this.txt = new flash.text.TextField();
            super();
            this._root = arg1;
            this._container = arg2;
            this._ivar = arg3;
            this._gallery = arg4;
            this.myFormat.font = this._root.categoryfont;
            this.myFormat.bold = true;
            this.myFormat.indent = 0;
            this.myFormat.color = this._root.categoryselectcolor;
            this.myFormat.size = this._root.categoryfontsize;
            this.txt.multiline = false;
            this.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.txt.embedFonts = false;
            this.txt.selectable = false;
            this.txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.txt.gridFitType = flash.text.GridFitType.SUBPIXEL;
            this.txt.text = this._root.gallerydata_array[this._ivar]["title"];
            this.txt.setTextFormat(this.myFormat);
            this.txt.mouseEnabled = false;
            this.btn.addChild(this.txt);
            this.btn.alpha = this._root.categoryidleopacity;
            this.btn.x = this._gallery.catbuttonx;
            this.btn.y = Math.round((this._root.categoryareaheight - this._root.gallerypadding) / 2 - this.btn.height / 2);
            this.xval = this._gallery.catbuttonx;
            this._gallery.catbuttonx = this._gallery.catbuttonx + (this.txt.width + this._root.categoryspacing);
            this._container.addChild(this.btn);
            this.btn.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mouse_over, false, 0, true);
            this.btn.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mouse_out, false, 0, true);
            this.btn.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click, false, 0, true);
            if (this._ivar == 0) 
            {
                this.selectBtn();
            }
            return;
        }

        public function selectBtn():void
        {
            this.btn.buttonMode = false;
            this.btn.mouseEnabled = false;
            if (this.hover_t != null) 
            {
                this.hover_t.stop();
            }
            this.hover_t = org.libspark.betweenas3.BetweenAS3.to(this.btn, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.hover_t.play();
            this.selectvar = true;
            this._gallery.selectCategory();
            return;
        }

        public function deselectBtn():void
        {
            this.btn.buttonMode = true;
            this.btn.mouseEnabled = true;
            if (this.hover_t != null) 
            {
                this.hover_t.stop();
            }
            this.hover_t = org.libspark.betweenas3.BetweenAS3.to(this.btn, {"alpha":this._root.categoryidleopacity}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            this.hover_t.play();
            this.selectvar = false;
            return;
        }

        internal function mouse_over(arg1:*):void
        {
            if (this.selectvar) 
            {
                this.btn.buttonMode = false;
                this.btn.mouseEnabled = false;
            }
            else 
            {
                this.btn.buttonMode = true;
                this.btn.mouseEnabled = true;
                if (this.hover_t != null) 
                {
                    this.hover_t.stop();
                }
                this.hover_t = org.libspark.betweenas3.BetweenAS3.to(this.btn, {"alpha":1}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.hover_t.play();
            }
            return;
        }

        internal function mouse_out(arg1:*):void
        {
            if (!this.selectvar) 
            {
                if (this.hover_t != null) 
                {
                    this.hover_t.stop();
                }
                this.hover_t = org.libspark.betweenas3.BetweenAS3.to(this.btn, {"alpha":this._root.categoryidleopacity}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
                this.hover_t.play();
            }
            return;
        }

        internal function mouse_click(arg1:*):void
        {
            if (!this.selectvar && this._gallery.clickallow) 
            {
                this._gallery.clickallow = false;
                this._gallery.categorybuttons[this._gallery.activecategory].deselectBtn();
                this._gallery.activecategory = this._ivar;
                this.selectBtn();
            }
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var myFormat:flash.text.TextFormat;

        internal var _container:flash.display.MovieClip;

        internal var _gallery:flash.display.MovieClip;

        internal var btn:flash.display.MovieClip;

        public var xval:Number;

        internal var selectvar:Boolean=false;

        internal var txt:flash.text.TextField;

        internal var hover_t:org.libspark.betweenas3.tweens.ITween;

        internal var _ivar:Number;
    }
}
