package org.libspark.betweenas3.core.ticker 
{
    public interface ITicker
    {
        function stop():void;

        function start():void;

        function removeTickerListener(arg1:org.libspark.betweenas3.core.ticker.TickerListener):void;

        function get time():Number;

        function addTickerListener(arg1:org.libspark.betweenas3.core.ticker.TickerListener):void;
    }
}
