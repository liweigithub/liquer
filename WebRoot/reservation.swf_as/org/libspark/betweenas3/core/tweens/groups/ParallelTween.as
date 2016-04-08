package org.libspark.betweenas3.core.tweens.groups 
{
    import __AS3__.vec.*;
    import org.libspark.betweenas3.core.ticker.*;
    import org.libspark.betweenas3.core.tweens.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class ParallelTween extends org.libspark.betweenas3.core.tweens.AbstractTween implements org.libspark.betweenas3.core.tweens.IITweenGroup
    {
        public function ParallelTween(arg1:Array, arg2:org.libspark.betweenas3.core.ticker.ITicker, arg3:Number)
        {
            var loc1:*=0;
            var loc2:*=0;
            var loc3:*=null;
            super(arg2, arg3);
            loc1 = arg1.length;
            _duration = 0;
            if (loc1 > 0) 
            {
                this._a = arg1[0] as org.libspark.betweenas3.core.tweens.IITween;
                _duration = this._a.duration > _duration ? this._a.duration : _duration;
                if (loc1 > 1) 
                {
                    this._b = arg1[1] as org.libspark.betweenas3.core.tweens.IITween;
                    _duration = this._b.duration > _duration ? this._b.duration : _duration;
                    if (loc1 > 2) 
                    {
                        this._c = arg1[2] as org.libspark.betweenas3.core.tweens.IITween;
                        _duration = this._c.duration > _duration ? this._c.duration : _duration;
                        if (loc1 > 3) 
                        {
                            this._d = arg1[3] as org.libspark.betweenas3.core.tweens.IITween;
                            _duration = this._d.duration > _duration ? this._d.duration : _duration;
                            if (loc1 > 4) 
                            {
                                this._targets = new Vector.<org.libspark.betweenas3.core.tweens.IITween>(loc1 - 4, true);
                                loc2 = 4;
                                while (loc2 < loc1) 
                                {
                                    loc3 = arg1[loc2] as org.libspark.betweenas3.core.tweens.IITween;
                                    this._targets[loc2 - 4] = loc3;
                                    _duration = loc3.duration > _duration ? loc3.duration : _duration;
                                    ++loc2;
                                }
                            }
                        }
                    }
                }
            }
            return;
        }

        public function getTweenAt(arg1:int):org.libspark.betweenas3.tweens.ITween
        {
            if (arg1 < 0) 
            {
                return null;
            }
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
            if (this._targets != null) 
            {
                if (arg1 - 4 < this._targets.length) 
                {
                    return this._targets[arg1 - 4];
                }
            }
            return null;
        }

        protected override function internalUpdate(arg1:Number):void
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
                            if (this._targets != null) 
                            {
                                loc1 = this._targets;
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

        protected override function newInstance():org.libspark.betweenas3.core.tweens.AbstractTween
        {
            var loc2:*=null;
            var loc3:*=0;
            var loc4:*=0;
            var loc1:*=[];
            if (this._a != null) 
            {
                loc1.push(this._a.clone());
            }
            if (this._b != null) 
            {
                loc1.push(this._b.clone());
            }
            if (this._c != null) 
            {
                loc1.push(this._c.clone());
            }
            if (this._d != null) 
            {
                loc1.push(this._d.clone());
            }
            if (this._targets != null) 
            {
                loc2 = this._targets;
                loc3 = loc2.length;
                loc4 = 0;
                while (loc4 < loc3) 
                {
                    loc1.push(loc2[loc4].clone());
                    ++loc4;
                }
            }
            return new org.libspark.betweenas3.core.tweens.groups.ParallelTween(loc1, _ticker, 0);
        }

        public function getTweenIndex(arg1:org.libspark.betweenas3.tweens.ITween):int
        {
            var loc1:*=0;
            if (arg1 == null) 
            {
                return -1;
            }
            if (this._a == arg1) 
            {
                return 0;
            }
            if (this._b == arg1) 
            {
                return 1;
            }
            if (this._c == arg1) 
            {
                return 2;
            }
            if (this._d == arg1) 
            {
                return 3;
            }
            if (this._targets != null) 
            {
                loc1 = this._targets.indexOf(arg1 as org.libspark.betweenas3.core.tweens.IITween);
                if (loc1 != -1) 
                {
                    return loc1 + 4;
                }
            }
            return -1;
        }

        public function contains(arg1:org.libspark.betweenas3.tweens.ITween):Boolean
        {
            if (arg1 == null) 
            {
                return false;
            }
            if (this._a == arg1) 
            {
                return true;
            }
            if (this._b == arg1) 
            {
                return true;
            }
            if (this._c == arg1) 
            {
                return true;
            }
            if (this._d == arg1) 
            {
                return true;
            }
            if (this._targets != null) 
            {
                return !(this._targets.indexOf(arg1 as org.libspark.betweenas3.core.tweens.IITween) == -1);
            }
            return false;
        }

        internal var _a:org.libspark.betweenas3.core.tweens.IITween;

        internal var _targets:__AS3__.vec.Vector.<org.libspark.betweenas3.core.tweens.IITween>;

        internal var _c:org.libspark.betweenas3.core.tweens.IITween;

        internal var _d:org.libspark.betweenas3.core.tweens.IITween;

        internal var _b:org.libspark.betweenas3.core.tweens.IITween;
    }
}
