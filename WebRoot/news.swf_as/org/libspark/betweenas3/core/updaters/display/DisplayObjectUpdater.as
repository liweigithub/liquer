package org.libspark.betweenas3.core.updaters.display 
{
    import flash.display.*;
    import flash.filters.*;
    import org.libspark.betweenas3.core.updaters.*;
    import org.libspark.betweenas3.core.utils.*;
    
    public class DisplayObjectUpdater extends org.libspark.betweenas3.core.updaters.AbstractUpdater
    {
        public function DisplayObjectUpdater()
        {
            this._source = new DisplayObjectParameter();
            this._destination = new DisplayObjectParameter();
            super();
            return;
        }

        public override function setObject(arg1:String, arg2:Object):void
        {
            if (arg1 == "_blurFilter") 
            {
                this.setFilterByClass(arg2 as flash.filters.BitmapFilter, flash.filters.BlurFilter);
                return;
            }
            if (arg1 == "_glowFilter") 
            {
                this.setFilterByClass(arg2 as flash.filters.BitmapFilter, flash.filters.GlowFilter);
                return;
            }
            if (arg1 == "_dropShadowFilter") 
            {
                this.setFilterByClass(arg2 as flash.filters.BitmapFilter, flash.filters.DropShadowFilter);
                return;
            }
            if (arg1 == "_colorMatrixFilter") 
            {
                this.setFilterByClass(arg2 as flash.filters.BitmapFilter, flash.filters.ColorMatrixFilter);
                return;
            }
            if (arg1 == "_bevelFilter") 
            {
                this.setFilterByClass(arg2 as flash.filters.BitmapFilter, flash.filters.BevelFilter);
                return;
            }
            if (arg1 == "_gradientGlowFilter") 
            {
                this.setFilterByClass(arg2 as flash.filters.BitmapFilter, flash.filters.GradientGlowFilter);
                return;
            }
            if (arg1 == "_gradientBevelFilter") 
            {
                this.setFilterByClass(arg2 as flash.filters.BitmapFilter, flash.filters.GradientBevelFilter);
                return;
            }
            if (arg1 == "_convolutionFilter") 
            {
                this.setFilterByClass(arg2 as flash.filters.BitmapFilter, flash.filters.ConvolutionFilter);
                return;
            }
            if (arg1 == "_displacementMapFilter") 
            {
                this.setFilterByClass(arg2 as flash.filters.BitmapFilter, flash.filters.DisplacementMapFilter);
                return;
            }
            if (arg1 == "_shaderFilter") 
            {
                this.setFilterByClass(arg2 as flash.filters.BitmapFilter, flash.filters.ShaderFilter);
                return;
            }
            return;
        }

        public override function setDestinationValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            if (arg1 != "x") 
            {
                if (arg1 != "y") 
                {
                    if (arg1 != "z") 
                    {
                        if (arg1 != "scaleX") 
                        {
                            if (arg1 != "scaleY") 
                            {
                                if (arg1 != "scaleZ") 
                                {
                                    if (arg1 != "rotation") 
                                    {
                                        if (arg1 != "rotationX") 
                                        {
                                            if (arg1 != "rotationY") 
                                            {
                                                if (arg1 != "rotationZ") 
                                                {
                                                    if (arg1 != "alpha") 
                                                    {
                                                        if (arg1 != "width") 
                                                        {
                                                            if (arg1 == "height") 
                                                            {
                                                                this._flags = this._flags | 4096;
                                                                this._destination.relativeFlags = this._destination.relativeFlags | (arg3 ? 4096 : 0);
                                                                this._destination.height = arg2;
                                                            }
                                                        }
                                                        else 
                                                        {
                                                            this._flags = this._flags | 2048;
                                                            this._destination.relativeFlags = this._destination.relativeFlags | (arg3 ? 2048 : 0);
                                                            this._destination.width = arg2;
                                                        }
                                                    }
                                                    else 
                                                    {
                                                        this._flags = this._flags | 1024;
                                                        this._destination.relativeFlags = this._destination.relativeFlags | (arg3 ? 1024 : 0);
                                                        this._destination.alpha = arg2;
                                                    }
                                                }
                                                else 
                                                {
                                                    this._flags = this._flags | 512;
                                                    this._destination.relativeFlags = this._destination.relativeFlags | (arg3 ? 512 : 0);
                                                    this._destination.rotationZ = arg2;
                                                }
                                            }
                                            else 
                                            {
                                                this._flags = this._flags | 256;
                                                this._destination.relativeFlags = this._destination.relativeFlags | (arg3 ? 256 : 0);
                                                this._destination.rotationY = arg2;
                                            }
                                        }
                                        else 
                                        {
                                            this._flags = this._flags | 128;
                                            this._destination.relativeFlags = this._destination.relativeFlags | (arg3 ? 128 : 0);
                                            this._destination.rotationX = arg2;
                                        }
                                    }
                                    else 
                                    {
                                        this._flags = this._flags | 64;
                                        this._destination.relativeFlags = this._destination.relativeFlags | (arg3 ? 64 : 0);
                                        this._destination.rotation = arg2;
                                    }
                                }
                                else 
                                {
                                    this._flags = this._flags | 32;
                                    this._destination.relativeFlags = this._destination.relativeFlags | (arg3 ? 32 : 0);
                                    this._destination.scaleZ = arg2;
                                }
                            }
                            else 
                            {
                                this._flags = this._flags | 16;
                                this._destination.relativeFlags = this._destination.relativeFlags | (arg3 ? 16 : 0);
                                this._destination.scaleY = arg2;
                            }
                        }
                        else 
                        {
                            this._flags = this._flags | 8;
                            this._destination.relativeFlags = this._destination.relativeFlags | (arg3 ? 8 : 0);
                            this._destination.scaleX = arg2;
                        }
                    }
                    else 
                    {
                        this._flags = this._flags | 4;
                        this._destination.relativeFlags = this._destination.relativeFlags | (arg3 ? 4 : 0);
                        this._destination.z = arg2;
                    }
                }
                else 
                {
                    this._flags = this._flags | 2;
                    this._destination.relativeFlags = this._destination.relativeFlags | (arg3 ? 2 : 0);
                    this._destination.y = arg2;
                }
            }
            else 
            {
                this._flags = this._flags | 1;
                this._destination.relativeFlags = this._destination.relativeFlags | (arg3 ? 1 : 0);
                this._destination.x = arg2;
            }
            return;
        }

        protected function setFilterByClass(arg1:flash.filters.BitmapFilter, arg2:Class):void
        {
            var loc1:*=this._target.filters;
            var loc2:*=loc1.length;
            var loc3:*=0;
            while (loc3 < loc2) 
            {
                if (loc1[loc3] is arg2) 
                {
                    loc1[loc3] = arg1;
                    this._target.filters = loc1;
                    return;
                }
                ++loc3;
            }
            loc1.push(arg1);
            this._target.filters = loc1;
            return;
        }

        public override function get target():Object
        {
            return this._target;
        }

        protected function getFilterByClass(arg1:Class):flash.filters.BitmapFilter
        {
            var loc1:*=null;
            var loc2:*=this._target.filters;
            var loc3:*=loc2.length;
            var loc4:*=0;
            while (loc4 < loc3) 
            {
                var loc5:*;
                loc1 = loc5 = loc2[loc4] as flash.filters.BitmapFilter;
                if (loc5 is arg1) 
                {
                    return loc1;
                }
                ++loc4;
            }
            loc1 = new arg1();
            loc2.push(loc1);
            this._target.filters = loc2;
            return loc1;
        }

        protected override function newInstance():org.libspark.betweenas3.core.updaters.AbstractUpdater
        {
            return new org.libspark.betweenas3.core.updaters.display.DisplayObjectUpdater();
        }

        public override function setSourceValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            if (arg1 != "x") 
            {
                if (arg1 != "y") 
                {
                    if (arg1 != "z") 
                    {
                        if (arg1 != "scaleX") 
                        {
                            if (arg1 != "scaleY") 
                            {
                                if (arg1 != "scaleZ") 
                                {
                                    if (arg1 != "rotation") 
                                    {
                                        if (arg1 != "rotationX") 
                                        {
                                            if (arg1 != "rotationY") 
                                            {
                                                if (arg1 != "rotationZ") 
                                                {
                                                    if (arg1 != "alpha") 
                                                    {
                                                        if (arg1 != "width") 
                                                        {
                                                            if (arg1 == "height") 
                                                            {
                                                                this._flags = this._flags | 4096;
                                                                this._source.relativeFlags = this._source.relativeFlags | (arg3 ? 4096 : 0);
                                                                this._source.height = arg2;
                                                            }
                                                        }
                                                        else 
                                                        {
                                                            this._flags = this._flags | 2048;
                                                            this._source.relativeFlags = this._source.relativeFlags | (arg3 ? 2048 : 0);
                                                            this._source.width = arg2;
                                                        }
                                                    }
                                                    else 
                                                    {
                                                        this._flags = this._flags | 1024;
                                                        this._source.relativeFlags = this._source.relativeFlags | (arg3 ? 1024 : 0);
                                                        this._source.alpha = arg2;
                                                    }
                                                }
                                                else 
                                                {
                                                    this._flags = this._flags | 512;
                                                    this._source.relativeFlags = this._source.relativeFlags | (arg3 ? 512 : 0);
                                                    this._source.rotationZ = arg2;
                                                }
                                            }
                                            else 
                                            {
                                                this._flags = this._flags | 256;
                                                this._source.relativeFlags = this._source.relativeFlags | (arg3 ? 256 : 0);
                                                this._source.rotationY = arg2;
                                            }
                                        }
                                        else 
                                        {
                                            this._flags = this._flags | 128;
                                            this._source.relativeFlags = this._source.relativeFlags | (arg3 ? 128 : 0);
                                            this._source.rotationX = arg2;
                                        }
                                    }
                                    else 
                                    {
                                        this._flags = this._flags | 64;
                                        this._source.relativeFlags = this._source.relativeFlags | (arg3 ? 64 : 0);
                                        this._source.rotation = arg2;
                                    }
                                }
                                else 
                                {
                                    this._flags = this._flags | 32;
                                    this._source.relativeFlags = this._source.relativeFlags | (arg3 ? 32 : 0);
                                    this._source.scaleZ = arg2;
                                }
                            }
                            else 
                            {
                                this._flags = this._flags | 16;
                                this._source.relativeFlags = this._source.relativeFlags | (arg3 ? 16 : 0);
                                this._source.scaleY = arg2;
                            }
                        }
                        else 
                        {
                            this._flags = this._flags | 8;
                            this._source.relativeFlags = this._source.relativeFlags | (arg3 ? 8 : 0);
                            this._source.scaleX = arg2;
                        }
                    }
                    else 
                    {
                        this._flags = this._flags | 4;
                        this._source.relativeFlags = this._source.relativeFlags | (arg3 ? 4 : 0);
                        this._source.z = arg2;
                    }
                }
                else 
                {
                    this._flags = this._flags | 2;
                    this._source.relativeFlags = this._source.relativeFlags | (arg3 ? 2 : 0);
                    this._source.y = arg2;
                }
            }
            else 
            {
                this._flags = this._flags | 1;
                this._source.relativeFlags = this._source.relativeFlags | (arg3 ? 1 : 0);
                this._source.x = arg2;
            }
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
                loc1.x = loc3.x * loc5 + loc2.x * arg1;
            }
            if ((loc4 & 2) != 0) 
            {
                loc1.y = loc3.y * loc5 + loc2.y * arg1;
            }
            if ((loc4 & 4) != 0) 
            {
                loc1.z = loc3.z * loc5 + loc2.z * arg1;
            }
            if ((loc4 & 56) != 0) 
            {
                if ((loc4 & 8) != 0) 
                {
                    loc1.scaleX = loc3.scaleX * loc5 + loc2.scaleX * arg1;
                }
                if ((loc4 & 16) != 0) 
                {
                    loc1.scaleY = loc3.scaleY * loc5 + loc2.scaleY * arg1;
                }
                if ((loc4 & 32) != 0) 
                {
                    loc1.scaleZ = loc3.scaleZ * loc5 + loc2.scaleZ * arg1;
                }
            }
            if ((loc4 & 960) != 0) 
            {
                if ((loc4 & 64) != 0) 
                {
                    loc1.rotation = loc3.rotation * loc5 + loc2.rotation * arg1;
                }
                if ((loc4 & 128) != 0) 
                {
                    loc1.rotationX = loc3.rotationX * loc5 + loc2.rotationX * arg1;
                }
                if ((loc4 & 256) != 0) 
                {
                    loc1.rotationY = loc3.rotationY * loc5 + loc2.rotationY * arg1;
                }
                if ((loc4 & 512) != 0) 
                {
                    loc1.rotationZ = loc3.rotationZ * loc5 + loc2.rotationZ * arg1;
                }
            }
            if ((loc4 & 7168) != 0) 
            {
                if ((loc4 & 1024) != 0) 
                {
                    loc1.alpha = loc3.alpha * loc5 + loc2.alpha * arg1;
                }
                if ((loc4 & 2048) != 0) 
                {
                    loc1.width = loc3.width * loc5 + loc2.width * arg1;
                }
                if ((loc4 & 4096) != 0) 
                {
                    loc1.height = loc3.height * loc5 + loc2.height * arg1;
                }
            }
            return;
        }

        public override function set target(arg1:Object):void
        {
            this._target = arg1 as flash.display.DisplayObject;
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
                if (isNaN(loc3.x)) 
                {
                    loc3.x = loc1.x;
                }
                else if ((loc3.relativeFlags & 1) != 0) 
                {
                    loc3.x = loc3.x + loc1.x;
                }
                if (isNaN(loc2.x)) 
                {
                    loc2.x = loc1.x;
                }
                else if ((loc2.relativeFlags & 1) != 0) 
                {
                    loc2.x = loc2.x + loc1.x;
                }
            }
            if ((loc4 & 2) != 0) 
            {
                if (isNaN(loc3.y)) 
                {
                    loc3.y = loc1.y;
                }
                else if ((loc3.relativeFlags & 2) != 0) 
                {
                    loc3.y = loc3.y + loc1.y;
                }
                if (isNaN(loc2.y)) 
                {
                    loc2.y = loc1.y;
                }
                else if ((loc2.relativeFlags & 2) != 0) 
                {
                    loc2.y = loc2.y + loc1.y;
                }
            }
            if ((loc4 & 4) != 0) 
            {
                if (isNaN(loc3.z)) 
                {
                    loc3.z = loc1.z;
                }
                else if ((loc3.relativeFlags & 4) != 0) 
                {
                    loc3.z = loc3.z + loc1.z;
                }
                if (isNaN(loc2.z)) 
                {
                    loc2.z = loc1.z;
                }
                else if ((loc2.relativeFlags & 4) != 0) 
                {
                    loc2.z = loc2.z + loc1.z;
                }
            }
            if ((loc4 & 8) != 0) 
            {
                if (isNaN(loc3.scaleX)) 
                {
                    loc3.scaleX = loc1.scaleX;
                }
                else if ((loc3.relativeFlags & 8) != 0) 
                {
                    loc3.scaleX = loc3.scaleX + loc1.scaleX;
                }
                if (isNaN(loc2.scaleX)) 
                {
                    loc2.scaleX = loc1.scaleX;
                }
                else if ((loc2.relativeFlags & 8) != 0) 
                {
                    loc2.scaleX = loc2.scaleX + loc1.scaleX;
                }
            }
            if ((loc4 & 16) != 0) 
            {
                if (isNaN(loc3.scaleY)) 
                {
                    loc3.scaleY = loc1.scaleY;
                }
                else if ((loc3.relativeFlags & 16) != 0) 
                {
                    loc3.scaleY = loc3.scaleY + loc1.scaleY;
                }
                if (isNaN(loc2.scaleY)) 
                {
                    loc2.scaleY = loc1.scaleY;
                }
                else if ((loc2.relativeFlags & 16) != 0) 
                {
                    loc2.scaleY = loc2.scaleY + loc1.scaleY;
                }
            }
            if ((loc4 & 32) != 0) 
            {
                if (isNaN(loc3.scaleZ)) 
                {
                    loc3.scaleZ = loc1.scaleZ;
                }
                else if ((loc3.relativeFlags & 32) != 0) 
                {
                    loc3.scaleZ = loc3.scaleZ + loc1.scaleZ;
                }
                if (isNaN(loc2.scaleZ)) 
                {
                    loc2.scaleZ = loc1.scaleZ;
                }
                else if ((loc2.relativeFlags & 32) != 0) 
                {
                    loc2.scaleZ = loc2.scaleZ + loc1.scaleZ;
                }
            }
            if ((loc4 & 64) != 0) 
            {
                if (isNaN(loc3.rotation)) 
                {
                    loc3.rotation = loc1.rotation;
                }
                else if ((loc3.relativeFlags & 64) != 0) 
                {
                    loc3.rotation = loc3.rotation + loc1.rotation;
                }
                if (isNaN(loc2.rotation)) 
                {
                    loc2.rotation = loc1.rotation;
                }
                else if ((loc2.relativeFlags & 64) != 0) 
                {
                    loc2.rotation = loc2.rotation + loc1.rotation;
                }
            }
            if ((loc4 & 128) != 0) 
            {
                if (isNaN(loc3.rotationX)) 
                {
                    loc3.rotationX = loc1.rotationX;
                }
                else if ((loc3.relativeFlags & 128) != 0) 
                {
                    loc3.rotationX = loc3.rotationX + loc1.rotationX;
                }
                if (isNaN(loc2.rotationX)) 
                {
                    loc2.rotationX = loc1.rotationX;
                }
                else if ((loc2.relativeFlags & 128) != 0) 
                {
                    loc2.rotationX = loc2.rotationX + loc1.rotationX;
                }
            }
            if ((loc4 & 256) != 0) 
            {
                if (isNaN(loc3.rotationY)) 
                {
                    loc3.rotationY = loc1.rotationY;
                }
                else if ((loc3.relativeFlags & 256) != 0) 
                {
                    loc3.rotationY = loc3.rotationY + loc1.rotationY;
                }
                if (isNaN(loc2.rotationY)) 
                {
                    loc2.rotationY = loc1.rotationY;
                }
                else if ((loc2.relativeFlags & 256) != 0) 
                {
                    loc2.rotationY = loc2.rotationY + loc1.rotationY;
                }
            }
            if ((loc4 & 512) != 0) 
            {
                if (isNaN(loc3.rotationZ)) 
                {
                    loc3.rotationZ = loc1.rotationZ;
                }
                else if ((loc3.relativeFlags & 512) != 0) 
                {
                    loc3.rotationZ = loc3.rotationZ + loc1.rotationZ;
                }
                if (isNaN(loc2.rotationZ)) 
                {
                    loc2.rotationZ = loc1.rotationZ;
                }
                else if ((loc2.relativeFlags & 512) != 0) 
                {
                    loc2.rotationZ = loc2.rotationZ + loc1.rotationZ;
                }
            }
            if ((loc4 & 1024) != 0) 
            {
                if (isNaN(loc3.alpha)) 
                {
                    loc3.alpha = loc1.alpha;
                }
                else if ((loc3.relativeFlags & 1024) != 0) 
                {
                    loc3.alpha = loc3.alpha + loc1.alpha;
                }
                if (isNaN(loc2.alpha)) 
                {
                    loc2.alpha = loc1.alpha;
                }
                else if ((loc2.relativeFlags & 1024) != 0) 
                {
                    loc2.alpha = loc2.alpha + loc1.alpha;
                }
            }
            if ((loc4 & 2048) != 0) 
            {
                if (isNaN(loc3.width)) 
                {
                    loc3.width = loc1.width;
                }
                else if ((loc3.relativeFlags & 2048) != 0) 
                {
                    loc3.width = loc3.width + loc1.width;
                }
                if (isNaN(loc2.width)) 
                {
                    loc2.width = loc1.width;
                }
                else if ((loc2.relativeFlags & 2048) != 0) 
                {
                    loc2.width = loc2.width + loc1.width;
                }
            }
            if ((loc4 & 4096) != 0) 
            {
                if (isNaN(loc3.height)) 
                {
                    loc3.height = loc1.height;
                }
                else if ((loc3.relativeFlags & 4096) != 0) 
                {
                    loc3.height = loc3.height + loc1.height;
                }
                if (isNaN(loc2.height)) 
                {
                    loc2.height = loc1.height;
                }
                else if ((loc2.relativeFlags & 4096) != 0) 
                {
                    loc2.height = loc2.height + loc1.height;
                }
            }
            return;
        }

        public override function getObject(arg1:String):Object
        {
            if (arg1 == "_blurFilter") 
            {
                return this.getFilterByClass(flash.filters.BlurFilter);
            }
            if (arg1 == "_glowFilter") 
            {
                return this.getFilterByClass(flash.filters.GlowFilter);
            }
            if (arg1 == "_dropShadowFilter") 
            {
                return this.getFilterByClass(flash.filters.DropShadowFilter);
            }
            if (arg1 == "_colorMatrixFilter") 
            {
                return this.getFilterByClass(flash.filters.ColorMatrixFilter);
            }
            if (arg1 == "_bevelFilter") 
            {
                return this.getFilterByClass(flash.filters.BevelFilter);
            }
            if (arg1 == "_gradientGlowFilter") 
            {
                return this.getFilterByClass(flash.filters.GradientGlowFilter);
            }
            if (arg1 == "_gradientBevelFilter") 
            {
                return this.getFilterByClass(flash.filters.GradientBevelFilter);
            }
            if (arg1 == "_convolutionFilter") 
            {
                return this.getFilterByClass(flash.filters.ConvolutionFilter);
            }
            if (arg1 == "_displacementMapFilter") 
            {
                return this.getFilterByClass(flash.filters.DisplacementMapFilter);
            }
            if (arg1 == "_shaderFilter") 
            {
                return this.getFilterByClass(flash.filters.ShaderFilter);
            }
            return null;
        }

        protected override function copyFrom(arg1:org.libspark.betweenas3.core.updaters.AbstractUpdater):void
        {
            super.copyFrom(arg1);
            var loc1:*=arg1 as org.libspark.betweenas3.core.updaters.display.DisplayObjectUpdater;
            this._target = loc1._target;
            this._source.copyFrom(loc1._source);
            this._destination.copyFrom(loc1._destination);
            this._flags = loc1._flags;
            return;
        }

        public static function register(arg1:org.libspark.betweenas3.core.utils.ClassRegistry):void
        {
            arg1.registerClassWithTargetClassAndPropertyNames(org.libspark.betweenas3.core.updaters.display.DisplayObjectUpdater, flash.display.DisplayObject, TARGET_PROPERTIES);
            return;
        }

        public static const TARGET_PROPERTIES:Array=["x", "y", "z", "scaleX", "scaleY", "scaleZ", "rotation", "rotationX", "rotationY", "rotationZ", "alpha", "width", "height", "_bevelFilter", "_blurFilter", "_colorMatrixFilter", "_convolutionFilter", "_displacementMapFilter", "_dropShadowFilter", "_glowFilter", "_gradientBevelFilter", "_gradientGlowFilter", "_shaderFilter"];

        protected var _flags:uint=0;

        protected var _destination:DisplayObjectParameter;

        protected var _target:flash.display.DisplayObject=null;

        protected var _source:DisplayObjectParameter;
    }
}


class DisplayObjectParameter extends Object
{
    public function DisplayObjectParameter()
    {
        super();
        return;
    }

    public function copyFrom(arg1:DisplayObjectParameter):void
    {
        this.relativeFlags = arg1.relativeFlags;
        this.x = arg1.x;
        this.y = arg1.y;
        this.z = arg1.z;
        this.scaleX = arg1.scaleX;
        this.scaleY = arg1.scaleY;
        this.scaleZ = arg1.scaleZ;
        this.rotation = arg1.rotation;
        this.rotationX = arg1.rotationX;
        this.rotationY = arg1.rotationY;
        this.rotationZ = arg1.rotationZ;
        this.alpha = arg1.alpha;
        this.width = arg1.width;
        this.height = arg1.height;
        return;
    }

    public var width:Number;

    public var scaleX:Number;

    public var scaleY:Number;

    public var scaleZ:Number;

    public var rotationX:Number;

    public var rotationY:Number;

    public var rotationZ:Number;

    public var alpha:Number;

    public var relativeFlags:uint=0;

    public var height:Number;

    public var x:Number;

    public var y:Number;

    public var z:Number;

    public var rotation:Number;
}