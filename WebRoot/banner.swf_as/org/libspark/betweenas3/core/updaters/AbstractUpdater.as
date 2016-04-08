package org.libspark.betweenas3.core.updaters 
{
    public class AbstractUpdater extends Object implements org.libspark.betweenas3.core.updaters.IUpdater
    {
        public function AbstractUpdater()
        {
            super();
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

        public function set target(arg1:Object):void
        {
            return;
        }

        public function update(arg1:Number):void
        {
            if (!this._isResolved) 
            {
                this.resolveValues();
                this._isResolved = true;
            }
            this.updateObject(arg1);
            return;
        }

        protected function newInstance():org.libspark.betweenas3.core.updaters.AbstractUpdater
        {
            return null;
        }

        protected function resolveValues():void
        {
            return;
        }

        protected function updateObject(arg1:Number):void
        {
            return;
        }

        public function setSourceValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            return;
        }

        public function get target():Object
        {
            return null;
        }

        public function getObject(arg1:String):Object
        {
            return null;
        }

        public function clone():org.libspark.betweenas3.core.updaters.IUpdater
        {
            var loc1:*=this.newInstance();
            if (loc1 != null) 
            {
                loc1.copyFrom(this);
            }
            return loc1;
        }

        protected function copyFrom(arg1:org.libspark.betweenas3.core.updaters.AbstractUpdater):void
        {
            return;
        }

        protected var _isResolved:Boolean=false;
    }
}
