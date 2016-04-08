package 
{
    import flash.events.*;
    
    public class SWFAddressEvent extends flash.events.Event
    {
        public function SWFAddressEvent(arg1:String, arg2:Boolean=false, arg3:Boolean=false)
        {
            super(arg1, arg2, arg3);
            return;
        }

        public function get parameters():Object
        {
            var loc1:*=0;
            if (this._parameters == null) 
            {
                this._parameters = new Object();
                loc1 = 0;
                while (loc1 < this.parameterNames.length) 
                {
                    this._parameters[this.parameterNames[loc1]] = SWFAddress.getParameter(this.parameterNames[loc1]);
                    ++loc1;
                }
            }
            return this._parameters;
        }

        public function get path():String
        {
            if (this._path == null) 
            {
                this._path = SWFAddress.getPath();
            }
            return this._path;
        }

        public override function get currentTarget():Object
        {
            return SWFAddress;
        }

        public override function toString():String
        {
            return formatToString("SWFAddressEvent", "type", "bubbles", "cancelable", "eventPhase", "value", "path", "pathNames", "parameterNames", "parameters");
        }

        public override function get target():Object
        {
            return SWFAddress;
        }

        public function get value():String
        {
            if (this._value == null) 
            {
                this._value = SWFAddress.getValue();
            }
            return this._value;
        }

        public override function get type():String
        {
            return super.type;
        }

        public function get pathNames():Array
        {
            if (this._pathNames == null) 
            {
                this._pathNames = SWFAddress.getPathNames();
            }
            return this._pathNames;
        }

        public override function clone():flash.events.Event
        {
            return new SWFAddressEvent(this.type, bubbles, cancelable);
        }

        public function get parameterNames():Array
        {
            if (this._parameterNames == null) 
            {
                this._parameterNames = SWFAddress.getParameterNames();
            }
            return this._parameterNames;
        }

        public static const INIT:String="init";

        public static const INTERNAL_CHANGE:String="internalChange";

        public static const EXTERNAL_CHANGE:String="externalChange";

        public static const CHANGE:String="change";

        internal var _pathNames:Array;

        internal var _parameters:Object;

        internal var _path:String;

        internal var _value:String;

        internal var _parameterNames:Array;
    }
}
