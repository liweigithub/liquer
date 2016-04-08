package welcomelib 
{
    import flash.display.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createpattern extends flash.display.Sprite
    {
        public function createpattern(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            this.solidbg = new flash.display.Sprite();
            this.pixel = new flash.display.Sprite();
            this.bg = new flash.display.Sprite();
            super();
            this._stage = arg1;
            this._root = arg2;
            this.solidbg.graphics.beginFill(this._root.solidbackgroundcolor);
            this.solidbg.graphics.drawRect(0, 0, 980, 500);
            this.solidbg.graphics.endFill();
            this.solidbg.alpha = 0;
            this.pixel.graphics.beginFill(this._root.backgroundpatterncolor, 1);
            this.pixel.graphics.drawRect(0, 0, 1, 1);
            this.pixel.graphics.drawRect(1, 1, 1, 1);
            this.pixel.graphics.endFill();
            this.bgTile = new flash.display.BitmapData(2, 2, true, this._root.backgroundpatterncolor);
            this.bgTile.draw(this.pixel);
            this.bg.graphics.beginBitmapFill(this.bgTile, null, true, false);
            this.bg.graphics.drawRect(0, 0, 980, 500);
            this.bg.graphics.endFill();
            this.bg.alpha = 0;
            addChild(this.solidbg);
            addChild(this.bg);
            this.solid_t = org.libspark.betweenas3.BetweenAS3.to(this.solidbg, {"alpha":1}, 1, org.libspark.betweenas3.easing.Sine.easeInOut);
            this.pattern_t = org.libspark.betweenas3.BetweenAS3.to(this.bg, {"alpha":1}, 1, org.libspark.betweenas3.easing.Sine.easeInOut);
            this.serial = org.libspark.betweenas3.BetweenAS3.serial(this.solid_t, this.pattern_t);
            this.serial.play();
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var bg:flash.display.Sprite;

        internal var pixel:flash.display.Sprite;

        internal var solid_t:org.libspark.betweenas3.tweens.ITween;

        internal var solidbg:flash.display.Sprite;

        internal var bgTile:flash.display.BitmapData;

        internal var pattern_t:org.libspark.betweenas3.tweens.ITween;

        internal var serial:org.libspark.betweenas3.tweens.ITween;

        internal var _stage:flash.display.Stage;
    }
}
