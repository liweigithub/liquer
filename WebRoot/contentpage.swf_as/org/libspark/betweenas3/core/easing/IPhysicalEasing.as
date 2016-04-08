package org.libspark.betweenas3.core.easing 
{
    public interface IPhysicalEasing
    {
        function getDuration(arg1:Number, arg2:Number):Number;

        function calculate(arg1:Number, arg2:Number, arg3:Number):Number;
    }
}
