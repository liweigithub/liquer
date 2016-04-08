package org.libspark.betweenas3.tweens 
{
    public interface ITweenGroup extends org.libspark.betweenas3.tweens.ITween
    {
        function getTweenAt(arg1:int):org.libspark.betweenas3.tweens.ITween;

        function getTweenIndex(arg1:org.libspark.betweenas3.tweens.ITween):int;

        function contains(arg1:org.libspark.betweenas3.tweens.ITween):Boolean;
    }
}
