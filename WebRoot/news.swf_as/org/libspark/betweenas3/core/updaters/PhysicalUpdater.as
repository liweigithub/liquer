package org.libspark.betweenas3.core.updaters 
{
    import flash.utils.*;
    import org.libspark.betweenas3.core.easing.*;
    
    public class PhysicalUpdater extends Object implements org.libspark.betweenas3.core.updaters.IPhysicalUpdater
    {
        public function PhysicalUpdater()
        {
            this._source = new flash.utils.Dictionary();
            this._destination = new flash.utils.Dictionary();
            this._relativeMap = new flash.utils.Dictionary();
            this._duration = new flash.utils.Dictionary();
            super();
            return;
        }

        public function setObject(arg1:String, arg2:Object):void
        {
            this._target[arg1] = arg2;
            return;
        }

        public function setDestinationValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            this._destination[arg1] = arg2;
            this._relativeMap["dest." + arg1] = arg3;
            return;
        }

        protected function copyFrom(arg1:org.libspark.betweenas3.core.updaters.PhysicalUpdater):void
        {
            var loc1:*=arg1 as org.libspark.betweenas3.core.updaters.PhysicalUpdater;
            this._target = loc1._target;
            this._easing = loc1._easing;
            this.copyObject(this._source, loc1._source);
            this.copyObject(this._destination, loc1._destination);
            this.copyObject(this._relativeMap, loc1._relativeMap);
            return;
        }

        public function update(arg1:Number):void
        {
            var loc1:*=NaN;
            var loc6:*=NaN;
            var loc8:*=null;
            if (!this._isResolved) 
            {
                this.resolveValues();
            }
            var loc2:*=this._target;
            var loc3:*=this._easing;
            var loc4:*=this._destination;
            var loc5:*=this._source;
            var loc7:*=this._duration;
            var loc9:*=0;
            var loc10:*=loc4;
            for (loc8 in loc10) 
            {
                if (arg1 >= loc7[loc8]) 
                {
                    loc2[loc8] = loc4[loc8];
                    continue;
                }
                loc6 = loc5[loc8];
                loc2[loc8] = loc3.calculate(arg1, loc6, loc4[loc8] - loc6);
            }
            return;
        }

        internal function copyObject(arg1:Object, arg2:Object):void
        {
            var loc1:*=null;
            var loc2:*=0;
            var loc3:*=arg2;
            for (loc1 in loc3) 
            {
                arg1[loc1] = arg2[loc1];
            }
            return;
        }

        public function get duration():Number
        {
            if (!this._isResolved) 
            {
                this.resolveValues();
            }
            return this._maxDuration;
        }

        protected function newInstance():org.libspark.betweenas3.core.updaters.PhysicalUpdater
        {
            return new org.libspark.betweenas3.core.updaters.PhysicalUpdater();
        }

        public function set easing(arg1:org.libspark.betweenas3.core.easing.IPhysicalEasing):void
        {
            this._easing = arg1;
            return;
        }

        public function get target():Object
        {
            return this._target;
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

        public function set target(arg1:Object):void
        {
            this._target = arg1;
            return;
        }

        public function setSourceValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            this._source[arg1] = arg2;
            this._relativeMap["source." + arg1] = arg3;
            return;
        }

        protected function resolveValues():void
        {
            var loc1:*=null;
            var loc7:*=NaN;
            var loc2:*=this._target;
            var loc3:*=this._source;
            var loc4:*=this._destination;
            var loc5:*=this._relativeMap;
            var loc6:*=this._duration;
            var loc8:*=0;
            var loc9:*=0;
            var loc10:*=loc3;
            for (loc1 in loc10) 
            {
                if (loc4[loc1] == undefined) 
                {
                    loc4[loc1] = loc2[loc1];
                }
                if (!loc5["source." + loc1]) 
                {
                    continue;
                }
                loc3[loc1] = loc3[loc1] + loc2[loc1];
            }
            loc9 = 0;
            loc10 = loc4;
            for (loc1 in loc10) 
            {
                if (loc3[loc1] == undefined) 
                {
                    loc3[loc1] = loc2[loc1];
                }
                if (loc5["dest." + loc1]) 
                {
                    loc4[loc1] = loc4[loc1] + loc2[loc1];
                }
                loc7 = this._easing.getDuration(loc3[loc1], loc4[loc1] - loc3[loc1]);
                loc6[loc1] = loc7;
                if (!(loc8 < loc7)) 
                {
                    continue;
                }
                loc8 = loc7;
            }
            this._maxDuration = loc8;
            this._isResolved = true;
            return;
        }

        public function get easing():org.libspark.betweenas3.core.easing.IPhysicalEasing
        {
            return this._easing;
        }

        public function getObject(arg1:String):Object
        {
            return this._target[arg1];
        }

        protected var _easing:org.libspark.betweenas3.core.easing.IPhysicalEasing=null;

        protected var _destination:flash.utils.Dictionary;

        protected var _maxDuration:Number=0;

        protected var _isResolved:Boolean=false;

        protected var _target:Object=null;

        protected var _duration:flash.utils.Dictionary;

        protected var _relativeMap:flash.utils.Dictionary;

        protected var _source:flash.utils.Dictionary;
    }
}
