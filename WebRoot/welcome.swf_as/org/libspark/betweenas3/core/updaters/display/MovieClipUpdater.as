package org.libspark.betweenas3.core.updaters.display 
{
    import flash.display.*;
    import org.libspark.betweenas3.core.updaters.*;
    import org.libspark.betweenas3.core.utils.*;
    
    public class MovieClipUpdater extends org.libspark.betweenas3.core.updaters.AbstractUpdater
    {
        public function MovieClipUpdater()
        {
            this._source = new MovieClipParameter();
            this._destination = new MovieClipParameter();
            super();
            return;
        }

        public override function setDestinationValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            if (arg1 == "_frame") 
            {
                this._flags = this._flags | 1;
                this._destination.relativeFlags = this._destination.relativeFlags | (arg3 ? 1 : 0);
                this._destination.frame = arg2;
            }
            return;
        }

        public override function set target(arg1:Object):void
        {
            this._target = arg1 as flash.display.MovieClip;
            return;
        }

        protected override function updateObject(arg1:Number):void
        {
            var loc1:*=this._target;
            var loc2:*=this._destination;
            var loc3:*=this._source;
            var loc4:*=this._flags;
            var loc5:*=1 - arg1;
            if ((loc4 & 1) != 0) 
            {
                loc1.gotoAndStop(Math.round(loc3.frame * loc5 + loc2.frame * arg1));
            }
            return;
        }

        protected override function resolveValues():void
        {
            var loc1:*=this._target;
            var loc2:*=this._destination;
            var loc3:*=this._source;
            var loc4:*;
            if (((loc4 = this._flags) & 1) != 0) 
            {
                if (isNaN(loc3.frame)) 
                {
                    loc3.frame = loc1.currentFrame;
                }
                else if ((loc3.relativeFlags & 1) != 0) 
                {
                    loc3.frame = loc3.frame + loc1.currentFrame;
                }
                if (isNaN(loc2.frame)) 
                {
                    loc2.frame = loc1.currentFrame;
                }
                else if ((loc2.relativeFlags & 1) != 0) 
                {
                    loc2.frame = loc2.frame + loc1.currentFrame;
                }
            }
            return;
        }

        public override function get target():Object
        {
            return this._target;
        }

        protected override function newInstance():org.libspark.betweenas3.core.updaters.AbstractUpdater
        {
            return new org.libspark.betweenas3.core.updaters.display.MovieClipUpdater();
        }

        public override function setSourceValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            if (arg1 == "_frame") 
            {
                this._flags = this._flags | 1;
                this._source.relativeFlags = this._source.relativeFlags | (arg3 ? 1 : 0);
                this._source.frame = arg2;
            }
            return;
        }

        protected override function copyFrom(arg1:org.libspark.betweenas3.core.updaters.AbstractUpdater):void
        {
            super.copyFrom(arg1);
            var loc1:*=arg1 as org.libspark.betweenas3.core.updaters.display.MovieClipUpdater;
            this._target = loc1._target;
            this._source.copyFrom(loc1._source);
            this._destination.copyFrom(loc1._destination);
            this._flags = loc1._flags;
            return;
        }

        public static function register(arg1:org.libspark.betweenas3.core.utils.ClassRegistry):void
        {
            arg1.registerClassWithTargetClassAndPropertyNames(org.libspark.betweenas3.core.updaters.display.MovieClipUpdater, flash.display.MovieClip, TARGET_PROPERTIES);
            return;
        }

        public static const TARGET_PROPERTIES:Array=["_frame"];

        protected var _flags:uint=0;

        protected var _destination:MovieClipParameter;

        protected var _target:flash.display.MovieClip=null;

        protected var _source:MovieClipParameter;
    }
}


class MovieClipParameter extends Object
{
    public function MovieClipParameter()
    {
        super();
        return;
    }

    public function copyFrom(arg1:MovieClipParameter):void
    {
        this.relativeFlags = arg1.relativeFlags;
        this.frame = arg1.frame;
        return;
    }

    public var relativeFlags:uint=0;

    public var frame:Number;
}