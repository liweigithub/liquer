package org.libspark.betweenas3.core.tweens.actions 
{
    import org.libspark.betweenas3.core.ticker.*;
    import org.libspark.betweenas3.core.tweens.*;
    
    public class FunctionAction extends org.libspark.betweenas3.core.tweens.AbstractActionTween
    {
        public function FunctionAction(arg1:org.libspark.betweenas3.core.ticker.ITicker, arg2:Function, arg3:Array=null, arg4:Boolean=false, arg5:Function=null, arg6:Array=null)
        {
            super(arg1);
            this._func = arg2;
            this._params = arg3;
            if (arg4) 
            {
                if (arg5 == null) 
                {
                    this._rollbackFunc = arg2;
                    this._rollbackParams = arg3;
                }
                else 
                {
                    this._rollbackFunc = arg5;
                    this._rollbackParams = arg6;
                }
            }
            return;
        }

        protected override function rollback():void
        {
            if (this._rollbackFunc != null) 
            {
                this._rollbackFunc.apply(null, this._rollbackParams);
            }
            return;
        }

        protected override function action():void
        {
            if (this._func != null) 
            {
                this._func.apply(null, this._params);
            }
            return;
        }

        internal var _func:Function;

        internal var _params:Array;

        internal var _rollbackFunc:Function;

        internal var _rollbackParams:Array;
    }
}
