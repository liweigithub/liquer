package org.libspark.betweenas3.core.easing 
{
    public class ElasticEaseInOut extends Object implements org.libspark.betweenas3.core.easing.IEasing
    {
        public function ElasticEaseInOut(arg1:Number=0, arg2:Number=0)
        {
            super();
            this.a = arg1;
            this.p = arg2;
            return;
        }

        public function calculate(arg1:Number, arg2:Number, arg3:Number, arg4:Number):Number
        {
            var loc1:*=NaN;
            if (arg1 == 0) 
            {
                return arg2;
            }
            var loc2:*;
            arg1 = loc2 = arg1 / (arg4 / 2);
            if (loc2 == 2) 
            {
                return arg2 + arg3;
            }
            if (!this.p) 
            {
                this.p = arg4 * 0.3 * 1.5;
            }
            if (!this.a || this.a < Math.abs(arg3)) 
            {
                this.a = arg3;
                loc1 = this.p / 4;
            }
            else 
            {
                loc1 = this.p / (2 * Math.PI) * Math.asin(arg3 / this.a);
            }
            if (arg1 < 1) 
            {
                --arg1;
                return -0.5 * this.a * Math.pow(2, 10 * loc2) * Math.sin((arg1 * arg4 - loc1) * 2 * Math.PI / this.p) + arg2;
            }
            --arg1;
            return this.a * Math.pow(2, -10 * loc2) * Math.sin((arg1 * arg4 - loc1) * 2 * Math.PI / this.p) * 0.5 + arg3 + arg2;
        }

        public var p:Number;

        public var a:Number;
    }
}
