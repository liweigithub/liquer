package org.libspark.betweenas3.core.easing 
{
    public class PhysicalAccelerate extends Object implements org.libspark.betweenas3.core.easing.IPhysicalEasing
    {
        public function PhysicalAccelerate(arg1:Number, arg2:Number, arg3:Number)
        {
            super();
            this._iv = arg1;
            this._a = arg2;
            this._fps = arg3;
            return;
        }

        public function getDuration(arg1:Number, arg2:Number):Number
        {
            var loc1:*=arg2 < 0 ? -this._iv : this._iv;
            var loc2:*=arg2 < 0 ? -this._a : this._a;
            return (-loc1 + Math.sqrt(loc1 * loc1 - 4 * loc2 / 2 * (-arg2))) / (2 * loc2 / 2) * 1 / this._fps;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number):Number
        {
            var loc1:*=arg3 < 0 ? -1 : 1;
            var loc2:*=arg1 / (1 / this._fps);
            return arg2 + loc1 * this._iv * loc2 + loc1 * this._a * loc2 * loc2 / 2;
        }

        internal var _a:Number;

        internal var _fps:Number;

        internal var _iv:Number;
    }
}
