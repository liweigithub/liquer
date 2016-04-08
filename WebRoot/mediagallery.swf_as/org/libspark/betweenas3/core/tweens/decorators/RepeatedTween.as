package org.libspark.betweenas3.core.tweens.decorators 
{
    import org.libspark.betweenas3.core.tweens.*;
    
    public class RepeatedTween extends org.libspark.betweenas3.core.tweens.TweenDecorator
    {
        public function RepeatedTween(arg1:org.libspark.betweenas3.core.tweens.IITween, arg2:uint)
        {
            super(arg1, 0);
            this._baseDuration = arg1.duration;
            this._repeatCount = arg2;
            _duration = this._baseDuration * arg2;
            return;
        }

        protected override function internalUpdate(arg1:Number):void
        {
            if (arg1 >= 0) 
            {
                arg1 = arg1 - (arg1 < _duration ? this._baseDuration * int(arg1 / this._baseDuration) : _duration - this._baseDuration);
            }
            _baseTween.update(arg1);
            return;
        }

        public function get repeatCount():uint
        {
            return this._repeatCount;
        }

        protected override function newInstance():org.libspark.betweenas3.core.tweens.AbstractTween
        {
            return new org.libspark.betweenas3.core.tweens.decorators.RepeatedTween(_baseTween.clone() as org.libspark.betweenas3.core.tweens.IITween, this.repeatCount);
        }

        internal var _baseDuration:Number;

        internal var _repeatCount:uint;
    }
}
