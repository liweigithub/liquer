package org.libspark.betweenas3.easing 
{
    import org.libspark.betweenas3.core.easing.*;
    
    public class Quad extends Object
    {
        public function Quad()
        {
            super();
            return;
        }

        public static const easeOut:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.QuadraticEaseOut();

        public static const easeIn:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.QuadraticEaseIn();

        public static const easeOutIn:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.QuadraticEaseOutIn();

        public static const easeInOut:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.QuadraticEaseInOut();
    }
}
