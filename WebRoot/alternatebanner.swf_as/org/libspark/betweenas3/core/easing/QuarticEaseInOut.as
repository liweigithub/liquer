package org.libspark.betweenas3.core.easing 
{
    public class QuarticEaseInOut extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function QuarticEaseInOut()
        {
            super();
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / (arg4 / 2);
            if (loc1 < 1) 
            {
                return arg3 / 2 * arg1 * arg1 * arg1 * arg1 + arg2;
            }
            arg1 = loc1 = arg1 - 2;
            return (-arg3) / 2 * (loc1 * arg1 * arg1 * arg1 - 2) + arg2;
        }
    }
}
