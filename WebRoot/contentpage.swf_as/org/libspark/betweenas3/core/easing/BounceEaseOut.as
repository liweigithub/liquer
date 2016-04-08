package org.libspark.betweenas3.core.easing 
{
    public class BounceEaseOut extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function BounceEaseOut()
        {
            super();
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / arg4;
            if (loc1 < 1 / 2.75) 
            {
                return arg3 * 7.5625 * arg1 * arg1 + arg2;
            }
            if (arg1 < 2 / 2.75) 
            {
                arg1 = loc1 = arg1 - 1.5 / 2.75;
                return arg3 * (7.5625 * loc1 * arg1 + 0.75) + arg2;
            }
            if (arg1 < 2.5 / 2.75) 
            {
                arg1 = loc1 = arg1 - 2.25 / 2.75;
                return arg3 * (7.5625 * loc1 * arg1 + 0.9375) + arg2;
            }
            arg1 = loc1 = arg1 - 2.625 / 2.75;
            return arg3 * (7.5625 * loc1 * arg1 + 0.984375) + arg2;
        }
    }
}
