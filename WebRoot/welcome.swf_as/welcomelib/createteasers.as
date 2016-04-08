package welcomelib 
{
    import flash.display.*;
    import org.libspark.betweenas3.easing.*;
    import org.libspark.betweenas3.tweens.*;
    
    public class createteasers extends flash.display.MovieClip
    {
        public function createteasers(arg1:flash.display.Stage, arg2:flash.display.MovieClip)
        {
            this.teasercontainer = new flash.display.MovieClip();
            this.teasers = new Array();
            super();
            this._stage = arg1;
            this._root = arg2;
            addChild(this.teasercontainer);
            this.loadTeasers();
            return;
        }

        internal function loadTeasers():void
        {
            var loc2:*=0;
            var loc3:*=0;
            var loc1:*=0;
            while (loc1 < this._root.maxteaser) 
            {
                if (loc1 != 0) 
                {
                    if (loc1 != 1) 
                    {
                        if (loc1 != 2) 
                        {
                            if (loc1 != 3) 
                            {
                                if (loc1 != 4) 
                                {
                                    if (loc1 == 5) 
                                    {
                                        loc2 = 745;
                                        loc3 = 5;
                                    }
                                }
                                else 
                                {
                                    loc2 = 420;
                                    loc3 = 185;
                                }
                            }
                            else 
                            {
                                loc2 = 565;
                                loc3 = 5;
                            }
                        }
                        else 
                        {
                            loc2 = 240;
                            loc3 = 185;
                        }
                    }
                    else 
                    {
                        loc2 = 240;
                        loc3 = 5;
                    }
                }
                else 
                {
                    loc2 = 5;
                    loc3 = 5;
                }
                this.teasers[loc1] = new welcomelib.teaser(this._root, this._stage, this.teasercontainer, loc1, loc2, loc3, this);
                ++loc1;
            }
            return;
        }

        internal var _root:flash.display.MovieClip;

        internal var teasers:Array;

        internal var teasersloaded:Number=0;

        internal var teasercontainer:flash.display.MovieClip;

        internal var container_t:org.libspark.betweenas3.tweens.ITween;

        internal var _stage:flash.display.Stage;
    }
}
