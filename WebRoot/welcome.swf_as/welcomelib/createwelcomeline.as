package welcomelib 
{
    import flash.display.*;
    import flash.text.*;
    import org.libspark.betweenas3.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createwelcomeline extends flash.display.MovieClip
    {
        public function createwelcomeline(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            this.txt = new flash.text.TextField();
            this.txt_mc = new flash.display.MovieClip();
            super();
            this._stage = arg1;
            this._root = arg2;
            this.txt.multiline = true;
            this.txt.condenseWhite = true;
            this.txt.wordWrap = true;
            this.txt.embedFonts = false;
            this.txt.selectable = false;
            this.txt.antiAliasType = flash.text.AntiAliasType.ADVANCED;
            this.txt.autoSize = flash.text.TextFieldAutoSize.LEFT;
            this.txt.gridFitType = flash.text.GridFitType.PIXEL;
            this.txt.width = 230;
            this.txt.styleSheet = this._root.style;
            this.txt.htmlText = this._root.welcometext;
            var loc1:*=new dropshadow(this._root, this.txt, 2, 45, 0, this._root.welcomeshadowopacity, 6, 6, 3, 1);
            this.txt_mc.alpha = 0;
            this.txt_mc.addChild(this.txt);
            this.txt_mc.x = 20;
            this.txt_mc.y = 370;
            addChild(this.txt_mc);
            this._root.addChild(this);
            this.t_text = org.libspark.betweenas3.BetweenAS3.to(this.txt_mc, {"alpha":1}, 0.5, org.libspark.betweenas3.easing.Sine.easeOut);
            this.t_text.play();
            return;
        }

        internal var txt:flash.text.TextField;

        internal var _root:flash.display.MovieClip;

        public var txt_mc:flash.display.MovieClip;

        internal var t_text:org.libspark.betweenas3.tweens.ITween;

        internal var _stage:flash.display.Stage;
    }
}
