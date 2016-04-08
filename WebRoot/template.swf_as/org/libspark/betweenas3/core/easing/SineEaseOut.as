package org.libspark.betweenas3.core.easing 
{
    public class SineEaseOut extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function SineEaseOut()
        {
            super();
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            return arg3 * Math.sin(arg1 / arg4 * Math.PI / 2) + arg2;
        }
    }
}
