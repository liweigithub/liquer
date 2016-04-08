package org.libspark.betweenas3.core.tweens.actions 
{
    import flash.display.*;
    import org.libspark.betweenas3.core.ticker.*;
    import org.libspark.betweenas3.core.tweens.*;
    
    public class AddChildAction extends org.libspark.betweenas3.core.tweens.AbstractActionTween
    {
        public function AddChildAction(arg1:org.libspark.betweenas3.core.ticker.ITicker, arg2:flash.display.DisplayObject, arg3:flash.display.DisplayObjectContainer)
        {
            super(arg1);
            this._target = arg2;
            this._parent = arg3;
            return;
        }

        public function get target():flash.display.DisplayObject
        {
            return this._target;
        }

        protected override function rollback():void
        {
            if (!(this._target == null) && !(this._parent == null) && this._target.parent == this._parent) 
            {
                this._parent.removeChild(this._target);
            }
            return;
        }

        protected override function action():void
        {
            if (!(this._target == null) && !(this._parent == null) && !(this._target.parent == this._parent)) 
            {
                this._parent.addChild(this._target);
            }
            return;
        }

        public function get parent():flash.display.DisplayObjectContainer
        {
            return this._parent;
        }

        internal var _target:flash.display.DisplayObject;

        internal var _parent:flash.display.DisplayObjectContainer;
    }
}
