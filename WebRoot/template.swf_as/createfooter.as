package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createfooter extends flash.display.MovieClip
    {
        public function createfooter(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            this.footer = new flash.display.MovieClip();
            this.solidbg = new flash.display.Sprite();
            this.pixel = new flash.display.Sprite();
            this.pixelbg = new flash.display.Sprite();
            this.txt = new flash.text.TextField();
            super();
            this._stage = arg1;
            this._root = arg2;
            this.solidbg.graphics.beginFill(this._root.footerbgcolor);
            this.solidbg.graphics.drawRect(0, 0, 5, 5);
            this.solidbg.graphics.endFill();
            this.solidbg.alpha = this._root.footerbgopacity;
            this.pixel.graphics.beginFill(this._root.footerpixelcolor, 1);
            this.pixel.graphics.drawRect(0, 0, 1, 1);
            this.pixel.graphics.drawRect(1, 1, 1, 1);
            this.pixel.graphics.endFill();
            this.pixeltile = new flash.display.BitmapData(2, 2, true, this._root.footerpixelcolor);
            this.pixeltile.draw(this.pixel);
            this.pixelbg.alpha = this._root.footerpixelopacity;
            this.txt.multiline = true;
            this.txt.condenseWhite = true;
            this.txt.wordWrap = true;
            this.txt.embedFonts = true;
            this.txt.selectable = false;
            this.txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.txt.gridFitType = flash.text.GridFitType.PIXEL;
            this.txt.width = this._root.templatewidth;
            this.txt.styleSheet = this._root.style;
            this.txt.htmlText = this._root.footertext;
            var loc1:*=new dropshadow(this._root, this.txt, this._root.footertextshadowdistance, 45, 0, this._root.footertextshadowopacity, this._root.footertextshadowstrength, this._root.footertextshadowstrength, 1, 1);
            this.footer.alpha = 0;
            this.footer.addChild(this.solidbg);
            this.footer.addChild(this.pixelbg);
            this.footer.addChild(this.txt);
            var loc2:*=new dropshadow(this._root, this.footer, this._root.footershadowdistance, 270, 0, this._root.footershadowopacity, this._root.footershadowstrength, this._root.footershadowstrength, 1, 1);
            this._stage.addChildAt(this.footer, 2);
            this.t_footer = org.libspark.betweenas3.BetweenAS3.to(this.footer, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.t_footer.play();
            this._stage.addEventListener(flash.events.Event.ADDED, this.onStageResize, false, 0, true);
            this._stage.addEventListener(flash.events.Event.RESIZE, this.onStageResize);
            return;
        }

        internal function onStageResize(arg1:flash.events.Event):void
        {
            var e:flash.events.Event;

            var loc1:*;
            e = arg1;
            this.solidbg.width = this._stage.stageWidth;
            this.solidbg.height = this._root.footerheight;
            var loc2:*;
            this.solidbg.x = loc2 = 0;
            this.pixelbg.x = loc2;
            this.solidbg.y = loc2 = Math.round(this._stage.stageHeight - this._root.footerheight);
            this.pixelbg.y = loc2;
            this.txt.x = Math.round(this._stage.stageWidth / 2) - Math.round(this.txt.width / 2);
            this.txt.y = this.pixelbg.y + Math.round(this._root.footerheight / 2) - Math.round(this.txt.height / 2);
            with (loc2 = this.pixelbg.graphics) 
            {
                clear();
                pixelbg.graphics.beginBitmapFill(pixeltile, null, true, false);
                pixelbg.graphics.drawRect(0, 0, _stage.stageWidth, _root.footerheight);
                endFill();
            }
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var pixel:flash.display.Sprite;

        internal var footerwidth:int;

        internal var t_footer:org.libspark.betweenas3.tweens.ITween;

        internal var solidbg:flash.display.Sprite;

        internal var pixelbg:flash.display.Sprite;

        internal var pixeltile:flash.display.BitmapData;

        internal var txt:flash.text.TextField;

        internal var footer:flash.display.MovieClip;

        internal var _stage:flash.display.Stage;
    }
}
