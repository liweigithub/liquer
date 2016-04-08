package alternatebannerlib 
{
    import flash.display.*;
    import flash.text.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class caption extends flash.display.MovieClip
    {
        public function caption(arg1:flash.display.MovieClip, arg2:flash.display.MovieClip, arg3:Number, arg4:flash.display.MovieClip)
        {
            this.captionmc = new flash.display.MovieClip();
            this.txt = new flash.text.TextField();
            this.bg = new flash.display.Sprite();
            super();
            this._root = arg1;
            this._container = arg2;
            this._ivar = arg3;
            this._banner = arg4;
            this.textbackgroundxpos = this._root.bannerdata_array[this._ivar]["textbackgroundxpos"];
            this.textbackgroundypos = this._root.bannerdata_array[this._ivar]["textbackgroundypos"];
            this.textpaddingtop = this._root.bannerdata_array[this._ivar]["textpaddingtop"];
            this.textpaddingleft = this._root.bannerdata_array[this._ivar]["textpaddingleft"];
            this.textpaddingright = this._root.bannerdata_array[this._ivar]["textpaddingright"];
            this.textbackgroundwidth = this._root.bannerdata_array[this._ivar]["textbackgroundwidth"];
            this.textbackgroundheight = this._root.bannerdata_array[this._ivar]["textbackgroundheight"];
            this.textbackgroundrotation = this._root.bannerdata_array[this._ivar]["textbackgroundrotation"];
            this.textbackgroundcolor = this._root.bannerdata_array[this._ivar]["textbackgroundcolor"];
            this.textbackgroundopacity = this._root.bannerdata_array[this._ivar]["textbackgroundopacity"];
            this.textbackgroundshadowcolor = this._root.bannerdata_array[this._ivar]["textbackgroundshadowcolor"];
            this.textbackgroundshadowopacity = this._root.bannerdata_array[this._ivar]["textbackgroundshadowopacity"];
            this.textbackgroundshadowdistance = this._root.bannerdata_array[this._ivar]["textbackgroundshadowdistance"];
            this.textbackgroundshadowangle = this._root.bannerdata_array[this._ivar]["textbackgroundshadowangle"];
            this.textbackgroundshadowsize = this._root.bannerdata_array[this._ivar]["textbackgroundshadowsize"];
            this.textbackgroundshadowstrength = this._root.bannerdata_array[this._ivar]["textbackgroundshadowstrength"];
            this.captiontext = this._root.bannerdata_array[this._ivar]["captiontext"];
            this.txt.multiline = true;
            this.txt.condenseWhite = true;
            this.txt.wordWrap = true;
            this.txt.embedFonts = false;
            this.txt.selectable = false;
            this.txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.txt.gridFitType = flash.text.GridFitType.PIXEL;
            this.txt.width = this.textbackgroundwidth - this.textpaddingleft - this.textpaddingright;
            this.txt.styleSheet = this._root.mainroot.style;
            this.txt.htmlText = this.captiontext;
            this.txt.x = this.textpaddingleft;
            this.txt.y = this.textpaddingtop;
            this.bg.graphics.beginFill(this.textbackgroundcolor);
            this.bg.graphics.drawRect(0, 0, this.textbackgroundwidth, this.textbackgroundheight);
            this.bg.graphics.endFill();
            this.bg.rotation = this.textbackgroundrotation;
            this.bg.alpha = this.textbackgroundopacity;
            this.bg.mouseEnabled = false;
            org.libspark.betweenas3.BetweenAS3.apply(this.bg, {"_dropShadowFilter":{"distance":this.textbackgroundshadowdistance, "angle":this.textbackgroundshadowangle, "color":this.textbackgroundshadowcolor, "alpha":this.textbackgroundshadowopacity, "blurX":this.textbackgroundshadowsize, "blurY":this.textbackgroundshadowsize, "strength":this.textbackgroundshadowstrength, "quality":3}});
            this.captionmc.mouseEnabled = false;
            this.captionmc.addChild(this.bg);
            this.captionmc.addChild(this.txt);
            this.addChild(this.captionmc);
            return;
        }

        internal var captionmc:flash.display.MovieClip;

        internal var _container:flash.display.MovieClip;

        public var textbackgroundwidth:int;

        public var textbackgroundopacity:Number;

        public var textpaddingtop:int;

        public var textbackgroundrotation:int;

        public var textbackgroundheight:int;

        internal var t_caption:org.libspark.betweenas3.tweens.ITween;

        public var textbackgroundcolor:uint;

        public var captiontext:String;

        public var textbackgroundshadowopacity:Number;

        public var textbackgroundshadowangle:int;

        public var textbackgroundshadowstrength:int;

        internal var _root:flash.display.MovieClip;

        internal var bg:flash.display.Sprite;

        public var textbackgroundshadowcolor:uint;

        internal var _banner:flash.display.MovieClip;

        public var textpaddingleft:int;

        public var textbackgroundypos:int;

        public var textpaddingright:int;

        internal var txt:flash.text.TextField;

        public var textbackgroundshadowsize:int;

        public var _ivar:Number;

        public var textbackgroundxpos:int;

        public var textbackgroundshadowdistance:int;
    }
}
