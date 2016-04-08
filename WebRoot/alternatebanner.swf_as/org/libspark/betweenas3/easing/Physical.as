package org.libspark.betweenas3.easing 
{
    import org.libspark.betweenas3.core.easing.*;
    
    public class Physical extends Object
    {
        public function Physical()
        {
            super();
            return;
        }

        public static function uniform(arg1:Number=10, arg2:Number=NaN):org.libspark.betweenas3.core.easing.IPhysicalEasing
        {
            return new org.libspark.betweenas3.core.easing.PhysicalUniform(arg1, isNaN(arg2) ? _defaultFrameRate : arg2);
        }

        public static function exponential(arg1:Number=0.2, arg2:Number=0.0001, arg3:Number=NaN):org.libspark.betweenas3.core.easing.IPhysicalEasing
        {
            return new org.libspark.betweenas3.core.easing.PhysicalExponential(arg1, arg2, isNaN(arg3) ? _defaultFrameRate : arg3);
        }

        public static function set defaultFrameRate(arg1:Number):void
        {
            _defaultFrameRate = arg1;
            return;
        }

        public static function get defaultFrameRate():Number
        {
            return _defaultFrameRate;
        }

        public static function accelerate(arg1:Number=1, arg2:Number=0, arg3:Number=NaN):org.libspark.betweenas3.core.easing.IPhysicalEasing
        {
            return new org.libspark.betweenas3.core.easing.PhysicalAccelerate(arg2, arg1, isNaN(arg3) ? _defaultFrameRate : arg3);
        }

        
        {
            _defaultFrameRate = 30;
        }

        internal static var _defaultFrameRate:Number=30;
    }
}
