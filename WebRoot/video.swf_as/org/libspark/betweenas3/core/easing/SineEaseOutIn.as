package org.libspark.betweenas3.core.easing 
{
    public class SineEaseOutIn extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function SineEaseOutIn()
        {
            super();
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            if (arg1 < arg4 / 2) 
            {
                return arg3 / 2 * Math.sin(arg1 * 2 / arg4 * Math.PI / 2) + arg2;
            }
            return (-arg3 / 2) * Math.cos((arg1 * 2 - arg4) / arg4 * Math.PI / 2) + arg3 / 2 + (arg2 + arg3 / 2);
        }
    }
}
