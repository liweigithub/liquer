package org.libspark.betweenas3.core.tweens.decorators 
{
    import org.libspark.betweenas3.core.tweens.*;
    
    public class ScaledTween extends org.libspark.betweenas3.core.tweens.TweenDecorator
    {
        public function ScaledTween(arg1:org.libspark.betweenas3.core.tweens.IITween, arg2:Number)
        {
            super(arg1, 0);
            _duration = arg1.duration * arg2;
            this._scale = arg2;
            return;
        }

        public function get scale():Number
        {
            return this._scale;
        }

        protected override function newInstance():org.libspark.betweenas3.core.tweens.AbstractTween
        {
            return new org.libspark.betweenas3.core.tweens.decorators.ScaledTween(_baseTween.clone() as org.libspark.betweenas3.core.tweens.IITween, this._scale);
        }

        protected override function internalUpdate(arg1:Number):void
        {
            _baseTween.update(arg1 / this.scale);
            return;
        }

        internal var _scale:Number;
    }
}
