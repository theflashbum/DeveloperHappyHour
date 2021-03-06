package
{
    import org.flixel.*;

    /**
     * A beermug is a barthing that makes the player lose
     * if it hits either end of the bar.
     */
    public class BeerMug extends BarThing
    {
        public static var SIZE:Number = 25;

        private var _full:Boolean;

        [Embed(source="../build/assets/beer_mug.png")]
        private var BeerMugSprite:Class;

        public function BeerMug(initX:Number, initY:Number, leftBound:Number, rightBound:Number, full:Boolean = true)
        {
            super(initX, initY, leftBound, rightBound);

            this.full = full;

            loadGraphic(BeerMugSprite, false, false, SIZE, SIZE);
            addAnimation("idle",[0]);
            addAnimation("fast",[1]);
            addAnimation("empty",[2]);

            collideRight = false;
            collideLeft = true;
        }

        public function get full():Boolean
        {
            return _full;
        }

        public function set full(value:Boolean):void
        {
            _full = value;

            if(value)
            {
                play("idle");
            }
            else
            {
                play("empty");
            }
        }
    }
}
