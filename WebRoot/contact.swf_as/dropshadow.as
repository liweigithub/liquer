package 
{
    import flash.display.*;
    import org.libspark.betweenas3.*;
    
    public class dropshadow extends Object
    {
        public function dropshadow(arg1:flash.display.MovieClip, arg2:flash.display.DisplayObject, arg3:Number, arg4:Number, arg5:Number, arg6:Number, arg7:Number, arg8:Number, arg9:Number, arg10:Number)
        {
            super();
            this._root = arg1;
            this._targetmc = arg2;
            this._distance = arg3;
            this._angle = arg4;
            this._color = arg5;
            this._alpha = arg6;
            this._blurX = arg7;
            this._blurY = arg8;
            this._strength = arg9;
            this._quality = arg10;
            org.libspark.betweenas3.BetweenAS3.apply(this._targetmc, {"_dropShadowFilter":{"distance":this._distance, "angle":this._angle, "color":this._color, "alpha":this._alpha, "blurX":this._blurX, "blurY":this._blurY, "strength":this._strength, "quality":this._quality}});
            return;
        }

        internal var _strength:Number;

        internal var _root:flash.display.MovieClip;

        internal var _color:uint;

        internal var _targetmc:flash.display.DisplayObject;

        internal var _blurX:Number;

        internal var _blurY:Number;

        internal var _distance:Number;

        internal var _quality:Number;

        internal var _angle:Number;

        internal var _alpha:Number;
    }
}
