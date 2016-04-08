package org.libspark.betweenas3.core.easing 
{
    public class SineEaseInOut extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function SineEaseInOut()
        {
            super();
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            return (-arg3) / 2 * (Math.cos(Math.PI * arg1 / arg4) - 1) + arg2;
        }
    }
}
