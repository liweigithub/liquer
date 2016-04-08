package org.libspark.betweenas3.core.tweens.decorators 
{
    import org.libspark.betweenas3.core.tweens.*;
    
    public class DelayedTween extends org.libspark.betweenas3.core.tweens.TweenDecorator
    {
        public function DelayedTween(arg1:org.libspark.betweenas3.core.tweens.IITween, arg2:Number, arg3:Number)
        {
            super(arg1, 0);
            _duration = arg2 + arg1.duration + arg3;
            this._preDelay = arg2;
            this._postDelay = arg3;
            return;
        }

        public function get preDelay():Number
        {
            return this._preDelay;
        }

        protected override function newInstance():org.libspark.betweenas3.core.tweens.AbstractTween
        {
            return new org.libspark.betweenas3.core.tweens.decorators.DelayedTween(_baseTween.clone() as org.libspark.betweenas3.core.tweens.IITween, this._preDelay, this._postDelay);
        }

        protected override function internalUpdate(arg1:Number):void
        {
            _baseTween.update(arg1 - this._preDelay);
            return;
        }

        public function get postDelay():Number
        {
            return this._postDelay;
        }

        internal var _postDelay:Number;

        internal var _preDelay:Number;
    }
}
