package org.libspark.betweenas3.easing 
{
    import org.libspark.betweenas3.core.easing.*;
    
    public class Linear extends Object
    {
        public function Linear()
        {
            super();
            return;
        }

        public static const easeOut:org.libspark.betweenas3.core.easing.IEasing=_linear;

        internal static const _linear:org.libspark.betweenas3.core.easing.IEasing=new org.libspark.betweenas3.core.easing.EaseNone();

        public static const linear:org.libspark.betweenas3.core.easing.IEasing=_linear;

        public static const easeNone:org.libspark.betweenas3.core.easing.IEasing=_linear;

        public static const easeIn:org.libspark.betweenas3.core.easing.IEasing=_linear;

        public static const easeOutIn:org.libspark.betweenas3.core.easing.IEasing=_linear;

        public static const easeInOut:org.libspark.betweenas3.core.easing.IEasing=_linear;
    }
}
