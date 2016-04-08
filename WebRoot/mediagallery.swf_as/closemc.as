package 
{
    import flash.display.*;
    
    public dynamic class closemc extends flash.display.MovieClip
    {
        public function closemc()
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
    }
}
