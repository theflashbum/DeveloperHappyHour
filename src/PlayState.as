package
{
    import org.flixel.*;

    public class PlayState extends FlxState
    {
        private var barNum:Number = 0;

        private var bars:Array;
        private var barMugs:Array;
        private var tapperPositions:Array;
        private var mugPositions:Array;

        private var player:Player;

        override public function create():void
        {
            FlxG.mouse.show();

            bars = new Array();
            barMugs = new Array();
            tapperPositions = new Array();
            mugPositions = new Array();
            
            bars[0] = new FlxRect(10, 120, 380, 10);
            
            var barShow:FlxSprite;
            for (var i:int = 0; i < bars.length; i++)
            {
                barShow = new FlxSprite(bars[i].x, bars[i].y).createGraphic(bars[i].width, bars[i].height);
                add(barShow);

                barMugs[i] = new FlxGroup();
                add(barMugs[i]);
                
                tapperPositions[i] = new FlxPoint(bars[i].right, bars[i].bottom);
                mugPositions[i] = new FlxPoint(bars[i].right - BeerMug.SIZE, bars[i].top);
            }
            
            player = new Player(tapperPositions[0]);
            
            add(player);

        }

        override public function update():void
        {
            super.update();

            var curBar:FlxRect = bars[barNum];
            var curMugs:FlxGroup = barMugs[barNum];

            //Handle input.
            if (FlxG.keys.justPressed("SPACE"))
            {
                //chuck a mug from the current position.
                var mug:BeerMug = curMugs.getFirstAvail() as BeerMug;
                var pos:FlxPoint = mugPositions[barNum];
                if (!mug)
                {
                    mug = new BeerMug(pos.x, pos.y, curBar.left, curBar.right);
                    curMugs.add(mug);
                }
                mug.prepare();
                mug.velocity.x = -200;
                mug.velocity.y = 0;
            }

            //check for collisions between mugs and patrons?

        }
        
    }
}
