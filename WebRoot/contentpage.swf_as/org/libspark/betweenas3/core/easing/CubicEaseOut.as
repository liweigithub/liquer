package org.libspark.betweenas3.core.easing 
{
    public class CubicEaseOut extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function CubicEaseOut()
        {
            super();
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            var loc1:*;
            arg1 = loc1 = (arg1 / arg4 - 1);
            return arg3 * (loc1 * arg1 * arg1 + 1) + arg2;
        }
    }
}
