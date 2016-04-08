package org.libspark.betweenas3.core.tweens 
{
    import flash.events.*;
    import org.libspark.betweenas3.core.ticker.*;
    import org.libspark.betweenas3.core.utils.*;
    import org.libspark.betweenas3.events.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class AbstractTween extends org.libspark.betweenas3.core.ticker.TickerListener implements org.libspark.betweenas3.core.tweens.IITween
    {
        public function AbstractTween(arg1:org.libspark.betweenas3.core.ticker.ITicker, arg2:Number)
        {
            super();
            this._ticker = arg1;
            this._position = arg2;
            return;
        }

        public override function tick(arg1:Number):Boolean
        {
            if (!this._isPlaying) 
            {
                return true;
            }
            var loc1:*=arg1 - this._startTime;
            this._position = loc1;
            this.internalUpdate(loc1);
            if ((this._willTriggerFlags & 4) != 0) 
            {
                this._dispatcher.dispatchEvent(new org.libspark.betweenas3.events.TweenEvent(org.libspark.betweenas3.events.TweenEvent.UPDATE));
            }
            if (!(this._classicHandlers == null) && !(this._classicHandlers.onUpdate == null)) 
            {
                this._classicHandlers.onUpdate.apply(null, this._classicHandlers.onUpdateParams);
            }
            if (this._isPlaying) 
            {
                if (loc1 >= this._duration) 
                {
                    this._position = this._duration;
                    if (this._stopOnComplete) 
                    {
                        this._isPlaying = false;
                        if ((this._willTriggerFlags & 8) != 0) 
                        {
                            this._dispatcher.dispatchEvent(new org.libspark.betweenas3.events.TweenEvent(org.libspark.betweenas3.events.TweenEvent.COMPLETE));
                        }
                        if (!(this._classicHandlers == null) && !(this._classicHandlers.onComplete == null)) 
                        {
                            this._classicHandlers.onComplete.apply(null, this._classicHandlers.onCompleteParams);
                        }
                        return true;
                    }
                    if ((this._willTriggerFlags & 8) != 0) 
                    {
                        this._dispatcher.dispatchEvent(new org.libspark.betweenas3.events.TweenEvent(org.libspark.betweenas3.events.TweenEvent.COMPLETE));
                    }
                    if (!(this._classicHandlers == null) && !(this._classicHandlers.onComplete == null)) 
                    {
                        this._classicHandlers.onComplete.apply(null, this._classicHandlers.onCompleteParams);
                    }
                    this._position = loc1 - this._duration;
                    this._startTime = arg1 - this._position;
                    this.tick(arg1);
                }
                return false;
            }
            return true;
        }

        public function get onStop():Function
        {
            return this._classicHandlers == null ? null : this._classicHandlers.onStop;
        }

        public function set onStop(arg1:Function):void
        {
            this.getClassicHandlers().onStop = arg1;
            return;
        }

        public function hasEventListener(arg1:String):Boolean
        {
            if (this._dispatcher != null) 
            {
                return this._dispatcher.hasEventListener(arg1);
            }
            return false;
        }

        public function willTrigger(arg1:String):Boolean
        {
            if (this._dispatcher != null) 
            {
                return this._dispatcher.willTrigger(arg1);
            }
            return false;
        }

        protected function newInstance():org.libspark.betweenas3.core.tweens.AbstractTween
        {
            return null;
        }

        public function get onUpdate():Function
        {
            return this._classicHandlers == null ? null : this._classicHandlers.onUpdate;
        }

        public function get ticker():org.libspark.betweenas3.core.ticker.ITicker
        {
            return this._ticker;
        }

        public function get duration():Number
        {
            return this._duration;
        }

        public function gotoAndStop(arg1:Number):void
        {
            if (arg1 < 0) 
            {
                arg1 = 0;
            }
            if (arg1 > this._duration) 
            {
                arg1 = this._duration;
            }
            this._position = arg1;
            this.internalUpdate(arg1);
            if ((this._willTriggerFlags & 4) != 0) 
            {
                this._dispatcher.dispatchEvent(new org.libspark.betweenas3.events.TweenEvent(org.libspark.betweenas3.events.TweenEvent.UPDATE));
            }
            if (!(this._classicHandlers == null) && !(this._classicHandlers.onUpdate == null)) 
            {
                this._classicHandlers.onUpdate.apply(null, this._classicHandlers.onUpdateParams);
            }
            this.stop();
            return;
        }

        public function get onPlayParams():Array
        {
            return this._classicHandlers == null ? null : this._classicHandlers.onPlayParams;
        }

        public function stop():void
        {
            if (this._isPlaying) 
            {
                this._isPlaying = false;
                if ((this._willTriggerFlags & 2) != 0) 
                {
                    this._dispatcher.dispatchEvent(new org.libspark.betweenas3.events.TweenEvent(org.libspark.betweenas3.events.TweenEvent.STOP));
                }
                if (!(this._classicHandlers == null) && !(this._classicHandlers.onStop == null)) 
                {
                    this._classicHandlers.onStop.apply(null, this._classicHandlers.onStopParams);
                }
            }
            return;
        }

        public function set onUpdate(arg1:Function):void
        {
            this.getClassicHandlers().onUpdate = arg1;
            return;
        }

        public function firePlay():void
        {
            if ((this._willTriggerFlags & 1) != 0) 
            {
                this._dispatcher.dispatchEvent(new org.libspark.betweenas3.events.TweenEvent(org.libspark.betweenas3.events.TweenEvent.PLAY));
            }
            if (!(this._classicHandlers == null) && !(this._classicHandlers.onPlay == null)) 
            {
                this._classicHandlers.onPlay.apply(null, this._classicHandlers.onPlayParams);
            }
            return;
        }

        public function get isPlaying():Boolean
        {
            return this._isPlaying;
        }

        protected function copyFrom(arg1:org.libspark.betweenas3.core.tweens.AbstractTween):void
        {
            this._ticker = arg1._ticker;
            this._duration = arg1._duration;
            this._stopOnComplete = arg1._stopOnComplete;
            if (arg1._classicHandlers != null) 
            {
                this._classicHandlers = new ClassicHandlers();
                this._classicHandlers.copyFrom(arg1._classicHandlers);
            }
            if (arg1._dispatcher != null) 
            {
                this._dispatcher = new org.libspark.betweenas3.core.utils.ClonableEventDispatcher(this);
                this._dispatcher.copyFrom(arg1._dispatcher);
            }
            this._willTriggerFlags = arg1._willTriggerFlags;
            return;
        }

        protected function internalUpdate(arg1:Number):void
        {
            return;
        }

        public function get onUpdateParams():Array
        {
            return this._classicHandlers == null ? null : this._classicHandlers.onUpdateParams;
        }

        public function get position():Number
        {
            return this._position;
        }

        public function set onPlayParams(arg1:Array):void
        {
            this.getClassicHandlers().onPlayParams = arg1;
            return;
        }

        public function get onPlay():Function
        {
            return this._classicHandlers == null ? null : this._classicHandlers.onPlay;
        }

        public function set stopOnComplete(arg1:Boolean):void
        {
            this._stopOnComplete = arg1;
            return;
        }

        protected function updateWillTriggerFlags():void
        {
            if (this._dispatcher.willTrigger(org.libspark.betweenas3.events.TweenEvent.PLAY)) 
            {
                this._willTriggerFlags = this._willTriggerFlags | 1;
            }
            else 
            {
                this._willTriggerFlags = this._willTriggerFlags & ~1;
            }
            if (this._dispatcher.willTrigger(org.libspark.betweenas3.events.TweenEvent.STOP)) 
            {
                this._willTriggerFlags = this._willTriggerFlags | 2;
            }
            else 
            {
                this._willTriggerFlags = this._willTriggerFlags & ~2;
            }
            if (this._dispatcher.willTrigger(org.libspark.betweenas3.events.TweenEvent.UPDATE)) 
            {
                this._willTriggerFlags = this._willTriggerFlags | 4;
            }
            else 
            {
                this._willTriggerFlags = this._willTriggerFlags & ~4;
            }
            if (this._dispatcher.willTrigger(org.libspark.betweenas3.events.TweenEvent.COMPLETE)) 
            {
                this._willTriggerFlags = this._willTriggerFlags | 8;
            }
            else 
            {
                this._willTriggerFlags = this._willTriggerFlags & ~8;
            }
            return;
        }

        public function set onCompleteParams(arg1:Array):void
        {
            this.getClassicHandlers().onCompleteParams = arg1;
            return;
        }

        public function dispatchEvent(arg1:flash.events.Event):Boolean
        {
            if (this._dispatcher != null) 
            {
                return this._dispatcher.dispatchEvent(arg1);
            }
            return false;
        }

        public function gotoAndPlay(arg1:Number):void
        {
            var loc1:*=NaN;
            if (arg1 < 0) 
            {
                arg1 = 0;
            }
            if (arg1 > this._duration) 
            {
                arg1 = this._duration;
            }
            this._position = arg1;
            if (this._isPlaying) 
            {
                if (this._position >= this._duration) 
                {
                    this._position = 0;
                }
                loc1 = this._ticker.time;
                this._startTime = loc1 - this._position;
                this.tick(loc1);
            }
            else 
            {
                this.play();
            }
            return;
        }

        public function get onComplete():Function
        {
            return this._classicHandlers == null ? null : this._classicHandlers.onComplete;
        }

        public function togglePause():void
        {
            if (this._isPlaying) 
            {
                this.stop();
            }
            else 
            {
                this.play();
            }
            return;
        }

        public function update(arg1:Number):void
        {
            var loc1:*=false;
            if (this._position < this._duration && this._duration <= arg1 || 0 < this._position && arg1 <= 0) 
            {
                loc1 = true;
            }
            this._position = arg1;
            this.internalUpdate(arg1);
            if ((this._willTriggerFlags & 4) != 0) 
            {
                this._dispatcher.dispatchEvent(new org.libspark.betweenas3.events.TweenEvent(org.libspark.betweenas3.events.TweenEvent.UPDATE));
            }
            if (!(this._classicHandlers == null) && !(this._classicHandlers.onUpdate == null)) 
            {
                this._classicHandlers.onUpdate.apply(null, this._classicHandlers.onUpdateParams);
            }
            if (loc1) 
            {
                if ((this._willTriggerFlags & 8) != 0) 
                {
                    this._dispatcher.dispatchEvent(new org.libspark.betweenas3.events.TweenEvent(org.libspark.betweenas3.events.TweenEvent.COMPLETE));
                }
                if (!(this._classicHandlers == null) && !(this._classicHandlers.onComplete == null)) 
                {
                    this._classicHandlers.onComplete.apply(null, this._classicHandlers.onCompleteParams);
                }
            }
            return;
        }

        public function play():void
        {
            var loc1:*=NaN;
            if (!this._isPlaying) 
            {
                if (this._position >= this._duration) 
                {
                    this._position = 0;
                }
                loc1 = this._ticker.time;
                this._startTime = loc1 - this._position;
                this._isPlaying = true;
                this._ticker.addTickerListener(this);
                if ((this._willTriggerFlags & 1) != 0) 
                {
                    this._dispatcher.dispatchEvent(new org.libspark.betweenas3.events.TweenEvent(org.libspark.betweenas3.events.TweenEvent.PLAY));
                }
                if (!(this._classicHandlers == null) && !(this._classicHandlers.onPlay == null)) 
                {
                    this._classicHandlers.onPlay.apply(null, this._classicHandlers.onPlayParams);
                }
                this.tick(loc1);
            }
            return;
        }

        public function set onStopParams(arg1:Array):void
        {
            this.getClassicHandlers().onStopParams = arg1;
            return;
        }

        public function removeEventListener(arg1:String, arg2:Function, arg3:Boolean=false):void
        {
            if (this._dispatcher != null) 
            {
                this._dispatcher.removeEventListener(arg1, arg2, arg3);
                this.updateWillTriggerFlags();
            }
            return;
        }

        public function addEventListener(arg1:String, arg2:Function, arg3:Boolean=false, arg4:int=0, arg5:Boolean=false):void
        {
            if (this._dispatcher == null) 
            {
                this._dispatcher = new org.libspark.betweenas3.core.utils.ClonableEventDispatcher(this);
            }
            this._dispatcher.addEventListener(arg1, arg2, arg3, arg4, arg5);
            this.updateWillTriggerFlags();
            return;
        }

        public function fireStop():void
        {
            if ((this._willTriggerFlags & 2) != 0) 
            {
                this._dispatcher.dispatchEvent(new org.libspark.betweenas3.events.TweenEvent(org.libspark.betweenas3.events.TweenEvent.STOP));
            }
            if (!(this._classicHandlers == null) && !(this._classicHandlers.onStop == null)) 
            {
                this._classicHandlers.onStop.apply(null, this._classicHandlers.onStopParams);
            }
            return;
        }

        public function get stopOnComplete():Boolean
        {
            return this._stopOnComplete;
        }

        public function clone():org.libspark.betweenas3.tweens.ITween
        {
            var loc1:*=this.newInstance();
            if (loc1 != null) 
            {
                loc1.copyFrom(this);
            }
            return loc1;
        }

        public function get onCompleteParams():Array
        {
            return this._classicHandlers == null ? null : this._classicHandlers.onCompleteParams;
        }

        public function set onUpdateParams(arg1:Array):void
        {
            this.getClassicHandlers().onUpdateParams = arg1;
            return;
        }

        public function get onStopParams():Array
        {
            return this._classicHandlers == null ? null : this._classicHandlers.onStopParams;
        }

        protected function getClassicHandlers():ClassicHandlers
        {
            if (!this._classicHandlers) 
            {
                this._classicHandlers;
                var loc1:*;
                this._classicHandlers = loc1 = new ClassicHandlers();
            }
            return this._classicHandlers;
        }

        public function set onPlay(arg1:Function):void
        {
            this.getClassicHandlers().onPlay = arg1;
            return;
        }

        public function set onComplete(arg1:Function):void
        {
            this.getClassicHandlers().onComplete = arg1;
            return;
        }

        protected var _willTriggerFlags:uint=0;

        protected var _position:Number=0;

        protected var _isPlaying:Boolean=false;

        protected var _ticker:org.libspark.betweenas3.core.ticker.ITicker;

        protected var _duration:Number=0;

        protected var _classicHandlers:ClassicHandlers;

        protected var _dispatcher:org.libspark.betweenas3.core.utils.ClonableEventDispatcher;

        protected var _stopOnComplete:Boolean=true;

        protected var _startTime:Number;
    }
}


class ClassicHandlers extends Object
{
    public function ClassicHandlers()
    {
        super();
        return;
    }

    public function copyFrom(arg1:ClassicHandlers):void
    {
        this.onPlay = arg1.onPlay;
        this.onPlayParams = arg1.onPlayParams;
        this.onStop = arg1.onStop;
        this.onStopParams = arg1.onStopParams;
        this.onUpdate = arg1.onUpdate;
        this.onUpdateParams = arg1.onUpdateParams;
        this.onComplete = arg1.onComplete;
        this.onCompleteParams = arg1.onCompleteParams;
        return;
    }

    public var onStop:Function;

    public var onStopParams:Array;

    public var onUpdate:Function;

    public var onUpdateParams:Array;

    public var onPlay:Function;

    public var onComplete:Function;

    public var onPlayParams:Array;

    public var onCompleteParams:Array;
}