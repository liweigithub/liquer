package 
{
    import flash.display.*;
    import flash.events.*;
    
    public class createsocial extends flash.display.MovieClip
    {
        public function createsocial(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            super();
            this._stage = arg1;
            this._root = arg2;
            this._stage.addChild(this);
            this._stage.addEventListener(flash.events.Event.ADDED, this.onStageResize, false, 0, true);
            this._stage.addEventListener(flash.events.Event.RESIZE, this.onStageResize);
            var loc1:*=0;
            while (loc1 < this._root.sociallength) 
            {
                this.xvar = (this._root.sociallogosize + this._root.sociallogospacing) * loc1;
                this.addChild(new social(this._root, this, this.xvar, loc1));
                ++loc1;
            }
            return;
        }

        internal function onStageResize(arg1:flash.events.Event):void
        {
            this.x = Math.round(this._stage.stageWidth / 2) - Math.round(this._root.templatewidth / 2) + this._root.socialleftpadding + this._root.footerpadding;
            this.y = Math.round(this._stage.stageHeight - this._root.footerheight / 2 - this._root.sociallogosize / 2) - this._root.socialbottompadding;
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var _stage:flash.display.Stage;

        internal var xvar:Number;
    }
}
