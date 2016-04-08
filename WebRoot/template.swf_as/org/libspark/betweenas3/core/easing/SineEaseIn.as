package org.libspark.betweenas3.core.easing 
{
    public class SineEaseIn extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function SineEaseIn()
        {
            super();
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            return (-arg3) * Math.cos(arg1 / arg4 * Math.PI / 2) + arg3 + arg2;
        }
    }
}
