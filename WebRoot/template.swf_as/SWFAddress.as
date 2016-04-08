package 
{
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
    
    public class SWFAddress extends Object
    {
        public function SWFAddress()
        {
            super();
            throw new flash.errors.IllegalOperationError("SWFAddress cannot be instantiated.");
        }

        internal static function _strictCheck(arg1:String, arg2:Boolean):String
        {
            if (SWFAddress.getStrict()) 
            {
                if (arg2) 
                {
                    if (arg1.substr(0, 1) != "/") 
                    {
                        arg1 = "/" + arg1;
                    }
                }
                else if (arg1 == "") 
                {
                    arg1 = "/";
                }
            }
            return arg1;
        }

        public static function getTracker():String
        {
            return _availability ? flash.external.ExternalInterface.call("SWFAddress.getTracker") as String : "";
        }

        public static function setStatus(arg1:String):void
        {
            _call("SWFAddress.setStatus", encodeURI(decodeURI(arg1)));
            return;
        }

        internal static function _check(arg1:flash.events.TimerEvent):void
        {
            if ((typeof SWFAddress["onInit"] == "function" || _dispatcher.hasEventListener(SWFAddressEvent.INIT)) && !_init) 
            {
                SWFAddress._setValueInit(_getValue());
                SWFAddress._init = true;
            }
            if (typeof SWFAddress["onChange"] == "function" || _dispatcher.hasEventListener(SWFAddressEvent.CHANGE) || typeof SWFAddress["onExternalChange"] == "function" || _dispatcher.hasEventListener(SWFAddressEvent.EXTERNAL_CHANGE)) 
            {
                _initTimer.stop();
                SWFAddress._init = true;
                SWFAddress._setValueInit(_getValue());
            }
            return;
        }

        internal static function _setValue(arg1:String):void
        {
            if (arg1 == "undefined" || arg1 == null) 
            {
                arg1 = "";
            }
            if (SWFAddress._value == arg1 && SWFAddress._init) 
            {
                return;
            }
            if (!SWFAddress._initChange) 
            {
                return;
            }
            SWFAddress._value = arg1;
            if (!_init) 
            {
                SWFAddress._init = true;
                if (typeof SWFAddress["onInit"] == "function" || _dispatcher.hasEventListener(SWFAddressEvent.INIT)) 
                {
                    _dispatchEvent(SWFAddressEvent.INIT);
                }
            }
            _dispatchEvent(SWFAddressEvent.CHANGE);
            _dispatchEvent(SWFAddressEvent.EXTERNAL_CHANGE);
            return;
        }

        public static function getParameterNames():Array
        {
            var loc4:*=null;
            var loc5:*=NaN;
            var loc1:*=SWFAddress.getValue();
            var loc2:*=loc1.indexOf("?");
            var loc3:*=new Array();
            if (loc2 != -1) 
            {
                loc1 = loc1.substr(loc2 + 1);
                if (!(loc1 == "") && !(loc1.indexOf("=") == -1)) 
                {
                    loc4 = loc1.split("&");
                    loc5 = 0;
                    while (loc5 < loc4.length) 
                    {
                        loc3.push(loc4[loc5].split("=")[0]);
                        ++loc5;
                    }
                }
            }
            return loc3;
        }

        
        {
            _init = false;
            _initChange = false;
            _initChanged = false;
            _strict = true;
            _value = "";
            _queue = new Array();
            _queueTimer = new flash.utils.Timer(10);
            _initTimer = new flash.utils.Timer(10);
            _availability = flash.external.ExternalInterface.available;
            _dispatcher = new flash.events.EventDispatcher();
            _initializer = _initialize();
        }

        public static function getStatus():String
        {
            var loc1:*=_availability ? flash.external.ExternalInterface.call("SWFAddress.getStatus") as String : "";
            if (loc1 == "undefined" || loc1 == null) 
            {
                loc1 = "";
            }
            return decodeURI(loc1);
        }

        public static function go(arg1:int):void
        {
            _call("SWFAddress.go", arg1);
            return;
        }

        internal static function _getValue():String
        {
            var loc1:*=null;
            var loc3:*=null;
            var loc2:*=null;
            if (_availability) 
            {
                loc1 = flash.external.ExternalInterface.call("SWFAddress.getValue") as String;
                loc3 = flash.external.ExternalInterface.call("SWFAddress.getIds") as Array;
                if (loc3 != null) 
                {
                    loc2 = loc3.toString();
                }
            }
            if (loc2 == null || !_availability || _initChanged) 
            {
                loc1 = SWFAddress._value;
            }
            else if (loc1 == "undefined" || loc1 == null) 
            {
                loc1 = "";
            }
            return _strictCheck(loc1 || "", false);
        }

        public static function up():void
        {
            var loc1:*=SWFAddress.getPath();
            SWFAddress.setValue(loc1.substr(0, loc1.lastIndexOf("/", loc1.length - 2) + (loc1.substr((loc1.length - 1)) != "/" ? 0 : 1)));
            return;
        }

        public static function hasEventListener(arg1:String):Boolean
        {
            return _dispatcher.hasEventListener(arg1);
        }

        public static function setTitle(arg1:String):void
        {
            _call("SWFAddress.setTitle", encodeURI(decodeURI(arg1)));
            return;
        }

        public static function resetStatus():void
        {
            _call("SWFAddress.resetStatus");
            return;
        }

        public static function getPathNames():Array
        {
            var loc1:*=SWFAddress.getPath();
            var loc2:*=loc1.split("/");
            if (loc1.substr(0, 1) == "/" || loc1.length == 0) 
            {
                loc2.splice(0, 1);
            }
            if (loc1.substr((loc1.length - 1), 1) == "/") 
            {
                loc2.splice((loc2.length - 1), 1);
            }
            return loc2;
        }

        public static function getBaseURL():String
        {
            var loc1:*=null;
            if (_availability) 
            {
                loc1 = String(flash.external.ExternalInterface.call("SWFAddress.getBaseURL"));
            }
            return loc1 == null || loc1 == "null" || !_availability ? "" : loc1;
        }

        public static function getTitle():String
        {
            var loc1:*=_availability ? flash.external.ExternalInterface.call("SWFAddress.getTitle") as String : "";
            if (loc1 == "undefined" || loc1 == null) 
            {
                loc1 = "";
            }
            return decodeURI(loc1);
        }

        public static function getPath():String
        {
            var loc1:*=SWFAddress.getValue();
            if (loc1.indexOf("?") != -1) 
            {
                return loc1.split("?")[0];
            }
            if (loc1.indexOf("#") != -1) 
            {
                return loc1.split("#")[0];
            }
            return loc1;
        }

        public static function href(arg1:String, arg2:String="_self"):void
        {
            if (_availability && flash.system.Capabilities.playerType == "ActiveX") 
            {
                flash.external.ExternalInterface.call("SWFAddress.href", arg1, arg2);
                return;
            }
            flash.net.navigateToURL(new flash.net.URLRequest(arg1), arg2);
            return;
        }

        internal static function _initialize():Boolean
        {
            var loc1:*;
            if (_availability) 
            {
                try 
                {
                    _availability = flash.external.ExternalInterface.call("function() { return (typeof SWFAddress != \"undefined\"); }") as Boolean;
                    flash.external.ExternalInterface.addCallback("getSWFAddressValue", function ():String
                    {
                        return _value;
                    })
                    flash.external.ExternalInterface.addCallback("setSWFAddressValue", _setValue);
                }
                catch (e:Error)
                {
                    _availability = false;
                }
            }
            _queueTimer.addEventListener(flash.events.TimerEvent.TIMER, _callQueue);
            _initTimer.addEventListener(flash.events.TimerEvent.TIMER, _check);
            _initTimer.start();
            return true;
        }

        public static function popup(arg1:String, arg2:String="popup", arg3:String="\"\"", arg4:String=""):void
        {
            if (_availability && (flash.system.Capabilities.playerType == "ActiveX" || flash.external.ExternalInterface.call("asual.util.Browser.isSafari"))) 
            {
                flash.external.ExternalInterface.call("SWFAddress.popup", arg1, arg2, arg3, arg4);
                return;
            }
            flash.net.navigateToURL(new flash.net.URLRequest("javascript:popup=window.open(\"" + arg1 + "\",\"" + arg2 + "\"," + arg3 + ");" + arg4 + ";void(0);"), "_self");
            return;
        }

        public static function setValue(arg1:String):void
        {
            if (arg1 == "undefined" || arg1 == null) 
            {
                arg1 = "";
            }
            arg1 = encodeURI(decodeURI(_strictCheck(arg1, true)));
            if (SWFAddress._value == arg1) 
            {
                return;
            }
            SWFAddress._value = arg1;
            _call("SWFAddress.setValue", arg1);
            if (SWFAddress._init) 
            {
                _dispatchEvent(SWFAddressEvent.CHANGE);
                _dispatchEvent(SWFAddressEvent.INTERNAL_CHANGE);
            }
            else 
            {
                _initChanged = true;
            }
            return;
        }

        public static function setTracker(arg1:String):void
        {
            _call("SWFAddress.setTracker", arg1);
            return;
        }

        public static function getValue():String
        {
            return decodeURI(_strictCheck(_value || "", false));
        }

        internal static function _call(arg1:String, arg2:Object=""):void
        {
            if (_availability) 
            {
                if (flash.system.Capabilities.os.indexOf("Mac") == -1) 
                {
                    flash.external.ExternalInterface.call(arg1, arg2);
                }
                else 
                {
                    if (_queue.length == 0) 
                    {
                        _queueTimer.start();
                    }
                    _queue.push({"fn":arg1, "param":arg2});
                }
            }
            return;
        }

        internal static function _setValueInit(arg1:String):void
        {
            SWFAddress._value = arg1;
            if (_init) 
            {
                _dispatchEvent(SWFAddressEvent.CHANGE);
                _dispatchEvent(SWFAddressEvent.EXTERNAL_CHANGE);
            }
            else 
            {
                _dispatchEvent(SWFAddressEvent.INIT);
            }
            _initChange = true;
            return;
        }

        public static function getStrict():Boolean
        {
            var loc1:*=null;
            if (_availability) 
            {
                loc1 = flash.external.ExternalInterface.call("SWFAddress.getStrict") as String;
            }
            return loc1 != null ? loc1 == "true" : _strict;
        }

        public static function dispatchEvent(arg1:flash.events.Event):Boolean
        {
            return _dispatcher.dispatchEvent(arg1);
        }

        internal static function _dispatchEvent(arg1:String):void
        {
            if (_dispatcher.hasEventListener(arg1)) 
            {
                _dispatcher.dispatchEvent(new SWFAddressEvent(arg1));
            }
            arg1 = arg1.substr(0, 1).toUpperCase() + arg1.substring(1);
            if (typeof SWFAddress["on" + arg1] == "function") 
            {
                var loc1:*;
                (loc1 = SWFAddress)["on" + arg1]();
            }
            return;
        }

        public static function getQueryString():String
        {
            var loc1:*=SWFAddress.getValue();
            var loc2:*=loc1.indexOf("?");
            if (!(loc2 == -1) && loc2 < loc1.length) 
            {
                return loc1.substr(loc2 + 1);
            }
            return null;
        }

        public static function removeEventListener(arg1:String, arg2:Function, arg3:Boolean=false):void
        {
            _dispatcher.removeEventListener(arg1, arg2, arg3);
            return;
        }

        public static function setStrict(arg1:Boolean):void
        {
            _call("SWFAddress.setStrict", arg1);
            _strict = arg1;
            return;
        }

        public static function forward():void
        {
            _call("SWFAddress.forward");
            return;
        }

        public static function setHistory(arg1:Boolean):void
        {
            _call("SWFAddress.setHistory", arg1);
            return;
        }

        internal static function _callQueue(arg1:flash.events.TimerEvent):void
        {
            var loc1:*=null;
            var loc2:*=0;
            var loc3:*=null;
            if (_queue.length == 0) 
            {
                _queueTimer.stop();
            }
            else 
            {
                loc1 = "";
                loc2 = 0;
                for (;;) 
                {
                    var loc4:*;
                    loc3 = loc4 = _queue[loc2];
                    if (!loc4) 
                    {
                        break;
                    }
                    if (loc3.param is String) 
                    {
                        loc3.param = "\"" + loc3.param + "\"";
                    }
                    loc1 = loc1 + (loc3.fn + "(" + loc3.param + ");");
                    ++loc2;
                }
                _queue = new Array();
                flash.net.navigateToURL(new flash.net.URLRequest("javascript:" + loc1 + "void(0);"), "_self");
            }
            return;
        }

        public static function addEventListener(arg1:String, arg2:Function, arg3:Boolean=false, arg4:int=0, arg5:Boolean=false):void
        {
            _dispatcher.addEventListener(arg1, arg2, arg3, arg4, arg5);
            return;
        }

        public static function back():void
        {
            _call("SWFAddress.back");
            return;
        }

        public static function getHistory():Boolean
        {
            return _availability ? flash.external.ExternalInterface.call("SWFAddress.getHistory") as Boolean : false;
        }

        public static function getParameter(arg1:String):Object
        {
            var loc3:*=null;
            var loc4:*=null;
            var loc5:*=NaN;
            var loc6:*=null;
            var loc1:*=SWFAddress.getValue();
            var loc2:*=loc1.indexOf("?");
            if (loc2 != -1) 
            {
                loc1 = loc1.substr(loc2 + 1);
                loc5 = (loc3 = loc1.split("&")).length;
                loc6 = new Array();
                while (loc5--) 
                {
                    if ((loc4 = loc3[loc5].split("="))[0] != arg1) 
                    {
                        continue;
                    }
                    loc6.push(loc4[1]);
                }
                if (loc6.length != 0) 
                {
                    return loc6.length == 1 ? loc6[0] : loc6;
                }
            }
            return null;
        }

        internal static var _queue:Array;

        internal static var _initTimer:flash.utils.Timer;

        public static var onInit:Function;

        internal static var _initializer:Boolean;

        internal static var _availability:Boolean;

        internal static var _dispatcher:flash.events.EventDispatcher;

        internal static var _queueTimer:flash.utils.Timer;

        internal static var _strict:Boolean=true;

        internal static var _initChanged:Boolean=false;

        internal static var _init:Boolean=false;

        internal static var _value:String="";

        internal static var _initChange:Boolean=false;

        public static var onChange:Function;
    }
}
