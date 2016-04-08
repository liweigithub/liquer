package org.libspark.betweenas3.easing 
{
    import org.libspark.betweenas3.core.easing.*;
    
    public class Cubic extends Object
    {
        public function Cubic()
        {
            super();
            return;
        }

        public static const easeOut:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.CubicEaseOut();

        public static const easeIn:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.CubicEaseIn();

        public static const easeOutIn:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.CubicEaseOutIn();

        public static const easeInOut:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.CubicEaseInOut();
    }
}
