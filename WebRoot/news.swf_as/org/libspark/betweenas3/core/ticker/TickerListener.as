package org.libspark.betweenas3.core.ticker 
{
    public class TickerListener extends Object
    {
        public function TickerListener()
        {
            super();
            return;
        }

        public function tick(arg1:Number):Boolean
        {
            return false;
        }

        public var prevListener:org.libspark.betweenas3.core.ticker.TickerListener=null;

        public var nextListener:org.libspark.betweenas3.core.ticker.TickerListener=null;
    }
}
