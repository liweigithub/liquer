package org.libspark.betweenas3.core.updaters 
{
    import flash.utils.*;
    import org.libspark.betweenas3.core.utils.*;
    
    public class ObjectUpdater extends org.libspark.betweenas3.core.updaters.AbstractUpdater
    {
        public function ObjectUpdater()
        {
            this._source = new flash.utils.Dictionary();
            this._destination = new flash.utils.Dictionary();
            this._relativeMap = new flash.utils.Dictionary();
            super();
            return;
        }

        public override function setObject(arg1:String, arg2:Object):void
        {
            this._target[arg1] = arg2;
            return;
        }

        public override function setDestinationValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            this._destination[arg1] = arg2;
            this._relativeMap["dest." + arg1] = arg3;
            return;
        }

        protected override function newInstance():org.libspark.betweenas3.core.updaters.AbstractUpdater
        {
            return new org.libspark.betweenas3.core.updaters.ObjectUpdater();
        }

        public override function get target():Object
        {
            return this._target;
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

        public override function setSourceValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            this._source[arg1] = arg2;
            this._relativeMap["source." + arg1] = arg3;
            return;
        }

        protected override function updateObject(arg1:Number):void
        {
            var loc5:*=null;
            var loc1:*=1 - arg1;
            var loc2:*=this._target;
            var loc3:*=this._destination;
            var loc4:*=this._source;
            var loc6:*=0;
            var loc7:*=loc3;
            for (loc5 in loc7) 
            {
                loc2[loc5] = loc4[loc5] * loc1 + loc3[loc5] * arg1;
            }
            return;
        }

        public override function set target(arg1:Object):void
        {
            this._target = arg1;
            return;
        }

        protected override function resolveValues():void
        {
            var loc1:*=null;
            var loc2:*=this._target;
            var loc3:*=this._source;
            var loc4:*=this._destination;
            var loc5:*=this._relativeMap;
            var loc6:*=0;
            var loc7:*=loc3;
            for (loc1 in loc7) 
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
            loc6 = 0;
            loc7 = loc4;
            for (loc1 in loc7) 
            {
                if (loc3[loc1] == undefined) 
                {
                    loc3[loc1] = loc2[loc1];
                }
                if (!loc5["dest." + loc1]) 
                {
                    continue;
                }
                loc4[loc1] = loc4[loc1] + loc2[loc1];
            }
            return;
        }

        public override function getObject(arg1:String):Object
        {
            return this._target[arg1];
        }

        protected override function copyFrom(arg1:org.libspark.betweenas3.core.updaters.AbstractUpdater):void
        {
            super.copyFrom(arg1);
            var loc1:*=arg1 as org.libspark.betweenas3.core.updaters.ObjectUpdater;
            this._target = loc1._target;
            this.copyObject(this._source, loc1._source);
            this.copyObject(this._destination, loc1._destination);
            this.copyObject(this._relativeMap, loc1._relativeMap);
            return;
        }

        public static function register(arg1:org.libspark.betweenas3.core.utils.ClassRegistry):void
        {
            arg1.registerClassWithTargetClassAndPropertyName(org.libspark.betweenas3.core.updaters.ObjectUpdater, Object, "*");
            return;
        }

        protected var _destination:flash.utils.Dictionary;

        protected var _target:Object=null;

        protected var _relativeMap:flash.utils.Dictionary;

        protected var _source:flash.utils.Dictionary;
    }
}
