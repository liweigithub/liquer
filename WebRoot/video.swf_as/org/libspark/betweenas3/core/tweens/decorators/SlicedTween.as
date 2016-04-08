package org.libspark.betweenas3.core.tweens.decorators 
{
    import org.libspark.betweenas3.core.tweens.*;
    
    public class SlicedTween extends org.libspark.betweenas3.core.tweens.TweenDecorator
    {
        public function SlicedTween(arg1:org.libspark.betweenas3.core.tweens.IITween, arg2:Number, arg3:Number)
        {
            super(arg1, 0);
            _duration = arg3 - arg2;
            this._begin = arg2;
            this._end = arg3;
            return;
        }

        protected override function newInstance():org.libspark.betweenas3.core.tweens.AbstractTween
        {
            return new org.libspark.betweenas3.core.tweens.decorators.SlicedTween(_baseTween.clone() as org.libspark.betweenas3.core.tweens.IITween, this._begin, this._end);
        }

        protected override function internalUpdate(arg1:Number):void
        {
            if (arg1 > 0) 
            {
                if (arg1 < _duration) 
                {
                    _baseTween.update(arg1 + this._begin);
                }
                else 
                {
                    _baseTween.update(this._end);
                }
            }
            else 
            {
                _baseTween.update(this._begin);
            }
            return;
        }

        public function get begin():Number
        {
            return this._begin;
        }

        public function get end():Number
        {
            return this._end;
        }

        internal var _begin:Number;

        internal var _end:Number;
    }
}
