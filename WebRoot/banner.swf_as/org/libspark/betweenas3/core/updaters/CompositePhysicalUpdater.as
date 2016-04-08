package org.libspark.betweenas3.core.updaters 
{
    import __AS3__.vec.*;
    import org.libspark.betweenas3.core.easing.*;
    
    public class CompositePhysicalUpdater extends Object implements org.libspark.betweenas3.core.updaters.IPhysicalUpdater
    {
        public function CompositePhysicalUpdater(arg1:Object, arg2:__AS3__.vec.Vector.<org.libspark.betweenas3.core.updaters.IPhysicalUpdater>)
        {
            var loc2:*=0;
            var loc3:*=null;
            super();
            this._target = arg1;
            var loc1:*=arg2.length;
            if (loc1 >= 1) 
            {
                this._a = arg2[0];
                if (this._duration < this._a.duration) 
                {
                    this._duration = this._a.duration;
                }
                if (loc1 >= 2) 
                {
                    this._b = arg2[1];
                    if (this._duration < this._b.duration) 
                    {
                        this._duration = this._b.duration;
                    }
                    if (loc1 >= 3) 
                    {
                        this._c = arg2[2];
                        if (this._duration < this._c.duration) 
                        {
                            this._duration = this._c.duration;
                        }
                        if (loc1 >= 4) 
                        {
                            this._d = arg2[3];
                            if (this._duration < this._d.duration) 
                            {
                                this._duration = this._d.duration;
                            }
                            if (loc1 >= 5) 
                            {
                                this._updaters = new Vector.<org.libspark.betweenas3.core.updaters.IPhysicalUpdater>(loc1 - 4, true);
                                loc2 = 4;
                                while (loc2 < loc1) 
                                {
                                    loc3 = arg2[loc2];
                                    this._updaters[loc2 - 4] = loc3;
                                    if (this._duration < loc3.duration) 
                                    {
                                        this._duration = loc3.duration;
                                    }
                                    ++loc2;
                                }
                            }
                        }
                    }
                }
            }
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

        public function update(arg1:Number):void
        {
            var loc1:*=null;
            var loc2:*=0;
            var loc3:*=0;
            if (this._a != null) 
            {
                this._a.update(arg1);
                if (this._b != null) 
                {
                    this._b.update(arg1);
                    if (this._c != null) 
                    {
                        this._c.update(arg1);
                        if (this._d != null) 
                        {
                            this._d.update(arg1);
                            if (this._updaters != null) 
                            {
                                loc1 = this._updaters;
                                loc2 = loc1.length;
                                loc3 = 0;
                                while (loc3 < loc2) 
                                {
                                    loc1[loc3].update(arg1);
                                    ++loc3;
                                }
                            }
                        }
                    }
                }
            }
            return;
        }

        public function get target():Object
        {
            return this._target;
        }

        public function get duration():Number
        {
            return this._duration;
        }

        public function set easing(arg1:org.libspark.betweenas3.core.easing.IPhysicalEasing):void
        {
            return;
        }

        public function setSourceValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            return;
        }

        public function getUpdaterAt(arg1:uint):org.libspark.betweenas3.core.updaters.IPhysicalUpdater
        {
            if (arg1 == 0) 
            {
                return this._a;
            }
            if (arg1 == 1) 
            {
                return this._b;
            }
            if (arg1 == 2) 
            {
                return this._c;
            }
            if (arg1 == 3) 
            {
                return this._d;
            }
            return this._updaters[arg1 - 4];
        }

        public function set target(arg1:Object):void
        {
            this._target = arg1;
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
            var loc2:*=null;
            var loc3:*=0;
            var loc4:*=0;
            var loc1:*=new Vector.<org.libspark.betweenas3.core.updaters.IPhysicalUpdater>();
            if (this._a != null) 
            {
                loc1.push(this._a.clone());
                if (this._b != null) 
                {
                    loc1.push(this._b.clone());
                    if (this._c != null) 
                    {
                        loc1.push(this._c.clone());
                        if (this._d != null) 
                        {
                            loc1.push(this._d.clone());
                            if (this._updaters != null) 
                            {
                                loc2 = this._updaters;
                                loc3 = loc2.length;
                                loc4 = 0;
                                while (loc4 < loc3) 
                                {
                                    loc1.push(loc2[loc4].clone());
                                    ++loc4;
                                }
                            }
                        }
                    }
                }
            }
            return new org.libspark.betweenas3.core.updaters.CompositePhysicalUpdater(this._target, loc1);
        }

        internal var _a:org.libspark.betweenas3.core.updaters.IPhysicalUpdater;

        internal var _b:org.libspark.betweenas3.core.updaters.IPhysicalUpdater;

        internal var _c:org.libspark.betweenas3.core.updaters.IPhysicalUpdater;

        internal var _d:org.libspark.betweenas3.core.updaters.IPhysicalUpdater;

        internal var _updaters:__AS3__.vec.Vector.<org.libspark.betweenas3.core.updaters.IPhysicalUpdater>;

        internal var _target:Object=null;

        internal var _duration:Number=0;
    }
}
