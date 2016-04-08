package org.libspark.betweenas3.core.tweens.actions 
{
    import flash.display.*;
    import org.libspark.betweenas3.core.ticker.*;
    import org.libspark.betweenas3.core.tweens.*;
    
    public class RemoveFromParentAction extends org.libspark.betweenas3.core.tweens.AbstractActionTween
    {
        public function RemoveFromParentAction(arg1:org.libspark.betweenas3.core.ticker.ITicker, arg2:flash.display.DisplayObject)
        {
            super(arg1);
            this._target = arg2;
            return;
        }

        public function get target():flash.display.DisplayObject
        {
            return this._target;
        }

        protected override function rollback():void
        {
            if (!(this._target == null) && !(this._parent == null)) 
            {
                this._parent.addChild(this._target);
                this._parent = null;
            }
            return;
        }

        protected override function action():void
        {
            if (!(this._target == null) && !(this._target.parent == null)) 
            {
                this._parent = this._target.parent;
                this._parent.removeChild(this._target);
            }
            return;
        }

        internal var _target:flash.display.DisplayObject;

        internal var _parent:flash.display.DisplayObjectContainer;
    }
}
