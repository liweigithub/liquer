package bannerlib 
{
    import flash.display.*;
    import flash.text.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class caption extends flash.display.MovieClip
    {
        public function caption(arg1:flash.display.MovieClip, arg2:flash.display.MovieClip, arg3:Number, arg4:Number)
        {
            this.captionmc = new flash.display.MovieClip();
            this.myFormat = new flash.text.TextFormat();
            this.txt = new flash.text.TextField();
            this.bg = new flash.display.Sprite();
            super();
            this._root = arg1;
            this._container = arg2;
            this._ivar = arg3;
            this._bannerid = arg4;
            this.textfontsize = this._root.bannerdata_array[this._bannerid]["textfontsize"][this._ivar];
            this.textfontcolor = this._root.bannerdata_array[this._bannerid]["textfontcolor"][this._ivar];
            this.textfontopacity = this._root.bannerdata_array[this._bannerid]["textfontopacity"][this._ivar];
            this.textbgcolor = this._root.bannerdata_array[this._bannerid]["textbgcolor"][this._ivar];
            this.textbgopacity = this._root.bannerdata_array[this._bannerid]["textbgopacity"][this._ivar];
            this.textbgpadding = this._root.bannerdata_array[this._bannerid]["textbgpadding"][this._ivar];
            this.textanimdirection = this._root.bannerdata_array[this._bannerid]["textanimdirection"][this._ivar];
            this.textanimoffset = this._root.bannerdata_array[this._bannerid]["textanimoffset"][this._ivar];
            this.textanimtime = this._root.bannerdata_array[this._bannerid]["textanimtime"][this._ivar];
            this.textanimdelay = this._root.bannerdata_array[this._bannerid]["textanimdelay"][this._ivar];
            this.textanimfxstrength = this._root.bannerdata_array[this._bannerid]["textanimfxstrength"][this._ivar];
            this.textposx = this._root.bannerdata_array[this._bannerid]["textposx"][this._ivar];
            this.textposy = this._root.bannerdata_array[this._bannerid]["textposy"][this._ivar];
            this.captiontext = this._root.bannerdata_array[this._bannerid]["text"][this._ivar];
            this.myFormat.font = this._root.fontused;
            this.myFormat.indent = this.textbgpadding;
            this.myFormat.color = this.textfontcolor;
            this.myFormat.size = this.textfontsize;
            this.txt.multiline = false;
            this.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.txt.embedFonts = false;
            this.txt.selectable = false;
            this.txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.txt.text = this.captiontext;
            this.txt.setTextFormat(this.myFormat);
            this.txt.alpha = this.textfontopacity;
            this.txt.mouseEnabled = false;
            this.txt.y = this.textbgpadding;
            this.bg.graphics.beginFill(this.textbgcolor);
            this.bg.graphics.drawRect(0, 0, Math.round(this.txt.width + this.textbgpadding), Math.round(this.txt.height + this.textbgpadding * 2));
            this.bg.graphics.endFill();
            this.bg.alpha = this.textbgopacity;
            this.bg.mouseEnabled = false;
            this.captionmc.alpha = 0;
            this.captionmc.mouseEnabled = false;
            this.captionmc.addChild(this.bg);
            this.captionmc.addChild(this.txt);
            if (this.textanimdirection != "top") 
            {
                if (this.textanimdirection != "left") 
                {
                    if (this.textanimdirection != "bottom") 
                    {
                        if (this.textanimdirection == "right") 
                        {
                            this.captionmc.x = this.textposx + this._root.leftpos + this.textanimoffset;
                            this.captionmc.y = this.textposy;
                        }
                    }
                    else 
                    {
                        this.captionmc.x = this.textposx + this._root.leftpos;
                        this.captionmc.y = this.textposy + this.textanimoffset;
                    }
                }
                else 
                {
                    this.captionmc.x = this.textposx + this._root.leftpos - this.textanimoffset;
                    this.captionmc.y = this.textposy;
                }
            }
            else 
            {
                this.captionmc.x = this.textposx + this._root.leftpos;
                this.captionmc.y = this.textposy - this.textanimoffset;
            }
            this._container.addChild(this.captionmc);
            return;
        }

        public function fadeInCaption(arg1:Number):void
        {
            var loc1:*=null;
            if (this.t_caption != null) 
            {
                this.t_caption.stop();
            }
            this.captionmc.alpha = 0;
            if (this.textanimdirection != "top") 
            {
                if (this.textanimdirection != "left") 
                {
                    if (this.textanimdirection != "bottom") 
                    {
                        if (this.textanimdirection == "right") 
                        {
                            this.captionmc.x = this.textposx + this._root.leftpos + this.textanimoffset;
                            this.captionmc.y = this.textposy + arg1;
                            loc1 = org.libspark.betweenas3.BetweenAS3.to(this.captionmc, {"x":this.textposx + this._root.leftpos}, this.textanimtime, org.libspark.betweenas3.easing.Quint.easeOut);
                        }
                    }
                    else 
                    {
                        this.captionmc.x = this.textposx + this._root.leftpos;
                        this.captionmc.y = this.textposy + this.textanimoffset + arg1;
                        loc1 = org.libspark.betweenas3.BetweenAS3.to(this.captionmc, {"y":this.textposy + arg1}, this.textanimtime, org.libspark.betweenas3.easing.Quint.easeOut);
                    }
                }
                else 
                {
                    this.captionmc.x = this.textposx + this._root.leftpos - this.textanimoffset;
                    this.captionmc.y = this.textposy + arg1;
                    loc1 = org.libspark.betweenas3.BetweenAS3.to(this.captionmc, {"x":this.textposx + this._root.leftpos}, this.textanimtime, org.libspark.betweenas3.easing.Quint.easeOut);
                }
            }
            else 
            {
                this.captionmc.x = this.textposx + this._root.leftpos;
                this.captionmc.y = this.textposy - this.textanimoffset + arg1;
                loc1 = org.libspark.betweenas3.BetweenAS3.to(this.captionmc, {"y":this.textposy + arg1}, this.textanimtime, org.libspark.betweenas3.easing.Quint.easeOut);
            }
            var loc2:*=org.libspark.betweenas3.BetweenAS3.to(this.captionmc, {"alpha":1}, this.textanimtime, org.libspark.betweenas3.easing.Quart.easeOut);
            var loc3:*=org.libspark.betweenas3.BetweenAS3.tween(this.captionmc, {"_colorMatrixFilter":{"matrix":[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]}}, {"_colorMatrixFilter":{"matrix":[this.textanimfxstrength, 0, 0, 0, 0, 0, this.textanimfxstrength, 0, 0, 0, 0, 0, this.textanimfxstrength, 0, 0, 0, 0, 0, this.textanimfxstrength, 0]}}, this.textanimtime, org.libspark.betweenas3.easing.Expo.easeOut);
            var loc4:*=org.libspark.betweenas3.BetweenAS3.delay(loc1, this.textanimdelay);
            var loc5:*=org.libspark.betweenas3.BetweenAS3.delay(loc2, this.textanimdelay);
            var loc6:*=org.libspark.betweenas3.BetweenAS3.delay(loc3, this.textanimdelay);
            this.t_caption = org.libspark.betweenas3.BetweenAS3.parallel(loc1, loc4, loc2, loc5, loc3, loc6);
            this.t_caption.play();
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var myFormat:flash.text.TextFormat;

        internal var textanimdelay:Number;

        internal var textanimdirection:String;

        internal var _container:flash.display.MovieClip;

        internal var textanimtime:Number;

        internal var textfontopacity:Number;

        internal var textanimoffset:Number;

        internal var captiontext:String;

        internal var bg:flash.display.Sprite;

        internal var textfontsize:Number;

        internal var textanimfxstrength:Number;

        internal var textbgopacity:Number;

        internal var textbgpadding:Number;

        internal var textposx:Number;

        internal var textposy:Number;

        internal var _bannerid:Number;

        internal var textfontcolor:uint;

        internal var t_caption:org.libspark.betweenas3.tweens.ITween;

        internal var txt:flash.text.TextField;

        internal var textbgcolor:uint;

        internal var captionmc:flash.display.MovieClip;

        internal var _ivar:Number;
    }
}
