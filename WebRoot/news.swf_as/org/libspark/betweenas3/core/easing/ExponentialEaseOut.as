package org.libspark.betweenas3.core.easing 
{
    public class ExponentialEaseOut extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function ExponentialEaseOut()
        {
            super();
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            return arg1 != arg4 ? arg3 * (1 - Math.pow(2, -10 * arg1 / arg4)) + arg2 : arg2 + arg3;
        }
    }
}
