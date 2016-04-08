package reservationlib 
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class formfield extends flash.display.MovieClip
    {
        public function formfield(arg1:flash.display.Stage, arg2:flash.display.MovieClip, arg3:flash.display.MovieClip, arg4:int, arg5:flash.display.MovieClip, arg6:int, arg7:int)
        {
            this.fieldbg = new flash.display.Sprite();
            this.inputFormat = new flash.text.TextFormat();
            this.field_txt = new flash.text.TextField();
            super();
            this._stage = arg1;
            this._root = arg2;
            this._fields = arg3;
            this._ivar = arg4;
            this._createform = arg5;
            this._xvar = arg6;
            this._yvar = arg7;
            this.fieldtitle = this._root.fielddata_array[this._ivar]["fieldtitle"];
            this.fieldrequired = this._root.fielddata_array[this._ivar]["fieldrequired"];
            this.fieldvar = this._root.fielddata_array[this._ivar]["fieldvar"];
            this.fielderror = this._root.fielddata_array[this._ivar]["fielderror"];
            this.fieldbg.graphics.beginFill(this._root.fieldbgcolor);
            if (this._root.fieldbgrounded != 0) 
            {
                this.fieldbg.graphics.drawRoundRect(0, 0, this._createform.fieldwidth, 25, this._root.fieldbgrounded, this._root.fieldbgrounded);
            }
            else 
            {
                this.fieldbg.graphics.drawRect(0, 0, this._createform.fieldwidth, 25);
            }
            this.fieldbg.graphics.endFill();
            this.fieldbg.alpha = this._root.fieldbgopacity;
            this.fieldbg.mouseEnabled = false;
            var loc1:*=0;
            this.inputFormat.font = this._root.fonttype;
            this.inputFormat.indent = loc1;
            this.inputFormat.color = this._root.fieldfontcolor;
            this.inputFormat.size = this._root.fieldfontsize;
            this.field_txt.multiline = false;
            this.field_txt.type = flash.text.TextFieldType.INPUT;
            this.field_txt.autoSize = flash.text.TextFieldAutoSize.NONE;
            this.field_txt.embedFonts = false;
            this.field_txt.selectable = true;
            this.field_txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.field_txt.text = this.fieldtitle;
            this.field_txt.setTextFormat(this.inputFormat);
            this.field_txt.width = this._createform.fieldwidth - 20;
            this.field_txt.height = Math.round(this._root.fieldfontsize * 1.5);
            this.field_txt.x = 10;
            this.field_txt.y = Math.round(this.fieldbg.height / 2 - this.field_txt.height / 2);
            this.field_txt.mouseEnabled = true;
            this.x = this._xvar;
            this.y = this._yvar;
            addChild(this.fieldbg);
            addChild(this.field_txt);
            this._fields.addChild(this);
            this.field_txt.addEventListener(flash.events.FocusEvent.FOCUS_IN, this.focusin, false, 0, true);
            this.field_txt.addEventListener(flash.events.FocusEvent.FOCUS_OUT, this.focusout, false, 0, true);
            return;
        }

        internal function leaveFS():void
        {
            if (this._stage.displayState == flash.display.StageDisplayState.FULL_SCREEN) 
            {
                this._stage.displayState = flash.display.StageDisplayState.NORMAL;
                this._root.mainroot.fsvar_stage = false;
            }
            return;
        }

        internal function focusin(arg1:flash.events.FocusEvent):void
        {
            if (this.field_t != null) 
            {
                this.field_t.stop();
            }
            this.field_t = org.libspark.betweenas3.BetweenAS3.to(this.fieldbg, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.field_t.play();
            if (this.field_txt.text == this.fieldtitle) 
            {
                this.field_txt.setSelection(this.field_txt.text.length, this.field_txt.text.length);
                this.field_txt.text = "";
                this.field_txt.setTextFormat(this.inputFormat);
            }
            this.leaveFS();
            return;
        }

        internal function focusout(arg1:flash.events.FocusEvent):void
        {
            if (this.field_t != null) 
            {
                this.field_t.stop();
            }
            this.field_t = org.libspark.betweenas3.BetweenAS3.to(this.fieldbg, {"alpha":this._root.fieldbgopacity}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.field_t.play();
            if (this.field_txt.text == " " || this.field_txt.text == "") 
            {
                this.field_txt.text = this.fieldtitle;
                this.field_txt.setTextFormat(this.inputFormat);
            }
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var fieldbg:flash.display.Sprite;

        internal var _xvar:int;

        public var fielderror:String;

        internal var _fields:flash.display.MovieClip;

        public var fieldrequired:String;

        public var fieldtitle:String;

        internal var _createform:flash.display.MovieClip;

        internal var inputFormat:flash.text.TextFormat;

        public var field_txt:flash.text.TextField;

        internal var _yvar:int;

        internal var field_t:org.libspark.betweenas3.tweens.ITween;

        public var fieldvar:String;

        internal var _ivar:int;

        internal var _stage:flash.display.Stage;
    }
}
