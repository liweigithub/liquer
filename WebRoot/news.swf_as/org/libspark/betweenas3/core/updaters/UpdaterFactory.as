package org.libspark.betweenas3.core.updaters 
{
    import __AS3__.vec.*;
    import flash.utils.*;
    import org.libspark.betweenas3.core.easing.*;
    import org.libspark.betweenas3.core.utils.*;
    
    public class UpdaterFactory extends Object
    {
        public function UpdaterFactory(arg1:org.libspark.betweenas3.core.utils.ClassRegistry)
        {
            this._mapPool = new Vector.<flash.utils.Dictionary>();
            this._listPool = new Vector.<Vector.<org.libspark.betweenas3.core.updaters.IUpdater>>();
            super();
            this._registry = arg1;
            return;
        }

        public function getUpdaterFor(arg1:Object, arg2:String, arg3:flash.utils.Dictionary, arg4:__AS3__.vec.Vector.<org.libspark.betweenas3.core.updaters.IUpdater>):org.libspark.betweenas3.core.updaters.IUpdater
        {
            var loc2:*=null;
            var loc1:*;
            if ((loc1 = this._registry.getClassByTargetClassAndPropertyName(arg1.constructor, arg2)) != null) 
            {
                if ((loc2 = arg3[loc1] as org.libspark.betweenas3.core.updaters.IUpdater) == null) 
                {
                    (loc2 = new loc1()).target = arg1;
                    arg3[loc1] = loc2;
                    if (arg4 != null) 
                    {
                        arg4.push(loc2);
                    }
                }
                return loc2;
            }
            return null;
        }

        public function createPhysical(arg1:Object, arg2:Object, arg3:Object, arg4:org.libspark.betweenas3.core.easing.IPhysicalEasing):org.libspark.betweenas3.core.updaters.IPhysicalUpdater
        {
            var loc4:*=null;
            var loc5:*=null;
            var loc6:*=false;
            var loc7:*=null;
            var loc8:*=null;
            var loc1:*=new flash.utils.Dictionary();
            var loc2:*=new Vector.<org.libspark.betweenas3.core.updaters.IPhysicalUpdater>();
            var loc3:*;
            (loc3 = new org.libspark.betweenas3.core.updaters.PhysicalUpdater()).target = arg1;
            loc3.easing = arg4;
            loc2.push(loc3);
            if (arg3 != null) 
            {
                var loc9:*=0;
                var loc10:*=arg3;
                for (loc4 in loc10) 
                {
                    var loc11:*;
                    loc5 = loc11 = arg3[loc4];
                    if (loc11 is Number) 
                    {
                        loc6 = loc11 = new RegExp("^\\$").test(loc4);
                        if (loc11) 
                        {
                            loc4 = loc4.substr(1);
                        }
                        loc3.setSourceValue(loc4, Number(loc5), loc6);
                        continue;
                    }
                    if (loc1[loc4]) 
                    {
                        continue;
                    }
                    loc7 = this.createPhysical(loc3.getObject(loc4), arg2 == null ? null : arg2[loc4], loc5, arg4);
                    loc2.push(new org.libspark.betweenas3.core.updaters.PhysicalUpdaterLadder(loc3, loc7, loc4));
                    loc1[loc4] = true;
                }
            }
            if (arg2 != null) 
            {
                loc9 = 0;
                loc10 = arg2;
                for (loc4 in loc10) 
                {
                    loc5 = loc11 = arg2[loc4];
                    if (loc11 is Number) 
                    {
                        loc6 = loc11 = new RegExp("^\\$").test(loc4);
                        if (loc11) 
                        {
                            loc4 = loc4.substr(1);
                        }
                        loc3.setDestinationValue(loc4, Number(loc5), loc6);
                        continue;
                    }
                    if (loc1[loc4]) 
                    {
                        continue;
                    }
                    loc7 = this.createPhysical(loc3.getObject(loc4), null, arg3 == null ? null : arg3[loc4], arg4);
                    loc2.push(new org.libspark.betweenas3.core.updaters.PhysicalUpdaterLadder(loc3, loc7, loc4));
                    loc1[loc4] = true;
                }
            }
            if (loc2.length != 1) 
            {
                if (loc2.length > 1) 
                {
                    loc8 = new org.libspark.betweenas3.core.updaters.CompositePhysicalUpdater(arg1, loc2);
                }
            }
            else 
            {
                loc8 = loc2[0];
            }
            return loc8;
        }

        public function createBezier(arg1:Object, arg2:Object, arg3:Object, arg4:Object):org.libspark.betweenas3.core.updaters.IUpdater
        {
            var loc4:*=null;
            var loc5:*=null;
            var loc6:*=false;
            var loc7:*=null;
            var loc8:*=0;
            var loc9:*=0;
            var loc10:*=null;
            var loc11:*=null;
            var loc1:*=new flash.utils.Dictionary();
            var loc2:*=new Vector.<org.libspark.betweenas3.core.updaters.IUpdater>();
            var loc3:*;
            (loc3 = new org.libspark.betweenas3.core.updaters.BezierUpdater()).target = arg1;
            loc2.push(loc3);
            if (arg3 != null) 
            {
                var loc12:*=0;
                var loc13:*=arg3;
                for (loc4 in loc13) 
                {
                    var loc14:*;
                    loc5 = loc14 = arg3[loc4];
                    if (loc14 is Number) 
                    {
                        loc6 = loc14 = new RegExp("^\\$").test(loc4);
                        if (loc14) 
                        {
                            loc4 = loc4.substr(1);
                        }
                        loc3.setSourceValue(loc4, Number(loc5), loc6);
                        continue;
                    }
                    if (loc1[loc4]) 
                    {
                        continue;
                    }
                    loc10 = this.createBezier(loc3.getObject(loc4), arg2 == null ? null : arg2[loc4], loc5, arg4 == null ? null : arg4[loc4]);
                    loc2.push(new org.libspark.betweenas3.core.updaters.UpdaterLadder(loc3, loc10, loc4));
                    loc1[loc4] = true;
                }
            }
            if (arg2 != null) 
            {
                loc12 = 0;
                loc13 = arg2;
                for (loc4 in loc13) 
                {
                    loc5 = loc14 = arg2[loc4];
                    if (loc14 is Number) 
                    {
                        loc6 = loc14 = new RegExp("^\\$").test(loc4);
                        if (loc14) 
                        {
                            loc4 = loc4.substr(1);
                        }
                        loc3.setDestinationValue(loc4, Number(loc5), loc6);
                        continue;
                    }
                    if (loc1[loc4]) 
                    {
                        continue;
                    }
                    loc10 = this.createBezier(loc3.getObject(loc4), null, arg3 == null ? null : arg3[loc4], arg4 == null ? null : arg4[loc4]);
                    loc2.push(new org.libspark.betweenas3.core.updaters.UpdaterLadder(loc3, loc10, loc4));
                    loc1[loc4] = true;
                }
            }
            if (arg4 != null) 
            {
                loc12 = 0;
                loc13 = arg4;
                for (loc4 in loc13) 
                {
                    loc5 = loc14 = arg4[loc4];
                    if (loc14 is Number) 
                    {
                        loc5 = [loc5];
                    }
                    if (loc5 is Array) 
                    {
                        loc6 = loc14 = new RegExp("^\\$").test(loc4);
                        if (loc14) 
                        {
                            loc4 = loc4.substr(1);
                        }
                        loc8 = (loc7 = loc5 as Array).length;
                        loc9 = 0;
                        while (loc9 < loc8) 
                        {
                            loc3.addControlPoint(loc4, loc7[loc9], loc6);
                            ++loc9;
                        }
                        continue;
                    }
                    if (loc1[loc4]) 
                    {
                        continue;
                    }
                    loc10 = this.createBezier(loc3.getObject(loc4), arg2 == null ? null : arg2[loc4], arg3 == null ? null : arg3[loc4], loc5);
                    loc2.push(new org.libspark.betweenas3.core.updaters.UpdaterLadder(loc3, loc10, loc4));
                    loc1[loc4] = true;
                }
            }
            if (loc2.length != 1) 
            {
                if (loc2.length > 1) 
                {
                    loc11 = new org.libspark.betweenas3.core.updaters.CompositeUpdater(arg1, loc2);
                }
            }
            else 
            {
                loc11 = loc2[0];
            }
            return loc11;
        }

        public function create(arg1:Object, arg2:Object, arg3:Object):org.libspark.betweenas3.core.updaters.IUpdater
        {
            var loc1:*=null;
            var loc2:*=null;
            var loc3:*=null;
            var loc4:*=null;
            var loc5:*=false;
            var loc6:*=null;
            var loc7:*=null;
            var loc8:*=null;
            var loc9:*=undefined;
            if (this._poolIndex > 0) 
            {
                var loc10:*;
                var loc11:*=((loc10 = this)._poolIndex - 1);
                loc10._poolIndex = loc11;
                loc1 = this._mapPool[this._poolIndex];
                loc2 = this._listPool[this._poolIndex];
            }
            else 
            {
                loc1 = new flash.utils.Dictionary();
                loc2 = new Vector.<org.libspark.betweenas3.core.updaters.IUpdater>();
            }
            if (arg3 != null) 
            {
                loc10 = 0;
                loc11 = arg3;
                for (loc3 in loc11) 
                {
                    var loc12:*;
                    loc4 = loc12 = arg3[loc3];
                    if (loc12 is Number) 
                    {
                        loc5 = loc12 = new RegExp("^\\$").test(loc3);
                        if (loc12) 
                        {
                            loc3 = loc3.substr(1);
                        }
                        this.getUpdaterFor(arg1, loc3, loc1, loc2).setSourceValue(loc3, Number(loc4), loc5);
                        continue;
                    }
                    loc6 = this.getUpdaterFor(arg1, loc3, loc1, loc2);
                    loc7 = this.create(loc6.getObject(loc3), arg2 == null ? null : arg2[loc3], loc4);
                    loc2.push(new org.libspark.betweenas3.core.updaters.UpdaterLadder(loc6, loc7, loc3));
                }
            }
            if (arg2 != null) 
            {
                loc10 = 0;
                loc11 = arg2;
                for (loc3 in loc11) 
                {
                    loc4 = loc12 = arg2[loc3];
                    if (loc12 is Number) 
                    {
                        loc5 = loc12 = new RegExp("^\\$").test(loc3);
                        if (loc12) 
                        {
                            loc3 = loc3.substr(1);
                        }
                        this.getUpdaterFor(arg1, loc3, loc1, loc2).setDestinationValue(loc3, Number(loc4), loc5);
                        continue;
                    }
                    if (!(arg3 == null) && loc3 in arg3) 
                    {
                        continue;
                    }
                    loc6 = this.getUpdaterFor(arg1, loc3, loc1, loc2);
                    loc7 = this.create(loc6.getObject(loc3), loc4, arg3 == null ? null : arg3[loc3]);
                    loc2.push(new org.libspark.betweenas3.core.updaters.UpdaterLadder(loc6, loc7, loc3));
                }
            }
            if (loc2.length != 1) 
            {
                if (loc2.length > 1) 
                {
                    loc8 = new org.libspark.betweenas3.core.updaters.CompositeUpdater(arg1, loc2);
                }
            }
            else 
            {
                loc8 = loc2[0];
            }
            loc10 = 0;
            loc11 = loc1;
            for (loc9 in loc11) 
            {
                delete loc1[loc9];
            }
            loc2.length = 0;
            this._mapPool[this._poolIndex] = loc1;
            this._listPool[this._poolIndex] = loc2;
            loc11 = ((loc10 = this)._poolIndex + 1);
            loc10._poolIndex = loc11;
            return loc8;
        }

        internal var _mapPool:__AS3__.vec.Vector.<flash.utils.Dictionary>;

        internal var _registry:org.libspark.betweenas3.core.utils.ClassRegistry;

        internal var _poolIndex:uint=0;

        internal var _listPool:__AS3__.vec.Vector.<__AS3__.vec.Vector.<org.libspark.betweenas3.core.updaters.IUpdater>>;
    }
}
