package org.libspark.betweenas3.core.updaters 
{
    public class UpdaterLadder extends Object implements org.libspark.betweenas3.core.updaters.IUpdater
    {
        public function UpdaterLadder(arg1:org.libspark.betweenas3.core.updaters.IUpdater, arg2:org.libspark.betweenas3.core.updaters.IUpdater, arg3:String)
        {
            super();
            this._parent = arg1;
            this._child = arg2;
            this._propertyName = arg3;
            return;
        }

        public function setObject(arg1:String, arg2:Object):void
        {
            return;
        }

        public function setDestinationValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            return;
        }

        public function setSourceValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            return;
        }

        public function update(arg1:Number):void
        {
            this._child.update(arg1);
            this._parent.setObject(this._propertyName, this._child.target);
            return;
        }

        public function get child():org.libspark.betweenas3.core.updaters.IUpdater
        {
            return this._child;
        }

        public function clone():org.libspark.betweenas3.core.updaters.IUpdater
        {
            return new org.libspark.betweenas3.core.updaters.UpdaterLadder(this._parent, this._child, this._propertyName);
        }

        public function get target():Object
        {
            return null;
        }

        public function set target(arg1:Object):void
        {
            return;
        }

        public function get parent():org.libspark.betweenas3.core.updaters.IUpdater
        {
            return this._parent;
        }

        public function resolveValues():void
        {
            return;
        }

        public function getObject(arg1:String):Object
        {
            return null;
        }

        internal var _parent:org.libspark.betweenas3.core.updaters.IUpdater;

        internal var _propertyName:String;

        internal var _child:org.libspark.betweenas3.core.updaters.IUpdater;
    }
}
