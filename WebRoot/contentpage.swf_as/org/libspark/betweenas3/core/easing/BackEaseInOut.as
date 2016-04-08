package org.libspark.betweenas3.core.easing 
{
    public class BackEaseInOut extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function BackEaseInOut(arg1:Number=1.70158)
        {
            super();
            this.s = arg1;
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            var loc1:*;
            arg1 = loc1 = arg1 / (arg4 / 2);
            if (loc1 < 1) 
            {
                return arg3 / 2 * arg1 * arg1 * ((this.s * 1.525 + 1) * arg1 - this.s * 1.525) + arg2;
            }
            arg1 = loc1 = arg1 - 2;
            return arg3 / 2 * (loc1 * arg1 * ((this.s * 1.525 + 1) * arg1 + this.s * 1.525) + 2) + arg2;
        }

        public var s:Number;
    }
}
