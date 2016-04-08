package org.libspark.betweenas3.core.easing 
{
    public class ExponentialEaseOutIn extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function ExponentialEaseOutIn()
        {
            super();
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            if (arg1 < arg4 / 2) 
            {
                return arg1 * 2 != arg4 ? arg3 / 2 * (1 - Math.pow(2, -10 * arg1 * 2 / arg4)) + arg2 : arg2 + arg3 / 2;
            }
            return arg1 * 2 - arg4 != 0 ? arg3 / 2 * Math.pow(2, 10 * ((arg1 * 2 - arg4) / arg4 - 1)) + arg2 + arg3 / 2 : arg2 + arg3 / 2;
        }
    }
}
