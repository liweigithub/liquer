package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class tooltip extends flash.display.MovieClip
    {
        public function tooltip(arg1:flash.display.MovieClip, arg2:flash.display.MovieClip, arg3:flash.display.MovieClip, arg4:Number)
        {
            super();
            this._root = arg1;
            this._ivar = arg4;
            this._container = arg3;
            this._socialmc = arg2;
            var loc1:*=new flash.text.TextFormat();
            var loc2:*=5;
            loc1.font = this._root.textfont;
            loc1.indent = loc2;
            loc1.color = this._root.socialtextcolor;
            loc1.size = this._root.socialtextsize;
            var loc3:*;
            (loc3 = new flash.text.TextField()).multiline = false;
            loc3.autoSize = flash.text.TextFieldAutoSize.LEFT;
            loc3.embedFonts = true;
            loc3.selectable = false;
            loc3.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            loc3.text = this._root.socialdata_array[this._ivar]["text"];
            loc3.setTextFormat(loc1);
            loc3.x = Math.round(-loc3.width / 2 - loc2 / 2);
            loc3.y = -Math.round(loc3.height / 2);
            loc3.mouseEnabled = false;
            var loc4:*=new dropshadow(this._root, loc3, 1, 90, this._root.socialtextshadowcolor, this._root.socialtextshadowalpha, this._root.socialtextshadowblur, this._root.socialtextshadowblur, 1, 1);
            var loc5:*;
            (loc5 = new flash.display.Sprite()).graphics.beginFill(this._root.socialbgcolor);
            loc5.graphics.drawRoundRect(-Math.round((loc3.width + loc2) / 2), -Math.round((loc3.height + loc2) / 2), Math.round(loc3.width + loc2), Math.round(loc3.height + loc2), this._root.socialbgrounded, this._root.socialbgrounded);
            loc5.graphics.endFill();
            loc5.mouseEnabled = false;
            this.mouseEnabled = false;
            this.addChild(loc5);
            this.addChild(loc3);
            this.alpha = 0;
            this.thisyvar = Math.round(this._socialmc.y - this.height / 2 - 5);
            this.y = this.thisyvar;
            this.x = this._socialmc.x + Math.round(this.width / 2);
            this._container.addChild(this);
            this._socialmc.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.mouse_over, false, 0, true);
            this._socialmc.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.mouse_out, false, 0, true);
            return;
        }

        internal function mouse_over(arg1:*):void
        {
            this.alpha = 0;
            this.y = this.thisyvar + 5;
            this.t_over = org.libspark.betweenas3.BetweenAS3.to(this, {"alpha":1, "y":this.thisyvar}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            if (this.t_out != null) 
            {
                this.t_out.stop();
            }
            this.t_over.play();
            return;
        }

        internal function mouse_out(arg1:*):void
        {
            this.t_out = org.libspark.betweenas3.BetweenAS3.to(this, {"alpha":0, "y":this.thisyvar + 5}, 0.4, org.libspark.betweenas3.easing.Expo.easeOut);
            if (this.t_over != null) 
            {
                this.t_over.stop();
            }
            this.t_out.play();
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var t_out:org.libspark.betweenas3.tweens.ITween;

        internal var _socialmc:flash.display.MovieClip;

        internal var thisyvar:Number;

        internal var _container:flash.display.MovieClip;

        internal var _ivar:Number;

        internal var t_over:org.libspark.betweenas3.tweens.ITween;
    }
}
