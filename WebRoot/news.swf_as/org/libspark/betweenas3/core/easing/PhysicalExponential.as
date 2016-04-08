package org.libspark.betweenas3.core.easing 
{
    public class PhysicalExponential extends Object implements org.libspark.betweenas3.core.easing.IPhysicalEasing
    {
        public function PhysicalExponential(arg1:Number, arg2:Number, arg3:Number)
        {
            super();
            this._f = arg1;
            this._th = arg2;
            this._fps = arg3;
            return;
        }

        public function getDuration(arg1:Number, arg2:Number):Number
        {
            return (Math.log(this._th / arg2) / Math.log(1 - this._f) + 1) * 1 / this._fps;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number):Number
        {
            return (-arg3) * Math.pow(1 - this._f, (arg1 / (1 / this._fps) - 1)) + (arg2 + arg3);
        }

        internal var _th:Number;

        internal var _f:Number;

        internal var _fps:Number;
    }
}
