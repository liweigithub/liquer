package org.libspark.betweenas3.core.tweens 
{
    import org.libspark.betweenas3.core.ticker.*;
    
    public class AbstractActionTween extends org.libspark.betweenas3.core.tweens.AbstractTween implements org.libspark.betweenas3.core.tweens.IIActionTween
    {
        public function AbstractActionTween(arg1:org.libspark.betweenas3.core.ticker.ITicker)
        {
            super(arg1, 0);
            _duration = 0.01;
            this._lastTime = -1;
            return;
        }

        protected function rollback():void
        {
            return;
        }

        protected function action():void
        {
            return;
        }

        protected override function internalUpdate(arg1:Number):void
        {
            if (this._lastTime < 0.01 && arg1 >= 0.01) 
            {
                this.action();
            }
            else if (this._lastTime > 0 && arg1 <= 0) 
            {
                this.rollback();
            }
            this._lastTime = arg1;
            return;
        }

        internal var _lastTime:Number;
    }
}
