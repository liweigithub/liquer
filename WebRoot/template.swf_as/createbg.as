package 
{
    import flash.display.*;
    import flash.events.*;
    
    public class createbg extends flash.display.MovieClip
    {
        public function createbg(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            this.image = new flash.display.MovieClip();
            this.bodybg = new flash.display.MovieClip();
            this.bodysprite = new flash.display.Sprite();
            this.image_array = new Array();
            super();
            this._stage = arg1;
            this._root = arg2;
            this.bodysprite.graphics.beginFill(this._root.bodybgcolor);
            this.bodysprite.graphics.drawRect(0, 0, 10, 10);
            this.bodysprite.graphics.endFill();
            this.bodybg.addChild(this.bodysprite);
            this.bodybg.alpha = this._root.bodybgalpha;
            this.bodybg.width = this._stage.stageWidth;
            this.bodybg.height = this._stage.stageHeight;
            this.bodybg.x = 0;
            this.bodybg.y = 0;
            this._stage.addChildAt(this.image, 0);
            this._stage.addChildAt(this.bodybg, 1);
            this._stage.addEventListener(flash.events.Event.RESIZE, this.bodybgpos);
            return;
        }

        public function stopLoaders():void
        {
            var loc1:*=0;
            while (loc1 < (this.image_array.length - 1)) 
            {
                this.image_array[loc1].stopLoading();
                ++loc1;
            }
            return;
        }

        public function killImages():void
        {
            var loc1:*=0;
            while (loc1 < (this.image_array.length - 1)) 
            {
                this.image_array[loc1].removeImage();
                this.image_array[loc1] = null;
                this.image_array.splice(loc1, 1);
                ++loc1;
            }
            return;
        }

        public function initImage():void
        {
            var loc1:*=new bgimage(this._stage, this._root, this.image, this);
            this.image_array.push(loc1);
            this.image_array[(this.image_array.length - 1)].addImage();
            return;
        }

        internal function bodybgpos(arg1:flash.events.Event):void
        {
            this.bodybg.width = this._stage.stageWidth;
            this.bodybg.height = this._stage.stageHeight;
            this.bodybg.x = 0;
            this.bodybg.y = 0;
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var _stage:flash.display.Stage;

        internal var bodybg:flash.display.MovieClip;

        public var loadedvar:Boolean=false;

        public var image_array:Array;

        public var image:flash.display.MovieClip;

        internal var bodysprite:flash.display.Sprite;
    }
}
