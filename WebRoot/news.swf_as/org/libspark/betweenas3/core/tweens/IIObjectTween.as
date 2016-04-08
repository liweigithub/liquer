package org.libspark.betweenas3.core.tweens 
{
    import org.libspark.betweenas3.core.easing.*;
    import org.libspark.betweenas3.core.updaters.*;
    import org.libspark.betweenas3.tweens.*;
    
    public interface IIObjectTween extends org.libspark.betweenas3.tweens.IObjectTween, org.libspark.betweenas3.core.tweens.IITween
    {
        function set updater(arg1:org.libspark.betweenas3.core.updaters.IUpdater):void;

        function set easing(arg1:org.libspark.betweenas3.core.easing.IEasing):void;

        function get updater():org.libspark.betweenas3.core.updaters.IUpdater;

        function set time(arg1:Number):void;

        function get easing():org.libspark.betweenas3.core.easing.IEasing;

        function get time():Number;
    }
}
