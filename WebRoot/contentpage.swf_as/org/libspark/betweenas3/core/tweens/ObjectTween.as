package org.libspark.betweenas3.core.tweens 
{
    import org.libspark.betweenas3.core.easing.*;
    import org.libspark.betweenas3.core.ticker.*;
    import org.libspark.betweenas3.core.updaters.*;
    
    public class ObjectTween extends org.libspark.betweenas3.core.tweens.AbstractTween implements org.libspark.betweenas3.core.tweens.IIObjectTween
    {
        public function ObjectTween(arg1:org.libspark.betweenas3.core.ticker.ITicker)
        {
            super(arg1, 0);
            return;
        }

        public function set time(arg1:Number):void
        {
            _duration = arg1;
            return;
        }

        protected override function internalUpdate(arg1:Number):void
        {
            var loc1:*=0;
            if (arg1 > 0) 
            {
                if (arg1 < _duration) 
                {
                    loc1 = this._easing.calculate(arg1, 0, 1, _duration);
                }
                else 
                {
                    loc1 = 1;
                }
            }
            this._updater.update(loc1);
            return;
        }

        public function get updater():org.libspark.betweenas3.core.updaters.IUpdater
        {
            return this._updater;
        }

        public function get easing():org.libspark.betweenas3.core.easing.IEasing
        {
            return this._easing;
        }

        protected override function copyFrom(arg1:org.libspark.betweenas3.core.tweens.AbstractTween):void
        {
            super.copyFrom(arg1);
            var loc1:*=arg1 as org.libspark.betweenas3.core.tweens.ObjectTween;
            this._easing = loc1._easing;
            this._updater = loc1._updater.clone();
            return;
        }

        protected override function newInstance():org.libspark.betweenas3.core.tweens.AbstractTween
        {
            return new org.libspark.betweenas3.core.tweens.ObjectTween(_ticker);
        }

        public function set easing(arg1:org.libspark.betweenas3.core.easing.IEasing):void
        {
            this._easing = arg1;
            return;
        }

        public function get target():Object
        {
            return this._updater == null ? null : this._updater.target;
        }

        public function set updater(arg1:org.libspark.betweenas3.core.updaters.IUpdater):void
        {
            this._updater = arg1;
            return;
        }

        public function get time():Number
        {
            return _duration;
        }

        protected var _easing:org.libspark.betweenas3.core.easing.IEasing;

        protected var _updater:org.libspark.betweenas3.core.updaters.IUpdater;
    }
}
