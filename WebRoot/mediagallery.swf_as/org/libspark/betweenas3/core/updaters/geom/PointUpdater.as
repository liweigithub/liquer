package org.libspark.betweenas3.core.updaters.geom 
{
    import flash.geom.*;
    import org.libspark.betweenas3.core.updaters.*;
    import org.libspark.betweenas3.core.utils.*;
    
    public class PointUpdater extends org.libspark.betweenas3.core.updaters.AbstractUpdater
    {
        public function PointUpdater()
        {
            super();
            return;
        }

        public override function setSourceValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            if (arg1 != "x") 
            {
                if (arg1 == "y") 
                {
                    this._fy = true;
                    this._sy = arg2;
                    this._flags = this._flags | (arg3 ? 4 : 0);
                }
            }
            else 
            {
                this._fx = true;
                this._sx = arg2;
                this._flags = this._flags | (arg3 ? 1 : 0);
            }
            return;
        }

        protected override function newInstance():org.libspark.betweenas3.core.updaters.AbstractUpdater
        {
            return new org.libspark.betweenas3.core.updaters.geom.PointUpdater();
        }

        public override function get target():Object
        {
            return this._target;
        }

        public override function setDestinationValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            if (arg1 != "x") 
            {
                if (arg1 == "y") 
                {
                    this._fy = true;
                    this._dy = arg2;
                    this._flags = this._flags | (arg3 ? 8 : 0);
                }
            }
            else 
            {
                this._fx = true;
                this._dx = arg2;
                this._flags = this._flags | (arg3 ? 2 : 0);
            }
            return;
        }

        public override function set target(arg1:Object):void
        {
            this._target = arg1 as flash.geom.Point;
            return;
        }

        protected override function resolveValues():void
        {
            var loc1:*=this._target;
            if (this._fx) 
            {
                if (isNaN(this._sx)) 
                {
                    this._sx = loc1.x;
                }
                else if ((this._flags & 1) != 0) 
                {
                    this._sx = this._sx + loc1.x;
                }
                if (isNaN(this._dx)) 
                {
                    this._dx = loc1.x;
                }
                else if ((this._flags & 2) != 0) 
                {
                    this._dx = this._dx + loc1.x;
                }
            }
            if (this._fy) 
            {
                if (isNaN(this._sy)) 
                {
                    this._sy = loc1.y;
                }
                else if ((this._flags & 4) != 0) 
                {
                    this._sy = this._sy + loc1.y;
                }
                if (isNaN(this._dy)) 
                {
                    this._dy = loc1.y;
                }
                else if ((this._flags & 8) != 0) 
                {
                    this._dy = this._dy + loc1.y;
                }
            }
            return;
        }

        protected override function updateObject(arg1:Number):void
        {
            var loc1:*=this._target;
            var loc2:*=1 - arg1;
            if (this._fx) 
            {
                loc1.x = this._sx * loc2 + this._dx * arg1;
            }
            if (this._fy) 
            {
                loc1.y = this._sy * loc2 + this._dy * arg1;
            }
            return;
        }

        protected override function copyFrom(arg1:org.libspark.betweenas3.core.updaters.AbstractUpdater):void
        {
            super.copyFrom(arg1);
            var loc1:*=arg1 as org.libspark.betweenas3.core.updaters.geom.PointUpdater;
            this._target = loc1._target;
            this._sx = loc1._sx;
            this._sy = loc1._sy;
            this._dx = loc1._dx;
            this._dy = loc1._dy;
            this._fx = loc1._fx;
            this._fy = loc1._fy;
            this._flags = loc1._flags;
            return;
        }

        public static function register(arg1:org.libspark.betweenas3.core.utils.ClassRegistry):void
        {
            arg1.registerClassWithTargetClassAndPropertyNames(org.libspark.betweenas3.core.updaters.geom.PointUpdater, flash.geom.Point, TARGET_PROPERTIES);
            return;
        }

        public static const TARGET_PROPERTIES:Array=["x", "y"];

        protected var _sx:Number;

        protected var _sy:Number;

        protected var _flags:uint=0;

        protected var _target:flash.geom.Point=null;

        protected var _fx:Boolean=false;

        protected var _fy:Boolean=false;

        protected var _dx:Number;

        protected var _dy:Number;
    }
}
