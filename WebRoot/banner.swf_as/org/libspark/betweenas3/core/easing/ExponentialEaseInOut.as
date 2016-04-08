package org.libspark.betweenas3.core.easing 
{
    public class ExponentialEaseInOut extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function ExponentialEaseInOut()
        {
            super();
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            if (arg1 == 0) 
            {
                return arg2;
            }
            if (arg1 == arg4) 
            {
                return arg2 + arg3;
            }
            var loc1:*;
            arg1 = loc1 = arg1 / (arg4 / 2);
            if (loc1 < 1) 
            {
                return arg3 / 2 * Math.pow(2, 10 * (arg1 - 1)) + arg2;
            }
            return arg3 / 2 * (2 - Math.pow(2, -10 * --arg1)) + arg2;
        }
    }
}
