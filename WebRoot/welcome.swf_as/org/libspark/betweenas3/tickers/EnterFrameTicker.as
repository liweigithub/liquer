package org.libspark.betweenas3.tickers 
{
    import __AS3__.vec.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import org.libspark.betweenas3.core.ticker.*;
    
    public class EnterFrameTicker extends Object implements org.libspark.betweenas3.core.ticker.ITicker
    {
        public function EnterFrameTicker()
        {
            var loc3:*=null;
            super();
            this._tickerListenerPaddings = new Vector.<org.libspark.betweenas3.core.ticker.TickerListener>(10, true);
            var loc1:*=null;
            var loc2:*=0;
            while (loc2 < 10) 
            {
                loc3 = new org.libspark.betweenas3.core.ticker.TickerListener();
                if (loc1 != null) 
                {
                    loc1.nextListener = loc3;
                    loc3.prevListener = loc1;
                }
                loc1 = loc3;
                this._tickerListenerPaddings[loc2] = loc3;
                ++loc2;
            }
            return;
        }

        function update(arg1:flash.events.Event):void
        {
            var loc7:*;
            this._time = loc7 = flash.utils.getTimer() / 1000;
            var loc1:*=loc7;
            var loc2:*=this._numListeners / 8 + 1 | 0;
            var loc3:*=loc2 * 8 - this._numListeners;
            var loc4:*=this._tickerListenerPaddings[0];
            var loc5:*=this._tickerListenerPaddings[loc3];
            var loc6:*=null;
            loc5.nextListener = loc7 = this._first;
            if (loc7 != null) 
            {
                this._first.prevListener = loc5;
            }
            while (--loc2 >= 0) 
            {
                loc4 = loc7 = loc4.nextListener;
                if (loc7.tick(loc1)) 
                {
                    if (loc4.prevListener != null) 
                    {
                        loc4.prevListener.nextListener = loc4.nextListener;
                    }
                    if (loc4.nextListener != null) 
                    {
                        loc4.nextListener.prevListener = loc4.prevListener;
                    }
                    if (loc4 == this._first) 
                    {
                        this._first = loc4.nextListener;
                    }
                    if (loc4 == this._last) 
                    {
                        this._last = loc4.prevListener;
                    }
                    loc6 = loc4.prevListener;
                    loc4.nextListener = null;
                    loc4.prevListener = null;
                    loc4 = loc6;
                    var loc8:*=((loc7 = this)._numListeners - 1);
                    loc7._numListeners = loc8;
                }
                loc4 = loc7 = loc4.nextListener;
                if (loc7.tick(loc1)) 
                {
                    if (loc4.prevListener != null) 
                    {
                        loc4.prevListener.nextListener = loc4.nextListener;
                    }
                    if (loc4.nextListener != null) 
                    {
                        loc4.nextListener.prevListener = loc4.prevListener;
                    }
                    if (loc4 == this._first) 
                    {
                        this._first = loc4.nextListener;
                    }
                    if (loc4 == this._last) 
                    {
                        this._last = loc4.prevListener;
                    }
                    loc6 = loc4.prevListener;
                    loc4.nextListener = null;
                    loc4.prevListener = null;
                    loc4 = loc6;
                    loc8 = ((loc7 = this)._numListeners - 1);
                    loc7._numListeners = loc8;
                }
                loc4 = loc7 = loc4.nextListener;
                if (loc7.tick(loc1)) 
                {
                    if (loc4.prevListener != null) 
                    {
                        loc4.prevListener.nextListener = loc4.nextListener;
                    }
                    if (loc4.nextListener != null) 
                    {
                        loc4.nextListener.prevListener = loc4.prevListener;
                    }
                    if (loc4 == this._first) 
                    {
                        this._first = loc4.nextListener;
                    }
                    if (loc4 == this._last) 
                    {
                        this._last = loc4.prevListener;
                    }
                    loc6 = loc4.prevListener;
                    loc4.nextListener = null;
                    loc4.prevListener = null;
                    loc4 = loc6;
                    loc8 = ((loc7 = this)._numListeners - 1);
                    loc7._numListeners = loc8;
                }
                loc4 = loc7 = loc4.nextListener;
                if (loc7.tick(loc1)) 
                {
                    if (loc4.prevListener != null) 
                    {
                        loc4.prevListener.nextListener = loc4.nextListener;
                    }
                    if (loc4.nextListener != null) 
                    {
                        loc4.nextListener.prevListener = loc4.prevListener;
                    }
                    if (loc4 == this._first) 
                    {
                        this._first = loc4.nextListener;
                    }
                    if (loc4 == this._last) 
                    {
                        this._last = loc4.prevListener;
                    }
                    loc6 = loc4.prevListener;
                    loc4.nextListener = null;
                    loc4.prevListener = null;
                    loc4 = loc6;
                    loc8 = ((loc7 = this)._numListeners - 1);
                    loc7._numListeners = loc8;
                }
                loc4 = loc7 = loc4.nextListener;
                if (loc7.tick(loc1)) 
                {
                    if (loc4.prevListener != null) 
                    {
                        loc4.prevListener.nextListener = loc4.nextListener;
                    }
                    if (loc4.nextListener != null) 
                    {
                        loc4.nextListener.prevListener = loc4.prevListener;
                    }
                    if (loc4 == this._first) 
                    {
                        this._first = loc4.nextListener;
                    }
                    if (loc4 == this._last) 
                    {
                        this._last = loc4.prevListener;
                    }
                    loc6 = loc4.prevListener;
                    loc4.nextListener = null;
                    loc4.prevListener = null;
                    loc4 = loc6;
                    loc8 = ((loc7 = this)._numListeners - 1);
                    loc7._numListeners = loc8;
                }
                loc4 = loc7 = loc4.nextListener;
                if (loc7.tick(loc1)) 
                {
                    if (loc4.prevListener != null) 
                    {
                        loc4.prevListener.nextListener = loc4.nextListener;
                    }
                    if (loc4.nextListener != null) 
                    {
                        loc4.nextListener.prevListener = loc4.prevListener;
                    }
                    if (loc4 == this._first) 
                    {
                        this._first = loc4.nextListener;
                    }
                    if (loc4 == this._last) 
                    {
                        this._last = loc4.prevListener;
                    }
                    loc6 = loc4.prevListener;
                    loc4.nextListener = null;
                    loc4.prevListener = null;
                    loc4 = loc6;
                    loc8 = ((loc7 = this)._numListeners - 1);
                    loc7._numListeners = loc8;
                }
                loc4 = loc7 = loc4.nextListener;
                if (loc7.tick(loc1)) 
                {
                    if (loc4.prevListener != null) 
                    {
                        loc4.prevListener.nextListener = loc4.nextListener;
                    }
                    if (loc4.nextListener != null) 
                    {
                        loc4.nextListener.prevListener = loc4.prevListener;
                    }
                    if (loc4 == this._first) 
                    {
                        this._first = loc4.nextListener;
                    }
                    if (loc4 == this._last) 
                    {
                        this._last = loc4.prevListener;
                    }
                    loc6 = loc4.prevListener;
                    loc4.nextListener = null;
                    loc4.prevListener = null;
                    loc4 = loc6;
                    loc8 = ((loc7 = this)._numListeners - 1);
                    loc7._numListeners = loc8;
                }
                loc4 = loc7 = loc4.nextListener;
                if (!loc7.tick(loc1)) 
                {
                    continue;
                }
                if (loc4.prevListener != null) 
                {
                    loc4.prevListener.nextListener = loc4.nextListener;
                }
                if (loc4.nextListener != null) 
                {
                    loc4.nextListener.prevListener = loc4.prevListener;
                }
                if (loc4 == this._first) 
                {
                    this._first = loc4.nextListener;
                }
                if (loc4 == this._last) 
                {
                    this._last = loc4.prevListener;
                }
                loc6 = loc4.prevListener;
                loc4.nextListener = null;
                loc4.prevListener = null;
                loc4 = loc6;
                loc8 = ((loc7 = this)._numListeners - 1);
                loc7._numListeners = loc8;
            }
            this._first = loc7 = loc5.nextListener;
            if (loc7 == null) 
            {
                this._last = null;
            }
            else 
            {
                this._first.prevListener = null;
            }
            loc5.nextListener = this._tickerListenerPaddings[loc3 + 1];
            return;
        }

        public function start():void
        {
            this._time = flash.utils.getTimer() / 1000;
            _shape.addEventListener(flash.events.Event.ENTER_FRAME, this.update);
            return;
        }

        public function removeTickerListener(arg1:org.libspark.betweenas3.core.ticker.TickerListener):void
        {
            var loc1:*=this._first;
            while (loc1 != null) 
            {
                if (loc1 == arg1) 
                {
                    if (loc1.prevListener == null) 
                    {
                        this._first = loc1.nextListener;
                    }
                    else 
                    {
                        loc1.prevListener.nextListener = loc1.nextListener;
                        loc1.nextListener = null;
                    }
                    if (loc1.nextListener == null) 
                    {
                        this._last = loc1.prevListener;
                    }
                    else 
                    {
                        loc1.nextListener.prevListener = loc1.prevListener;
                        loc1.prevListener = null;
                    }
                    var loc2:*;
                    var loc3:*=((loc2 = this)._numListeners - 1);
                    loc2._numListeners = loc3;
                }
                loc1 = loc1.nextListener;
            }
            return;
        }

        public function get time():Number
        {
            return this._time;
        }

        public function addTickerListener(arg1:org.libspark.betweenas3.core.ticker.TickerListener):void
        {
            if (!(arg1.nextListener == null) || !(arg1.prevListener == null)) 
            {
                return;
            }
            if (this._last != null) 
            {
                if (this._last.nextListener != null) 
                {
                    this._last.nextListener.prevListener = arg1;
                    arg1.nextListener = this._last.nextListener;
                }
                arg1.prevListener = this._last;
                this._last.nextListener = arg1;
            }
            this._last = arg1;
            if (this._first == null) 
            {
                this._first = arg1;
            }
            var loc1:*;
            var loc2:*=((loc1 = this)._numListeners + 1);
            loc1._numListeners = loc2;
            return;
        }

        public function stop():void
        {
            _shape.removeEventListener(flash.events.Event.ENTER_FRAME, this.update);
            return;
        }

        
        {
            _shape = new flash.display.Shape();
        }

        internal var _tickerListenerPaddings:__AS3__.vec.Vector.<org.libspark.betweenas3.core.ticker.TickerListener>;

        internal var _time:Number;

        internal var _first:org.libspark.betweenas3.core.ticker.TickerListener=null;

        internal var _last:org.libspark.betweenas3.core.ticker.TickerListener=null;

        internal var _numListeners:uint=0;

        internal static var _shape:flash.display.Shape;
    }
}
