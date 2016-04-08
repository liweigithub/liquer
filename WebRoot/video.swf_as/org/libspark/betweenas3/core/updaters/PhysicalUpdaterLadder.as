package org.libspark.betweenas3.core.updaters 
{
    import org.libspark.betweenas3.core.easing.*;
    
    public class PhysicalUpdaterLadder extends Object implements org.libspark.betweenas3.core.updaters.IPhysicalUpdater
    {
        public function PhysicalUpdaterLadder(arg1:org.libspark.betweenas3.core.updaters.IPhysicalUpdater, arg2:org.libspark.betweenas3.core.updaters.IPhysicalUpdater, arg3:String)
        {
            super();
            this._parent = arg1;
            this._child = arg2;
            this._propertyName = arg3;
            this._duration = arg2.duration;
            return;
        }

        public function setDestinationValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            return;
        }

        public function setObject(arg1:String, arg2:Object):void
        {
            return;
        }

        public function get target():Object
        {
            return null;
        }

        public function setSourceValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            return;
        }

        public function get child():org.libspark.betweenas3.core.updaters.IPhysicalUpdater
        {
            return this._child;
        }

        public function set easing(arg1:org.libspark.betweenas3.core.easing.IPhysicalEasing):void
        {
            return;
        }

        public function update(arg1:Number):void
        {
            this._child.update(arg1);
            this._parent.setObject(this._propertyName, this._child.target);
            return;
        }

        public function set target(arg1:Object):void
        {
            return;
        }

        public function get duration():Number
        {
            return this._duration;
        }

        public function get parent():org.libspark.betweenas3.core.updaters.IPhysicalUpdater
        {
            return this._parent;
        }

        public function resolveValues():void
        {
            return;
        }

        public function get easing():org.libspark.betweenas3.core.easing.IPhysicalEasing
        {
            return null;
        }

        public function getObject(arg1:String):Object
        {
            return null;
        }

        public function clone():org.libspark.betweenas3.core.updaters.IUpdater
        {
            return new org.libspark.betweenas3.core.updaters.PhysicalUpdaterLadder(this._parent, this._child, this._propertyName);
        }

        internal var _parent:org.libspark.betweenas3.core.updaters.IPhysicalUpdater;

        internal var _propertyName:String;

        internal var _child:org.libspark.betweenas3.core.updaters.IPhysicalUpdater;

        internal var _duration:Number=0;
    }
}
