package org.libspark.betweenas3.core.tweens.decorators 
{
    import org.libspark.betweenas3.core.tweens.*;
    
    public class ReversedTween extends org.libspark.betweenas3.core.tweens.TweenDecorator
    {
        public function ReversedTween(arg1:org.libspark.betweenas3.core.tweens.IITween, arg2:Number)
        {
            super(arg1, arg2);
            _duration = arg1.duration;
            return;
        }

        protected override function newInstance():org.libspark.betweenas3.core.tweens.AbstractTween
        {
            return new org.libspark.betweenas3.core.tweens.decorators.ReversedTween(_baseTween.clone() as org.libspark.betweenas3.core.tweens.IITween, 0);
        }

        protected override function internalUpdate(arg1:Number):void
        {
            _baseTween.update(_duration - arg1);
            return;
        }
    }
}
