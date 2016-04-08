package org.libspark.betweenas3.core.utils 
{
    import __AS3__.vec.*;
    import flash.utils.*;
    
    public class ClassRegistry extends Object
    {
        public function ClassRegistry()
        {
            this._classes = new flash.utils.Dictionary();
            this._subclasses = new flash.utils.Dictionary();
            super();
            return;
        }

        internal function getClassTree(arg1:Class):__AS3__.vec.Vector.<Class>
        {
            var klass:Class;
            var c:Class;
            var superClassName:String;
            var tree:__AS3__.vec.Vector.<Class>;

            var loc1:*;
            superClassName = null;
            klass = arg1;
            tree = new Vector.<Class>();
            c = klass;
            while (c != null) 
            {
                tree.push(c);
                var loc2:*;
                superClassName = loc2 = flash.utils.getQualifiedSuperclassName(c);
                if (loc2 != null) 
                {
                    try 
                    {
                        c = flash.utils.getDefinitionByName(superClassName) as Class;
                    }
                    catch (e:ReferenceError)
                    {
                        c = Object;
                    }
                    continue;
                }
                c = null;
            }
            return tree;
        }

        public function registerClassWithTargetClassAndPropertyNames(arg1:Class, arg2:Class, arg3:Array):void
        {
            var loc1:*=arg3.length;
            var loc2:*=0;
            while (loc2 < loc1) 
            {
                this.registerClassWithTargetClassAndPropertyName(arg1, arg2, arg3[loc2]);
                ++loc2;
            }
            return;
        }

        public function getClassByTargetClassAndPropertyName(arg1:Class, arg2:String):Class
        {
            var loc2:*=undefined;
            var loc1:*=this._classes[arg1];
            if (loc1 == null) 
            {
                this.buildCacheFor(arg1);
                return this.getClassByTargetClassAndPropertyName(arg1, arg2);
            }
            else 
            {
                var loc3:*;
                loc2 = loc3 = loc1[arg2];
                if (loc3 != null) 
                {
                    return loc2 as Class;
                }
                loc2 = loc3 = loc1["*"];
                if (loc3 != null) 
                {
                    return loc2 as Class;
                }
            }
            return null;
        }

        public function registerClassWithTargetClassAndPropertyName(arg1:Class, arg2:Class, arg3:String):void
        {
            var loc4:*=0;
            var loc5:*=0;
            var loc6:*=null;
            if (this._classes[arg2] == undefined) 
            {
                this.buildCacheFor(arg2);
            }
            var loc1:*;
            var loc2:*=(loc1 = this._classes)[arg2][arg3] as Class;
            loc1[arg2][arg3] = arg1;
            var loc3:*;
            if ((loc3 = this._subclasses[arg2] as Vector.<Class>) != null) 
            {
                loc4 = loc3.length;
                loc5 = 0;
                while (loc5 < loc4) 
                {
                    loc6 = loc3[loc5];
                    if (loc1[loc6][arg3] == loc2) 
                    {
                        loc1[loc6][arg3] = arg1;
                    }
                    ++loc5;
                }
            }
            return;
        }

        internal function buildCacheFor(arg1:Class):void
        {
            var loc7:*=null;
            var loc8:*=null;
            var loc9:*=null;
            var loc10:*=null;
            var loc11:*=null;
            var loc12:*=null;
            var loc13:*=0;
            var loc14:*=null;
            var loc1:*=this._classes;
            var loc2:*=this._subclasses;
            var loc3:*=new flash.utils.Dictionary();
            var loc4:*;
            var loc5:*;
            var loc6:*=loc5 = (loc4 = this.getClassTree(arg1)).length;
            while (--loc6 >= 0) 
            {
                loc7 = loc4[loc6];
                if ((loc8 = loc1[loc7] as flash.utils.Dictionary) == null) 
                {
                    loc11 = new flash.utils.Dictionary();
                    loc15 = 0;
                    loc16 = loc3;
                    for (loc9 in loc16) 
                    {
                        loc11[loc9] = loc3[loc9];
                    }
                    loc1[loc7] = loc11;
                }
                else 
                {
                    loc10 = new flash.utils.Dictionary();
                    if (loc3 != null) 
                    {
                        var loc15:*=0;
                        var loc16:*=loc3;
                        for (loc9 in loc16) 
                        {
                            loc10[loc9] = loc3[loc9];
                            if (loc9 in loc8) 
                            {
                                continue;
                            }
                            loc8[loc9] = loc3[loc9];
                        }
                    }
                    loc15 = 0;
                    loc16 = loc8;
                    for (loc9 in loc16) 
                    {
                        loc10[loc9] = loc8[loc9];
                    }
                    loc3 = loc10;
                }
                if (loc2[loc7] != undefined) 
                {
                    loc12 = loc2[loc7] as Vector.<Class>;
                    --loc13;
                    while (loc13 >= 0) 
                    {
                        loc14 = loc4[loc13];
                        if (loc12.indexOf(loc14) == -1) 
                        {
                            loc12.push(loc14);
                        }
                        --loc13;
                    }
                    continue;
                }
                loc2[loc7] = loc4.slice(0, loc6);
            }
            return;
        }

        internal var _subclasses:flash.utils.Dictionary;

        internal var _classes:flash.utils.Dictionary;
    }
}
