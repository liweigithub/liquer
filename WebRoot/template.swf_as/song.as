package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class song extends flash.display.MovieClip
    {
        public function song(arg1:flash.display.MovieClip, arg2:flash.display.Stage, arg3:flash.display.MovieClip, arg4:Number, arg5:Number, arg6:flash.display.MovieClip)
        {
            this.tformat = new flash.text.TextFormat();
            this.txt = new flash.text.TextField();
            this.bg = new flash.display.Sprite();
            super();
            this._root = arg1;
            this._stage = arg2;
            this._container = arg3;
            this._ivar = arg4;
            this._yvar = arg5;
            this._creator = arg6;
            this.indent = 5;
            this.tformat.font = this._root.textfont;
            this.tformat.color = this._root.musicentryfontcolor;
            this.tformat.size = this._root.musicentryfontsize;
            this.txt.embedFonts = true;
            this.txt.selectable = false;
            this.txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.txt.gridFitType = flash.text.GridFitType.PIXEL;
            this.txt.text = this._root.musicdata_array[this._ivar]["text"];
            this.txt.setTextFormat(this.tformat);
            this.txt.x = this.indent;
            this.txt.mouseEnabled = false;
            this.bg = new flash.display.Sprite();
            this.bg.graphics.beginFill(this._root.musicentrybgcolor);
            this.bg.graphics.drawRect(0, 0, this._root.musicplayerwidth, this._root.musicentryheight);
            this.bg.graphics.endFill();
            this.txt.y = Math.round(this.bg.height / 2 - this.txt.height / 2);
            this.mouseEnabled = true;
            this.buttonMode = true;
            this.alpha = this._root.musicentrybgopacity;
            this.addChild(this.bg);
            this.addChild(this.txt);
            this.y = this._yvar;
            this._container.addChild(this);
            this.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.onMouseOut, false, 0, true);
            this.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.onMouseOver, false, 0, true);
            this.addEventListener(flash.events.MouseEvent.CLICK, this.mouse_click, false, 0, true);
            return;
        }

        internal function onMouseOver(arg1:flash.events.MouseEvent):*
        {
            if (!this.select) 
            {
                if (this.t_out != null) 
                {
                    this.t_out.stop();
                }
                this.t_over = org.libspark.betweenas3.BetweenAS3.to(this, {"alpha":1}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
                this.t_over.play();
            }
            return;
        }

        public function selectEntry():void
        {
            if (this.t_out != null) 
            {
                this.t_out.stop();
            }
            this.t_over = org.libspark.betweenas3.BetweenAS3.to(this, {"alpha":1}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
            this.t_over.play();
            if (this._creator.activesong != null) 
            {
                this._creator.activesong.deselectEntry();
            }
            this.select = true;
            this._creator.activesongid = this._ivar;
            this._creator.activesong = this;
            this._creator.unPause();
            this._creator.stopSong();
            this._creator.playSong();
            return;
        }

        internal function onMouseOut(arg1:flash.events.MouseEvent):*
        {
            if (!this.select) 
            {
                if (this.t_over != null) 
                {
                    this.t_over.stop();
                }
                this.t_out = org.libspark.betweenas3.BetweenAS3.to(this, {"alpha":this._root.musicentrybgopacity}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
                this.t_out.play();
            }
            return;
        }

        internal function mouse_click(arg1:*):void
        {
            if (!this.select) 
            {
                this.selectEntry();
            }
            return;
        }

        public function deselectEntry():void
        {
            if (this.t_over != null) 
            {
                this.t_over.stop();
            }
            this.t_out = org.libspark.betweenas3.BetweenAS3.to(this, {"alpha":this._root.musicentrybgopacity}, 1, org.libspark.betweenas3.easing.Expo.easeOut);
            this.t_out.play();
            this.select = false;
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var t_out:org.libspark.betweenas3.tweens.ITween;

        internal var bg:flash.display.Sprite;

        internal var _stage:flash.display.Stage;

        internal var _container:flash.display.MovieClip;

        internal var tformat:flash.text.TextFormat;

        internal var indent:int;

        internal var _creator:flash.display.MovieClip;

        internal var txt:flash.text.TextField;

        public var _yvar:Number;

        public var select:Boolean=false;

        public var _ivar:Number;

        internal var t_over:org.libspark.betweenas3.tweens.ITween;
    }
}
