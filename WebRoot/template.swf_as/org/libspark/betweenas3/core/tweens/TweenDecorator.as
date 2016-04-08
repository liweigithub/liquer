package org.libspark.betweenas3.core.tweens 
{
    public class TweenDecorator extends org.libspark.betweenas3.core.tweens.AbstractTween
    {
        public function TweenDecorator(arg1:org.libspark.betweenas3.core.tweens.IITween, arg2:Number)
        {
            super(arg1.ticker, arg2);
            this._baseTween = arg1;
            _duration = arg1.duration;
            return;
        }

        public override function stop():void
        {
            if (_isPlaying) 
            {
                super.stop();
                this._baseTween.fireStop();
            }
            return;
        }

        protected override function internalUpdate(arg1:Number):void
        {
            this._baseTween.update(arg1);
            return;
        }

        public override function firePlay():void
        {
            super.firePlay();
            this._baseTween.firePlay();
            return;
        }

        public override function play():void
        {
            if (!_isPlaying) 
            {
                this._baseTween.firePlay();
                super.play();
            }
            return;
        }

        public function get baseTween():org.libspark.betweenas3.core.tweens.IITween
        {
            return this._baseTween;
        }

        public override function fireStop():void
        {
            super.fireStop();
            this._baseTween.fireStop();
            return;
        }

        protected var _baseTween:org.libspark.betweenas3.core.tweens.IITween;
    }
}
