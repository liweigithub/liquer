package org.libspark.betweenas3.core.updaters 
{
    import org.libspark.betweenas3.core.easing.*;
    
    public interface IPhysicalUpdater extends org.libspark.betweenas3.core.updaters.IUpdater
    {
        function get easing():org.libspark.betweenas3.core.easing.IPhysicalEasing;

        function get duration():Number;

        function set easing(arg1:org.libspark.betweenas3.core.easing.IPhysicalEasing):void;
    }
}
