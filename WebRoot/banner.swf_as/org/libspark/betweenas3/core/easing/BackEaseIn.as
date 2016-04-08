package org.libspark.betweenas3.core.easing 
{
    public class BackEaseIn extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function BackEaseIn(arg1:Number=1.70158)
        {
            super();
            this.s = arg1;
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / arg4;
            return arg3 * loc1 * arg1 * ((this.s + 1) * arg1 - this.s) + arg2;
        }

        public var s:Number;
    }
}
