package org.libspark.betweenas3.core.easing 
{
    public class CubicEaseOutIn extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function CubicEaseOutIn()
        {
            super();
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            if (arg1 < arg4 / 2) 
            {
                var loc1:*;
                arg1 = loc1 = (arg1 * 2 / arg4 - 1);
            }
            else 
            {
                arg1 = loc1 = (arg1 * 2 - arg4) / arg4;
            }
            return undefined;
        }
    }
}
