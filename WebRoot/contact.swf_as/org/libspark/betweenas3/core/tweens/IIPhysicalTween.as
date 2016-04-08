package org.libspark.betweenas3.core.tweens 
{
    import org.libspark.betweenas3.core.updaters.*;
    import org.libspark.betweenas3.tweens.*;
    
    public interface IIPhysicalTween extends org.libspark.betweenas3.tweens.IObjectTween, org.libspark.betweenas3.core.tweens.IITween
    {
        function get updater():org.libspark.betweenas3.core.updaters.IPhysicalUpdater;

        function set updater(arg1:org.libspark.betweenas3.core.updaters.IPhysicalUpdater):void;
    }
}
