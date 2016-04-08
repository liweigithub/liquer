package alternatebannerlib 
{
    import flash.display.*;
    
    public class createpattern extends flash.display.Sprite
    {
        public function createpattern(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            this.solidbg = new flash.display.Sprite();
            super();
            this._stage = arg1;
            this._root = arg2;
            this.solidbg.graphics.beginFill(this._root.solidbackgroundcolor);
            this.solidbg.graphics.drawRect(0, 0, this._root.bannerwidth, this._root.bannerheight);
            this.solidbg.graphics.endFill();
            this.solidbg.alpha = this._root.solidbackgroundopacity;
            this._root.addChild(this.solidbg);
            return;
        }

        public var solidbg:flash.display.Sprite;

        internal var _root:flash.display.MovieClip;

        internal var _stage:flash.display.Stage;
    }
}
