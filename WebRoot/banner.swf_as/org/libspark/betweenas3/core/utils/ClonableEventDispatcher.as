package org.libspark.betweenas3.core.utils 
{
    import __AS3__.vec.*;
    import flash.events.*;
    import flash.utils.*;
    
    public class ClonableEventDispatcher extends flash.events.EventDispatcher
    {
        public function ClonableEventDispatcher(arg1:flash.events.IEventDispatcher=null)
        {
            this._listeners = new flash.utils.Dictionary();
            super(arg1);
            return;
        }

        public override function addEventListener(arg1:String, arg2:Function, arg3:Boolean=false, arg4:int=0, arg5:Boolean=false):void
        {
            super.addEventListener(arg1, arg2, arg3, arg4, arg5);
            var loc1:*;
            (loc1 = new ListenerData()).listener = arg2;
            loc1.useCapture = arg3;
            loc1.priority = arg4;
            loc1.useWeakReference = arg5;
            if (!this._listeners[arg1]) 
            {
                this._listeners[arg1];
                var loc2:*;
                this._listeners[arg1] = loc2 = new Vector.<ListenerData>();
            }
            (this._listeners[arg1] as Vector.<ListenerData>).push(loc1);
            return;
        }

        public override function removeEventListener(arg1:String, arg2:Function, arg3:Boolean=false):void
        {
            var loc2:*=0;
            var loc3:*=0;
            var loc4:*=null;
            super.removeEventListener(arg1, arg2, arg3);
            var loc1:*;
            if ((loc1 = this._listeners[arg1] as Vector.<ListenerData>) != null) 
            {
                loc2 = loc1.length;
                loc3 = 0;
                while (loc3 < loc2) 
                {
                    if ((loc4 = loc1[loc3] as ListenerData).listener == arg2 && loc4.useCapture == arg3) 
                    {
                        loc1.splice(loc3, 1);
                        --loc3;
                        --loc2;
                    }
                    ++loc3;
                }
            }
            return;
        }

        public function copyFrom(arg1:org.libspark.betweenas3.core.utils.ClonableEventDispatcher):void
        {
            var loc2:*=null;
            var loc3:*=null;
            var loc4:*=0;
            var loc5:*=0;
            var loc6:*=null;
            var loc1:*=arg1._listeners;
            var loc7:*=0;
            var loc8:*=loc1;
            for (loc2 in loc8) 
            {
                loc4 = (loc3 = loc1[loc2] as Vector.<ListenerData>).length;
                loc5 = 0;
                while (loc5 < loc4) 
                {
                    loc6 = loc3[loc5] as ListenerData;
                    this.addEventListener(loc2, loc6.listener, loc6.useCapture, loc6.priority, loc6.useWeakReference);
                    ++loc5;
                }
            }
            return;
        }

        internal var _listeners:flash.utils.Dictionary;
    }
}


class ListenerData extends Object
{
    public function ListenerData()
    {
        super();
        return;
    }

    public var priority:int;

    public var useCapture:Boolean;

    public var listener:Function;

    public var useWeakReference:Boolean;
}