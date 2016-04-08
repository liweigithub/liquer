package gallerylib 
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
            if (this._root.solidbackgroundrounded != 0) 
            {
                this.solidbg.graphics.drawRoundRect(0, 0, this._root.gallerywidth, this._root.galleryheight, this._root.solidbackgroundrounded, this._root.solidbackgroundrounded);
            }
            else 
            {
                this.solidbg.graphics.drawRect(0, 0, this._root.gallerywidth, this._root.galleryheight);
            }
            this.solidbg.graphics.endFill();
            this.solidbg.alpha = this._root.solidbackgroundopacity;
            addChild(this.solidbg);
            return;
        }

        internal var solidbg:flash.display.Sprite;

        internal var _root:flash.display.MovieClip;

        internal var _stage:flash.display.Stage;
    }
}
