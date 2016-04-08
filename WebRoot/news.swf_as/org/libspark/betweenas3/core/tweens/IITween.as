package org.libspark.betweenas3.core.tweens 
{
    import org.libspark.betweenas3.core.ticker.*;
    import org.libspark.betweenas3.tweens.*;
    
    public interface IITween extends org.libspark.betweenas3.tweens.ITween
    {
        function fireStop():void;

        function firePlay():void;

        function get ticker():org.libspark.betweenas3.core.ticker.ITicker;

        function update(arg1:Number):void;
    }
}
