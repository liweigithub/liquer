package org.libspark.betweenas3.easing 
{
    import org.libspark.betweenas3.core.easing.*;
    
    public class Back extends Object
    {
        public function Back()
        {
            super();
            return;
        }

        public static function easeInOutWith(arg1:Number=1.70158):org.libspark.betweenas3.core.easing.IEasing
        {
            return new org.libspark.betweenas3.core.easing.BackEaseInOut(arg1);
        }

        public static function easeOutInWith(arg1:Number=1.70158):org.libspark.betweenas3.core.easing.IEasing
        {
            return new org.libspark.betweenas3.core.easing.BackEaseOutIn(arg1);
        }

        public static function easeOutWith(arg1:Number=1.70158):org.libspark.betweenas3.core.easing.IEasing
        {
            return new org.libspark.betweenas3.core.easing.BackEaseOut(arg1);
        }

        public static function easeInWith(arg1:Number=1.70158):org.libspark.betweenas3.core.easing.IEasing
        {
            return new org.libspark.betweenas3.core.easing.BackEaseIn(arg1);
        }

        public static const easeOut:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.BackEaseOut();

        public static const easeOutIn:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.BackEaseOutIn();

        public static const easeIn:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.BackEaseIn();

        public static const easeInOut:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.BackEaseInOut();
    }
}
