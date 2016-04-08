package org.libspark.betweenas3 
{
    import flash.display.*;
    import org.libspark.betweenas3.core.easing.*;
    import org.libspark.betweenas3.core.ticker.*;
    import org.libspark.betweenas3.core.tweens.*;
    import org.libspark.betweenas3.core.tweens.actions.*;
    import org.libspark.betweenas3.core.tweens.decorators.*;
    import org.libspark.betweenas3.core.tweens.groups.*;
    import org.libspark.betweenas3.core.updaters.*;
    import org.libspark.betweenas3.core.updaters.display.*;
    import org.libspark.betweenas3.core.updaters.geom.*;
    import org.libspark.betweenas3.core.utils.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tickers.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class BetweenAS3 extends Object
    {
        public function BetweenAS3()
        {
            super();
            return;
        }

        public static function addChild(arg1:flash.display.DisplayObject, arg2:flash.display.DisplayObjectContainer):org.libspark.betweenas3.tweens.ITween
        {
            return new org.libspark.betweenas3.core.tweens.actions.AddChildAction(_ticker, arg1, arg2);
        }

        public static function func(arg1:Function, arg2:Array=null, arg3:Boolean=false, arg4:Function=null, arg5:Array=null):org.libspark.betweenas3.tweens.ITween
        {
            return new org.libspark.betweenas3.core.tweens.actions.FunctionAction(_ticker, arg1, arg2, arg3, arg4, arg5);
        }

        public static function parallel(... rest):org.libspark.betweenas3.tweens.ITweenGroup
        {
            return parallelTweens(rest);
        }

        public static function scale(arg1:org.libspark.betweenas3.tweens.ITween, arg2:Number):org.libspark.betweenas3.tweens.ITween
        {
            return new org.libspark.betweenas3.core.tweens.decorators.ScaledTween(arg1 as org.libspark.betweenas3.core.tweens.IITween, arg2);
        }

        public static function parallelTweens(arg1:Array):org.libspark.betweenas3.tweens.ITweenGroup
        {
            return new org.libspark.betweenas3.core.tweens.groups.ParallelTween(arg1, _ticker, 0);
        }

        public static function physical(arg1:Object, arg2:Object, arg3:Object=null, arg4:org.libspark.betweenas3.core.easing.IPhysicalEasing=null):org.libspark.betweenas3.tweens.IObjectTween
        {
            var loc1:*;
            (loc1 = new org.libspark.betweenas3.core.tweens.PhysicalTween(_ticker)).updater = _updaterFactory.createPhysical(arg1, arg2, arg3, arg4 || org.libspark.betweenas3.easing.Physical.exponential());
            return loc1;
        }

        public static function removeFromParent(arg1:flash.display.DisplayObject):org.libspark.betweenas3.tweens.ITween
        {
            return new org.libspark.betweenas3.core.tweens.actions.RemoveFromParentAction(_ticker, arg1);
        }

        public static function slice(arg1:org.libspark.betweenas3.tweens.ITween, arg2:Number, arg3:Number, arg4:Boolean=false):org.libspark.betweenas3.tweens.ITween
        {
            if (arg4) 
            {
                arg2 = arg1.duration * arg2;
                arg3 = arg1.duration * arg3;
            }
            if (arg2 > arg3) 
            {
                return new org.libspark.betweenas3.core.tweens.decorators.ReversedTween(new org.libspark.betweenas3.core.tweens.decorators.SlicedTween(arg1 as org.libspark.betweenas3.core.tweens.IITween, arg3, arg2), 0);
            }
            return new org.libspark.betweenas3.core.tweens.decorators.SlicedTween(arg1 as org.libspark.betweenas3.core.tweens.IITween, arg2, arg3);
        }

        public static function repeat(arg1:org.libspark.betweenas3.tweens.ITween, arg2:uint):org.libspark.betweenas3.tweens.ITween
        {
            return new org.libspark.betweenas3.core.tweens.decorators.RepeatedTween(arg1 as org.libspark.betweenas3.core.tweens.IITween, arg2);
        }

        public static function physicalApply(arg1:Object, arg2:Object, arg3:Object=null, arg4:Number=1, arg5:org.libspark.betweenas3.core.easing.IPhysicalEasing=null):void
        {
            var loc1:*;
            (loc1 = new org.libspark.betweenas3.core.tweens.PhysicalTween(_ticker)).updater = _updaterFactory.createPhysical(arg1, arg2, arg3, arg5 || org.libspark.betweenas3.easing.Physical.exponential());
            loc1.update(arg4);
            return;
        }

        public static function bezier(arg1:Object, arg2:Object, arg3:Object=null, arg4:Object=null, arg5:Number=1, arg6:org.libspark.betweenas3.core.easing.IEasing=null):org.libspark.betweenas3.tweens.IObjectTween
        {
            var loc1:*;
            (loc1 = new org.libspark.betweenas3.core.tweens.ObjectTween(_ticker)).updater = _updaterFactory.createBezier(arg1, arg2, arg3, arg4);
            loc1.time = arg5;
            loc1.easing = arg6 || org.libspark.betweenas3.easing.Linear.easeNone;
            return loc1;
        }

        public static function physicalFrom(arg1:Object, arg2:Object, arg3:org.libspark.betweenas3.core.easing.IPhysicalEasing=null):org.libspark.betweenas3.tweens.IObjectTween
        {
            var loc1:*;
            (loc1 = new org.libspark.betweenas3.core.tweens.PhysicalTween(_ticker)).updater = _updaterFactory.createPhysical(arg1, null, arg2, arg3 || org.libspark.betweenas3.easing.Physical.exponential());
            return loc1;
        }

        public static function delay(arg1:org.libspark.betweenas3.tweens.ITween, arg2:Number, arg3:Number=0):org.libspark.betweenas3.tweens.ITween
        {
            return new org.libspark.betweenas3.core.tweens.decorators.DelayedTween(arg1 as org.libspark.betweenas3.core.tweens.IITween, arg2, arg3);
        }

        public static function reverse(arg1:org.libspark.betweenas3.tweens.ITween, arg2:Boolean=true):org.libspark.betweenas3.tweens.ITween
        {
            var loc1:*=arg2 ? arg1.duration - arg1.position : 0;
            if (arg1 is org.libspark.betweenas3.core.tweens.decorators.ReversedTween) 
            {
                return new org.libspark.betweenas3.core.tweens.TweenDecorator((arg1 as org.libspark.betweenas3.core.tweens.decorators.ReversedTween).baseTween, loc1);
            }
            if ((arg1 as Object).constructor == org.libspark.betweenas3.core.tweens.TweenDecorator) 
            {
                arg1 = (arg1 as org.libspark.betweenas3.core.tweens.TweenDecorator).baseTween;
            }
            return new org.libspark.betweenas3.core.tweens.decorators.ReversedTween(arg1 as org.libspark.betweenas3.core.tweens.IITween, loc1);
        }

        public static function from(arg1:Object, arg2:Object, arg3:Number=1, arg4:org.libspark.betweenas3.core.easing.IEasing=null):org.libspark.betweenas3.tweens.IObjectTween
        {
            var loc1:*;
            (loc1 = new org.libspark.betweenas3.core.tweens.ObjectTween(_ticker)).updater = _updaterFactory.create(arg1, null, arg2);
            loc1.time = arg3;
            loc1.easing = arg4 || org.libspark.betweenas3.easing.Linear.easeNone;
            return loc1;
        }

        public static function tween(arg1:Object, arg2:Object, arg3:Object=null, arg4:Number=1, arg5:org.libspark.betweenas3.core.easing.IEasing=null):org.libspark.betweenas3.tweens.IObjectTween
        {
            var loc1:*;
            (loc1 = new org.libspark.betweenas3.core.tweens.ObjectTween(_ticker)).updater = _updaterFactory.create(arg1, arg2, arg3);
            loc1.time = arg4;
            loc1.easing = arg5 || org.libspark.betweenas3.easing.Linear.easeNone;
            return loc1;
        }

        public static function apply(arg1:Object, arg2:Object, arg3:Object=null, arg4:Number=1, arg5:Number=1, arg6:org.libspark.betweenas3.core.easing.IEasing=null):void
        {
            var loc1:*;
            (loc1 = new org.libspark.betweenas3.core.tweens.ObjectTween(_ticker)).updater = _updaterFactory.create(arg1, arg2, arg3);
            loc1.time = arg4;
            loc1.easing = arg6 || org.libspark.betweenas3.easing.Linear.easeNone;
            loc1.update(arg5);
            return;
        }

        public static function physicalTo(arg1:Object, arg2:Object, arg3:org.libspark.betweenas3.core.easing.IPhysicalEasing=null):org.libspark.betweenas3.tweens.IObjectTween
        {
            var loc1:*;
            (loc1 = new org.libspark.betweenas3.core.tweens.PhysicalTween(_ticker)).updater = _updaterFactory.createPhysical(arg1, arg2, null, arg3 || org.libspark.betweenas3.easing.Physical.exponential());
            return loc1;
        }

        public static function serial(... rest):org.libspark.betweenas3.tweens.ITweenGroup
        {
            return serialTweens(rest);
        }

        public static function bezierFrom(arg1:Object, arg2:Object, arg3:Object=null, arg4:Number=1, arg5:org.libspark.betweenas3.core.easing.IEasing=null):org.libspark.betweenas3.tweens.IObjectTween
        {
            var loc1:*;
            (loc1 = new org.libspark.betweenas3.core.tweens.ObjectTween(_ticker)).updater = _updaterFactory.createBezier(arg1, null, arg2, arg3);
            loc1.time = arg4;
            loc1.easing = arg5 || org.libspark.betweenas3.easing.Linear.easeNone;
            return loc1;
        }

        public static function bezierTo(arg1:Object, arg2:Object, arg3:Object=null, arg4:Number=1, arg5:org.libspark.betweenas3.core.easing.IEasing=null):org.libspark.betweenas3.tweens.IObjectTween
        {
            var loc1:*;
            (loc1 = new org.libspark.betweenas3.core.tweens.ObjectTween(_ticker)).updater = _updaterFactory.createBezier(arg1, arg2, null, arg3);
            loc1.time = arg4;
            loc1.easing = arg5 || org.libspark.betweenas3.easing.Linear.easeNone;
            return loc1;
        }

        public static function to(arg1:Object, arg2:Object, arg3:Number=1, arg4:org.libspark.betweenas3.core.easing.IEasing=null):org.libspark.betweenas3.tweens.IObjectTween
        {
            var loc1:*;
            (loc1 = new org.libspark.betweenas3.core.tweens.ObjectTween(_ticker)).updater = _updaterFactory.create(arg1, arg2, null);
            loc1.time = arg3;
            loc1.easing = arg4 || org.libspark.betweenas3.easing.Linear.easeNone;
            return loc1;
        }

        public static function serialTweens(arg1:Array):org.libspark.betweenas3.tweens.ITweenGroup
        {
            return new org.libspark.betweenas3.core.tweens.groups.SerialTween(arg1, _ticker, 0);
        }

        
        {
            _ticker = new org.libspark.betweenas3.tickers.EnterFrameTicker();
            _ticker.start();
            _updaterClassRegistry = new org.libspark.betweenas3.core.utils.ClassRegistry();
            _updaterFactory = new org.libspark.betweenas3.core.updaters.UpdaterFactory(_updaterClassRegistry);
            org.libspark.betweenas3.core.updaters.ObjectUpdater.register(_updaterClassRegistry);
            org.libspark.betweenas3.core.updaters.display.DisplayObjectUpdater.register(_updaterClassRegistry);
            org.libspark.betweenas3.core.updaters.display.MovieClipUpdater.register(_updaterClassRegistry);
            org.libspark.betweenas3.core.updaters.geom.PointUpdater.register(_updaterClassRegistry);
        }

        public static const VERSION:String="0.2 (Alpha)";

        internal static var _updaterClassRegistry:org.libspark.betweenas3.core.utils.ClassRegistry;

        internal static var _updaterFactory:org.libspark.betweenas3.core.updaters.UpdaterFactory;

        internal static var _ticker:org.libspark.betweenas3.core.ticker.ITicker;
    }
}
