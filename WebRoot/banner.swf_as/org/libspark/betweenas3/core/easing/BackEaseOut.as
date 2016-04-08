package org.libspark.betweenas3.core.easing 
{
    public class BackEaseOut extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function BackEaseOut(arg1:Number=1.70158)
        {
            super();
            this.s = arg1;
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            var loc1:*;
            arg1 = loc1 = (arg1 / arg4 - 1);
            return arg3 * (loc1 * arg1 * ((this.s + 1) * arg1 + this.s) + 1) + arg2;
        }

        public var s:Number;
    }
}
