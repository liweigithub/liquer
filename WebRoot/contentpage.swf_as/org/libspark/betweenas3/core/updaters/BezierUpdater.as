package org.libspark.betweenas3.core.updaters 
{
    import __AS3__.vec.*;
    import flash.utils.*;
    
    public class BezierUpdater extends org.libspark.betweenas3.core.updaters.AbstractUpdater
    {
        public function BezierUpdater()
        {
            this._source = new flash.utils.Dictionary();
            this._destination = new flash.utils.Dictionary();
            this._controlPoint = new flash.utils.Dictionary();
            this._relativeMap = new flash.utils.Dictionary();
            super();
            return;
        }

        public override function setObject(arg1:String, arg2:Object):void
        {
            this._target[arg1] = arg2;
            return;
        }

        public override function set target(arg1:Object):void
        {
            this._target = arg1;
            return;
        }

        public override function setDestinationValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            this._destination[arg1] = arg2;
            this._relativeMap["dest." + arg1] = arg3;
            return;
        }

        public override function get target():Object
        {
            return this._target;
        }

        public override function setSourceValue(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            this._source[arg1] = arg2;
            this._relativeMap["source." + arg1] = arg3;
            return;
        }

        protected override function newInstance():org.libspark.betweenas3.core.updaters.AbstractUpdater
        {
            return new org.libspark.betweenas3.core.updaters.BezierUpdater();
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

        protected override function updateObject(arg1:Number):void
        {
            var loc5:*=NaN;
            var loc7:*=null;
            var loc8:*=0;
            var loc9:*=0;
            var loc10:*=NaN;
            var loc11:*=NaN;
            var loc12:*=NaN;
            var loc13:*=null;
            var loc1:*=1 - arg1;
            var loc2:*=this._target;
            var loc3:*=this._destination;
            var loc4:*=this._source;
            var loc6:*=this._controlPoint;
            var loc14:*=0;
            var loc15:*=loc3;
            for (loc13 in loc15) 
            {
                loc5 = loc4[loc13];
                if (!(arg1 == 1)) 
                {
                    !(arg1 == 1);
                    var loc16:*;
                    loc7 = loc16 = this._controlPoint[loc13] as Vector.<Number>;
                }
                if (!(arg1 == 1)) 
                {
                    loc8 = loc16 = loc7.length;
                    if (loc16 != 1) 
                    {
                        if (arg1 < 0) 
                        {
                            loc9 = 0;
                        }
                        else if (arg1 > 1) 
                        {
                            --loc9;
                        }
                        else 
                        {
                            loc9 = arg1 * loc8 >> 0;
                        }
                        loc10 = (arg1 - loc9 * 1 / loc8) * loc8;
                        if (loc9 != 0) 
                        {
                            if (loc9 != (loc8 - 1)) 
                            {
                                loc11 = (loc7[(loc9 - 1)] + loc7[loc9]) / 2;
                                loc12 = (loc7[loc9] + loc7[loc9 + 1]) / 2;
                            }
                            else 
                            {
                                loc11 = (loc7[(loc9 - 1)] + loc7[loc9]) / 2;
                                loc12 = loc3[loc13];
                            }
                        }
                        else 
                        {
                            loc11 = loc5;
                            loc12 = (loc7[0] + loc7[1]) / 2;
                        }
                        loc2[loc13] = loc11 + loc10 * (2 * (1 - loc10) * (loc7[loc9] - loc11) + loc10 * (loc12 - loc11));
                    }
                    else 
                    {
                        loc2[loc13] = loc5 + arg1 * (2 * loc1 * (loc7[0] - loc5) + arg1 * (loc3[loc13] - loc5));
                    }
                    continue;
                }
                loc2[loc13] = loc5 * loc1 + loc3[loc13] * arg1;
            }
            return;
        }

        protected override function resolveValues():void
        {
            var loc1:*=null;
            var loc6:*=null;
            var loc7:*=0;
            var loc8:*=0;
            var loc2:*=this._target;
            var loc3:*=this._source;
            var loc4:*=this._destination;
            var loc5:*=this._controlPoint;
            var loc9:*=this._relativeMap;
            var loc10:*=0;
            var loc11:*=loc3;
            for (loc1 in loc11) 
            {
                if (loc4[loc1] == undefined) 
                {
                    loc4[loc1] = loc2[loc1];
                }
                if (!loc9["source." + loc1]) 
                {
                    continue;
                }
                loc3[loc1] = loc3[loc1] + loc2[loc1];
            }
            loc10 = 0;
            loc11 = loc4;
            for (loc1 in loc11) 
            {
                if (loc3[loc1] == undefined) 
                {
                    loc3[loc1] = loc2[loc1];
                }
                if (!loc9["dest." + loc1]) 
                {
                    continue;
                }
                loc4[loc1] = loc4[loc1] + loc2[loc1];
            }
            loc10 = 0;
            loc11 = loc5;
            for (loc1 in loc11) 
            {
                loc7 = (loc6 = loc5[loc1] as Vector.<Number>).length;
                loc8 = 0;
                while (loc8 < loc7) 
                {
                    if (loc9["cp." + loc1 + "." + loc8]) 
                    {
                        loc6[loc8] = loc6[loc8] + loc2[loc1];
                    }
                    ++loc8;
                }
            }
            return;
        }

        public function addControlPoint(arg1:String, arg2:Number, arg3:Boolean=false):void
        {
            var loc1:*;
            if ((loc1 = this._controlPoint[arg1] as Vector.<Number>) == null) 
            {
                var loc2:*;
                loc1 = loc2 = new Vector.<Number>();
                this._controlPoint[arg1] = loc2;
            }
            loc1.push(arg2);
            this._relativeMap["cp." + arg1 + "." + loc1.length] = arg3;
            return;
        }

        public override function getObject(arg1:String):Object
        {
            return this._target[arg1];
        }

        protected override function copyFrom(arg1:org.libspark.betweenas3.core.updaters.AbstractUpdater):void
        {
            super.copyFrom(arg1);
            var loc1:*=arg1 as org.libspark.betweenas3.core.updaters.BezierUpdater;
            this._target = loc1._target;
            this.copyObject(this._source, loc1._source);
            this.copyObject(this._destination, loc1._destination);
            this.copyObject(this._controlPoint, loc1._controlPoint);
            this.copyObject(this._relativeMap, loc1._relativeMap);
            return;
        }

        protected var _destination:flash.utils.Dictionary;

        protected var _controlPoint:flash.utils.Dictionary;

        protected var _target:Object=null;

        protected var _relativeMap:flash.utils.Dictionary;

        protected var _source:flash.utils.Dictionary;
    }
}
