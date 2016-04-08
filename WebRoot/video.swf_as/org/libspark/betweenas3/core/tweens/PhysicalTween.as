package org.libspark.betweenas3.core.tweens 
{
    import org.libspark.betweenas3.core.ticker.*;
    import org.libspark.betweenas3.core.updaters.*;
    
    public class PhysicalTween extends org.libspark.betweenas3.core.tweens.AbstractTween implements org.libspark.betweenas3.core.tweens.IIPhysicalTween
    {
        public function PhysicalTween(arg1:org.libspark.betweenas3.core.ticker.ITicker)
        {
            super(arg1, 0);
            return;
        }

        public function get updater():org.libspark.betweenas3.core.updaters.IPhysicalUpdater
        {
            return this._updater;
        }

        public function set updater(arg1:org.libspark.betweenas3.core.updaters.IPhysicalUpdater):void
        {
            this._updater = arg1;
            if (this._updater != null) 
            {
                _duration = this._updater.duration;
            }
            return;
        }

        protected override function newInstance():org.libspark.betweenas3.core.tweens.AbstractTween
        {
            return new org.libspark.betweenas3.core.tweens.PhysicalTween(_ticker);
        }

        protected override function internalUpdate(arg1:Number):void
        {
            this._updater.update(arg1);
            return;
        }

        public function get target():Object
        {
            return this._updater == null ? null : this._updater.target;
        }

        protected override function copyFrom(arg1:org.libspark.betweenas3.core.tweens.AbstractTween):void
        {
            super.copyFrom(arg1);
            var loc1:*=arg1 as org.libspark.betweenas3.core.tweens.PhysicalTween;
            this._updater = loc1._updater.clone() as org.libspark.betweenas3.core.updaters.IPhysicalUpdater;
            return;
        }

        protected var _updater:org.libspark.betweenas3.core.updaters.IPhysicalUpdater;
    }
}
