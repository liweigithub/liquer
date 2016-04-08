package org.libspark.betweenas3.easing 
{
    import org.libspark.betweenas3.core.easing.*;
    
    public class Sine extends Object
    {
        public function Sine()
        {
            super();
            return;
        }

        public static const easeOut:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.SineEaseOut();

        public static const easeIn:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.SineEaseIn();

        public static const easeOutIn:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.SineEaseOutIn();

        public static const easeInOut:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.SineEaseInOut();
    }
}
