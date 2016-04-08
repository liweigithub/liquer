package org.libspark.betweenas3.core.easing 
{
    public class ExponentialEaseIn extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function ExponentialEaseIn()
        {
            super();
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            return arg1 != 0 ? arg3 * Math.pow(2, 10 * (arg1 / arg4 - 1)) + arg2 : arg2;
        }
    }
}
