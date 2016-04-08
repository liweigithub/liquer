package org.libspark.betweenas3.tweens 
{
    import flash.events.*;
    
    public interface ITween extends flash.events.IEventDispatcher
    {
        function get onStop():Function;

        function set onStop(arg1:Function):void;

        function gotoAndPlay(arg1:Number):void;

        function togglePause():void;

        function set onStopParams(arg1:Array):void;

        function get onUpdate():Function;

        function set onUpdate(arg1:Function):void;

        function stop():void;

        function get duration():Number;

        function gotoAndStop(arg1:Number):void;

        function get onPlayParams():Array;

        function get stopOnComplete():Boolean;

        function set onUpdateParams(arg1:Array):void;

        function clone():org.libspark.betweenas3.tweens.ITween;

        function get onCompleteParams():Array;

        function get isPlaying():Boolean;

        function set onPlay(arg1:Function):void;

        function get onStopParams():Array;

        function get position():Number;

        function get onUpdateParams():Array;

        function set onComplete(arg1:Function):void;

        function set onPlayParams(arg1:Array):void;

        function get onPlay():Function;

        function play():void;

        function get onComplete():Function;

        function set stopOnComplete(arg1:Boolean):void;

        function set onCompleteParams(arg1:Array):void;
    }
}
