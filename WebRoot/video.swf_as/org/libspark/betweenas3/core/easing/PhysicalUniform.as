package org.libspark.betweenas3.core.easing 
{
    public class PhysicalUniform extends Object implements org.libspark.betweenas3.core.easing.IPhysicalEasing
    {
        public function PhysicalUniform(arg1:Number, arg2:Number)
        {
            super();
            this._v = arg1;
            this._fps = arg2;
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number):Number
        {
            return arg2 + (arg3 < 0 ? -this._v : this._v) * arg1 / (1 / this._fps);
        }

        public function getDuration(arg1:Number, arg2:Number):Number
        {
            return arg2 / (arg2 < 0 ? -this._v : this._v) * 1 / this._fps;
        }

        internal var _fps:Number;

        internal var _v:Number;
    }
}
