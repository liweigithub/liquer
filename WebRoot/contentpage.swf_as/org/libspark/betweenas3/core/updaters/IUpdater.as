package org.libspark.betweenas3.core.updaters 
{
    public interface IUpdater
    {
        function setObject(arg1:String, arg2:Object):void;

        function set target(arg1:Object):void;

        function setSourceValue(arg1:String, arg2:Number, arg3:Boolean=false):void;

        function setDestinationValue(arg1:String, arg2:Number, arg3:Boolean=false):void;

        function get target():Object;

        function update(arg1:Number):void;

        function getObject(arg1:String):Object;

        function clone():org.libspark.betweenas3.core.updaters.IUpdater;
    }
}
