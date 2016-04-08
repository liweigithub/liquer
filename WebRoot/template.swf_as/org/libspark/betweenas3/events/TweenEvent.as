package org.libspark.betweenas3.events 
{
    import flash.events.*;
    
    public class TweenEvent extends flash.events.Event
    {
        public function TweenEvent(arg1:String, arg2:Boolean=false, arg3:Boolean=false)
        {
            super(arg1, arg2, arg3);
            return;
        }

        public static const UPDATE:String="update";

        public static const STOP:String="stop";

        public static const COMPLETE:String="complete";

        public static const PLAY:String="play";
    }
}
