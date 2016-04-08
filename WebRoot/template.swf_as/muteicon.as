package 
{
    import flash.display.*;
    
    public dynamic class muteicon extends flash.display.MovieClip
    {
        public function muteicon()
        {
            super();
            addFrameScript(0, this.frame1);
            return;
        }

        internal function frame1():*
        {
            stop();
            return;
        }

        public var spk:flash.display.MovieClip;

        public var xmc:flash.display.MovieClip;
    }
}
