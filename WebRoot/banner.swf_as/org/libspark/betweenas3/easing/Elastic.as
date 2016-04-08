package org.libspark.betweenas3.easing 
{
    import org.libspark.betweenas3.core.easing.*;
    
    public class Elastic extends Object
    {
        public function Elastic()
        {
            super();
            return;
        }

        public static function easeInOutWith(arg1:Number=0, arg2:Number=0):org.libspark.betweenas3.core.easing.IEasing
        {
            return new org.libspark.betweenas3.core.easing.ElasticEaseInOut(arg1, arg2);
        }

        public static function easeOutInWith(arg1:Number=0, arg2:Number=0):org.libspark.betweenas3.core.easing.IEasing
        {
            return new org.libspark.betweenas3.core.easing.ElasticEaseOutIn(arg1, arg2);
        }

        public static function easeOutWith(arg1:Number=0, arg2:Number=0):org.libspark.betweenas3.core.easing.IEasing
        {
            return new org.libspark.betweenas3.core.easing.ElasticEaseOut(arg1, arg2);
        }

        public static function easeInWith(arg1:Number=0, arg2:Number=0):org.libspark.betweenas3.core.easing.IEasing
        {
            return new org.libspark.betweenas3.core.easing.ElasticEaseIn(arg1, arg2);
        }

        public static const easeOut:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.ElasticEaseOut();

        public static const easeOutIn:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.ElasticEaseOutIn();

        public static const easeIn:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.ElasticEaseIn();

        public static const easeInOut:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.ElasticEaseInOut();
    }
}
