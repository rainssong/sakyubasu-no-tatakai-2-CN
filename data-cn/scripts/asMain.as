package
{
   import fl.motion.Color;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.net.SharedObject;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;

   public class asMain extends MovieClip
   {
      public var preloader:asLoader;

      public var tempX:int;

      public var tempY:int;

      public var euType:int;

      public var bType:int;

      public var preCount:int;

      public var vinTint:int;

      public var timerSpeed:int;

      public var charMod:int;

      public var craftNode:int;

      public var scrollDir:int;

      public var bossDam:int;

      public var sortSet:int;

      public var pubTarget:int;

      public var gameState:int;

      public var gameStory:int;

      public var skillType:int;

      public var skillTemp:int;

      public var skillTarget:int;

      public var squadSelect:int;

      public var combatTurn:int;

      public var pecuLoc:int;

      public var combatSoul:int;

      public var currentMap:int;

      public var inventState:int;

      public var combatState:int;

      public var combatLevel:int;

      public var selectedUnit:int;

      public var defaultGrid:int;

      public var currentGrid:int;

      public var targetGrid:int;

      public var dashGrid:int;

      public var finalCombat:int;

      public var pecuNuke:int;

      public var activeAbility:int;

      public var actualList:int;

      public var loopSaver:int;

      public var summoning:Boolean;

      public var swapping:Boolean;

      public var selecting:Boolean;

      public var diaLock:Boolean;

      public var pecuWin:Boolean;

      public var eventLock:Boolean;

      public var skillLock:Boolean;

      public var mouseLock:Boolean;

      public var scrollLock:Boolean;

      public var scrollLock_2:Boolean;

      public var combatSwap:Boolean;

      public var combatSelect:Boolean;

      public var animationLock:Boolean;

      public var combatResult:Boolean;

      public var pecuDamage:Boolean;

      public var shavee:Boolean;

      public var sCheck:Boolean;

      public var activeMission:Array;

      public var eStats:Array;

      public var objList:Array;

      public var swapTool:Array;

      public var gameData:Array;

      public var loadData:Array;

      public var charData:Array;

      public var runeState:Array;

      public var damageArray:Array;

      public var combatHand:Array;

      public var combatDeck:Array;

      public var combatConvert:Array;

      public var skillStats:Array;

      public var combatStats:Array;

      public var combatArray:Array;

      public var tempGearArray:Array;

      public var gearInventory:Array;

      public var cardInventory:Array;

      public var storeInventory:Array;

      public var inventoryDeck:Array;

      public var exileRunes:Array;

      public var exileClasses:Array;

      public var exileModMenu:Array;

      public var exileInventory:Array;

      public var specialDialogues:Array;

      public var specialEvents:Array;

      public var unitMapping:Array;

      public var mapCount:Array;

      public var pecuVars:Array;

      public var rocksArray:Array;

      public var pecuWar:MovieClip;

      public var vicScreen:MovieClip;

      public var boss:MovieClip;

      public var unitPrep:MovieClip;

      public var spellIcon:MovieClip;

      public var pLoader:MovieClip;

      public var dialogue:MovieClip;

      public var inventory:MovieClip;

      public var stageShade:MovieClip;

      public var stageEffect:MovieClip;

      public var bgHolder:MovieClip;

      public var obHolder:MovieClip;

      public var uiHolder:MovieClip;

      public var cSpecial:MovieClip;

      public var gameFader:MovieClip;

      public var combatGrid:MovieClip;

      public var miscOverlay:MovieClip;

      public var mainMask:Shape;

      public var specMask:Shape;

      public var diaMask:Shape;

      public var gameTimer:Timer;

      public var save:SharedObject;

      public function asMain()
      {
         super();
         this.gameLoaded();
         addEventListener(Event.ADDED_TO_STAGE, this.__setPerspectiveProjection_);
      }

      public function __setPerspectiveProjection_(param1:Event):void
      {
         root.transform.perspectiveProjection.fieldOfView = 74.265168;
         root.transform.perspectiveProjection.projectionCenter = new Point(275, 200);
      }

      public function gameLoaded():*
      {
         this.save = SharedObject.getLocal("com.gorepete.snt2v32", "/");
         this.loadMask();
         this.loadWarn();
      }

      public function loadMask():void
      {
         this.mainMask = new Shape();
         this.specMask = new Shape();
         this.diaMask = new Shape();
         this.mainMask.graphics.beginFill(16777215);
         this.mainMask.graphics.drawRect(0, 0, 800, 450);
         this.specMask.graphics.beginFill(16777215);
         this.specMask.graphics.drawRect(0, 0, 800, 450);
         this.diaMask.graphics.beginFill(16777215);
         this.diaMask.graphics.drawRect(0, 0, 800, 450);
      }

      public function saveGame():void
      {
         var _loc7_:int = 0;
         this.save.data.mainSlot = new Array();
         this.gameData = new Array();
         this.gameData[0] = this.gameStory;
         this.gameData[1] = new Array();
         this.gameData[2] = new Array();
         this.gameData[3] = new Array();
         this.gameData[4] = new Array();
         this.gameData[5] = new Array();
         this.gameData[6] = new Array();
         this.gameData[7] = new Array();
         this.gameData[11] = new Array();
         var _loc1_:int = 0;
         while (_loc1_ < this.gearInventory.length)
         {
            this.gameData[1][_loc1_] = this.gearInventory[_loc1_].concat();
            _loc1_++;
         }
         var _loc2_:int = 0;
         while (_loc2_ < this.exileInventory.length)
         {
            this.gameData[2][_loc2_] = new Array();
            this.gameData[2][_loc2_][0] = this.exileInventory[_loc2_][0].concat();
            this.gameData[2][_loc2_][1] = this.exileInventory[_loc2_][1].concat();
            _loc2_++;
         }
         var _loc3_:int = 0;
         while (_loc3_ < this.cardInventory.length)
         {
            this.gameData[3][_loc3_] = new Array();
            this.gameData[3][_loc3_][0] = this.cardInventory[_loc3_][0].concat();
            this.gameData[3][_loc3_][1] = this.cardInventory[_loc3_][1].concat();
            this.gameData[3][_loc3_][2] = this.cardInventory[_loc3_][2].concat();
            _loc3_++;
         }
         var _loc4_:int = 0;
         while (_loc4_ < 15)
         {
            this.gameData[4][_loc4_] = new Array();
            if (this.inventoryDeck[_loc4_] != "0000")
            {
               this.gameData[4][_loc4_][0] = this.inventoryDeck[_loc4_][0].concat();
               this.gameData[4][_loc4_][1] = this.inventoryDeck[_loc4_][1].concat();
               this.gameData[4][_loc4_][2] = this.inventoryDeck[_loc4_][2].concat();
            }
            else
            {
               this.gameData[4][_loc4_][0] = "0000";
            }
            _loc4_++;
         }
         this.gameData[5] = this.charData.concat();
         var _loc5_:int = 0;
         while (_loc5_ < this.exileRunes.length)
         {
            this.gameData[6][_loc5_] = this.exileRunes[_loc5_].concat();
            _loc5_++;
         }
         this.gameData[7] = this.exileClasses.concat();
         this.gameData[8] = this.specialDialogues.concat();
         this.gameData[9] = this.specialEvents.concat();
         this.gameData[10] = 34;
         var _loc6_:int = 0;
         while (_loc6_ < 4)
         {
            this.gameData[11][_loc6_] = new Array();
            _loc7_ = 0;
            while (_loc7_ < 4)
            {
               this.gameData[11][_loc6_][_loc7_] = new Array();
               this.gameData[11][_loc6_][_loc7_] = this.activeMission[_loc6_][_loc7_].concat();
               _loc7_++;
            }
            _loc6_++;
         }
         this.gameData[11][5] = this.activeMission[5].concat();
         this.save.data.mainSlot = this.gameData;
         this.save.flush();
      }

      public function loadWarn():void
      {
         this.gameState = -5;
         this.mouseLock = true;
         this.timerSpeed = 25;
         this.pecuWin = false;
         this.shavee = false;
         this.activeMission = new Array();
         addEventListener(MouseEvent.CLICK, this.mouseClick);
         addEventListener(MouseEvent.RIGHT_CLICK, this.rightClick);
         addEventListener(Event.ENTER_FRAME, this.gameTick);
         this.bgHolder = new asWarn();
         this.gameFader = new asFader();
         this.gameFader.stop();
         addChild(this.bgHolder);
         addChild(this.gameFader);
      }

      public function loadLogo():void
      {
         removeChild(this.bgHolder);
         this.bgHolder = null;
         this.gameState = -3;
         this.mouseLock = true;
         this.bgHolder = new asLogo();
         this.gameFader = new asFader();
         this.gameFader.stop();
         addChild(this.bgHolder);
         addChild(this.gameFader);
      }

      public function prepGame():void
      {
         removeChild(this.bgHolder);
         this.bgHolder = null;
         this.loadGame();
      }

      public function loadGame():void
      {
         this.loadVars();
         this.loadEvents();
         this.loadTitle();
      }

      public function setQuality(param1:int):void
      {
         switch (true)
         {
            case param1 == 1:
               stage.quality = StageQuality.LOW;
               break;
            case param1 == 2:
               stage.quality = StageQuality.MEDIUM;
               break;
            case param1 == 3:
               stage.quality = StageQuality.HIGH;
         }
      }

      public function loadVars():void
      {
         this.gameState = 0;
         this.currentMap = 0;
         this.mouseLock = true;
         this.diaLock = false;
      }

      public function loadEvents():void
      {
         addEventListener(MouseEvent.MOUSE_OVER, this.mouseOn);
         addEventListener(MouseEvent.MOUSE_OUT, this.mouseOff);
         addEventListener(MouseEvent.MOUSE_DOWN, this.mouseD);
         addEventListener(MouseEvent.MOUSE_UP, this.mouseU);
         addEventListener(MouseEvent.MOUSE_WHEEL, this.mouseS);
      }

      public function loadTitle():void
      {
         this.bgHolder = new asTitle();
         this.bgHolder.btnNew.gotoAndStop(1);
         this.bgHolder.btnLoad.visible = false;
         this.bgHolder.btnLoad.gotoAndStop(1);
         if (this.save.data.mainSlot != null && this.save.data.mainSlot[10] == 34)
         {
            this.bgHolder.btnCont.gotoAndStop(1);
         }
         else
         {
            this.bgHolder.btnCont.visible = false;
         }
         this.gameFader = new asFader();
         this.gameFader.stop();
         addChild(this.bgHolder);
         addChild(this.mainMask);
         this.bgHolder.mask = this.mainMask;
         addChild(this.gameFader);
         this.gameState = 1;
      }

      public function unloadTitle():void
      {
         removeChild(this.bgHolder);
         removeChild(this.mainMask);
         this.bgHolder = null;
      }

      public function newGame():void
      {
         var _loc3_:int = 0;
         this.gameStory = 1;
         this.specialDialogues = new Array(false, false, false, false, false, false, false, false, false, false, false, false);
         this.specialEvents = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
         this.exileClasses = new Array(0, 0, 0, 0, 0, 0, 0);
         this.charClass(2);
         this.charData[16] = 500;
         var _loc1_:int = 0;
         while (_loc1_ < 4)
         {
            this.activeMission[_loc1_] = new Array();
            _loc3_ = 0;
            while (_loc3_ < 4)
            {
               this.activeMission[_loc1_][_loc3_] = new Array();
               this.activeMission[_loc1_][_loc3_] = new Array("void", "", 0);
               _loc3_++;
            }
            _loc1_++;
         }
         this.activeMission[5] = new Array();
         var _loc2_:int = 0;
         while (_loc2_ < 77)
         {
            this.activeMission[5][_loc2_] = false;
            _loc2_++;
         }
         this.newGameDeck();
         this.createGear();
         this.mouseLock = true;
         this.saveGame();
         this.loadChapter(4);
      }

      public function devGame():void
      {
         var _loc4_:int = 0;
         this.gameStory = 156;
         this.specialDialogues = new Array(true, true, true, true, true, true, true, true, true, true, true, true);
         this.specialEvents = new Array(3, 3, 3, 3, 3, 3, 3, 3, 3, 3, "", 1, 1, 1, 1, 1, 1, 1, 1, 1, "", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
         this.exileClasses = new Array(70, 70, 70, 70, 70, 70, 70);
         this.charClass(2);
         this.charData[16] = 500;
         var _loc1_:int = 0;
         while (_loc1_ < 4)
         {
            this.activeMission[_loc1_] = new Array();
            _loc4_ = 0;
            while (_loc4_ < 4)
            {
               this.activeMission[_loc1_][_loc4_] = new Array();
               this.activeMission[_loc1_][_loc4_] = new Array("void", "", 0);
               _loc4_++;
            }
            _loc1_++;
         }
         var _loc2_:Array = this.getMissionText(34);
         this.activeMission[0] = new Array(4);
         this.activeMission[0][0] = _loc2_.concat();
         this.activeMission[0][0][2] = 2;
         this.activeMission[0][0][3] = 34;
         this.activeMission[0][1] = new Array("void", "", 0, 0);
         this.activeMission[0][2] = new Array("void", "", 0, 0);
         this.activeMission[0][3] = new Array("void", "", 0, 0);
         this.activeMission[5] = new Array();
         var _loc3_:int = 0;
         while (_loc3_ < 77)
         {
            this.activeMission[5][_loc3_] = false;
            _loc3_++;
         }
         this.devGameDeck();
         this.devCreateGear();
         this.mouseLock = true;
         this.saveGame();
         this.loadWorldMap();
      }

      public function contGame():void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         this.loadData = this.save.data.mainSlot;
         this.gameStory = this.loadData[0];
         this.gearInventory = new Array();
         this.exileRunes = new Array();
         this.exileInventory = new Array();
         this.cardInventory = new Array();
         this.inventoryDeck = new Array();
         this.exileClasses = new Array();
         this.specialDialogues = new Array();
         var _loc1_:int = 0;
         while (_loc1_ < this.loadData[1].length)
         {
            this.gearInventory[_loc1_] = this.loadData[1][_loc1_].concat();
            _loc1_++;
         }
         var _loc2_:int = 0;
         while (_loc2_ < this.loadData[2].length)
         {
            this.exileInventory[_loc2_] = new Array();
            this.exileInventory[_loc2_][0] = this.loadData[2][_loc2_][0].concat();
            this.exileInventory[_loc2_][1] = this.loadData[2][_loc2_][1].concat();
            _loc2_++;
         }
         var _loc3_:int = 0;
         while (_loc3_ < this.loadData[3].length)
         {
            this.cardInventory[_loc3_] = new Array();
            this.cardInventory[_loc3_][0] = this.loadData[3][_loc3_][0].concat();
            this.cardInventory[_loc3_][1] = this.loadData[3][_loc3_][1].concat();
            this.cardInventory[_loc3_][2] = this.loadData[3][_loc3_][2].concat();
            _loc3_++;
         }
         var _loc4_:int = 0;
         while (_loc4_ < 15)
         {
            this.inventoryDeck[_loc4_] = new Array();
            if (this.loadData[4][_loc4_] != "0000")
            {
               this.inventoryDeck[_loc4_][0] = this.loadData[4][_loc4_][0].concat();
               this.inventoryDeck[_loc4_][1] = this.loadData[4][_loc4_][1].concat();
               this.inventoryDeck[_loc4_][2] = this.loadData[4][_loc4_][2].concat();
            }
            else
            {
               this.inventoryDeck[_loc4_][0] = "0000";
            }
            _loc4_++;
         }
         this.charData = this.loadData[5].concat();
         var _loc5_:int = 0;
         while (_loc5_ < this.loadData[6].length)
         {
            this.exileRunes[_loc5_] = this.loadData[6][_loc5_].concat();
            _loc5_++;
         }
         this.exileClasses = this.loadData[7].concat();
         this.specialDialogues = this.loadData[8].concat();
         this.specialEvents = this.loadData[9].concat();
         if (this.loadData[11] != null)
         {
            _loc6_ = 0;
            while (_loc6_ < 4)
            {
               this.activeMission[_loc6_] = new Array();
               _loc7_ = 0;
               while (_loc7_ < 4)
               {
                  this.activeMission[_loc6_][_loc7_] = new Array();
                  this.activeMission[_loc6_][_loc7_] = this.loadData[11][_loc6_][_loc7_].concat();
                  _loc7_++;
               }
               _loc6_++;
            }
            this.activeMission[5] = this.loadData[11][5].concat();
         }
         else
         {
            _loc8_ = 0;
            while (_loc8_ < 4)
            {
               this.activeMission[_loc8_] = new Array();
               _loc10_ = 0;
               while (_loc10_ < 4)
               {
                  this.activeMission[_loc8_][_loc10_] = new Array();
                  this.activeMission[_loc8_][_loc10_] = new Array("void", "", 0);
                  _loc10_++;
               }
               _loc8_++;
            }
            this.activeMission[5] = new Array();
            _loc9_ = 0;
            while (_loc9_ < 77)
            {
               this.activeMission[5][_loc9_] = false;
               _loc9_++;
            }
         }
         if (this.gameStory < 5)
         {
            this.loadMap(2);
         }
         else
         {
            this.loadWorldMap();
         }
      }

      public function loadChapter(param1:int):void
      {
         this.gameState = -2;
         if (this.bgHolder != null)
         {
            removeChild(this.bgHolder);
            this.bgHolder = null;
         }
         this.bgHolder = new asChapter();
         if (param1 != 10)
         {
            this.bgHolder.txtNum.text = "Chapter " + param1;
         }
         else
         {
            this.bgHolder.txtNum.text = "";
         }
         this.bgHolder.txtTitle.text = this.getChap(param1);
         this.gameFader = new asFader();
         this.gameFader.stop();
         addChild(this.bgHolder);
         addChild(this.gameFader);
      }

      public function unloadChapter():void
      {
         removeChild(this.bgHolder);
         this.bgHolder = null;
         if (this.gameStory == 1)
         {
            this.dialogue = new MovieClip();
            this.diaLock = true;
         }
      }

      public function getChap(param1:int):String
      {
         switch (true)
         {
            case param1 == 10:
               return "第二幕结束";
            case param1 == 9:
               return "漫长征途";
            case param1 == 8:
               return "未完之事";
            case param1 == 7:
               return "王牌与计谋";
            case param1 == 6:
               return "坚守阵地";
            case param1 == 5:
               return "幻象与现实";
            case param1 == 4:
               return "回归基础";
            default:
               return "What... what whaaaat!";
         }
      }

      public function createGear():void
      {
         this.gearInventory = new Array();
         var _loc1_:int = 0;
         while (_loc1_ < 5)
         {
            switch (true)
            {
               case _loc1_ == 0:
                  this.gearInventory[_loc1_] = new Array(1, 1, 1);
                  break;
               case _loc1_ == 1:
                  this.gearInventory[_loc1_] = new Array(2, 1, 1);
                  break;
               case _loc1_ == 2:
                  this.gearInventory[_loc1_] = new Array(3, 1, 1);
                  break;
               case _loc1_ == 3:
                  this.gearInventory[_loc1_] = new Array(4, 1, 1);
                  break;
               case _loc1_ == 4:
                  this.gearInventory[_loc1_] = new Array(5, 1, 1);
                  break;
            }
            _loc1_++;
         }
      }

      public function devCreateGear():void
      {
         this.gearInventory = new Array();
         var _loc1_:int = 0;
         while (_loc1_ < 21)
         {
            switch (true)
            {
               case _loc1_ == 0:
                  this.gearInventory[_loc1_] = new Array(1, 4, 1);
                  break;
               case _loc1_ == 1:
                  this.gearInventory[_loc1_] = new Array(2, 4, 1);
                  break;
               case _loc1_ == 2:
                  this.gearInventory[_loc1_] = new Array(3, 5, 1);
                  break;
               case _loc1_ == 3:
                  this.gearInventory[_loc1_] = new Array(4, 4, 1);
                  break;
               case _loc1_ == 4:
                  this.gearInventory[_loc1_] = new Array(5, 5, 1);
                  break;
               case _loc1_ == 5:
                  this.gearInventory[_loc1_] = new Array(3, 8, 1);
                  break;
               case _loc1_ == 6:
                  this.gearInventory[_loc1_] = new Array(3, 8, 1);
                  break;
               case _loc1_ == 7:
                  this.gearInventory[_loc1_] = new Array(1, 4, 1);
                  break;
               case _loc1_ == 8:
                  this.gearInventory[_loc1_] = new Array(1, 1, 2);
                  break;
               case _loc1_ == 9:
                  this.gearInventory[_loc1_] = new Array(1, 2, 2);
                  break;
               case _loc1_ == 10:
                  this.gearInventory[_loc1_] = new Array(1, 3, 2);
                  break;
               case _loc1_ == 11:
                  this.gearInventory[_loc1_] = new Array(2, 1, 2);
                  break;
               case _loc1_ == 12:
                  this.gearInventory[_loc1_] = new Array(2, 2, 2);
                  break;
               case _loc1_ == 13:
                  this.gearInventory[_loc1_] = new Array(3, 1, 2);
                  break;
               case _loc1_ == 14:
                  this.gearInventory[_loc1_] = new Array(3, 2, 2);
                  break;
               case _loc1_ == 15:
                  this.gearInventory[_loc1_] = new Array(4, 1, 2);
                  break;
               case _loc1_ == 16:
                  this.gearInventory[_loc1_] = new Array(4, 2, 2);
                  break;
               case _loc1_ == 17:
                  this.gearInventory[_loc1_] = new Array(5, 1, 2);
                  break;
               case _loc1_ == 18:
                  this.gearInventory[_loc1_] = new Array(5, 2, 2);
                  break;
               case _loc1_ == 19:
                  this.gearInventory[_loc1_] = new Array(6, 1, 2);
                  break;
               case _loc1_ == 20:
                  this.gearInventory[_loc1_] = new Array(6, 2, 2);
                  break;
            }
            _loc1_++;
         }
      }

      public function newGameDeck():void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.exileInventory = new Array();
         this.exileClasses = new Array(0, 0, 0, 0, 0, 0, 0);
         this.exileRunes = new Array();
         this.cardInventory = new Array();
         this.inventoryDeck = new Array();
         var _loc1_:int = 0;
         while (_loc1_ < 15)
         {
            this.inventoryDeck[_loc1_] = new Array("0000");
            _loc1_++;
         }
         var _loc2_:int = 0;
         while (_loc2_ < 1)
         {
            _loc3_ = Math.floor(Math.random() * 2);
            if (_loc3_ == 0)
            {
               _loc3_ = 4;
            }
            switch (true)
            {
               case _loc2_ == 0:
                  this.cardInventory[_loc2_] = this.createCard(1, 1, 1, 0, 1);
            }
            this.cardInventory[_loc2_][0][8] = -1;
            this.cardInventory[_loc2_][0][9] = _loc2_;
            if (_loc2_ < 1)
            {
               this.cardInventory[_loc2_][0][8] = _loc2_;
               this.inventoryDeck[_loc2_] = new Array();
               _loc4_ = 0;
               while (_loc4_ < 3)
               {
                  this.inventoryDeck[_loc2_][_loc4_] = this.cardInventory[_loc2_][_loc4_].concat();
                  _loc4_++;
               }
            }
            _loc2_++;
         }
      }

      public function devGameDeck():void
      {
         var _loc3_:int = 0;
         this.exileInventory = new Array();
         this.exileClasses = new Array(0, 0, 0, 0, 0, 0, 0);
         this.exileRunes = new Array();
         this.cardInventory = new Array();
         this.inventoryDeck = new Array();
         var _loc1_:int = 0;
         while (_loc1_ < 15)
         {
            this.inventoryDeck[_loc1_] = new Array("0000");
            _loc1_++;
         }
         var _loc2_:int = 0;
         while (_loc2_ < 37)
         {
            switch (true)
            {
               case _loc2_ == 0:
                  this.cardInventory[_loc2_] = this.createCard(1, 1, 1, 0, 1);
                  break;
               case _loc2_ == 1:
                  this.cardInventory[_loc2_] = this.createCard(2, 1, 1, 0, 1);
                  break;
               case _loc2_ == 2:
                  this.cardInventory[_loc2_] = this.createCard(4, 1, 1, 0, 1);
                  break;
               case _loc2_ == 3:
                  this.cardInventory[_loc2_] = this.createCard(5, 1, 1, 0, 1);
                  break;
               case _loc2_ == 4:
                  this.cardInventory[_loc2_] = this.createCard(6, 1, 1, 0, 1);
                  break;
               case _loc2_ == 5:
                  this.cardInventory[_loc2_] = this.createCard(1, 2, 1, 0, 1);
                  break;
               case _loc2_ == 6:
                  this.cardInventory[_loc2_] = this.createCard(2, 2, 1, 0, 1);
                  break;
               case _loc2_ == 7:
                  this.cardInventory[_loc2_] = this.createCard(4, 2, 1, 0, 1);
                  break;
               case _loc2_ == 8:
                  this.cardInventory[_loc2_] = this.createCard(5, 2, 1, 0, 1);
                  break;
               case _loc2_ == 9:
                  this.cardInventory[_loc2_] = this.createCard(6, 2, 1, 0, 1);
                  break;
               case _loc2_ == 10:
                  this.cardInventory[_loc2_] = this.createCard(1, 3, 1, 0, 1);
                  break;
               case _loc2_ == 11:
                  this.cardInventory[_loc2_] = this.createCard(2, 3, 1, 0, 1);
                  break;
               case _loc2_ == 12:
                  this.cardInventory[_loc2_] = this.createCard(4, 3, 1, 0, 1);
                  break;
               case _loc2_ == 13:
                  this.cardInventory[_loc2_] = this.createCard(5, 3, 1, 0, 1);
                  break;
               case _loc2_ == 14:
                  this.cardInventory[_loc2_] = this.createCard(6, 3, 1, 0, 1);
                  break;
               case _loc2_ == 15:
                  this.cardInventory[_loc2_] = this.createCard(1, 4, 1, 0, 1);
                  break;
               case _loc2_ == 16:
                  this.cardInventory[_loc2_] = this.createCard(2, 4, 1, 0, 1);
                  break;
               case _loc2_ == 17:
                  this.cardInventory[_loc2_] = this.createCard(4, 4, 1, 0, 1);
                  break;
               case _loc2_ == 18:
                  this.cardInventory[_loc2_] = this.createCard(5, 4, 1, 0, 1);
                  break;
               case _loc2_ == 19:
                  this.cardInventory[_loc2_] = this.createCard(3, 4, 1, 0, 1);
                  break;
               case _loc2_ == 20:
                  this.cardInventory[_loc2_] = this.createCard(1, 5, 1, 0, 1);
                  break;
               case _loc2_ == 21:
                  this.cardInventory[_loc2_] = this.createCard(2, 5, 1, 0, 1);
                  break;
               case _loc2_ == 22:
                  this.cardInventory[_loc2_] = this.createCard(4, 5, 1, 0, 1);
                  break;
               case _loc2_ == 23:
                  this.cardInventory[_loc2_] = this.createCard(5, 5, 1, 0, 1);
                  break;
               case _loc2_ == 24:
                  this.cardInventory[_loc2_] = this.createCard(6, 5, 1, 0, 1);
                  break;
               case _loc2_ == 25:
                  this.cardInventory[_loc2_] = this.createCard(1, 6, 1, 0, 1);
                  break;
               case _loc2_ == 26:
                  this.cardInventory[_loc2_] = this.createCard(2, 6, 1, 0, 1);
                  break;
               case _loc2_ == 27:
                  this.cardInventory[_loc2_] = this.createCard(4, 6, 1, 0, 1);
                  break;
               case _loc2_ == 28:
                  this.cardInventory[_loc2_] = this.createCard(5, 6, 1, 0, 1);
                  break;
               case _loc2_ == 29:
                  this.cardInventory[_loc2_] = this.createCard(6, 6, 1, 0, 1);
                  break;
               case _loc2_ == 30:
                  this.cardInventory[_loc2_] = this.createCard(9, 1, 5, 2, 6);
                  break;
               case _loc2_ == 31:
                  this.cardInventory[_loc2_] = this.createCard(9, 2, 5, 3, 4);
                  break;
               case _loc2_ == 32:
                  this.cardInventory[_loc2_] = this.createCard(9, 3, 6, 5, 4);
                  break;
               case _loc2_ == 33:
                  this.cardInventory[_loc2_] = this.createCard(9, 4, 5, 1, 6);
                  break;
               case _loc2_ == 34:
                  this.cardInventory[_loc2_] = this.createCard(9, 5, 4, 4, 4);
                  break;
               case _loc2_ == 35:
                  this.cardInventory[_loc2_] = this.createCard(10, 2, 6, 6, 4);
                  break;
               case _loc2_ == 36:
                  this.cardInventory[_loc2_] = this.createCard(10, 4, 6, 1, 7);
            }
            this.cardInventory[_loc2_][0][8] = -1;
            this.cardInventory[_loc2_][0][9] = _loc2_;
            if (_loc2_ < 15)
            {
               this.cardInventory[_loc2_][0][8] = _loc2_;
               this.inventoryDeck[_loc2_] = new Array();
               _loc3_ = 0;
               while (_loc3_ < 3)
               {
                  this.inventoryDeck[_loc2_][_loc3_] = this.cardInventory[_loc2_][_loc3_].concat();
                  _loc3_++;
               }
            }
            _loc2_++;
         }
      }

      public function createDeck():void
      {
         var _loc3_:int = 0;
         this.cardInventory = new Array();
         this.inventoryDeck = new Array();
         var _loc1_:int = 0;
         while (_loc1_ < 15)
         {
            this.inventoryDeck[_loc1_] = new Array("0000");
            _loc1_++;
         }
         var _loc2_:int = 0;
         while (_loc2_ < 10)
         {
            switch (true)
            {
               case _loc2_ == 0:
                  this.cardInventory[_loc2_] = this.createCard(1, 1, 1, 0, 1);
                  break;
               case _loc2_ == 1:
                  this.cardInventory[_loc2_] = this.createCard(4, 1, 1, 0, 1);
                  break;
               case _loc2_ == 2:
                  this.cardInventory[_loc2_] = this.createCard(1, 2, 1, 0, 1);
                  break;
               case _loc2_ == 3:
                  this.cardInventory[_loc2_] = this.createCard(4, 2, 1, 0, 1);
                  break;
               case _loc2_ == 4:
                  this.cardInventory[_loc2_] = this.createCard(1, 3, 1, 0, 1);
                  break;
               case _loc2_ == 5:
                  this.cardInventory[_loc2_] = this.createCard(4, 3, 1, 0, 1);
                  break;
               case _loc2_ == 6:
                  this.cardInventory[_loc2_] = this.createCard(1, 4, 1, 0, 1);
                  break;
               case _loc2_ == 7:
                  this.cardInventory[_loc2_] = this.createCard(4, 4, 1, 0, 1);
                  break;
               case _loc2_ == 8:
                  this.cardInventory[_loc2_] = this.createCard(1, 5, 1, 0, 1);
                  break;
               case _loc2_ == 9:
                  this.cardInventory[_loc2_] = this.createCard(4, 5, 1, 0, 1);
            }
            this.cardInventory[_loc2_][0][8] = -1;
            this.cardInventory[_loc2_][0][9] = _loc2_;
            if (_loc2_ < 15)
            {
               this.cardInventory[_loc2_][0][8] = _loc2_;
               this.inventoryDeck[_loc2_] = new Array();
               _loc3_ = 0;
               while (_loc3_ < 3)
               {
                  this.inventoryDeck[_loc2_][_loc3_] = this.cardInventory[_loc2_][_loc3_].concat();
                  _loc3_++;
               }
            }
            _loc2_++;
         }
      }

      public function gameTick(param1:Event):void
      {
         switch (true)
         {
            case this.gameState == -5:
               this.checkFader();
               break;
            case this.gameState == -3:
               this.checkFader();
               break;
            case this.gameState == -2:
               this.checkFader();
               break;
            case this.gameState == 1:
               this.checkFader();
               break;
            case this.gameState == 3:
               this.checkFader();
               break;
            case this.gameState == 4:
               this.checkDia();
               break;
            case this.gameState == 5:
               this.checkFader();
               break;
            case this.gameState == 6:
               this.checkDia();
               break;
            case this.gameState == 7:
               this.checkFader();
               break;
            case this.gameState == 8:
               this.combatTick();
               break;
            case this.gameState == 9:
               this.checkFader();
               break;
            case this.gameState == 10:
               this.inventoryTick();
               break;
            case this.gameState == 12:
               this.checkFader();
               break;
            case this.gameState == 13:
               this.bossTick();
               break;
            case this.gameState == 14:
               this.checkFader();
               break;
            case this.gameState == 15:
               this.exileTick();
         }
      }

      public function mouseS(param1:MouseEvent):void
      {
         switch (true)
         {
            case this.gameState == 10 && param1.delta > 0:
               this.invScroll(0);
               break;
            case this.gameState == 10 && param1.delta < 0:
               this.invScroll(1);
         }
      }

      public function mouseClick(param1:MouseEvent):void
      {
         if (param1.target.name == "btnFlee" && this.gameState == 8 && !this.skillLock && this.combatLevel != 1)
         {
            this.combatState = 12;
            this.combatFail(this.combatLevel);
         }
         else if (!this.mouseLock && !this.diaLock)
         {
            switch (true)
            {
               case this.gameState == -4:
                  this.loadLogo();
                  break;
               case this.gameState == -6:
                  this.prepGame();
                  break;
               case this.gameState == -1 && this.gameStory < 5:
                  this.unloadChapter();
                  this.loadMap(2);
                  break;
               case this.gameState == -1 && this.gameStory == 10:
                  this.unloadChapter();
                  this.loadMap(2);
                  break;
               case this.gameState == -1:
                  this.unloadChapter();
                  this.loadWorldMap();
                  break;
               case this.gameState == 2 && param1.target.name == "btnL":
                  this.setQuality(1);
                  break;
               case this.gameState == 2 && param1.target.name == "btnM":
                  this.setQuality(2);
                  break;
               case this.gameState == 2 && param1.target.name == "btnH":
                  this.setQuality(3);
                  break;
               case this.gameState == 2 && param1.target.name == "btnNew":
                  this.unloadTitle();
                  this.newGame();
                  break;
               case this.gameState == 2 && param1.target.name == "btnLoad":
                  this.unloadTitle();
                  this.devGame();
                  break;
               case this.gameState == 2 && param1.target.name == "btnCont":
                  this.unloadTitle();
                  this.contGame();
                  break;
               case this.gameState == 4 && param1.target.name == "btnL":
                  this.setQuality(1);
                  break;
               case this.gameState == 4 && param1.target.name == "btnM":
                  this.setQuality(2);
                  break;
               case this.gameState == 4 && param1.target.name == "btnH":
                  this.setQuality(3);
                  break;
               case this.gameState == 4 && param1.target.name == "btnSave":
                  param1.target.alpha = 0;
                  this.saveGame();
                  break;
               case this.gameState == 4 && param1.target.name == "btnArmy":
                  this.unloadWorldMap();
                  this.loadInventory();
                  break;
               case this.gameState == 4 && param1.target.name == "map7":
                  this.unloadWorldMap();
                  this.loadExile();
                  break;
               case this.gameState == 4 && param1.target.name == "btnExit":
                  this.unloadWorldMap();
                  this.loadTitle();
                  break;
               case this.gameState == 4 && param1.target.name == "map1":
                  this.unloadWorldMap();
                  this.loadMap(1);
                  break;
               case this.gameState == 4 && param1.target.name == "map2":
                  this.unloadWorldMap();
                  this.loadMap(2);
                  break;
               case this.gameState == 4 && param1.target.name == "map3":
                  this.unloadWorldMap();
                  this.loadMap(3);
                  break;
               case this.gameState == 4 && param1.target.name == "map4":
                  this.unloadWorldMap();
                  this.loadMap(4);
                  break;
               case this.gameState == 4 && param1.target.name == "map5":
                  this.unloadWorldMap();
                  this.loadMap(5);
                  break;
               case this.gameState == 4 && param1.target.name == "map6":
                  this.unloadWorldMap();
                  this.loadMap(6);
                  break;
               case this.gameState == 6 && param1.target.name == "btnSubExit":
                  this.unloadMap();
                  this.loadWorldMap();
                  break;
               case this.gameState == 6 && param1.target.name == "arrowCF" && this.gameStory > 4:
                  this.unloadMap();
                  this.loadMap(1);
                  break;
               case this.gameState == 6 && param1.target.name == "arrowSF" && this.gameStory > 4:
                  this.unloadMap();
                  this.loadMap(2);
                  break;
               case this.gameState == 6 && param1.target.name == "arrowTW" && this.gameStory > 4:
                  this.unloadMap();
                  this.loadMap(3);
                  break;
               case this.gameState == 6 && param1.target.name == "arrowDR" && this.gameStory > 4:
                  this.unloadMap();
                  this.loadMap(4);
                  break;
               case this.gameState == 6 && param1.target.name == "arrowTB" && this.gameStory > 4:
                  this.unloadMap();
                  this.loadMap(5);
                  break;
               case this.gameState == 6 && param1.target.name == "arrowDC" && this.gameStory > 4:
                  this.unloadMap();
                  this.loadMap(6);
                  break;
               case this.gameState == 6 && param1.target.name == "combat1" && this.gameStory < 5 && this.currentMap == 2:
                  this.unloadMap();
                  this.loadCombat(1);
                  break;
               case this.gameState == 6 && param1.target.name == "combat1" && this.gameStory >= 55 && this.currentMap == 2:
                  this.unloadMap();
                  this.loadCombat(98);
                  break;
               case this.gameState == 6 && param1.target.name == "combat1" && this.gameStory > 4 && this.currentMap == 2:
                  this.unloadMap();
                  this.loadCombat(99);
                  break;
               case this.gameState == 6 && param1.target.name == "combat2" && this.gameStory > 4 && this.currentMap == 2:
                  this.unloadMap();
                  this.loadCombat(2);
                  break;
               case this.gameState == 6 && param1.target.name == "combat1" && this.gameStory > 10 && this.currentMap == 1:
                  this.unloadMap();
                  this.loadCombat(3);
                  break;
               case this.gameState == 6 && param1.target.name == "combat2" && this.gameStory > 15 && this.currentMap == 1:
                  this.unloadMap();
                  this.loadCombat(4);
                  break;
               case this.gameState == 6 && param1.target.name == "combat3" && this.gameStory > 20 && this.currentMap == 1:
                  this.unloadMap();
                  this.loadCombat(5);
                  break;
               case this.gameState == 6 && param1.target.name == "combat4" && this.gameStory > 35 && this.currentMap == 1:
                  this.unloadMap();
                  this.loadCombat(6);
                  break;
               case this.gameState == 6 && param1.target.name == "combat4" && this.gameStory > 30 && this.currentMap == 1:
                  this.unloadMap();
                  this.loadBossCombat(100);
                  break;
               case this.gameState == 6 && param1.target.name == "combat4" && this.gameStory > 25 && this.currentMap == 1:
                  this.unloadMap();
                  this.loadCombat(6);
                  break;
               case this.gameState == 6 && param1.target.name == "combat5" && this.gameStory > 35 && this.currentMap == 1:
                  this.unloadMap();
                  this.loadCombat(7);
                  break;
               case this.gameState == 6 && param1.target.name == "combat1" && this.gameStory > 40 && this.currentMap == 3:
                  this.unloadMap();
                  this.loadCombat(8);
                  break;
               case this.gameState == 6 && param1.target.name == "combat7" && this.gameStory > 45 && this.currentMap == 2:
                  this.unloadMap();
                  this.loadCombat(9);
                  break;
               case this.gameState == 6 && param1.target.name == "combat3" && this.gameStory > 50 && this.gameStory < 55 && this.currentMap == 2:
                  this.unloadMap();
                  this.loadCombat(10);
                  break;
               case this.gameState == 6 && param1.target.name == "combat6" && this.gameStory > 55 && this.currentMap == 2:
                  this.unloadMap();
                  this.loadCombat(11);
                  break;
               case this.gameState == 6 && param1.target.name == "combat4" && this.gameStory > 60 && this.currentMap == 2:
                  this.unloadMap();
                  this.loadCombat(12);
                  break;
               case this.gameState == 6 && param1.target.name == "combat5" && this.gameStory > 65 && this.currentMap == 2:
                  this.unloadMap();
                  this.loadCombat(13);
                  break;
               case this.gameState == 6 && param1.target.name == "combat1" && this.gameStory > 70 && this.currentMap == 4:
                  this.unloadMap();
                  this.loadCombat(14);
                  break;
               case this.gameState == 6 && param1.target.name == "combat2" && this.gameStory > 75 && this.currentMap == 4:
                  this.unloadMap();
                  this.loadCombat(15);
                  break;
               case this.gameState == 6 && param1.target.name == "combat3" && this.gameStory >= 90 && this.currentMap == 4:
                  this.unloadMap();
                  this.loadCombat(16);
                  break;
               case this.gameState == 6 && param1.target.name == "combat3" && this.gameStory > 85 && this.currentMap == 4:
                  this.unloadMap();
                  this.loadBossCombat(101);
                  break;
               case this.gameState == 6 && param1.target.name == "combat3" && this.gameStory > 80 && this.currentMap == 4:
                  this.unloadMap();
                  this.loadCombat(16);
                  break;
               case this.gameState == 6 && param1.target.name == "combat4" && this.gameStory > 90 && this.currentMap == 4:
                  this.unloadMap();
                  this.loadCombat(17);
                  break;
               case this.gameState == 6 && param1.target.name == "combat2" && this.gameStory > 95 && this.currentMap == 3:
                  this.unloadMap();
                  this.loadCombat(18);
                  break;
               case this.gameState == 6 && param1.target.name == "combat3" && this.gameStory > 100 && this.gameStory < 105 && this.currentMap == 3:
                  this.unloadMap();
                  this.loadBossCombat(102);
                  break;
               case this.gameState == 6 && param1.target.name == "combat1" && this.gameStory > 105 && this.currentMap == 5:
                  this.unloadMap();
                  this.loadCombat(19);
                  break;
               case this.gameState == 6 && param1.target.name == "combat2" && this.gameStory > 110 && this.currentMap == 5:
                  this.unloadMap();
                  this.loadCombat(20);
                  break;
               case this.gameState == 6 && param1.target.name == "combat3" && this.gameStory > 115 && this.currentMap == 5:
                  this.unloadMap();
                  this.loadCombat(21);
                  break;
               case this.gameState == 6 && param1.target.name == "combat4" && this.gameStory > 130 && this.currentMap == 5:
                  this.unloadMap();
                  this.loadCombat(22);
                  break;
               case this.gameState == 6 && param1.target.name == "combat4" && this.gameStory > 125 && this.currentMap == 5:
                  this.unloadMap();
                  this.loadBossCombat(105);
                  break;
               case this.gameState == 6 && param1.target.name == "combat4" && this.gameStory > 120 && this.currentMap == 5:
                  this.unloadMap();
                  this.loadCombat(22);
                  break;
               case this.gameState == 6 && param1.target.name == "combat5" && this.gameStory > 130 && this.currentMap == 5:
                  this.unloadMap();
                  this.loadCombat(23);
                  break;
               case this.gameState == 6 && param1.target.name == "combat1" && this.gameStory > 135 && this.currentMap == 6:
                  this.unloadMap();
                  this.loadCombat(24);
                  break;
               case this.gameState == 6 && param1.target.name == "combat2" && this.gameStory > 140 && this.currentMap == 6:
                  this.unloadMap();
                  this.loadCombat(25);
                  break;
               case this.gameState == 6 && param1.target.name == "combat3" && this.gameStory > 145 && this.currentMap == 6:
                  this.unloadMap();
                  this.loadCombat(26);
                  break;
               case this.gameState == 6 && param1.target.name == "combat4" && this.gameStory > 150 && this.currentMap == 6:
                  this.unloadMap();
                  this.loadCombat(27);
                  break;
               case this.gameState == 6 && param1.target.name == "combat5" && this.gameStory >= 165 && this.currentMap == 6:
                  break;
               case this.gameState == 6 && param1.target.name == "combat5" && this.gameStory >= 160 && this.currentMap == 6:
                  this.unloadMap();
                  this.loadBossCombat(106);
                  break;
               case this.gameState == 6 && param1.target.name == "combat5" && this.gameStory > 155 && this.currentMap == 6:
                  this.unloadMap();
                  this.loadCombat(28);
                  break;
               case this.gameState == 8:
                  this.combatClick(param1);
                  break;
               case this.gameState == 10:
                  this.inventoryClick(param1);
                  break;
               case this.gameState == 13:
                  this.bossClick(param1);
                  break;
               case this.gameState == 15:
                  this.exileClick(param1);
            }
         }
         else if (this.diaLock)
         {
            this.diaClick(param1);
         }
      }

      public function rightClick(param1:MouseEvent):void
      {
      }

      public function mouseD(param1:MouseEvent):void
      {
         if (!this.mouseLock && !this.diaLock)
         {
            switch (true)
            {
               case this.gameState == 10 && param1.target.name == "scrollUp":
                  this.scrollDir = 0;
                  this.scrollLock = true;
                  break;
               case this.gameState == 10 && param1.target.name == "scrollDown":
                  this.scrollDir = 1;
                  this.scrollLock = true;
                  break;
               case this.gameState == 15 && param1.target.name == "scrollUp":
                  this.scrollDir = 0;
                  this.scrollLock = true;
                  break;
               case this.gameState == 15 && param1.target.name == "scrollDown":
                  this.scrollDir = 1;
                  this.scrollLock = true;
                  break;
               case this.gameState == 15 && param1.target.name == "scrollUp_2":
                  this.scrollDir = 0;
                  this.scrollLock_2 = true;
                  break;
               case this.gameState == 15 && param1.target.name == "scrollDown_2":
                  this.scrollDir = 1;
                  this.scrollLock_2 = true;
            }
         }
      }

      public function mouseU(param1:MouseEvent):void
      {
         if (!this.mouseLock && !this.diaLock)
         {
            switch (true)
            {
               case this.gameState == 10:
                  this.scrollLock = false;
                  break;
               case this.gameState == 15:
                  this.scrollLock = false;
                  this.scrollLock_2 = false;
            }
         }
      }

      public function mouseOn(param1:MouseEvent):void
      {
         if (!this.mouseLock && !this.diaLock)
         {
            switch (true)
            {
               case this.gameState == 2 && param1.target.name == "btnNew":
                  this.bgHolder.btnNew.gotoAndStop(2);
                  break;
               case this.gameState == 2 && param1.target.name == "btnLoad":
                  this.bgHolder.btnLoad.gotoAndStop(2);
                  break;
               case this.gameState == 2 && param1.target.name == "btnCont":
                  this.bgHolder.btnCont.gotoAndStop(2);
                  break;
               case this.gameState == 4 && param1.target.name == "map1":
                  this.bgHolder.map1.gotoAndStop(2);
                  break;
               case this.gameState == 4 && param1.target.name == "map2":
                  this.bgHolder.map2.gotoAndStop(2);
                  break;
               case this.gameState == 4 && param1.target.name == "map3":
                  this.bgHolder.map3.gotoAndStop(2);
                  break;
               case this.gameState == 4 && param1.target.name == "map4":
                  this.bgHolder.map4.gotoAndStop(2);
                  break;
               case this.gameState == 4 && param1.target.name == "map5":
                  this.bgHolder.map5.gotoAndStop(2);
                  break;
               case this.gameState == 4 && param1.target.name == "map6":
                  this.bgHolder.map6.gotoAndStop(2);
                  break;
               case this.gameState == 4 && param1.target.name == "map7":
                  this.bgHolder.map7.gotoAndStop(2);
                  break;
               case this.gameState == 6 && param1.target.name == "combat1":
                  this.bgHolder.mapGlow.gotoAndStop(2);
                  this.bgHolder.mapLogo.gotoAndStop(2);
                  break;
               case this.gameState == 6 && param1.target.name == "combat2":
                  this.bgHolder.mapGlow.gotoAndStop(3);
                  this.bgHolder.mapLogo.gotoAndStop(3);
                  break;
               case this.gameState == 6 && param1.target.name == "combat3":
                  this.bgHolder.mapGlow.gotoAndStop(4);
                  this.bgHolder.mapLogo.gotoAndStop(4);
                  break;
               case this.gameState == 6 && param1.target.name == "combat4":
                  this.bgHolder.mapGlow.gotoAndStop(5);
                  this.bgHolder.mapLogo.gotoAndStop(5);
                  break;
               case this.gameState == 6 && param1.target.name == "combat5":
                  this.bgHolder.mapGlow.gotoAndStop(6);
                  this.bgHolder.mapLogo.gotoAndStop(6);
                  break;
               case this.gameState == 6 && param1.target.name == "combat6":
                  this.bgHolder.mapGlow.gotoAndStop(7);
                  this.bgHolder.mapLogo.gotoAndStop(7);
                  break;
               case this.gameState == 6 && param1.target.name == "combat7":
                  this.bgHolder.mapGlow.gotoAndStop(8);
                  this.bgHolder.mapLogo.gotoAndStop(8);
                  break;
               case this.gameState == 8 && param1.target.name == "btnSpec":
                  this.uiHolder.charBar.toolTip.visible = true;
                  break;
               case this.gameState == 10 && param1.target.name == "scrollUp":
                  this.inventory.army1.scrollUp.gotoAndStop(2);
                  break;
               case this.gameState == 10 && param1.target.name == "scrollDown":
                  this.inventory.army1.scrollDown.gotoAndStop(2);
                  break;
               case this.gameState == 10 && param1.target.name == "scrollUpPage":
                  this.inventory.army1.scrollUpPage.gotoAndStop(2);
                  break;
               case this.gameState == 10 && param1.target.name == "scrollDownPage":
                  this.inventory.army1.scrollDownPage.gotoAndStop(2);
                  break;
               case this.gameState == 10 && param1.target.name == "scrollUpEnd":
                  this.inventory.army1.scrollUpEnd.gotoAndStop(2);
                  break;
               case this.gameState == 10 && param1.target.name == "scrollDownEnd":
                  this.inventory.army1.scrollDownEnd.gotoAndStop(2);
                  break;
               case this.gameState == 10 && param1.target.name == "btnInvBack" && (this.inventoryDeck[0][0] != "0000" && this.inventoryDeck[1][0] != "0000" && this.inventoryDeck[2][0] != "0000"):
                  this.inventory.btnInvBack.gotoAndStop(2);
                  break;
               case this.gameState == 10 && param1.target.name == "btnInvBack" && (this.inventoryDeck[0][0] == "0000" || this.inventoryDeck[1][0] == "0000" || this.inventoryDeck[2][0] == "0000"):
                  this.inventory.btnInvBack.gotoAndStop(3);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollUp":
                  this.inventory.army1.scrollUp.gotoAndStop(2);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollDown":
                  this.inventory.army1.scrollDown.gotoAndStop(2);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollUp_2":
                  this.inventory.army1.scrollUp_2.gotoAndStop(2);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollDown_2":
                  this.inventory.army1.scrollDown_2.gotoAndStop(2);
                  break;
               case this.gameState == 15 && param1.target.name == "btnExBack":
                  this.inventory.btnExBack.gotoAndStop(2);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollUpPage":
                  this.inventory.army1.scrollUpPage.gotoAndStop(2);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollDownPage":
                  this.inventory.army1.scrollDownPage.gotoAndStop(2);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollUpEnd":
                  this.inventory.army1.scrollUpEnd.gotoAndStop(2);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollDownEnd":
                  this.inventory.army1.scrollDownEnd.gotoAndStop(2);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollUpPage_2":
                  this.inventory.army1.scrollUpPage_2.gotoAndStop(2);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollDownPage_2":
                  this.inventory.army1.scrollDownPage_2.gotoAndStop(2);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollUpEnd_2":
                  this.inventory.army1.scrollUpEnd_2.gotoAndStop(2);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollDownEnd_2":
                  this.inventory.army1.scrollDownEnd_2.gotoAndStop(2);
                  break;
               case this.gameState == 8 && param1.target.name == "oneStar":
                  this.vicSelect(1);
                  break;
               case this.gameState == 8 && param1.target.name == "twoStar":
                  this.vicSelect(2);
                  break;
               case this.gameState == 8 && param1.target.name == "threeStar":
                  this.vicSelect(3);
            }
         }
      }

      public function mouseOff(param1:MouseEvent):void
      {
         if (!this.mouseLock && !this.diaLock)
         {
            switch (true)
            {
               case this.gameState == 2 && param1.target.name == "btnNew":
                  this.bgHolder.btnNew.gotoAndStop(1);
                  break;
               case this.gameState == 2 && param1.target.name == "btnLoad":
                  this.bgHolder.btnLoad.gotoAndStop(1);
                  break;
               case this.gameState == 2 && param1.target.name == "btnCont":
                  this.bgHolder.btnCont.gotoAndStop(1);
                  break;
               case this.gameState == 4 && param1.target.name == "map1":
                  this.bgHolder.map1.gotoAndStop(1);
                  break;
               case this.gameState == 4 && param1.target.name == "map2":
                  this.bgHolder.map2.gotoAndStop(1);
                  break;
               case this.gameState == 4 && param1.target.name == "map3":
                  this.bgHolder.map3.gotoAndStop(1);
                  break;
               case this.gameState == 4 && param1.target.name == "map4":
                  this.bgHolder.map4.gotoAndStop(1);
                  break;
               case this.gameState == 4 && param1.target.name == "map5":
                  this.bgHolder.map5.gotoAndStop(1);
                  break;
               case this.gameState == 4 && param1.target.name == "map6":
                  this.bgHolder.map6.gotoAndStop(1);
                  break;
               case this.gameState == 4 && param1.target.name == "map7":
                  this.bgHolder.map7.gotoAndStop(1);
                  break;
               case this.gameState == 6 && param1.target.name == "combat1":
                  this.bgHolder.mapGlow.gotoAndStop(1);
                  this.bgHolder.mapLogo.gotoAndStop(1);
                  break;
               case this.gameState == 6 && param1.target.name == "combat2":
                  this.bgHolder.mapGlow.gotoAndStop(1);
                  this.bgHolder.mapLogo.gotoAndStop(1);
                  break;
               case this.gameState == 6 && param1.target.name == "combat3":
                  this.bgHolder.mapGlow.gotoAndStop(1);
                  this.bgHolder.mapLogo.gotoAndStop(1);
                  break;
               case this.gameState == 6 && param1.target.name == "combat4":
                  this.bgHolder.mapGlow.gotoAndStop(1);
                  this.bgHolder.mapLogo.gotoAndStop(1);
                  break;
               case this.gameState == 6 && param1.target.name == "combat5":
                  this.bgHolder.mapGlow.gotoAndStop(1);
                  this.bgHolder.mapLogo.gotoAndStop(1);
                  break;
               case this.gameState == 6 && param1.target.name == "combat6":
                  this.bgHolder.mapGlow.gotoAndStop(1);
                  this.bgHolder.mapLogo.gotoAndStop(1);
                  break;
               case this.gameState == 6 && param1.target.name == "combat7":
                  this.bgHolder.mapGlow.gotoAndStop(1);
                  this.bgHolder.mapLogo.gotoAndStop(1);
                  break;
               case this.gameState == 8 && param1.target.name == "btnSpec":
                  this.uiHolder.charBar.toolTip.visible = false;
                  break;
               case this.gameState == 10 && param1.target.name == "scrollUp":
                  this.inventory.army1.scrollUp.gotoAndStop(1);
                  break;
               case this.gameState == 10 && param1.target.name == "scrollDown":
                  this.inventory.army1.scrollDown.gotoAndStop(1);
                  break;
               case this.gameState == 10 && param1.target.name == "scrollUpPage":
                  this.inventory.army1.scrollUpPage.gotoAndStop(1);
                  break;
               case this.gameState == 10 && param1.target.name == "scrollDownPage":
                  this.inventory.army1.scrollDownPage.gotoAndStop(1);
                  break;
               case this.gameState == 10 && param1.target.name == "scrollUpEnd":
                  this.inventory.army1.scrollUpEnd.gotoAndStop(1);
                  break;
               case this.gameState == 10 && param1.target.name == "scrollDownEnd":
                  this.inventory.army1.scrollDownEnd.gotoAndStop(1);
                  break;
               case this.gameState == 10 && param1.target.name == "btnInvBack":
                  this.inventory.btnInvBack.gotoAndStop(1);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollUp":
                  this.inventory.army1.scrollUp.gotoAndStop(1);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollDown":
                  this.inventory.army1.scrollDown.gotoAndStop(1);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollUp_2":
                  this.inventory.army1.scrollUp_2.gotoAndStop(1);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollDown_2":
                  this.inventory.army1.scrollDown_2.gotoAndStop(1);
                  break;
               case this.gameState == 15 && param1.target.name == "btnExBack":
                  this.inventory.btnExBack.gotoAndStop(1);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollUpPage":
                  this.inventory.army1.scrollUpPage.gotoAndStop(1);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollDownPage":
                  this.inventory.army1.scrollDownPage.gotoAndStop(1);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollUpEnd":
                  this.inventory.army1.scrollUpEnd.gotoAndStop(1);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollDownEnd":
                  this.inventory.army1.scrollDownEnd.gotoAndStop(1);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollUpPage_2":
                  this.inventory.army1.scrollUpPage_2.gotoAndStop(1);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollDownPage_2":
                  this.inventory.army1.scrollDownPage_2.gotoAndStop(1);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollUpEnd_2":
                  this.inventory.army1.scrollUpEnd_2.gotoAndStop(1);
                  break;
               case this.gameState == 15 && param1.target.name == "scrollDownEnd_2":
                  this.inventory.army1.scrollDownEnd_2.gotoAndStop(1);
                  break;
               case this.gameState == 8 && param1.target.name == "oneStar":
                  this.vicSelect(-1);
                  break;
               case this.gameState == 8 && param1.target.name == "twoStar":
                  this.vicSelect(-2);
                  break;
               case this.gameState == 8 && param1.target.name == "threeStar":
                  this.vicSelect(-3);
            }
         }
      }

      public function checkFader():void
      {
         if (!this.diaLock)
         {
            this.gameFader.nextFrame();
            this.gameFader.stop();
            if (this.gameFader.currentFrame == this.gameFader.totalFrames)
            {
               removeChild(this.gameFader);
               this.gameFader = null;
               this.mouseLock = false;
               switch (true)
               {
                  case this.gameState == -2:
                     this.gameState = -1;
                     this.checkDia();
                     break;
                  case this.gameState == -5:
                     this.gameState = -4;
                     break;
                  case this.gameState == -3:
                     this.gameState = -6;
                     break;
                  case this.gameState == 1:
                     this.gameState = 2;
                     this.checkDia();
                     break;
                  case this.gameState == 3:
                     this.gameState = 4;
                     this.checkDia();
                     break;
                  case this.gameState == 5:
                     this.gameState = 6;
                     this.checkDia();
                     break;
                  case this.gameState == 7:
                     this.gameState = 8;
                     this.checkDia();
                     break;
                  case this.gameState == 9:
                     this.gameState = 10;
                     this.checkDia();
                     break;
                  case this.gameState == 12:
                     this.gameState = 13;
                     this.checkDia();
                     break;
                  case this.gameState == 14:
                     this.gameState = 15;
                     this.checkDia();
               }
            }
         }
         else
         {
            this.checkDia();
         }
      }

      public function diaClick(param1:MouseEvent):void
      {
         if (this.dialogue != null && param1.target.name == "btnSkip")
         {
            this.dialogue.diaSkip();
         }
         switch (true)
         {
            case this.dialogue != null && !this.dialogue.diaDone:
               this.dialogue.nextDia();
               break;
            case this.dialogue != null && this.dialogue.diaDone:
               this.unloadDia();
               break;
            case this.dialogue == null:
         }
      }

      public function loadDia(param1:int):void
      {
         this.diaLock = true;
         this.dialogue = new asDialogue();
         addChild(this.dialogue);
         addChild(this.diaMask);
         this.dialogue.mask = this.diaMask;
         this.dialogue.loadDialogue(param1);
      }

      public function unloadDia():void
      {
         if (this.combatLevel == 4 && this.combatTurn > 1)
         {
            this.eventLock = true;
            this.loadSpec(4);
         }
         if (this.combatLevel == 5 && this.combatTurn > 1)
         {
            this.eventLock = true;
            this.loadSpec(5);
         }
         if (this.combatLevel == 400)
         {
            this.combatWin(107);
         }
         if (this.gameStory == 106)
         {
            ++ this.gameStory;
            this.loadChapter(8);
         }
         if (this.gameStory == 136)
         {
            ++ this.gameStory;
            this.loadChapter(9);
         }
         removeChild(this.dialogue);
         removeChild(this.diaMask);
         this.dialogue = null;
         if (this.shavee)
         {
            this.unloadExile();
            this.loadCombat(90);
         }
         this.diaLock = false;
      }

      public function getDialogue(param1:int):void
      {
         if (param1 == 0)
         {
            this.loadDia(100000 + this.gameStory);
            this.gameStory += 1;
         }
         else
         {
            this.loadDia(param1);
         }
      }

      public function checkDia():void
      {
         switch (true)
         {
            case this.gameStory == 1 && this.gameState == 5:
               this.getDialogue(0);
               break;
            case this.gameStory == 5 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 10 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 15 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 20 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 25 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 30 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 35 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 40 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 45 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 50 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 55 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 60 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 65 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 70 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 75 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 80 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 85 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 90 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 95 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 100 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 105 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 110 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 115 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 120 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 125 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 130 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 135 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 140 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 145 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 150 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 155 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 160 && this.gameState == 6:
               this.getDialogue(0);
               break;
            case this.gameStory == 107 && this.gameState == 4:
               ++ this.gameStory;
               this.getDialogue(900007);
               break;
            case this.combatLevel == 1 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 2)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(101000);
               break;
            case this.combatLevel == 1 && this.gameState == 8 && this.combatTurn == 1:
               this.getDialogue(101001);
               break;
            case this.combatLevel == 1 && this.gameState == 8 && this.combatTurn == 2:
               this.getDialogue(101002);
               break;
            case this.combatLevel == 1 && this.gameState == 8 && this.combatTurn == 3:
               this.getDialogue(101003);
               break;
            case this.combatLevel == 1 && this.gameState == 8 && this.combatTurn == 4:
               this.getDialogue(101004);
               break;
            case this.combatLevel == 1 && this.gameState == 8 && this.combatTurn == 5:
               this.getDialogue(101005);
               break;
            case this.combatLevel == 99 && this.gameState == 8 && this.combatTurn == 0:
               this.getDialogue(101099);
               break;
            case this.combatLevel == 98 && this.gameState == 8 && this.combatTurn == 0:
               this.getDialogue(101096);
               break;
            case this.combatLevel == 97 && this.gameState == 8 && this.combatTurn == 0:
               this.getDialogue(101093);
               break;
            case this.combatLevel == 96 && this.gameState == 8 && this.combatTurn == 0:
               this.getDialogue(101090);
               break;
            case this.combatLevel == 95 && this.gameState == 8 && this.combatTurn == 0:
               this.getDialogue(101087);
               break;
            case this.combatLevel == 94 && this.gameState == 8 && this.combatTurn == 0:
               this.getDialogue(101084);
               break;
            case this.combatLevel == 93 && this.gameState == 8 && this.combatTurn == 0:
               this.getDialogue(101081);
               break;
            case this.combatLevel == 92 && this.gameState == 8 && this.combatTurn == 0:
               this.getDialogue(101078);
               break;
            case this.combatLevel == 91 && this.gameState == 8 && this.combatTurn == 0:
               this.getDialogue(101075);
               break;
            case this.combatLevel == 90 && this.gameState == 8 && this.combatTurn == 0:
               this.getDialogue(101072);
               break;
            case this.combatLevel == 2 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 6)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(102000);
               break;
            case this.combatLevel == 3 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 11)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(103000);
               break;
            case this.combatLevel == 4 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 16)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(104000);
               break;
            case this.combatLevel == 5 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 21)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(105000);
               break;
            case this.combatLevel == 6 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 26)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(106000);
               break;
            case this.combatLevel == 7 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 31)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(107000);
               break;
            case this.combatLevel == 8 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 36)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(108000);
               break;
            case this.combatLevel == 9 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 41)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(109000);
               break;
            case this.combatLevel == 10 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 51)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(111000);
               break;
            case this.combatLevel == 11 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 56)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(101100);
               break;
            case this.combatLevel == 12 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 61)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(101200);
               break;
            case this.combatLevel == 13 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 66)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(101300);
               break;
            case this.combatLevel == 14 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 71)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(101400);
               break;
            case this.combatLevel == 15 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 76)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(101500);
               break;
            case this.combatLevel == 16 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 81)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(101600);
               break;
            case this.combatLevel == 17 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 91)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(101700);
               break;
            case this.combatLevel == 18 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 96)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(101800);
               break;
            case this.combatLevel == 19 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 107)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(101900);
               break;
            case this.combatLevel == 20 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 111)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(102012);
               break;
            case this.combatLevel == 21 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 116)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(102100);
               break;
            case this.combatLevel == 22 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 121)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(102200);
               break;
            case this.combatLevel == 23 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 126)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(102300);
               break;
            case this.combatLevel == 24 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 131)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(102400);
               break;
            case this.combatLevel == 25 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 136)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(102500);
               break;
            case this.combatLevel == 26 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 141)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(102600);
               break;
            case this.combatLevel == 27 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 146)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(102700);
               break;
            case this.combatLevel == 28 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 151)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(102800);
               break;
            case this.combatLevel == 29 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 152)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(102900);
               break;
            case this.combatLevel == 30 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 153)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(133000);
               break;
            case this.combatLevel == 31 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 154)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(103100);
               break;
            case this.combatLevel == 32 && this.gameState == 8 && this.combatTurn == 0:
               if (this.gameStory == 155)
               {
                  ++ this.gameStory;
               }
               this.getDialogue(103200);
               break;
            case this.combatLevel == 100 && this.combatTurn == 1:
               this.getDialogue(200101);
               break;
            case this.combatLevel == 100 && this.combatTurn == 2:
               this.getDialogue(200102);
               break;
            case this.combatLevel == 100 && this.combatTurn == 4:
               this.getDialogue(200104);
               break;
            case this.combatLevel == 100 && this.combatTurn == 6:
               this.getDialogue(200106);
               break;
            case this.combatLevel == 101 && this.combatTurn == 1:
               this.getDialogue(200201);
               break;
            case this.combatLevel == 101 && this.combatTurn == 5:
               this.getDialogue(200205);
               break;
            case this.combatLevel == 101 && this.combatTurn == 11:
               this.getDialogue(200211);
               break;
            case this.combatLevel == 101 && this.combatTurn == 17:
               this.getDialogue(200217);
               break;
            case this.combatLevel == 102 && this.combatTurn == 0:
               this.getDialogue(200301);
               break;
            case this.combatLevel == 103 && this.combatTurn == 1:
               this.getDialogue(200401);
               break;
            case this.combatLevel == 103 && this.combatTurn == 2:
               this.getDialogue(200402);
               break;
            case this.combatLevel == 104 && this.combatTurn == 0:
               this.getDialogue(200501);
               break;
            case this.combatLevel == 105 && this.combatTurn == 0:
               this.getDialogue(200601);
               break;
            case this.combatLevel == 105 && this.combatTurn == 2:
               this.getDialogue(200602);
               break;
            case this.combatLevel == 105 && this.combatTurn == 4:
               this.getDialogue(200603);
               break;
            case this.gameState == 10 && !this.specialDialogues[0]:
               this.specialDialogues[0] = true;
               this.getDialogue(900001);
               break;
            case this.gameState == 15 && !this.specialDialogues[1]:
               this.specialDialogues[1] = true;
               this.getDialogue(900002);
               break;
            case this.gameState == 15 && !this.specialDialogues[2] && this.gameStory >= 35:
               this.specialDialogues[2] = true;
               this.getDialogue(900004);
               break;
            case this.gameState == 15 && this.inventState == 3 && !this.specialDialogues[3]:
               this.specialDialogues[3] = true;
               this.getDialogue(900005);
               break;
            case this.gameState == 15 && this.inventState == 4 && !this.specialDialogues[4]:
               this.specialDialogues[4] = true;
               this.getDialogue(900006);
         }
      }

      public function loadWorldMap():void
      {
         this.bgHolder = new asMap0(this.gameStory);
         this.gameFader = new asFader();
         this.gameFader.stop();
         addChild(this.bgHolder);
         addChild(this.gameFader);
         addChild(this.mainMask);
         this.bgHolder.mask = this.mainMask;
         this.gameState = 3;
      }

      public function unloadWorldMap():void
      {
         this.currentMap = 0;
         removeChild(this.bgHolder);
         removeChild(this.mainMask);
         this.bgHolder = null;
      }

      public function loadMap(param1:int):void
      {
         this.currentMap = param1;
         var _loc2_:Class = Class(getDefinitionByName("asMap" + param1));
         this.bgHolder = new _loc2_(this.gameStory);
         this.gameFader = new asFader();
         this.gameFader.stop();
         addChild(this.bgHolder);
         addChild(this.gameFader);
         addChild(this.mainMask);
         this.bgHolder.mask = this.mainMask;
         this.gameState = 5;
      }

      public function unloadMap():void
      {
         removeChild(this.bgHolder);
         removeChild(this.mainMask);
         this.bgHolder = null;
      }

      public function loadExile():void
      {
         this.inventory = new asExile();
         this.animationLock = false;
         this.gameFader = new asFader();
         this.gameFader.stop();
         addChild(this.inventory);
         addChild(this.mainMask);
         this.inventory.mask = this.mainMask;
         this.actualList = 0;
         this.currentGrid = 0;
         this.inventory.gotoAndStop(1);
         addChild(this.gameFader);
         this.inventState = 1;
         this.scrollLock = false;
         this.scrollDir = 0;
         this.inventory.army1.gotoAndStop(1);
         this.inventory.army1.scrollUp.stop();
         this.inventory.army1.scrollUpPage.stop();
         this.inventory.army1.scrollUpEnd.stop();
         this.inventory.army1.scrollDown.stop();
         this.inventory.army1.scrollDownPage.stop();
         this.inventory.army1.scrollDownEnd.stop();
         this.inventory.btnExBack.stop();
         this.gameState = 14;
         this.loadExileChant();
      }

      public function unloadExile():void
      {
         removeChild(this.inventory);
         removeChild(this.mainMask);
         this.inventory = null;
      }

      public function exileClick(param1:MouseEvent):void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if (!this.animationLock)
         {
            switch (true)
            {
               case param1.target.name == "btnExBack":
                  this.unloadExile();
                  this.loadWorldMap();
                  break;
               case param1.target.name == "btnChant" && this.inventState != 1:
                  this.inventState = 1;
                  this.loadExileChant();
                  break;
               case param1.target.name == "btnMart" && this.inventState != 3:
                  this.inventState = 3;
                  this.loadExileStore();
                  this.checkDia();
                  break;
               case param1.target.name == "btnTavern" && this.inventState != 4:
                  this.inventState = 4;
                  this.loadExileTavern();
                  this.checkDia();
                  break;
               case param1.target.name == "btnCraft" && this.inventState != 2 && this.gameStory >= 35:
                  this.inventState = 2;
                  this.loadExileCraft();
                  break;
               case param1.target.name == "btnCraft" && this.inventState != 2 && this.gameStory < 35:
                  this.getDialogue(900003);
                  break;
               case param1.target.name == "btnReset" && this.inventState == 2:
                  this.loadExileCraft();
                  break;
               case param1.target.name == "btnForge" && this.inventState == 2:
                  this.createNewRune();
                  break;
               case param1.target.name == "btnRumor" && this.inventState == 4:
                  this.loadRumors();
                  break;
               case param1.target.name == "btnMission" && this.inventState == 4:
                  this.loadMission();
                  break;
               case param1.target.name == "miss_1" && this.inventState == 4:
                  this.selMiss(1);
                  break;
               case param1.target.name == "miss_2" && this.inventState == 4:
                  this.selMiss(2);
                  break;
               case param1.target.name == "miss_3" && this.inventState == 4:
                  this.selMiss(3);
                  break;
               case param1.target.name == "miss_4" && this.inventState == 4:
                  this.selMiss(4);
                  break;
               case param1.target.name == "btnReset_1" && !this.activeMission[5][10]:
                  this.activeMission[5][10] = true;
                  this.resetMission(1);
                  break;
               case param1.target.name == "btnReset_2" && !this.activeMission[5][20]:
                  this.activeMission[5][20] = true;
                  this.resetMission(2);
                  break;
               case param1.target.name == "btnReset_3" && !this.activeMission[5][30]:
                  this.activeMission[5][30] = true;
                  this.resetMission(3);
                  break;
               case param1.target.name == "btnReset_4" && !this.activeMission[5][40]:
                  this.activeMission[5][40] = true;
                  this.resetMission(4);
                  break;
               case param1.target.name == "scrollUpPage":
                  this.exPage(1);
                  break;
               case param1.target.name == "scrollUpEnd":
                  this.exPage(0);
                  break;
               case param1.target.name == "scrollDownPage":
                  this.exPage(3);
                  break;
               case param1.target.name == "scrollDownEnd":
                  this.exPage(2);
                  break;
               case param1.target.name == "scrollUpPage_2":
                  this.exPage_2(1);
                  break;
               case param1.target.name == "scrollUpEnd_2":
                  this.exPage_2(0);
                  break;
               case param1.target.name == "scrollDownPage_2":
                  this.exPage_2(3);
                  break;
               case param1.target.name == "scrollDownEnd_2":
                  this.exPage_2(2);
            }
            _loc2_ = 0;
            while (_loc2_ < 755)
            {
               if (param1.target.name == "btnArmy" + _loc2_ && this.inventState == 1)
               {
                  this.unExileUnit(_loc2_);
               }
               _loc2_++;
            }
            if (this.inventState == 2)
            {
               switch (true)
               {
                  case param1.target.name == "E1":
                     this.loadCraftRune(0);
                     break;
                  case param1.target.name == "E2":
                     this.loadCraftRune(1);
                     break;
                  case param1.target.name == "E3":
                     this.loadCraftRune(2);
                     break;
                  case param1.target.name == "A1":
                     this.loadCraftRune(3);
                     break;
                  case param1.target.name == "A2":
                     this.loadCraftRune(4);
                     break;
                  case param1.target.name == "A3":
                     this.loadCraftRune(5);
                     break;
                  case param1.target.name == "F1":
                     this.loadCraftRune(6);
                     break;
                  case param1.target.name == "F2":
                     this.loadCraftRune(7);
                     break;
                  case param1.target.name == "F3":
                     this.loadCraftRune(8);
                     break;
                  case param1.target.name == "W1":
                     this.loadCraftRune(9);
                     break;
                  case param1.target.name == "W2":
                     this.loadCraftRune(10);
                     break;
                  case param1.target.name == "W3":
                     this.loadCraftRune(11);
                     break;
                  case param1.target.name == "L1":
                     this.loadCraftRune(12);
                     break;
                  case param1.target.name == "L2":
                     this.loadCraftRune(13);
                     break;
                  case param1.target.name == "L3":
                     this.loadCraftRune(14);
                     break;
                  case param1.target.name == "D1":
                     this.loadCraftRune(15);
                     break;
                  case param1.target.name == "D2":
                     this.loadCraftRune(16);
                     break;
                  case param1.target.name == "D3":
                     this.loadCraftRune(17);
               }
            }
            if (this.inventState == 3)
            {
               _loc3_ = 0;
               while (_loc3_ < this.storeInventory.length)
               {
                  if (param1.target.name == "buy_" + _loc3_)
                  {
                     this.storePurchase(_loc3_);
                  }
                  _loc3_++;
               }
               _loc4_ = 0;
               while (_loc4_ < this.gearInventory.length)
               {
                  if (param1.target.name == "sell_" + _loc4_)
                  {
                     this.storeSell(_loc4_);
                  }
                  _loc4_++;
               }
            }
            if (this.inventState == 4)
            {
               _loc5_ = 0;
               while (_loc5_ < this.cardInventory.length)
               {
                  if (param1.target.name == "munit_" + _loc5_ && this.currentGrid != 0)
                  {
                     this.munitSel(_loc5_);
                  }
                  _loc5_++;
               }
            }
         }
      }

      public function loadMission():void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:MovieClip = null;
         this.inventory.army1.gotoAndStop(6);
         this.currentGrid = 0;
         var _loc1_:int = 1;
         while (_loc1_ < 5)
         {
            if (this.activeMission[_loc1_ - 1][0][0] == "void")
            {
               this.resetMission(_loc1_);
            }
            if (!this.activeMission[5][_loc1_ * 10])
            {
               _loc3_ = new asMReset();
               _loc3_.x = 26;
               _loc3_.y = 54;
               _loc3_.name = "btnReset_" + _loc1_;
               _loc3_.mouseChildren = false;
               this.inventory.army1["mission_" + _loc1_].addChild(_loc3_);
            }
            _loc2_ = new asTokenMiss();
            _loc2_.x = 380;
            _loc2_.y = 7;
            _loc2_.name = "miss_" + _loc1_;
            _loc2_.mouseChildren = false;
            this.inventory.army1["mission_" + _loc1_].addChild(_loc2_);
            this.inventory.army1["mission_" + _loc1_].txtName.text = this.activeMission[_loc1_ - 1][0][0];
            this.inventory.army1["mission_" + _loc1_].txtDesc.text = this.activeMission[_loc1_ - 1][0][1];
            this.inventory.army1["mission_" + _loc1_].txtMiss.text = this.activeMission[_loc1_ - 1][0][2];
            if (this.activeMission[_loc1_ - 1][1][0] != "void")
            {
               if (_loc3_ != null)
               {
                  _loc3_.visible = false;
               }
               if (this.activeMission[_loc1_ - 1][0][2] == 0)
               {
                  _loc2_.gotoAndStop(4);
               }
               else
               {
                  _loc2_.gotoAndStop(3);
                  this.loadMissPort(_loc1_, _loc2_);
               }
            }
            else
            {
               _loc2_.gotoAndStop(1);
            }
            this.inventory.army1["mission_" + _loc1_].mouseEnabled = false;
            _loc1_++;
         }
         this.loadMissionUnits();
      }

      public function loadMissPort(param1:int, param2:MovieClip):void
      {
         var _loc3_:int = this.activeMission[param1 - 1][1][7] * 10 + this.activeMission[param1 - 1][2][0];
         param2.mana.text = this.activeMission[param1 - 1][1][3] + int(this.getWeapon(this.activeMission[param1 - 1][2][0], this.activeMission[param1 - 1][2][1], 3, 1, this.activeMission[param1 - 1][1][10]));
         param2.atk.text = this.activeMission[param1 - 1][1][1] + int(this.getWeapon(this.activeMission[param1 - 1][2][0], this.activeMission[param1 - 1][2][1], 1, 1, this.activeMission[param1 - 1][1][10]));
         param2.hp.text = this.activeMission[param1 - 1][1][2] + int(this.getWeapon(this.activeMission[param1 - 1][2][0], this.activeMission[param1 - 1][2][1], 2, 1, this.activeMission[param1 - 1][1][10]));
         param2.aRange.text = this.activeMission[param1 - 1][1][5] + int(this.getWeapon(this.activeMission[param1 - 1][2][0], this.activeMission[param1 - 1][2][1], 5, 1, this.activeMission[param1 - 1][1][10]));
         param2.cMove.text = this.activeMission[param1 - 1][1][4] + int(this.getWeapon(this.activeMission[param1 - 1][2][0], this.activeMission[param1 - 1][2][1], 4, 1, this.activeMission[param1 - 1][1][10]));
         param2.sName.text = this.getRune(this.activeMission[param1 - 1][3][0], this.activeMission[param1 - 1][3][1], this.activeMission[param1 - 1][1][6], 0);
         param2.uName.text = this.getTitle(this.activeMission[param1 - 1][1][7], this.activeMission[param1 - 1][2][0]);
         param2.portr.gotoAndStop(_loc3_);
         param2.cType.gotoAndStop(this.activeMission[param1 - 1][2][0]);
      }

      public function selMiss(param1:int):void
      {
         var _loc3_:int = 0;
         var _loc4_:MovieClip = null;
         var _loc2_:MovieClip = this.inventory.army1["mission_" + param1].getChildByName("miss_" + param1);
         if (_loc2_.currentFrame == 1)
         {
            this.currentGrid = param1;
            _loc3_ = 1;
            while (_loc3_ < 5)
            {
               _loc4_ = this.inventory.army1["mission_" + _loc3_].getChildByName("miss_" + _loc3_);
               if (_loc4_.currentFrame == 2)
               {
                  _loc4_.gotoAndStop(1);
               }
               _loc3_++;
            }
            _loc2_.gotoAndStop(2);
         }
         else if (_loc2_.currentFrame == 4)
         {
            this.completeMission(param1);
         }
      }

      public function munitSel(param1:int):void
      {
         var _loc2_:int = this.cardInventory[param1][0][7] * 10 + this.cardInventory[param1][1][0];
         var _loc3_:MovieClip = this.inventory.army1["mission_" + this.currentGrid].getChildByName("miss_" + this.currentGrid);
         var _loc4_:MovieClip = this.inventory.army1["mission_" + this.currentGrid].getChildByName("btnReset_" + this.currentGrid);
         if (_loc3_.currentFrame != 3)
         {
            _loc3_.gotoAndStop(3);
            _loc3_.mana.text = this.cardInventory[param1][0][3] + int(this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 3, 1, this.cardInventory[param1][0][10]));
            _loc3_.atk.text = this.cardInventory[param1][0][1] + int(this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 1, 1, this.cardInventory[param1][0][10]));
            _loc3_.hp.text = this.cardInventory[param1][0][2] + int(this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 2, 1, this.cardInventory[param1][0][10]));
            _loc3_.aRange.text = this.cardInventory[param1][0][5] + int(this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 5, 1, this.cardInventory[param1][0][10]));
            _loc3_.cMove.text = this.cardInventory[param1][0][4] + int(this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 4, 1, this.cardInventory[param1][0][10]));
            _loc3_.sName.text = this.getRune(this.cardInventory[param1][2][0], this.cardInventory[param1][2][1], this.cardInventory[param1][0][6], 0);
            _loc3_.uName.text = this.getTitle(this.cardInventory[param1][0][7], this.cardInventory[param1][1][0]);
            _loc3_.portr.gotoAndStop(_loc2_);
            _loc3_.cType.gotoAndStop(this.cardInventory[param1][1][0]);
            if (_loc4_ != null)
            {
               _loc4_.visible = false;
            }
            this.activeMission[this.currentGrid - 1][1] = this.cardInventory[param1][0].concat();
            this.activeMission[this.currentGrid - 1][2] = this.cardInventory[param1][1].concat();
            this.activeMission[this.currentGrid - 1][3] = this.cardInventory[param1][2].concat();
            this.cardInventory.splice(param1, 1);
            this.sortUnits();
            this.resetMissionList();
            this.loadMissionUnits();
         }
      }

      public function completeMission(param1:int):void
      {
         var _loc2_:MovieClip = this.inventory.army1["mission_" + param1].getChildByName("miss_" + param1);
         var _loc3_:int = int(this.cardInventory.length);
         var _loc4_:int = Math.floor(this.activeMission[param1 - 1][0][3] / 10);
         var _loc5_:int = this.activeMission[param1 - 1][0][3] - _loc4_ * 10;
         var _loc6_:int = int(this.activeMission[param1 - 1][1][7]);
         var _loc7_:int = int(this.activeMission[param1 - 1][2][0]);
         var _loc8_:int = 430000 + _loc6_ * 10 + _loc7_;
         this.cardInventory[_loc3_] = new Array();
         this.cardInventory[_loc3_][0] = this.activeMission[param1 - 1][1].concat();
         this.cardInventory[_loc3_][1] = this.activeMission[param1 - 1][2].concat();
         this.cardInventory[_loc3_][2] = this.activeMission[param1 - 1][3].concat();
         this.sortUnits();
         this.resetMissionList();
         this.loadMissionUnits();
         switch (true)
         {
            case _loc4_ == _loc6_ && _loc5_ == _loc7_:
               this.loadDia(_loc8_);
               this.cardInventory[_loc3_][0][11] += 4;
               break;
            case _loc4_ == _loc6_:
               this.loadDia(_loc8_ - 10000);
               this.cardInventory[_loc3_][0][11] += 2;
               break;
            case _loc5_ == _loc7_:
               this.loadDia(_loc8_ - 10000);
               this.cardInventory[_loc3_][0][11] += 2;
               break;
            default:
               this.loadDia(_loc8_ - 20000);
               this.cardInventory[_loc3_][0][11] += 1;
         }
         if (this.cardInventory[_loc3_][0][11] > this.cardInventory[_loc3_][0][10] * 5)
         {
            this.cardInventory[_loc3_][0][11] = 0;
            if (this.cardInventory[_loc3_][0][10] < 4)
            {
               ++ this.cardInventory[_loc3_][0][10];
            }
         }
         this.resetMission(param1);
      }

      public function resetMission(param1:int):void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:Array = new Array();
         var _loc3_:int = 1;
         while (_loc3_ < 8)
         {
            _loc7_ = 1;
            while (_loc7_ < 7)
            {
               if (!this.activeMission[5][_loc3_ * 10 + _loc7_])
               {
                  _loc2_.push(_loc3_ * 10 + _loc7_);
               }
               _loc7_++;
            }
            _loc3_++;
         }
         if (_loc2_.length < 5)
         {
            _loc8_ = 1;
            while (_loc8_ < 8)
            {
               _loc9_ = 1;
               while (_loc9_ < 7)
               {
                  this.activeMission[5][_loc8_ * 10 + _loc9_] = false;
                  _loc9_++;
               }
               _loc8_++;
            }
         }
         var _loc4_:int = Math.floor(Math.random() * _loc2_.length);
         var _loc5_:int = int(_loc2_[_loc4_]);
         var _loc6_:Array = this.getMissionText(_loc5_);
         this.activeMission[5][_loc5_] = true;
         this.activeMission[param1 - 1] = new Array(4);
         this.activeMission[param1 - 1][0] = _loc6_.concat();
         this.activeMission[param1 - 1][0][2] = 2;
         this.activeMission[param1 - 1][0][3] = _loc5_;
         this.activeMission[param1 - 1][1] = new Array("void", "", 0, 0);
         this.activeMission[param1 - 1][2] = new Array("void", "", 0, 0);
         this.activeMission[param1 - 1][3] = new Array("void", "", 0, 0);
         this.loadExileTavern();
         this.loadMission();
      }

      public function loadMissionUnits():void
      {
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         this.actualList = -1;
         this.inventory.army1.scrollUp.stop();
         this.inventory.army1.scrollUpPage.stop();
         this.inventory.army1.scrollUpEnd.stop();
         this.inventory.army1.scrollDown.stop();
         this.inventory.army1.scrollDownPage.stop();
         this.inventory.army1.scrollDownEnd.stop();
         var _loc1_:int = 0;
         while (_loc1_ < this.cardInventory.length)
         {
            if (this.cardInventory[_loc1_][0][8] == -1)
            {
               if (this.cardInventory[_loc1_][0][7] < 9)
               {
                  this.actualList += 1;
                  _loc2_ = this.cardInventory[_loc1_][0][7] * 10 + this.cardInventory[_loc1_][1][0];
                  _loc3_ = new asTokenInv();
                  _loc3_.sSpot.gotoAndStop(1);
                  _loc3_.mana.text = this.cardInventory[_loc1_][0][3] + int(this.getWeapon(this.cardInventory[_loc1_][1][0], this.cardInventory[_loc1_][1][1], 3, 1, this.cardInventory[_loc1_][0][10]));
                  _loc3_.atk.text = this.cardInventory[_loc1_][0][1] + int(this.getWeapon(this.cardInventory[_loc1_][1][0], this.cardInventory[_loc1_][1][1], 1, 1, this.cardInventory[_loc1_][0][10]));
                  _loc3_.hp.text = this.cardInventory[_loc1_][0][2] + int(this.getWeapon(this.cardInventory[_loc1_][1][0], this.cardInventory[_loc1_][1][1], 2, 1, this.cardInventory[_loc1_][0][10]));
                  _loc3_.aRange.text = this.cardInventory[_loc1_][0][5] + int(this.getWeapon(this.cardInventory[_loc1_][1][0], this.cardInventory[_loc1_][1][1], 5, 1, this.cardInventory[_loc1_][0][10]));
                  _loc3_.cMove.text = this.cardInventory[_loc1_][0][4] + int(this.getWeapon(this.cardInventory[_loc1_][1][0], this.cardInventory[_loc1_][1][1], 4, 1, this.cardInventory[_loc1_][0][10]));
                  _loc3_.sName.text = this.getRune(this.cardInventory[_loc1_][2][0], this.cardInventory[_loc1_][2][1], this.cardInventory[_loc1_][0][6], 0);
                  _loc3_.uName.text = this.getTitle(this.cardInventory[_loc1_][0][7], this.cardInventory[_loc1_][1][0]);
                  _loc3_.portr.gotoAndStop(_loc2_);
                  _loc3_.cType.gotoAndStop(this.cardInventory[_loc1_][1][0]);
                  _loc3_.mouseChildren = false;
                  _loc3_.name = "munit_" + _loc1_;
                  _loc3_.x = 0;
                  _loc3_.y = this.actualList * 60;
                  _loc3_.cacheAsBitmap = true;
                  this.inventory.army1.portHolder.addChild(_loc3_);
               }
            }
            _loc1_++;
         }
      }

      public function exileTick():void
      {
         if (!this.animationLock)
         {
            switch (true)
            {
               case this.scrollLock:
                  this.exScroll(this.scrollDir);
                  break;
               case this.scrollLock:
                  this.exScroll(this.scrollDir);
                  break;
               case this.scrollLock_2:
                  this.exScroll_2(this.scrollDir);
                  break;
               case this.scrollLock_2:
                  this.exScroll_2(this.scrollDir);
            }
         }
         else if (this.inventState == 2)
         {
            if (this.inventory.army1.forge.currentFrame == this.inventory.army1.forge.totalFrames)
            {
               this.runeCraftComplete();
            }
            else
            {
               this.inventory.army1.forge.nextFrame();
               this.inventory.army1.forge.stop();
            }
         }
      }

      public function exScroll(param1:int):void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         switch (true)
         {
            case this.inventory.army1.currentFrame == 1:
               _loc5_ = 0;
               while (_loc5_ < this.exileModMenu.length)
               {
                  if (this.exileModMenu[_loc5_] > 0)
                  {
                     _loc4_++;
                  }
                  _loc5_++;
               }
         }
         if (this.inventory.army1.currentFrame == 1)
         {
            _loc2_ = this.inventory.army1.portHolder;
            _loc3_ = 420 - 60 * _loc4_;
         }
         if (this.inventory.army1.currentFrame == 4)
         {
            _loc2_ = this.inventory.army1.portHolder;
            _loc3_ = 420 - 60 * this.tempGearArray.length;
         }
         if (this.inventory.army1.currentFrame == 6)
         {
            _loc2_ = this.inventory.army1.portHolder;
            _loc3_ = 420 - 60 * (this.actualList + 1);
         }
         switch (true)
         {
            case param1 == 0 && _loc2_.y <= 60:
               _loc2_.y += 15;
               if (_loc2_.y >= 60)
               {
                  _loc2_.y = 60;
               }
               break;
            case param1 == 1 && _loc2_.y >= _loc3_:
               _loc2_.y -= 15;
               if (_loc2_.y <= _loc3_)
               {
                  _loc2_.y = _loc3_;
                  break;
               }
         }
      }

      public function exPage(param1:int):void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         switch (true)
         {
            case this.inventory.army1.currentFrame == 1:
               _loc5_ = 0;
               while (_loc5_ < this.exileModMenu.length)
               {
                  if (this.exileModMenu[_loc5_] > 0)
                  {
                     _loc4_++;
                  }
                  _loc5_++;
               }
         }
         if (this.inventory.army1.currentFrame == 1)
         {
            _loc2_ = this.inventory.army1.portHolder;
            _loc3_ = 420 - 60 * _loc4_;
         }
         if (this.inventory.army1.currentFrame == 4)
         {
            _loc2_ = this.inventory.army1.portHolder;
            _loc3_ = 420 - 60 * this.tempGearArray.length;
         }
         if (this.inventory.army1.currentFrame == 6)
         {
            _loc2_ = this.inventory.army1.portHolder;
            _loc3_ = 420 - 60 * (this.actualList + 1);
         }
         switch (true)
         {
            case param1 == 3 && _loc2_.y >= _loc3_:
               _loc2_.y -= 360;
               if (_loc2_.y <= _loc3_)
               {
                  _loc2_.y = _loc3_;
               }
               break;
            case param1 == 1 && _loc2_.y <= 60:
               _loc2_.y += 360;
               if (_loc2_.y >= 60)
               {
                  _loc2_.y = 60;
               }
               break;
            case param1 == 2:
               _loc2_.y = _loc3_;
               break;
            case param1 == 0:
               _loc2_.y = 60;
         }
      }

      public function exScroll_2(param1:int):void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         if (this.inventory.army1.currentFrame == 4)
         {
            _loc2_ = this.inventory.army1.portHolder_2;
            _loc3_ = 420 - 60 * this.storeInventory.length;
         }
         switch (true)
         {
            case param1 == 0 && _loc2_.y <= 60:
               _loc2_.y += 15;
               if (_loc2_.y >= 60)
               {
                  _loc2_.y = 60;
               }
               break;
            case param1 == 1 && _loc2_.y >= _loc3_:
               _loc2_.y -= 15;
               if (_loc2_.y <= _loc3_)
               {
                  _loc2_.y = _loc3_;
                  break;
               }
         }
      }

      public function exPage_2(param1:int):void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         if (this.inventory.army1.currentFrame == 4)
         {
            _loc2_ = this.inventory.army1.portHolder_2;
            _loc3_ = 420 - 60 * this.storeInventory.length;
         }
         switch (true)
         {
            case param1 == 3 && _loc2_.y >= _loc3_:
               _loc2_.y -= 360;
               if (_loc2_.y <= _loc3_)
               {
                  _loc2_.y = _loc3_;
               }
               break;
            case param1 == 1 && _loc2_.y <= 60:
               _loc2_.y += 360;
               if (_loc2_.y >= 60)
               {
                  _loc2_.y = 60;
               }
               break;
            case param1 == 2:
               _loc2_.y = _loc3_;
               break;
            case param1 == 0:
               _loc2_.y = 60;
         }
      }

      public function runeCraftComplete():void
      {
         this.inventory.army1.forge.gotoAndStop(1);
         this.inventory.army1.forge.forge.resultN.gotoAndStop(2);
         this.inventory.army1.forge.forge.resultN.portr.gotoAndStop(this.gearInventory[this.gearInventory.length - 1][0] * 10 + this.gearInventory[this.gearInventory.length - 1][1] + 100);
         var _loc1_:int = 0;
         while (_loc1_ < 5)
         {
            this.inventory.army1.forge.forge["node" + _loc1_].portr.gotoAndStop(1);
            _loc1_++;
         }
         this.craftNode = 0;
         this.inventory.army1.btnForge.gotoAndStop(1);
         this.updateRuneState();
         this.updateCraftText();
         this.animationLock = false;
      }

      public function createNewRune():void
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         if (this.craftNode == 5)
         {
            _loc1_ = new Array();
            _loc2_ = new Array();
            _loc3_ = 0;
            while (_loc3_ < 5)
            {
               _loc7_ = false;
               _loc8_ = this.inventory.army1.forge.forge["node" + _loc3_].portr.currentFrame - 100;
               _loc9_ = Math.floor(_loc8_ / 10);
               _loc10_ = _loc8_ - _loc9_ * 10;
               _loc2_.push(_loc9_);
               _loc1_.push(_loc10_);
               _loc11_ = 0;
               while (_loc11_ < this.gearInventory.length)
               {
                  if (!_loc7_)
                  {
                     if (this.gearInventory[_loc11_][0] == _loc9_ && this.gearInventory[_loc11_][1] == _loc10_ && this.gearInventory[_loc11_][2] != 1)
                     {
                        this.gearInventory.splice(_loc11_, 1);
                        _loc7_ = true;
                     }
                  }
                  _loc11_++;
               }
               _loc3_++;
            }
            _loc4_ = int(_loc2_[Math.floor(Math.random() * _loc2_.length)]);
            _loc5_ = 1;
            _loc6_ = 0;
            while (_loc6_ < _loc1_.length)
            {
               if (_loc1_[_loc6_] == 3)
               {
                  _loc5_ = 3;
               }
               _loc6_++;
            }
            if (_loc5_ != 3)
            {
               _loc5_ = _loc1_[Math.floor(Math.random() * _loc1_.length)] + 1;
            }
            this.gearInventory[this.gearInventory.length] = new Array(_loc4_, _loc5_, 2);
            this.animationLock = true;
         }
      }

      public function loadCraftRune(param1:int):void
      {
         var _loc2_:MovieClip = null;
         if (this.craftNode < 5)
         {
            if (this.inventory.army1.forge.forge.resultN.currentFrame == 2)
            {
               this.inventory.army1.forge.forge.resultN.gotoAndStop(1);
            }
            if (this.runeState[param1] > 0)
            {
               -- this.runeState[param1];
               this.updateCraftText();
               _loc2_ = this.inventory.army1.forge.forge["node" + this.craftNode];
               ++this.craftNode;
               if (this.craftNode == 5)
               {
                  this.inventory.army1.btnForge.gotoAndStop(2);
               }
               switch (true)
               {
                  case param1 == 0:
                     _loc2_.portr.gotoAndStop(111);
                     break;
                  case param1 == 1:
                     _loc2_.portr.gotoAndStop(112);
                     break;
                  case param1 == 2:
                     _loc2_.portr.gotoAndStop(113);
                     break;
                  case param1 == 3:
                     _loc2_.portr.gotoAndStop(121);
                     break;
                  case param1 == 4:
                     _loc2_.portr.gotoAndStop(122);
                     break;
                  case param1 == 5:
                     _loc2_.portr.gotoAndStop(123);
                     break;
                  case param1 == 6:
                     _loc2_.portr.gotoAndStop(131);
                     break;
                  case param1 == 7:
                     _loc2_.portr.gotoAndStop(132);
                     break;
                  case param1 == 8:
                     _loc2_.portr.gotoAndStop(133);
                     break;
                  case param1 == 9:
                     _loc2_.portr.gotoAndStop(141);
                     break;
                  case param1 == 10:
                     _loc2_.portr.gotoAndStop(142);
                     break;
                  case param1 == 11:
                     _loc2_.portr.gotoAndStop(143);
                     break;
                  case param1 == 12:
                     _loc2_.portr.gotoAndStop(151);
                     break;
                  case param1 == 13:
                     _loc2_.portr.gotoAndStop(152);
                     break;
                  case param1 == 14:
                     _loc2_.portr.gotoAndStop(153);
                     break;
                  case param1 == 15:
                     _loc2_.portr.gotoAndStop(161);
                     break;
                  case param1 == 16:
                     _loc2_.portr.gotoAndStop(162);
                     break;
                  case param1 == 17:
                     _loc2_.portr.gotoAndStop(163);
               }
            }
         }
      }

      public function loadExileTavern():void
      {
         this.inventory.gotoAndStop(2);
         this.inventory.army1.gotoAndStop(5);
      }

      public function loadRumors():void
      {
         switch (true)
         {
            case !this.specialDialogues[5] && this.gameStory >= 10:
               this.loadDia(300002);
               break;
            case !this.specialDialogues[6] && this.gameStory >= 20:
               this.loadDia(300003);
               break;
            case !this.specialDialogues[7] && this.gameStory >= 40:
               this.loadDia(300004);
               break;
            case !this.specialDialogues[8] && this.gameStory >= 60:
               this.loadDia(300005);
               break;
            case !this.specialDialogues[9] && this.gameStory >= 90:
               this.loadDia(300006);
               break;
            case !this.specialDialogues[10] && this.gameStory >= 135:
               this.loadDia(300007);
               break;
            case !this.specialDialogues[11] && this.gameStory >= 155:
               this.loadDia(300008);
               break;
            default:
               this.loadDia(300001);
         }
      }

      public function loadExileCraft():void
      {
         this.craftNode = 0;
         this.inventory.gotoAndStop(2);
         this.inventory.army1.gotoAndStop(3);
         this.inventory.army1.mouseEnabled = false;
         this.inventory.army1.btnForge.gotoAndStop(1);
         this.inventory.army1.forge.gotoAndStop(1);
         this.inventory.army1.forge.mouseEnabled = false;
         this.inventory.army1.forge.forge.mouseEnabled = false;
         this.inventory.army1.E1.mouseChildren = false;
         this.inventory.army1.E2.mouseChildren = false;
         this.inventory.army1.E3.mouseChildren = false;
         this.inventory.army1["A1"].mouseChildren = false;
         this.inventory.army1["A2"].mouseChildren = false;
         this.inventory.army1["A3"].mouseChildren = false;
         this.inventory.army1.W1.mouseChildren = false;
         this.inventory.army1.W2.mouseChildren = false;
         this.inventory.army1.W3.mouseChildren = false;
         this.inventory.army1.L1.mouseChildren = false;
         this.inventory.army1.L2.mouseChildren = false;
         this.inventory.army1.L3.mouseChildren = false;
         this.inventory.army1.D1.mouseChildren = false;
         this.inventory.army1.D2.mouseChildren = false;
         this.inventory.army1.D3.mouseChildren = false;
         this.inventory.army1["F1"].mouseChildren = false;
         this.inventory.army1["F2"].mouseChildren = false;
         this.inventory.army1["F3"].mouseChildren = false;
         var _loc1_:int = 0;
         while (_loc1_ < 5)
         {
            this.inventory.army1.forge.forge["node" + _loc1_].portr.gotoAndStop(1);
            _loc1_++;
         }
         this.inventory.army1.forge.forge.resultN.gotoAndStop(1);
         this.updateRuneState();
         this.updateCraftText();
      }

      public function loadExileStore():void
      {
         this.craftNode = 0;
         this.inventory.gotoAndStop(2);
         this.inventory.army1.gotoAndStop(4);
         this.inventory.army1.mouseEnabled = false;
         this.inventory.army1.txtSouls.text = String(this.charData[16]);
         this.inventory.army1.scrollUp.stop();
         this.inventory.army1.scrollUpPage.stop();
         this.inventory.army1.scrollUpEnd.stop();
         this.inventory.army1.scrollDown.stop();
         this.inventory.army1.scrollDownPage.stop();
         this.inventory.army1.scrollDownEnd.stop();
         this.inventory.army1.scrollUp_2.stop();
         this.inventory.army1.scrollUpPage_2.stop();
         this.inventory.army1.scrollUpEnd_2.stop();
         this.inventory.army1.scrollDown_2.stop();
         this.inventory.army1.scrollDownPage_2.stop();
         this.inventory.army1.scrollDownEnd_2.stop();
         this.createStore();
         this.loadStoreBuy();
         this.loadStoreSell();
      }

      public function storePurchase(param1:int):void
      {
         if (this.charData[16] >= this.getCost(this.storeInventory[param1][1]) * 3)
         {
            this.charData[16] -= this.getCost(this.storeInventory[param1][1]) * 3;
            this.inventory.army1.txtSouls.text = String(this.charData[16]);
            this.gearInventory[this.gearInventory.length] = this.storeInventory[param1].concat();
            this.storeInventory.splice(param1, 1);
            this.unloadStoreBuy();
            this.unloadStoreSell();
            this.loadStoreBuy();
            this.loadStoreSell();
         }
      }

      public function storeSell(param1:int):void
      {
         var _loc2_:int = int(this.tempGearArray[param1][3]);
         this.charData[16] += this.getCost(this.gearInventory[_loc2_][1]);
         this.inventory.army1.txtSouls.text = String(this.charData[16]);
         this.gearInventory.splice(_loc2_, 1);
         this.unloadStoreSell();
         this.loadStoreSell();
      }

      public function unloadStoreBuy():void
      {
         var _loc2_:MovieClip = null;
         var _loc1_:int = this.inventory.army1.portHolder_2.numChildren - 1;
         while (_loc1_ >= 0)
         {
            _loc2_ = this.inventory.army1.portHolder_2.getChildAt(_loc1_);
            this.inventory.army1.portHolder_2.removeChild(_loc2_);
            _loc1_--;
         }
      }

      public function unloadStoreSell():void
      {
         var _loc2_:MovieClip = null;
         var _loc1_:int = this.inventory.army1.portHolder.numChildren - 1;
         while (_loc1_ >= 0)
         {
            _loc2_ = this.inventory.army1.portHolder.getChildAt(_loc1_);
            this.inventory.army1.portHolder.removeChild(_loc2_);
            _loc1_--;
         }
      }

      public function createStore():void
      {
         var _loc2_:int = 0;
         this.storeInventory = new Array();
         var _loc1_:int = 0;
         while (_loc1_ < 30)
         {
            _loc2_ = Math.floor(Math.random() * 5) + 1;
            switch (true)
            {
               case _loc1_ < 15:
                  this.storeInventory[_loc1_] = new Array(_loc2_, 1, 1);
                  break;
               case _loc1_ < 25:
                  this.storeInventory[_loc1_] = new Array(_loc2_, 2, 1);
                  break;
               default:
                  this.storeInventory[_loc1_] = new Array(_loc2_, 3, 1);
                  break;
            }
            _loc1_++;
         }
      }

      public function loadStoreBuy():void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:MovieClip = null;
         var _loc1_:int = 0;
         while (_loc1_ < this.storeInventory.length)
         {
            _loc2_ = new asTokenStore();
            _loc2_.mana.text = int(this.getWeapon(this.storeInventory[_loc1_][0], this.storeInventory[_loc1_][1], 3, 1, 1));
            _loc2_.atk.text = int(this.getWeapon(this.storeInventory[_loc1_][0], this.storeInventory[_loc1_][1], 1, 1, 1));
            _loc2_.hp.text = int(this.getWeapon(this.storeInventory[_loc1_][0], this.storeInventory[_loc1_][1], 2, 1, 1));
            _loc2_.souls.text = this.getCost(this.storeInventory[_loc1_][1]) * 3;
            _loc2_.iName.text = String(this.getWeapon(this.storeInventory[_loc1_][0], this.storeInventory[_loc1_][1], 8, 1, 1));
            _loc2_.portr.gotoAndStop(this.storeInventory[_loc1_][0] * 10 + this.storeInventory[_loc1_][1]);
            _loc2_.mouseChildren = true;
            _loc2_.mouseEnabled = false;
            _loc2_.name = "shop_" + _loc1_;
            _loc2_.x = 0;
            _loc2_.y = _loc1_ * 60;
            _loc3_ = new asBuy();
            _loc3_.name = "buy_" + _loc1_;
            _loc3_.cacheAsBitmap = true;
            _loc2_.addChild(_loc3_);
            this.inventory.army1.portHolder_2.addChild(_loc2_);
            _loc1_++;
         }
      }

      public function loadStoreSell():void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         this.tempGearArray = new Array();
         var _loc1_:int = 0;
         while (_loc1_ < this.gearInventory.length)
         {
            if (this.gearInventory[_loc1_][2] == 1)
            {
               this.tempGearArray.push(this.gearInventory[_loc1_]);
               this.tempGearArray[this.tempGearArray.length - 1][3] = _loc1_;
            }
            _loc1_++;
         }
         var _loc2_:int = 0;
         while (_loc2_ < this.tempGearArray.length)
         {
            _loc3_ = new asTokenStore();
            _loc3_.mana.text = int(this.getWeapon(this.tempGearArray[_loc2_][0], this.tempGearArray[_loc2_][1], 3, 1, 1));
            _loc3_.atk.text = int(this.getWeapon(this.tempGearArray[_loc2_][0], this.tempGearArray[_loc2_][1], 1, 1, 1));
            _loc3_.hp.text = int(this.getWeapon(this.tempGearArray[_loc2_][0], this.tempGearArray[_loc2_][1], 2, 1, 1));
            _loc3_.souls.text = this.getCost(this.tempGearArray[_loc2_][1]);
            _loc3_.iName.text = String(this.getWeapon(this.tempGearArray[_loc2_][0], this.tempGearArray[_loc2_][1], 8, 1, 1));
            _loc3_.portr.gotoAndStop(this.tempGearArray[_loc2_][0] * 10 + this.tempGearArray[_loc2_][1]);
            _loc3_.mouseChildren = true;
            _loc3_.mouseEnabled = false;
            _loc3_.name = "gear_" + _loc2_;
            _loc3_.x = 0;
            _loc3_.y = _loc2_ * 60;
            _loc4_ = new asSell();
            _loc4_.name = "sell_" + _loc2_;
            _loc4_.cacheAsBitmap = true;
            _loc3_.addChild(_loc4_);
            this.inventory.army1.portHolder.addChild(_loc3_);
            _loc2_++;
         }
      }

      public function getCost(param1:int):int
      {
         switch (true)
         {
            case param1 == 1:
               return 100;
            case param1 == 2:
               return 1000;
            case param1 == 3:
               return 10000;
            default:
               return 100000;
         }
      }

      public function updateRuneState():void
      {
         this.runeState = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
         var _loc1_:int = 0;
         for (; _loc1_ < this.gearInventory.length; _loc1_++)
         {
            if (this.gearInventory[_loc1_][2] == 1)
            {
               continue;
            }
            switch (true)
            {
               case this.gearInventory[_loc1_][0] == 1 && this.gearInventory[_loc1_][1] == 1:
                  ++ this.runeState[0];
                  break;
               case this.gearInventory[_loc1_][0] == 1 && this.gearInventory[_loc1_][1] == 2:
                  ++ this.runeState[1];
                  break;
               case this.gearInventory[_loc1_][0] == 1 && this.gearInventory[_loc1_][1] == 3:
                  ++ this.runeState[2];
                  break;
               case this.gearInventory[_loc1_][0] == 2 && this.gearInventory[_loc1_][1] == 1:
                  ++ this.runeState[3];
                  break;
               case this.gearInventory[_loc1_][0] == 2 && this.gearInventory[_loc1_][1] == 2:
                  ++ this.runeState[4];
                  break;
               case this.gearInventory[_loc1_][0] == 2 && this.gearInventory[_loc1_][1] == 3:
                  ++ this.runeState[5];
                  break;
               case this.gearInventory[_loc1_][0] == 3 && this.gearInventory[_loc1_][1] == 1:
                  ++ this.runeState[6];
                  break;
               case this.gearInventory[_loc1_][0] == 3 && this.gearInventory[_loc1_][1] == 2:
                  ++ this.runeState[7];
                  break;
               case this.gearInventory[_loc1_][0] == 3 && this.gearInventory[_loc1_][1] == 3:
                  ++ this.runeState[8];
                  break;
               case this.gearInventory[_loc1_][0] == 4 && this.gearInventory[_loc1_][1] == 1:
                  ++ this.runeState[9];
                  break;
               case this.gearInventory[_loc1_][0] == 4 && this.gearInventory[_loc1_][1] == 2:
                  ++ this.runeState[10];
                  break;
               case this.gearInventory[_loc1_][0] == 4 && this.gearInventory[_loc1_][1] == 3:
                  ++ this.runeState[11];
                  break;
               case this.gearInventory[_loc1_][0] == 5 && this.gearInventory[_loc1_][1] == 1:
                  ++ this.runeState[12];
                  break;
               case this.gearInventory[_loc1_][0] == 5 && this.gearInventory[_loc1_][1] == 2:
                  ++ this.runeState[13];
                  break;
               case this.gearInventory[_loc1_][0] == 5 && this.gearInventory[_loc1_][1] == 3:
                  ++ this.runeState[14];
                  break;
               case this.gearInventory[_loc1_][0] == 6 && this.gearInventory[_loc1_][1] == 1:
                  ++ this.runeState[15];
                  break;
               case this.gearInventory[_loc1_][0] == 6 && this.gearInventory[_loc1_][1] == 2:
                  ++ this.runeState[16];
                  break;
               case this.gearInventory[_loc1_][0] == 6 && this.gearInventory[_loc1_][1] == 3:
                  ++ this.runeState[17];
                  break;
            }
         }
      }

      public function updateCraftText():void
      {
         this.inventory.army1.E1N.text = this.runeState[0];
         this.inventory.army1.E2N.text = this.runeState[1];
         this.inventory.army1.E3N.text = this.runeState[2];
         this.inventory.army1.A1N.text = this.runeState[3];
         this.inventory.army1.A2N.text = this.runeState[4];
         this.inventory.army1.A3N.text = this.runeState[5];
         this.inventory.army1.F1N.text = this.runeState[6];
         this.inventory.army1.F2N.text = this.runeState[7];
         this.inventory.army1.F3N.text = this.runeState[8];
         this.inventory.army1.W1N.text = this.runeState[9];
         this.inventory.army1.W2N.text = this.runeState[10];
         this.inventory.army1.W3N.text = this.runeState[11];
         this.inventory.army1.L1N.text = this.runeState[12];
         this.inventory.army1.L2N.text = this.runeState[13];
         this.inventory.army1.L3N.text = this.runeState[14];
         this.inventory.army1.D1N.text = this.runeState[15];
         this.inventory.army1.D2N.text = this.runeState[16];
         this.inventory.army1.D3N.text = this.runeState[17];
      }

      public function loadExileChant_mod():void
      {
         var _loc3_:int = 0;
         this.exileModMenu = new Array();
         var _loc1_:int = 0;
         while (_loc1_ < 755)
         {
            this.exileModMenu[_loc1_] = 0;
            _loc1_++;
         }
         var _loc2_:int = 0;
         while (_loc2_ < this.exileInventory.length)
         {
            _loc3_ = this.exileInventory[_loc2_][0][7] * 100 + this.exileInventory[_loc2_][1][0] * 10;
            switch (true)
            {
               case this.exileInventory[_loc2_][1][1] == 1:
                  _loc3_ += 1;
                  break;
               case this.exileInventory[_loc2_][1][1] == 2:
                  _loc3_ += 2;
                  break;
               case this.exileInventory[_loc2_][1][1] == 3:
                  _loc3_ += 3;
                  break;
               default:
                  _loc3_ += 4;
                  break;
            }
            ++ this.exileModMenu[_loc3_];
            _loc2_++;
         }
         this.loadExileUnits();
      }

      public function loadExileChant():void
      {
         this.inventory.gotoAndStop(1);
         this.inventory.army1.gotoAndStop(1);
         this.inventory.bTankTxt.text = this.exileClasses[1];
         this.inventory.bonusTank.gotoAndStop(this.exileClasses[1] + 1);
         this.inventory.bFighterTxt.text = this.exileClasses[2];
         this.inventory.bonusFighter.gotoAndStop(this.exileClasses[2] + 1);
         this.inventory.bScoutTxt.text = this.exileClasses[3];
         this.inventory.bonusScout.gotoAndStop(this.exileClasses[3] + 1);
         this.inventory.bHealerTxt.text = this.exileClasses[4];
         this.inventory.bonusHealer.gotoAndStop(this.exileClasses[4] + 1);
         this.inventory.bMageTxt.text = this.exileClasses[5];
         this.inventory.bonusMage.gotoAndStop(this.exileClasses[5] + 1);
         this.loadExileChant_mod();
      }

      public function unExileUnit(param1:int):void
      {
         var _loc2_:int = int(this.cardInventory.length);
         var _loc3_:int = Math.floor(param1 / 100);
         var _loc4_:int = Math.floor(param1 / 10) - Math.floor(param1 / 100) * 10;
         var _loc5_:int = param1 - Math.floor(param1 / 10) * 10;
         switch (true)
         {
            case _loc5_ == 4 && _loc4_ == 1:
               _loc5_ = 4;
               break;
            case _loc5_ == 4 && _loc4_ == 2:
               _loc5_ = 4;
               break;
            case _loc5_ == 4 && _loc4_ == 3:
               _loc5_ = 5;
               break;
            case _loc5_ == 4 && _loc4_ == 4:
               _loc5_ = 4;
               break;
            case _loc5_ == 4 && _loc4_ == 5:
               _loc5_ = 5;
         }
         this.cardInventory[_loc2_] = this.createCard(_loc3_, _loc4_, _loc5_, 0, 1);
         switch (true)
         {
            case _loc4_ == 1:
               this.exileClasses[1] = this.exileClasses[1] - 1;
               break;
            case _loc4_ == 2:
               this.exileClasses[2] = this.exileClasses[2] - 1;
               break;
            case _loc4_ == 3:
               this.exileClasses[3] = this.exileClasses[3] - 1;
               break;
            case _loc4_ == 4:
               this.exileClasses[4] = this.exileClasses[4] - 1;
               break;
            case _loc4_ == 5:
               this.exileClasses[5] = this.exileClasses[5] - 1;
               break;
            case _loc4_ == 6:
               this.exileClasses[6] = this.exileClasses[6] - 1;
         }
         this.sortUnits();
         this.charClass(this.charData[0]);
         var _loc6_:int = 0;
         while (_loc6_ < this.exileInventory.length)
         {
            if (this.exileInventory[_loc6_][1][0] == _loc4_ && this.exileInventory[_loc6_][1][1] == _loc5_ && this.exileInventory[_loc6_][0][7] == _loc3_)
            {
               this.exileInventory.splice(_loc6_, 1);
               break;
            }
            _loc6_++;
         }
         this.unLoadExileUnits();
         this.loadExileChant();
      }

      public function loadExileUnits():void
      {
         var _loc3_:int = 0;
         var _loc4_:MovieClip = null;
         var _loc5_:MovieClip = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Array = null;
         this.inventory.army1.scrollUp.stop();
         this.inventory.army1.scrollUpPage.stop();
         this.inventory.army1.scrollUpEnd.stop();
         this.inventory.army1.scrollDown.stop();
         this.inventory.army1.scrollDownPage.stop();
         this.inventory.army1.scrollDownEnd.stop();
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while (_loc2_ < this.exileModMenu.length)
         {
            if (this.exileModMenu[_loc2_] > 0)
            {
               _loc3_ = Math.floor(_loc2_ / 10);
               _loc4_ = new asTokenExileN();
               _loc5_ = new asDeChant();
               _loc6_ = Math.floor(_loc2_ / 100);
               _loc7_ = Math.floor(_loc2_ / 10) - Math.floor(_loc2_ / 100) * 10;
               _loc8_ = _loc2_ - Math.floor(_loc2_ / 10) * 10;
               _loc10_ = this.blankCard(_loc6_);
               if (_loc6_ < 4)
               {
                  _loc9_ = 1;
               }
               else
               {
                  _loc9_ = 0;
               }
               _loc5_.name = "btnArmy" + _loc2_;
               _loc4_.mana.text = _loc10_[3] + int(this.getWeapon(_loc7_, _loc8_, 3, 1, 1));
               _loc4_.atk.text = _loc10_[1] + int(this.getWeapon(_loc7_, _loc8_, 1, 1, 1));
               _loc4_.hp.text = _loc10_[2] + int(this.getWeapon(_loc7_, _loc8_, 2, 1, 1));
               _loc4_.uName.text = this.getTitle(_loc6_, _loc7_);
               _loc4_.xCount.text = this.exileModMenu[_loc2_];
               _loc4_.portr.gotoAndStop(_loc3_);
               _loc4_.cType.gotoAndStop(_loc7_);
               _loc4_.mouseEnabled = false;
               _loc4_.mouseChildren = true;
               _loc4_.name = "unit_" + _loc2_;
               _loc4_.cacheAsBitmap = true;
               _loc5_.cacheAsBitmap = true;
               _loc4_.addChild(_loc5_);
               _loc5_.x = 105;
               _loc5_.scaleX = 0.75;
               _loc5_.y = 48;
               _loc5_.scaleY = 0.75;
               _loc4_.x = 0;
               _loc4_.y = _loc1_ * 60;
               _loc1_++;
               this.inventory.army1.portHolder.addChild(_loc4_);
            }
            _loc2_++;
         }
      }

      public function resetMissionList():void
      {
         var _loc2_:MovieClip = null;
         var _loc1_:int = this.inventory.army1.portHolder.numChildren - 1;
         while (_loc1_ >= 0)
         {
            _loc2_ = this.inventory.army1.portHolder.getChildAt(_loc1_);
            this.inventory.army1.portHolder.removeChild(_loc2_);
            _loc1_--;
         }
      }

      public function unLoadExileUnits():void
      {
         this.inventory.army1.gotoAndStop(2);
         this.inventory.army1.gotoAndStop(1);
      }

      public function loadInventory():void
      {
         this.inventory = new asArmy();
         this.gameFader = new asFader();
         this.gameFader.stop();
         addChild(this.inventory);
         addChild(this.gameFader);
         addChild(this.mainMask);
         this.inventory.mask = this.mainMask;
         this.infoMenu(0);
         this.eventLock = false;
         this.selectedUnit = 0;
         this.inventState = 1;
         this.squadSelect = -1;
         this.sortSet = 0;
         this.scrollLock = false;
         this.scrollDir = 0;
         this.inventory.army1.scrollUp.stop();
         this.inventory.army1.scrollUpPage.stop();
         this.inventory.army1.scrollUpEnd.stop();
         this.inventory.army1.scrollDown.stop();
         this.inventory.army1.scrollDownPage.stop();
         this.inventory.army1.scrollDownEnd.stop();
         this.inventory.btnInvBack.stop();
         this.gameState = 9;
         this.loadInvUnits();
      }

      public function loadInvUnits():void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:MovieClip = null;
         if (this.inventState == 3)
         {
            _loc2_ = new Array();
            _loc3_ = 0;
            while (_loc3_ < 80)
            {
               _loc2_[_loc3_] = 0;
               _loc3_++;
            }
            _loc4_ = 0;
            while (_loc4_ < 15)
            {
               if (this.inventoryDeck[_loc4_][0] != "0000")
               {
                  _loc5_ = this.inventoryDeck[_loc4_][0][7] * 10 + this.inventoryDeck[_loc4_][1][0];
                  _loc2_[_loc5_] += 1;
               }
               _loc4_++;
            }
         }
         if (this.inventory.army1.currentFrame != 1)
         {
            this.inventory.army1.gotoAndStop(1);
         }
         else
         {
            this.resetInvList();
         }
         this.inventory.army1.scrollUp.stop();
         this.inventory.army1.scrollUpPage.stop();
         this.inventory.army1.scrollUpEnd.stop();
         this.inventory.army1.scrollDown.stop();
         this.inventory.army1.scrollDownPage.stop();
         this.inventory.army1.scrollDownEnd.stop();
         var _loc1_:int = 0;
         while (_loc1_ < this.cardInventory.length)
         {
            _loc6_ = this.cardInventory[_loc1_][0][7] * 10 + this.cardInventory[_loc1_][1][0];
            _loc7_ = new asTokenInv();
            switch (true)
            {
               case this.cardInventory[_loc1_][0][8] == -1:
                  _loc7_.sSpot.gotoAndStop(1);
                  break;
               case this.cardInventory[_loc1_][0][8] == 0:
                  _loc7_.sSpot.gotoAndStop(2);
                  break;
               case this.cardInventory[_loc1_][0][8] == 1:
                  _loc7_.sSpot.gotoAndStop(3);
                  break;
               case this.cardInventory[_loc1_][0][8] == 2:
                  _loc7_.sSpot.gotoAndStop(3);
                  break;
               case this.cardInventory[_loc1_][0][8] > 2:
                  _loc7_.sSpot.gotoAndStop(4);
            }
            _loc7_.mana.text = this.cardInventory[_loc1_][0][3] + int(this.getWeapon(this.cardInventory[_loc1_][1][0], this.cardInventory[_loc1_][1][1], 3, 1, this.cardInventory[_loc1_][0][10]));
            _loc7_.atk.text = this.cardInventory[_loc1_][0][1] + int(this.getWeapon(this.cardInventory[_loc1_][1][0], this.cardInventory[_loc1_][1][1], 1, 1, this.cardInventory[_loc1_][0][10]));
            _loc7_.hp.text = this.cardInventory[_loc1_][0][2] + int(this.getWeapon(this.cardInventory[_loc1_][1][0], this.cardInventory[_loc1_][1][1], 2, 1, this.cardInventory[_loc1_][0][10]));
            _loc7_.aRange.text = this.cardInventory[_loc1_][0][5] + int(this.getWeapon(this.cardInventory[_loc1_][1][0], this.cardInventory[_loc1_][1][1], 5, 1, this.cardInventory[_loc1_][0][10]));
            _loc7_.cMove.text = this.cardInventory[_loc1_][0][4] + int(this.getWeapon(this.cardInventory[_loc1_][1][0], this.cardInventory[_loc1_][1][1], 4, 1, this.cardInventory[_loc1_][0][10]));
            _loc7_.sName.text = this.getRune(this.cardInventory[_loc1_][2][0], this.cardInventory[_loc1_][2][1], this.cardInventory[_loc1_][0][6], 0);
            _loc7_.uName.text = this.getTitle(this.cardInventory[_loc1_][0][7], this.cardInventory[_loc1_][1][0]);
            _loc7_.portr.gotoAndStop(_loc6_);
            _loc7_.cType.gotoAndStop(this.cardInventory[_loc1_][1][0]);
            _loc7_.mouseChildren = false;
            _loc7_.name = "unit_" + _loc1_;
            _loc7_.x = 0;
            _loc7_.y = _loc1_ * 60;
            if (this.inventState == 3 && this.cardInventory[_loc1_][0][8] >= 0)
            {
               _loc7_.alpha = 0.5;
            }
            if (this.inventState == 3 && _loc2_[_loc6_] >= 2)
            {
               _loc7_.alpha = 0.5;
            }
            _loc7_.cacheAsBitmap = true;
            this.inventory.army1.portHolder.addChild(_loc7_);
            _loc1_++;
         }
      }

      public function loadInvGear():void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:MovieClip = null;
         this.inventory.army1.scrollUp.stop();
         this.inventory.army1.scrollUpPage.stop();
         this.inventory.army1.scrollUpEnd.stop();
         this.inventory.army1.scrollDown.stop();
         this.inventory.army1.scrollDownPage.stop();
         this.inventory.army1.scrollDownEnd.stop();
         var _loc1_:int = 0;
         while (_loc1_ < this.gearInventory.length)
         {
            if (this.gearInventory[_loc1_][2] == 1)
            {
               _loc2_ = new asTokenGear();
               _loc2_.mana.text = int(this.getWeapon(this.gearInventory[_loc1_][0], this.gearInventory[_loc1_][1], 3, 1, 1));
               _loc2_.atk.text = int(this.getWeapon(this.gearInventory[_loc1_][0], this.gearInventory[_loc1_][1], 1, 1, 1));
               _loc2_.hp.text = int(this.getWeapon(this.gearInventory[_loc1_][0], this.gearInventory[_loc1_][1], 2, 1, 1));
               _loc2_.aRange.text = int(this.getWeapon(this.gearInventory[_loc1_][0], this.gearInventory[_loc1_][1], 5, 1, 1));
               _loc2_.cMove.text = int(this.getWeapon(this.gearInventory[_loc1_][0], this.gearInventory[_loc1_][1], 4, 1, 1));
               _loc2_.iName.text = String(this.getWeapon(this.gearInventory[_loc1_][0], this.gearInventory[_loc1_][1], 8, 1, 1));
               _loc2_.portr.gotoAndStop(this.gearInventory[_loc1_][0] * 10 + this.gearInventory[_loc1_][1]);
               _loc2_.mouseChildren = false;
               _loc2_.name = "gear_" + _loc1_;
               _loc2_.x = 0;
               _loc2_.y = _loc1_ * 60;
               _loc2_.cacheAsBitmap = true;
               this.inventory.army1.gotoAndStop(2);
               this.inventory.army1.gearHolder.addChild(_loc2_);
            }
            else
            {
               _loc3_ = new asTokenRune();
               _loc3_.sName_1.text = String(this.getRune(this.gearInventory[_loc1_][0], this.gearInventory[_loc1_][1], 0, 0));
               _loc3_.sName_2.text = String(this.getRune(this.gearInventory[_loc1_][0], this.gearInventory[_loc1_][1], 1, 0));
               _loc3_.rName.text = String(this.getRune(this.gearInventory[_loc1_][0], this.gearInventory[_loc1_][1], 0, 5));
               _loc3_.portr.gotoAndStop(this.gearInventory[_loc1_][0] * 10 + this.gearInventory[_loc1_][1] + 100);
               _loc3_.mouseChildren = false;
               _loc3_.name = "gear_" + _loc1_;
               _loc3_.x = 0;
               _loc3_.y = _loc1_ * 60;
               _loc3_.cacheAsBitmap = true;
               this.inventory.army1.gotoAndStop(2);
               this.inventory.army1.gearHolder.addChild(_loc3_);
            }
            _loc1_++;
         }
      }

      public function setGearList(param1:int):void
      {
         var _loc4_:MovieClip = null;
         var _loc5_:MovieClip = null;
         this.tempGearArray = new Array();
         var _loc2_:int = 0;
         while (_loc2_ < this.gearInventory.length)
         {
            if (this.gearInventory[_loc2_][2] == param1)
            {
               this.tempGearArray.push(this.gearInventory[_loc2_]);
               this.tempGearArray[this.tempGearArray.length - 1][3] = _loc2_;
            }
            _loc2_++;
         }
         var _loc3_:int = 0;
         while (_loc3_ < this.tempGearArray.length)
         {
            if (this.tempGearArray[_loc3_][2] == 1 && param1 == 1)
            {
               _loc4_ = new asTokenGear();
               _loc4_.mana.text = int(this.getWeapon(this.tempGearArray[_loc3_][0], this.tempGearArray[_loc3_][1], 3, 1, 1));
               _loc4_.atk.text = int(this.getWeapon(this.tempGearArray[_loc3_][0], this.tempGearArray[_loc3_][1], 1, 1, 1));
               _loc4_.hp.text = int(this.getWeapon(this.tempGearArray[_loc3_][0], this.tempGearArray[_loc3_][1], 2, 1, 1));
               _loc4_.aRange.text = int(this.getWeapon(this.tempGearArray[_loc3_][0], this.tempGearArray[_loc3_][1], 5, 1, 1));
               _loc4_.cMove.text = int(this.getWeapon(this.tempGearArray[_loc3_][0], this.tempGearArray[_loc3_][1], 4, 1, 1));
               _loc4_.iName.text = String(this.getWeapon(this.tempGearArray[_loc3_][0], this.tempGearArray[_loc3_][1], 8, 1, 1));
               _loc4_.portr.gotoAndStop(this.tempGearArray[_loc3_][0] * 10 + this.tempGearArray[_loc3_][1]);
               _loc4_.mouseChildren = false;
               _loc4_.name = "gear_" + this.tempGearArray[_loc3_][3];
               _loc4_.x = 0;
               _loc4_.y = _loc3_ * 60;
               _loc4_.cacheAsBitmap = true;
               this.inventory.army1.gotoAndStop(2);
               this.inventory.army1.gearHolder.addChild(_loc4_);
            }
            else if (this.tempGearArray[_loc3_][2] == 2 && param1 == 2)
            {
               _loc5_ = new asTokenRune();
               _loc5_.sName_1.text = String(this.getRune(this.tempGearArray[_loc3_][0], this.tempGearArray[_loc3_][1], 0, 0));
               _loc5_.sName_2.text = String(this.getRune(this.tempGearArray[_loc3_][0], this.tempGearArray[_loc3_][1], 1, 0));
               _loc5_.rName.text = String(this.getRune(this.tempGearArray[_loc3_][0], this.tempGearArray[_loc3_][1], 0, 5));
               _loc5_.portr.gotoAndStop(this.tempGearArray[_loc3_][0] * 10 + this.tempGearArray[_loc3_][1] + 100);
               _loc5_.mouseChildren = false;
               _loc5_.name = "gear_" + this.tempGearArray[_loc3_][3];
               _loc5_.x = 0;
               _loc5_.y = _loc3_ * 60;
               _loc5_.cacheAsBitmap = true;
               this.inventory.army1.gotoAndStop(2);
               this.inventory.army1.gearHolder.addChild(_loc5_);
            }
            _loc3_++;
         }
      }

      public function loadSquad():void
      {
         this.inventory.army2.btnRemove.gotoAndStop(1);
         this.inventory.army2.btnRemove.mouseChildren = false;
         var _loc1_:int = 0;
         while (_loc1_ < 15)
         {
            this.inventory.army2["squad_" + _loc1_].gotoAndStop(1);
            this.inventory.army2["squad_" + _loc1_].mouseChildren = false;
            this.inventory.army2.squadHolder.mouseEnabled = false;
            switch (true)
            {
               case _loc1_ == 0 && this.inventoryDeck.length > 0:
                  this.placeSquad(_loc1_, 530, 97, 80);
                  break;
               case _loc1_ == 1 && this.inventoryDeck.length > 1:
                  this.placeSquad(_loc1_, 420, 164, 75);
                  break;
               case _loc1_ == 2 && this.inventoryDeck.length > 2:
                  this.placeSquad(_loc1_, 650, 164, 75);
                  break;
               case _loc1_ == 3 && this.inventoryDeck.length > 3:
                  this.placeSquad(_loc1_, 360, 242, 70);
                  break;
               case _loc1_ == 4 && this.inventoryDeck.length > 4:
                  this.placeSquad(_loc1_, 480, 242, 70);
                  break;
               case _loc1_ == 5 && this.inventoryDeck.length > 5:
                  this.placeSquad(_loc1_, 590, 242, 70);
                  break;
               case _loc1_ == 6 && this.inventoryDeck.length > 6:
                  this.placeSquad(_loc1_, 710, 242, 70);
                  break;
               case _loc1_ == 7 && this.inventoryDeck.length > 7:
                  this.placeSquad(_loc1_, 360, 332, 70);
                  break;
               case _loc1_ == 8 && this.inventoryDeck.length > 8:
                  this.placeSquad(_loc1_, 480, 332, 70);
                  break;
               case _loc1_ == 9 && this.inventoryDeck.length > 9:
                  this.placeSquad(_loc1_, 590, 332, 70);
                  break;
               case _loc1_ == 10 && this.inventoryDeck.length > 10:
                  this.placeSquad(_loc1_, 710, 332, 70);
                  break;
               case _loc1_ == 11 && this.inventoryDeck.length > 11:
                  this.placeSquad(_loc1_, 360, 412, 70);
                  break;
               case _loc1_ == 12 && this.inventoryDeck.length > 12:
                  this.placeSquad(_loc1_, 480, 412, 70);
                  break;
               case _loc1_ == 13 && this.inventoryDeck.length > 13:
                  this.placeSquad(_loc1_, 590, 412, 70);
                  break;
               case _loc1_ == 14 && this.inventoryDeck.length > 14:
                  this.placeSquad(_loc1_, 710, 412, 70);
                  break;
            }
            _loc1_++;
         }
      }

      public function inventoryClick(param1:MouseEvent):void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if (!this.eventLock)
         {
            switch (true)
            {
               case param1.target.name == "btnInvBack" && (this.inventoryDeck[0][0] != "0000" && this.inventoryDeck[1][0] != "0000" && this.inventoryDeck[2][0] != "0000"):
                  this.unloadInventory();
                  this.loadWorldMap();
                  break;
               case param1.target.name == "btnInvBack" && (this.inventoryDeck[0][0] == "0000" || this.inventoryDeck[1][0] == "0000" || this.inventoryDeck[2][0] == "0000"):
                  this.inventory.army1.gotoAndStop(1);
                  this.loadInvUnits();
                  this.inventState = 3;
                  this.inventory.army2.gotoAndStop(3);
                  this.squadMenu();
                  break;
               case param1.target.name == "btnUnit":
                  this.inventory.army1.gotoAndStop(1);
                  this.loadInvUnits();
                  break;
               case param1.target.name == "btnItem" && this.inventState == 1:
                  this.inventory.army1.gotoAndStop(2);
                  this.sortBy(10);
                  break;
               case param1.target.name == "btnInfo":
                  this.inventState = 1;
                  this.loadInvUnits();
                  this.inventory.army2.gotoAndStop(1);
                  this.infoMenu(this.selectedUnit);
                  break;
               case param1.target.name == "btnEquip":
                  this.inventState = 2;
                  this.loadInvUnits();
                  this.inventory.army2.gotoAndStop(2);
                  this.loadGear(this.selectedUnit);
                  break;
               case param1.target.name == "btnSquad":
                  this.inventState = 3;
                  this.loadInvUnits();
                  this.inventory.army2.gotoAndStop(3);
                  this.squadMenu();
                  break;
               case param1.target.name == "btnSummon":
                  this.inventState = 4;
                  this.inventory.army2.gotoAndStop(4);
                  this.summonMenu();
                  break;
               case param1.target.name == "btnEva":
                  this.inventState = 5;
                  this.resetInvList();
                  this.inventory.army2.gotoAndStop(5);
                  this.evaMenu();
                  break;
               case param1.target.name == "btnRemove" && this.inventState == 1:
                  this.exileUnit();
                  break;
               case param1.target.name == "btnChantCancel":
                  this.clearExile();
                  break;
               case param1.target.name == "btnChantGo":
                  this.exileUnit_sub();
                  break;
               case param1.target.name == "btnTank" && this.inventState == 5:
                  this.updateClass(1);
                  break;
               case param1.target.name == "btnFighter" && this.inventState == 5:
                  this.updateClass(2);
                  break;
               case param1.target.name == "btnScout" && this.inventState == 5:
                  this.updateClass(3);
                  break;
               case param1.target.name == "btnHealer" && this.inventState == 5:
                  this.updateClass(4);
                  break;
               case param1.target.name == "btnMage" && this.inventState == 5:
                  this.updateClass(5);
                  break;
               case param1.target.name == "btnTank" && this.inventState == 1:
                  this.updateChant(1);
                  break;
               case param1.target.name == "btnFighter" && this.inventState == 1:
                  this.updateChant(2);
                  break;
               case param1.target.name == "btnScout" && this.inventState == 1:
                  this.updateChant(3);
                  break;
               case param1.target.name == "btnHealer" && this.inventState == 1:
                  this.updateChant(4);
                  break;
               case param1.target.name == "btnMage" && this.inventState == 1:
                  this.updateChant(5);
                  break;
               case param1.target.name == "scrollUpPage":
                  this.invPage(1);
                  break;
               case param1.target.name == "scrollUpEnd":
                  this.invPage(0);
                  break;
               case param1.target.name == "scrollDownPage":
                  this.invPage(3);
                  break;
               case param1.target.name == "scrollDownEnd":
                  this.invPage(2);
                  break;
               case param1.target.name == "btnC":
                  this.sortBy(0);
                  break;
               case param1.target.name == "btnT":
                  this.sortBy(1);
                  break;
               case param1.target.name == "btnS":
                  this.sortBy(2);
                  break;
               case param1.target.name == "btnR":
                  this.sortBy(3);
                  break;
               case param1.target.name == "squad_0":
                  this.squadSel(0);
                  break;
               case param1.target.name == "squad_1":
                  this.squadSel(1);
                  break;
               case param1.target.name == "squad_2":
                  this.squadSel(2);
                  break;
               case param1.target.name == "squad_3":
                  this.squadSel(3);
                  break;
               case param1.target.name == "squad_4":
                  this.squadSel(4);
                  break;
               case param1.target.name == "squad_5":
                  this.squadSel(5);
                  break;
               case param1.target.name == "squad_6":
                  this.squadSel(6);
                  break;
               case param1.target.name == "squad_7":
                  this.squadSel(7);
                  break;
               case param1.target.name == "squad_8":
                  this.squadSel(8);
                  break;
               case param1.target.name == "squad_9":
                  this.squadSel(9);
                  break;
               case param1.target.name == "squad_10":
                  this.squadSel(10);
                  break;
               case param1.target.name == "squad_11":
                  this.squadSel(11);
                  break;
               case param1.target.name == "squad_12":
                  this.squadSel(12);
                  break;
               case param1.target.name == "squad_13":
                  this.squadSel(13);
                  break;
               case param1.target.name == "squad_14":
                  this.squadSel(14);
                  break;
               case param1.target.name == "boss_0":
                  this.loadSummon(2, 1);
                  break;
               case param1.target.name == "boss_1":
                  this.loadSummon(2, 2);
                  break;
               case param1.target.name == "boss_2":
                  this.loadSummon(2, 3);
                  break;
               case param1.target.name == "boss_3":
                  this.loadSummon(2, 4);
                  break;
               case param1.target.name == "boss_4":
                  this.loadSummon(2, 5);
                  break;
               case param1.target.name == "boss_5":
                  this.loadSummon(2, 6);
                  break;
               case param1.target.name == "boss_6":
                  this.loadSummon(2, 7);
                  break;
               case param1.target.name == "minion_0":
                  this.loadSummon(1, 1);
                  break;
               case param1.target.name == "minion_1":
                  this.loadSummon(1, 2);
                  break;
               case param1.target.name == "minion_2":
                  this.loadSummon(1, 3);
                  break;
               case param1.target.name == "minion_3":
                  this.loadSummon(1, 4);
                  break;
               case param1.target.name == "minion_4":
                  this.loadSummon(1, 5);
                  break;
               case param1.target.name == "minion_5":
                  this.loadSummon(1, 6);
                  break;
               case param1.target.name == "minion_6":
                  this.loadSummon(1, 7);
                  break;
               case param1.target.name == "minion_7":
                  this.loadSummon(1, 8);
                  break;
               case param1.target.name == "hero_0":
                  this.loadSummon(3, 1);
                  break;
               case param1.target.name == "hero_1":
                  this.loadSummon(3, 2);
                  break;
               case param1.target.name == "hero_2":
                  this.loadSummon(3, 3);
                  break;
               case param1.target.name == "hero_3":
                  this.loadSummon(3, 4);
                  break;
               case param1.target.name == "hero_4":
                  this.loadSummon(3, 5);
                  break;
               case param1.target.name == "hero_5":
                  this.loadSummon(3, 6);
                  break;
               case param1.target.name == "hero_6":
                  this.loadSummon(3, 7);
                  break;
               case param1.target.name == "hero_7":
                  this.loadSummon(3, 8);
                  break;
               case param1.target.name == "oneStar":
                  this.beginSummon(1);
                  break;
               case param1.target.name == "twoStar":
                  this.beginSummon(2);
                  break;
               case param1.target.name == "threeStar":
                  this.beginSummon(3);
                  break;
               case param1.target.name == "bossStar":
                  this.beginSummon(4);
                  break;
               case param1.target.name == "heroStar":
                  this.beginSummon(5);
                  break;
               case param1.target.name == "btnInfinity":
                  this.beginSummon(6);
                  break;
               case param1.target.name == "btnRemove" && this.inventory.army2.btnRemove.currentFrame == 2:
                  this.removeSquad(this.squadSelect);
                  break;
               case param1.target.name == "btnRemoveAll":
                  this.removeSquadA();
                  break;
               case param1.target.name == "btnRem_1":
                  this.remGear(1);
                  break;
               case param1.target.name == "btnRem_2":
                  this.remGear(2);
                  break;
               case param1.target.name == "btnSel_1":
                  this.selGear(1);
                  break;
               case param1.target.name == "btnSel_2":
                  this.selGear(2);
            }
            _loc2_ = 0;
            while (_loc2_ < this.cardInventory.length)
            {
               switch (true)
               {
                  case param1.target.name == "unit_" + _loc2_ && this.inventState == 1:
                     this.infoMenu(_loc2_);
                     break;
                  case param1.target.name == "unit_" + _loc2_ && this.inventState == 2:
                     this.loadGear(_loc2_);
                     break;
                  case param1.target.name == "unit_" + _loc2_ && this.inventState == 3 && this.squadSelect >= 0 && this.cardInventory[_loc2_][0][8] < 0 && param1.target.alpha == 1:
                     this.swapSquad(_loc2_, this.squadSelect, 0);
                     break;
               }
               _loc2_++;
            }
            _loc3_ = 0;
            while (_loc3_ < this.gearInventory.length)
            {
               switch (true)
               {
                  case param1.target.name == "gear_" + _loc3_ && this.inventState == 2:
                     this.equipGear(_loc3_);
                     break;
               }
               _loc3_++;
            }
         }
         else if (this.cSpecial != null)
         {
            if (this.cSpecial.eventType > 0)
            {
               this.cSpecial.finished = true;
            }
         }
      }

      public function evaMenu():void
      {
         this.inventory.army2.curClass.gotoAndStop(this.charData[0]);
         this.inventory.army2.abilities.gotoAndStop(this.charData[0]);
         this.inventory.army2.abilities.ability1.gotoAndStop(this.charData[0] * 10 + 1);
         this.inventory.army2.abilities.ability2.gotoAndStop(this.charData[0] * 10 + 2);
         this.inventory.army2.abilities.ability3.gotoAndStop(this.charData[0] * 10 + 3);
         this.inventory.army2.abilities.ability4.gotoAndStop(this.charData[0] * 10 + 4);
         this.inventory.army2.abilities.ability5.gotoAndStop(this.charData[0] * 10 + 6);
         this.inventory.army2.eATK.text = Math.floor(this.charData[1] * this.charData[10]);
         this.inventory.army2.eHP.text = Math.floor(this.charData[2]);
         this.inventory.army2.eMOVE.text = Math.floor(this.charData[3]);
      }

      public function updateClass(param1:int):void
      {
         this.charClass(param1);
         this.evaMenu();
      }

      public function exileUnit():void
      {
         var _loc1_:int = 0;
         if (this.inventory.army2.btnRemove.currentFrame == 2)
         {
            this.miscOverlay = new asChantOver();
            this.inventory.addChild(this.miscOverlay);
            this.combatSwap = true;
            this.miscOverlay.btnTank.visible = false;
            this.miscOverlay.btnFighter.visible = false;
            this.miscOverlay.btnScout.visible = false;
            this.miscOverlay.btnHealer.visible = false;
            this.miscOverlay.btnMage.visible = false;
            this.miscOverlay.btnChantGo.gotoAndStop(1);
            this.miscOverlay.curClass.gotoAndStop(6);
            this.skillType = this.cardInventory[this.selectedUnit][1][0];
            _loc1_ = 0;
            while (_loc1_ < this.gearInventory.length)
            {
               switch (true)
               {
                  case this.gearInventory[_loc1_][0] == 1 && this.gearInventory[_loc1_][2] == 1:
                     this.miscOverlay.btnTank.visible = true;
                     break;
                  case this.gearInventory[_loc1_][0] == 2 && this.gearInventory[_loc1_][2] == 1:
                     this.miscOverlay.btnFighter.visible = true;
                     break;
                  case this.gearInventory[_loc1_][0] == 3 && this.gearInventory[_loc1_][2] == 1:
                     this.miscOverlay.btnScout.visible = true;
                     break;
                  case this.gearInventory[_loc1_][0] == 4 && this.gearInventory[_loc1_][2] == 1:
                     this.miscOverlay.btnHealer.visible = true;
                     break;
                  case this.gearInventory[_loc1_][0] == 5 && this.gearInventory[_loc1_][2] == 1:
                     this.miscOverlay.btnMage.visible = true;
                     break;
               }
               _loc1_++;
            }
            switch (true)
            {
               case this.cardInventory[this.selectedUnit][1][0] == 1:
                  this.miscOverlay.btnChantGo.gotoAndStop(2);
                  this.miscOverlay.btnTank.visible = true;
                  this.miscOverlay.curClass.gotoAndStop(1);
                  break;
               case this.cardInventory[this.selectedUnit][1][0] == 2:
                  this.miscOverlay.btnChantGo.gotoAndStop(2);
                  this.miscOverlay.btnFighter.visible = true;
                  this.miscOverlay.curClass.gotoAndStop(2);
                  break;
               case this.cardInventory[this.selectedUnit][1][0] == 3:
                  this.miscOverlay.btnChantGo.gotoAndStop(2);
                  this.miscOverlay.btnScout.visible = true;
                  this.miscOverlay.curClass.gotoAndStop(3);
                  break;
               case this.cardInventory[this.selectedUnit][1][0] == 4:
                  this.miscOverlay.btnChantGo.gotoAndStop(2);
                  this.miscOverlay.btnHealer.visible = true;
                  this.miscOverlay.curClass.gotoAndStop(4);
                  break;
               case this.cardInventory[this.selectedUnit][1][0] == 5:
                  this.miscOverlay.btnChantGo.gotoAndStop(2);
                  this.miscOverlay.btnMage.visible = true;
                  this.miscOverlay.curClass.gotoAndStop(5);
            }
         }
      }

      public function updateChant(param1:int):void
      {
         this.skillType = param1;
         this.miscOverlay.curClass.gotoAndStop(param1);
         this.miscOverlay.btnChantGo.gotoAndStop(2);
      }

      public function clearExile():void
      {
         this.combatSwap = false;
         this.inventory.removeChild(this.miscOverlay);
         this.miscOverlay = null;
      }

      public function exileUnit_sub():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if (this.miscOverlay.btnChantGo.currentFrame == 2)
         {
            if (this.cardInventory[this.selectedUnit][1][0] != 6)
            {
               _loc1_ = int(this.gearInventory.length);
               this.gearInventory[_loc1_] = new Array();
               this.gearInventory[_loc1_] = this.cardInventory[this.selectedUnit][1].concat();
               this.gearInventory[_loc1_][3] = 1;
               this.gearInventory[_loc1_][2] = 1;
               this.cardInventory[this.selectedUnit][1] = new Array(6, 1);
            }
            if (this.cardInventory[this.selectedUnit][2][0] != 0)
            {
               _loc1_ = int(this.gearInventory.length);
               this.gearInventory[_loc1_] = new Array();
               this.gearInventory[_loc1_] = this.cardInventory[this.selectedUnit][2].concat();
               this.gearInventory[_loc1_][2] = 2;
               this.gearInventory[_loc1_][3] = 2;
               this.cardInventory[this.selectedUnit][2][0] = 0;
               this.cardInventory[this.selectedUnit][2][1] = 1;
            }
            _loc2_ = 0;
            while (_loc2_ < this.gearInventory.length)
            {
               if (this.gearInventory[_loc2_][0] == this.skillType && this.gearInventory[_loc2_][1] == 1 && this.gearInventory[_loc2_][2] == 1)
               {
                  this.cardInventory[this.selectedUnit][1][0] = this.gearInventory[_loc2_][0];
                  this.cardInventory[this.selectedUnit][1][1] = this.gearInventory[_loc2_][1];
                  this.gearInventory.splice(_loc2_, 1);
                  this.skillType = 99;
                  break;
               }
               _loc2_++;
            }
            _loc3_ = 0;
            while (_loc3_ < this.gearInventory.length)
            {
               if (this.gearInventory[_loc3_][0] == this.skillType && this.gearInventory[_loc3_][1] == 2 && this.gearInventory[_loc3_][2] == 1)
               {
                  this.cardInventory[this.selectedUnit][1][0] = this.gearInventory[_loc3_][0];
                  this.cardInventory[this.selectedUnit][1][1] = this.gearInventory[_loc3_][1];
                  this.gearInventory.splice(_loc3_, 1);
                  this.skillType = 99;
                  break;
               }
               _loc3_++;
            }
            _loc4_ = 0;
            while (_loc4_ < this.gearInventory.length)
            {
               if (this.gearInventory[_loc4_][0] == this.skillType && this.gearInventory[_loc4_][1] == 3 && this.gearInventory[_loc4_][2] == 1)
               {
                  this.cardInventory[this.selectedUnit][1][0] = this.gearInventory[_loc4_][0];
                  this.cardInventory[this.selectedUnit][1][1] = this.gearInventory[_loc4_][1];
                  this.gearInventory.splice(_loc4_, 1);
                  this.skillType = 99;
                  break;
               }
               _loc4_++;
            }
            _loc5_ = 0;
            while (_loc5_ < this.gearInventory.length)
            {
               if (this.gearInventory[_loc5_][0] == this.skillType && this.gearInventory[_loc5_][2] == 1)
               {
                  this.cardInventory[this.selectedUnit][1][0] = this.gearInventory[_loc5_][0];
                  this.cardInventory[this.selectedUnit][1][1] = this.gearInventory[_loc5_][1];
                  this.gearInventory.splice(_loc5_, 1);
                  this.skillType = 99;
                  break;
               }
               _loc5_++;
            }
            _loc1_ = int(this.exileInventory.length);
            this.exileInventory[_loc1_] = new Array();
            this.exileInventory[_loc1_][0] = new Array();
            this.exileInventory[_loc1_][1] = new Array();
            this.exileInventory[_loc1_][0] = this.cardInventory[this.selectedUnit][0].concat();
            this.exileInventory[_loc1_][1] = this.cardInventory[this.selectedUnit][1].concat();
            switch (true)
            {
               case this.cardInventory[this.selectedUnit][1][0] == 1:
                  this.exileClasses[1] += 1;
                  break;
               case this.cardInventory[this.selectedUnit][1][0] == 2:
                  this.exileClasses[2] += 1;
                  break;
               case this.cardInventory[this.selectedUnit][1][0] == 3:
                  this.exileClasses[3] += 1;
                  break;
               case this.cardInventory[this.selectedUnit][1][0] == 4:
                  this.exileClasses[4] += 1;
                  break;
               case this.cardInventory[this.selectedUnit][1][0] == 5:
                  this.exileClasses[5] += 1;
                  break;
               case this.cardInventory[this.selectedUnit][1][0] == 6:
                  this.exileClasses[6] += 1;
            }
            this.charClass(this.charData[0]);
            this.cardInventory.splice(this.selectedUnit, 1);
            this.sortUnits();
            this.loadInvUnits();
            this.inventory.army2.gotoAndStop(1);
            this.infoMenu(0);
            this.selectedUnit = 0;
            this.clearExile();
         }
      }

      public function equipGear(param1:*):void
      {
         if (this.gearInventory[param1][2] == 1)
         {
            if (this.cardInventory[this.selectedUnit][0][8] >= 0)
            {
               this.inventoryDeck[this.cardInventory[this.selectedUnit][0][8]][0] = "0000";
               this.cardInventory[this.selectedUnit][0][8] = -1;
            }
            if (this.cardInventory[this.selectedUnit][1][0] != 6)
            {
               this.remGear(1);
            }
            this.cardInventory[this.selectedUnit][1][0] = this.gearInventory[param1][0];
            this.cardInventory[this.selectedUnit][1][1] = this.gearInventory[param1][1];
            this.gearInventory.splice(param1, 1);
         }
         else
         {
            if (this.cardInventory[this.selectedUnit][2][1] != 0)
            {
               this.remGear(2);
            }
            this.cardInventory[this.selectedUnit][2][0] = this.gearInventory[param1][0];
            this.cardInventory[this.selectedUnit][2][1] = this.gearInventory[param1][1];
            if (this.cardInventory[this.selectedUnit][0][8] >= 0)
            {
               this.inventoryDeck[this.cardInventory[this.selectedUnit][0][8]][2][0] = this.gearInventory[param1][0];
               this.inventoryDeck[this.cardInventory[this.selectedUnit][0][8]][2][1] = this.gearInventory[param1][1];
            }
            this.gearInventory.splice(param1, 1);
         }
         this.loadInvUnits();
         this.loadGear(this.selectedUnit);
      }

      public function selGear(param1:int):void
      {
         if (this.inventory.army1.currentFrame == 2)
         {
            this.resetGearList();
         }
         this.sortBy(11);
         this.setGearList(param1);
      }

      public function remGear(param1:int):void
      {
         if (param1 == 1)
         {
            if (this.cardInventory[this.selectedUnit][0][8] >= 0)
            {
               this.inventoryDeck[this.cardInventory[this.selectedUnit][0][8]][0] = "0000";
               this.cardInventory[this.selectedUnit][0][8] = -1;
            }
            if (this.cardInventory[this.selectedUnit][1][0] != 6)
            {
               this.gearInventory.push(new Array(this.cardInventory[this.selectedUnit][1][0], this.cardInventory[this.selectedUnit][1][1], 1));
               this.cardInventory[this.selectedUnit][1][0] = 6;
               this.cardInventory[this.selectedUnit][1][1] = 1;
               if (this.cardInventory[this.selectedUnit][0][8] >= 0)
               {
                  this.inventoryDeck[this.cardInventory[this.selectedUnit][0][8]][1][0] = 6;
                  this.inventoryDeck[this.cardInventory[this.selectedUnit][0][8]][1][1] = 1;
               }
            }
         }
         else if (this.cardInventory[this.selectedUnit][2][0] != 0)
         {
            this.gearInventory.push(new Array(this.cardInventory[this.selectedUnit][2][0], this.cardInventory[this.selectedUnit][2][1], 2));
            this.cardInventory[this.selectedUnit][2][0] = 0;
            this.cardInventory[this.selectedUnit][2][1] = 1;
            if (this.cardInventory[this.selectedUnit][0][8] >= 0)
            {
               this.inventoryDeck[this.cardInventory[this.selectedUnit][0][8]][2][0] = 0;
               this.inventoryDeck[this.cardInventory[this.selectedUnit][0][8]][2][1] = 1;
            }
         }
         this.loadInvUnits();
         this.loadGear(this.selectedUnit);
      }

      public function loadGear(param1:int):void
      {
         this.selectedUnit = param1;
         if (this.cardInventory[param1][0][7] > 7)
         {
            this.inventory.army2.btnSel_1.visible = false;
            this.inventory.army2.btnSel_2.visible = false;
            this.inventory.army2.btnRem_1.visible = false;
            this.inventory.army2.btnRem_2.visible = false;
         }
         else
         {
            this.inventory.army2.btnSel_1.visible = true;
            this.inventory.army2.btnSel_2.visible = true;
            this.inventory.army2.btnRem_1.visible = true;
            this.inventory.army2.btnRem_2.visible = true;
         }
         var _loc2_:int = this.cardInventory[param1][0][7] * 10 + this.cardInventory[param1][1][0];
         var _loc3_:int = int(this.getRune(this.cardInventory[param1][2][0], this.cardInventory[param1][2][1], this.cardInventory[param1][0][6], 2));
         var _loc4_:int = int(this.getRune(this.cardInventory[param1][2][0], this.cardInventory[param1][2][1], this.cardInventory[param1][0][6], 3));
         this.inventory.army2.unitHolder.gotoAndStop(_loc2_);
         this.inventory.army2.gearPort.portr.gotoAndStop(this.cardInventory[param1][1][0] * 10 + this.cardInventory[param1][1][1]);
         this.inventory.army2.gName.text = this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 8, 1, this.cardInventory[param1][0][10]);
         this.inventory.army2.atk_1.text = this.cardInventory[param1][0][1];
         this.inventory.army2.atk_3.text = this.getInvChant(this.cardInventory[param1][1][0], 0, this.cardInventory[param1][0][3] + int(this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 3, 1, this.cardInventory[param1][0][10])));
         this.inventory.army2.atk_4.text = String(this.getInvCorr(this.cardInventory[param1][0][10], 0));
         this.inventory.army2.atk_2.text = String(int(this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 1, 1, this.cardInventory[param1][0][10])) - (int(this.inventory.army2.atk_3.text) + int(this.inventory.army2.atk_4.text)));
         this.inventory.army2.atk_5.text = int(this.inventory.army2.atk_1.text) + int(this.inventory.army2.atk_2.text) + int(this.inventory.army2.atk_3.text) + int(this.inventory.army2.atk_4.text);
         this.inventory.army2.hp_1.text = this.cardInventory[param1][0][2];
         this.inventory.army2.hp_3.text = this.getInvChant(this.cardInventory[param1][1][0], 1, this.cardInventory[param1][0][3] + int(this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 3, 1, this.cardInventory[param1][0][10])));
         this.inventory.army2.hp_4.text = String(this.getInvCorr(this.cardInventory[param1][0][10], 1));
         this.inventory.army2.hp_2.text = String(int(this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 2, 1, this.cardInventory[param1][0][10])) - (int(this.inventory.army2.hp_3.text) + int(this.inventory.army2.hp_4.text)));
         this.inventory.army2.hp_5.text = int(this.inventory.army2.hp_1.text) + int(this.inventory.army2.hp_2.text) + int(this.inventory.army2.hp_3.text) + int(this.inventory.army2.hp_4.text);
         this.inventory.army2.mana_1.text = this.cardInventory[param1][0][3];
         this.inventory.army2.mana_2.text = this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 3, 1, this.cardInventory[param1][0][10]);
         this.inventory.army2.mana_5.text = int(this.inventory.army2.mana_1.text) + int(this.inventory.army2.mana_2.text);
         this.inventory.army2.move_1.text = this.cardInventory[param1][0][4];
         this.inventory.army2.move_2.text = this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 4, 1, this.cardInventory[param1][0][10]);
         this.inventory.army2.move_5.text = int(this.inventory.army2.move_1.text) + int(this.inventory.army2.move_2.text);
         this.inventory.army2.range_1.text = this.cardInventory[param1][0][5];
         this.inventory.army2.range_2.text = this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 5, 1, this.cardInventory[param1][0][10]);
         this.inventory.army2.range_5.text = int(this.inventory.army2.range_1.text) + int(this.inventory.army2.range_2.text);
         this.inventory.army2.runePort.portr.gotoAndStop(this.cardInventory[param1][2][0] * 10 + this.cardInventory[param1][2][1] + 100);
         this.inventory.army2.rName.text = String(this.getRune(this.cardInventory[param1][2][0], this.cardInventory[param1][2][1], this.cardInventory[param1][0][6], 5));
         this.inventory.army2.sName.text = this.getRune(this.cardInventory[param1][2][0], this.cardInventory[param1][2][1], this.cardInventory[param1][0][6], 0);
         this.inventory.army2.sDesc.text = this.getDescription(this.getRune(this.cardInventory[param1][2][0], this.cardInventory[param1][2][1], this.cardInventory[param1][0][6], 0), _loc3_, _loc4_);
      }

      public function getInvChant(param1:int, param2:int, param3:int):int
      {
         switch (true)
         {
            case this.exileClasses[param1] > 69 && param2 == 1 && param3 == 4:
               return 6;
            case this.exileClasses[param1] > 69 && param2 == 1 && param3 == 3:
               return 4;
            case this.exileClasses[param1] > 69 && param2 == 1 && param3 == 2:
               return 4;
            case this.exileClasses[param1] > 49 && param2 == 1 && param3 == 4:
               return 4;
            case this.exileClasses[param1] > 29 && param2 == 1 && param3 == 3:
               return 2;
            case this.exileClasses[param1] > 9 && param2 == 1 && param3 == 2:
               return 2;
            case this.exileClasses[param1] > 59 && param2 == 0 && param3 == 4:
               return 2;
            case this.exileClasses[param1] > 39 && param2 == 0 && param3 == 3:
               return 1;
            case this.exileClasses[param1] > 19 && param2 == 0 && param3 == 2:
               return 1;
            default:
               return 0;
         }
      }

      public function getInvCorr(param1:int, param2:int):int
      {
         switch (true)
         {
            case param1 == 2 && param2 == 1:
               return 1;
            case param1 == 3 && param2 == 1:
               return 2;
            case param1 == 4 && param2 == 1:
               return 4;
            case param1 == 3 && param2 == 0:
               return 1;
            case param1 == 4 && param2 == 0:
               return 2;
            default:
               return 0;
         }
      }

      public function summonMenu():void
      {
         switch (true)
         {
            case this.inventory.army1.currentFrame == 1:
               this.resetInvList();
               break;
            case this.inventory.army1.currentFrame == 2:
               this.resetGearList();
         }
         var _loc1_:int = 0;
         while (_loc1_ < 8)
         {
            if (_loc1_ < 7)
            {
               this.inventory.army2["boss_" + _loc1_].mouseChildren = false;
               this.inventory.army2["minion_" + _loc1_].mouseChildren = false;
               this.inventory.army2["hero_" + _loc1_].mouseChildren = false;
               if (this.specialEvents[_loc1_ + 11] > 0)
               {
                  this.inventory.army2["boss_" + _loc1_].gotoAndStop(2);
               }
               else
               {
                  this.inventory.army2["boss_" + _loc1_].gotoAndStop(1);
               }
               if (this.specialEvents[_loc1_ + 1] > 0)
               {
                  this.inventory.army2["minion_" + _loc1_].gotoAndStop(2);
               }
               else
               {
                  this.inventory.army2["minion_" + _loc1_].gotoAndStop(1);
               }
               if (this.specialEvents[_loc1_ + 21] > 0)
               {
                  this.inventory.army2["hero_" + _loc1_].gotoAndStop(2);
               }
               else
               {
                  this.inventory.army2["hero_" + _loc1_].gotoAndStop(1);
               }
            }
            else
            {
               this.inventory.army2["minion_" + _loc1_].mouseChildren = false;
               this.inventory.army2["hero_" + _loc1_].mouseChildren = false;
               if (this.specialEvents[_loc1_ + 1] > 0)
               {
                  this.inventory.army2["minion_" + _loc1_].gotoAndStop(2);
               }
               else
               {
                  this.inventory.army2["minion_" + _loc1_].gotoAndStop(1);
               }
               if (this.specialEvents[_loc1_ + 21] > 0)
               {
                  this.inventory.army2["hero_" + _loc1_].gotoAndStop(2);
               }
               else
               {
                  this.inventory.army2["hero_" + _loc1_].gotoAndStop(1);
               }
            }
            _loc1_++;
         }
         this.inventory.army2.sumBar.gotoAndStop(1);
      }

      public function loadSummon(param1:int, param2:int):void
      {
         this.euType = param2;
         this.inventory.army2.sumBar.gotoAndStop(param1 + 1);
         if (param1 == 1)
         {
            this.inventory.army2.sumBar.oneStar.mouseChildren = false;
            this.inventory.army2.sumBar.twoStar.mouseChildren = false;
            this.inventory.army2.sumBar.threeStar.mouseChildren = false;
            if (this.specialEvents[param2] >= 3)
            {
               this.inventory.army2.sumBar.threeStar.gotoAndStop(param2 + 10);
            }
            else
            {
               this.inventory.army2.sumBar.threeStar.gotoAndStop(param2);
            }
            if (this.specialEvents[param2] >= 2)
            {
               this.inventory.army2.sumBar.twoStar.gotoAndStop(param2 + 10);
            }
            else
            {
               this.inventory.army2.sumBar.twoStar.gotoAndStop(param2);
            }
            if (this.specialEvents[param2] >= 1)
            {
               this.inventory.army2.sumBar.oneStar.gotoAndStop(param2 + 10);
            }
            else
            {
               this.inventory.army2.sumBar.oneStar.gotoAndStop(param2);
            }
         }
         else if (param1 == 2)
         {
            this.inventory.army2.sumBar.bossStar.mouseChildren = false;
            if (this.specialEvents[param2 + 10] == 0)
            {
               this.inventory.army2.sumBar.bossStar.gotoAndStop(param2 + 10);
            }
            else
            {
               this.inventory.army2.sumBar.bossStar.gotoAndStop(param2);
            }
         }
         else if (param1 == 3)
         {
            this.inventory.army2.sumBar.heroStar.mouseChildren = false;
            if (this.specialEvents[param2 + 20] == 0)
            {
               this.inventory.army2.sumBar.heroStar.gotoAndStop(param2 + 10);
            }
            else
            {
               this.inventory.army2.sumBar.heroStar.gotoAndStop(param2);
            }
         }
      }

      public function beginSummon(param1:int):void
      {
         this.eventLock = true;
         switch (true)
         {
            case param1 < 4:
               this.cSpecial = new asModEvent(this.euType * 10 + param1);
               break;
            case param1 == 4:
               this.cSpecial = new asModEvent((this.euType + 10) * 10 + 1);
               break;
            case param1 == 5:
               this.cSpecial = new asModEvent(this.euType + 90);
               break;
            case param1 == 6:
               this.cSpecial = new asModEvent(54);
         }
         switch (true)
         {
            case this.euType == 2 && param1 == 2:
               this.cSpecial.x = 0;
               this.cSpecial.y = 62;
               break;
            case this.euType == 4 && param1 == 1:
               this.cSpecial.x = 322;
               this.cSpecial.y = 417;
               break;
            case this.euType == 4 && param1 == 2:
               this.cSpecial.x = 322.05;
               this.cSpecial.y = 415.95;
               break;
            case this.euType == 5 && param1 == 1:
               this.cSpecial.x = -114.65;
               this.cSpecial.y = 479.05;
         }
         if (param1 == 1 && this.specialEvents[this.euType] >= 1 || param1 == 2 && this.specialEvents[this.euType] >= 2 || param1 == 3 && this.specialEvents[this.euType] >= 3 || param1 == 4 && this.specialEvents[this.euType + 10] >= 1 || param1 == 5 && this.specialEvents[this.euType + 20] >= 1 || param1 == 6)
         {
            addChild(this.cSpecial);
            addChild(this.specMask);
            this.cSpecial.mask = this.specMask;
         }
         else
         {
            this.eventLock = false;
            this.cSpecial = null;
         }
      }

      public function infoMenu(param1:int):void
      {
         this.selectedUnit = param1;
         var _loc2_:int = this.cardInventory[param1][0][7] * 10 + this.cardInventory[param1][1][0];
         var _loc3_:int = int(this.getRune(this.cardInventory[param1][2][0], this.cardInventory[param1][2][1], this.cardInventory[param1][0][6], 2));
         var _loc4_:int = int(this.getRune(this.cardInventory[param1][2][0], this.cardInventory[param1][2][1], this.cardInventory[param1][0][6], 3));
         this.inventory.army2.xpBar.gotoAndStop(Math.floor(100 * (this.cardInventory[param1][0][11] / (this.cardInventory[param1][0][10] * 5))) + 1);
         this.inventory.army2.txtLevel.text = this.getCardRank(this.cardInventory[param1][0][10]);
         this.inventory.army2.unitHolder.gotoAndStop(_loc2_);
         this.inventory.army2.uName.text = this.getTitle(this.cardInventory[param1][0][7], this.cardInventory[param1][1][0]);
         this.inventory.army2.infoText.text = this.getInfo(this.cardInventory[param1][0][7], this.cardInventory[param1][1][0]);
         this.inventory.army2.mana.text = this.cardInventory[param1][0][3] + int(this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 3, 1, this.cardInventory[param1][0][10]));
         this.inventory.army2.atk.text = this.cardInventory[param1][0][1] + int(this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 1, 1, this.cardInventory[param1][0][10]));
         this.inventory.army2.hp.text = this.cardInventory[param1][0][2] + int(this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 2, 1, this.cardInventory[param1][0][10]));
         this.inventory.army2.aRange.text = this.cardInventory[param1][0][5] + int(this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 5, 1, this.cardInventory[param1][0][10]));
         this.inventory.army2.cMove.text = this.cardInventory[param1][0][4] + int(this.getWeapon(this.cardInventory[param1][1][0], this.cardInventory[param1][1][1], 4, 1, this.cardInventory[param1][0][10]));
         this.inventory.army2.sName.text = this.getRune(this.cardInventory[param1][2][0], this.cardInventory[param1][2][1], this.cardInventory[param1][0][6], 0);
         this.inventory.army2.cType.gotoAndStop(this.cardInventory[param1][1][0]);
         this.inventory.army2.sDesc.text = this.getDescription(this.getRune(this.cardInventory[param1][2][0], this.cardInventory[param1][2][1], this.cardInventory[param1][0][6], 0), _loc3_, _loc4_);
         if (this.cardInventory[param1][0][8] >= 0 || this.cardInventory.length <= 3 || this.cardInventory[param1][0][7] > 7)
         {
            this.inventory.army2.btnRemove.gotoAndStop(1);
         }
         else
         {
            this.inventory.army2.btnRemove.gotoAndStop(2);
         }
      }

      public function getCardRank(param1:int):String
      {
         switch (true)
         {
            case param1 == 1:
               return "Enslaved Convert";
            case param1 == 2:
               return "Willing Servant";
            case param1 == 3:
               return "Active Corrupter";
            case param1 == 4:
               return "Cohort Succubi";
            default:
               return "Turd Furgeson";
         }
      }

      public function squadSel(param1:int):void
      {
         var _loc2_:int = 0;
         if (this.squadSelect == -1)
         {
            this.inventory.army2.btnRemove.gotoAndStop(1);
            _loc2_ = 0;
            while (_loc2_ < 15)
            {
               this.inventory.army2["squad_" + _loc2_].gotoAndStop(1);
               _loc2_++;
            }
            if (this.inventoryDeck[param1][0] != "0000")
            {
               this.inventory.army2.btnRemove.gotoAndStop(2);
            }
            this.inventory.army2["squad_" + param1].gotoAndStop(2);
            this.squadSelect = param1;
         }
         else
         {
            this.swapSquad(this.squadSelect, param1, 1);
         }
      }

      public function swapSquad(param1:int, param2:int, param3:int):void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         if (param3 == 0)
         {
            this.removeSquad(param2);
            _loc4_ = 0;
            while (_loc4_ < 3)
            {
               this.inventoryDeck[param2][_loc4_] = this.cardInventory[param1][_loc4_].concat();
               _loc4_++;
            }
            this.inventoryDeck[param2][0][8] = param2;
            this.inventoryDeck[param2][0][9] = param1;
            this.cardInventory[param1][0][8] = param2;
            this.resetSquad();
            this.squadMenu();
         }
         else if (param1 == param2)
         {
            this.squadSelect = -1;
            this.resetSquad();
            this.squadMenu();
         }
         else if (this.inventoryDeck[param2][0] == "0000" && this.inventoryDeck[param1][0] == "0000")
         {
            this.squadSelect = -1;
            this.resetSquad();
            this.squadMenu();
         }
         else if (this.inventoryDeck[param2][0] == "0000")
         {
            _loc5_ = int(this.inventoryDeck[param1][0][9]);
            this.removeSquad(param1);
            _loc6_ = 0;
            while (_loc6_ < 3)
            {
               this.inventoryDeck[param2][_loc6_] = this.cardInventory[_loc5_][_loc6_].concat();
               _loc6_++;
            }
            this.inventoryDeck[param2][0][8] = param2;
            this.inventoryDeck[param2][0][9] = _loc5_;
            this.cardInventory[_loc5_][0][8] = param2;
            this.resetSquad();
            this.squadMenu();
         }
         else if (this.inventoryDeck[param1][0] != "0000")
         {
            _loc7_ = int(this.inventoryDeck[param1][0][9]);
            _loc8_ = int(this.inventoryDeck[param2][0][9]);
            this.removeSquad(param1);
            this.removeSquad(param2);
            _loc9_ = 0;
            while (_loc9_ < 3)
            {
               this.inventoryDeck[param2][_loc9_] = this.cardInventory[_loc7_][_loc9_].concat();
               this.inventoryDeck[param1][_loc9_] = this.cardInventory[_loc8_][_loc9_].concat();
               _loc9_++;
            }
            this.inventoryDeck[param2][0][8] = param2;
            this.inventoryDeck[param2][0][9] = _loc7_;
            this.cardInventory[_loc7_][0][8] = param2;
            this.inventoryDeck[param1][0][8] = param1;
            this.inventoryDeck[param1][0][9] = _loc8_;
            this.cardInventory[_loc8_][0][8] = param1;
            this.resetSquad();
            this.squadMenu();
         }
         else if (this.inventoryDeck[param1][0] == "0000")
         {
            _loc10_ = int(this.inventoryDeck[param2][0][9]);
            this.removeSquad(param2);
            _loc11_ = 0;
            while (_loc11_ < 3)
            {
               this.inventoryDeck[param1][_loc11_] = this.cardInventory[_loc10_][_loc11_].concat();
               _loc11_++;
            }
            this.inventoryDeck[param1][0][8] = param1;
            this.inventoryDeck[param1][0][9] = _loc10_;
            this.cardInventory[_loc10_][0][8] = param1;
            this.resetSquad();
            this.squadMenu();
         }
      }

      public function removeSquad(param1:int):void
      {
         this.inventoryDeck[param1] = new Array("0000");
         var _loc2_:int = 0;
         while (_loc2_ < this.cardInventory.length)
         {
            if (this.cardInventory[_loc2_][0][8] == param1)
            {
               this.cardInventory[_loc2_][0][8] = -1;
            }
            _loc2_++;
         }
         this.squadSelect = -1;
         if (this.inventState == 3)
         {
            this.resetSquad();
            this.squadMenu();
         }
      }

      public function removeSquadA():void
      {
         var _loc1_:int = 0;
         while (_loc1_ < 15)
         {
            if (this.inventoryDeck[_loc1_][0] != "0000")
            {
               this.removeSquad(_loc1_);
            }
            _loc1_++;
         }
         this.resetSquad();
         this.squadMenu();
      }

      public function squadMenu():void
      {
         this.squadSelect = -1;
         this.resetInvList();
         this.loadInvUnits();
         this.loadSquad();
      }

      public function resetInvList():void
      {
         var _loc2_:MovieClip = null;
         var _loc1_:int = this.inventory.army1.portHolder.numChildren - 1;
         while (_loc1_ >= 0)
         {
            _loc2_ = this.inventory.army1.portHolder.getChildAt(_loc1_);
            this.inventory.army1.portHolder.removeChild(_loc2_);
            _loc1_--;
         }
      }

      public function resetGearList():void
      {
         var _loc2_:MovieClip = null;
         var _loc1_:int = this.inventory.army1.gearHolder.numChildren - 1;
         while (_loc1_ >= 0)
         {
            _loc2_ = this.inventory.army1.gearHolder.getChildAt(_loc1_);
            this.inventory.army1.gearHolder.removeChild(_loc2_);
            _loc1_--;
         }
      }

      public function resetSquad():void
      {
         var _loc2_:MovieClip = null;
         var _loc1_:int = this.inventory.army2.squadHolder.numChildren - 1;
         while (_loc1_ >= 0)
         {
            _loc2_ = this.inventory.army2.squadHolder.getChildAt(_loc1_);
            this.inventory.army2.squadHolder.removeChild(_loc2_);
            _loc1_--;
         }
      }

      public function inventoryTick():void
      {
         switch (true)
         {
            case this.scrollLock:
               this.invScroll(this.scrollDir);
               break;
            case this.scrollLock:
               this.invScroll(this.scrollDir);
         }
      }

      public function placeSquad(param1:int, param2:int, param3:int, param4:int):void
      {
         var _loc5_:MovieClip = null;
         if (this.inventoryDeck[param1][0] != "0000")
         {
            _loc5_ = new asToken();
            _loc5_.mana.text = this.inventoryDeck[param1][0][3] + int(this.getWeapon(this.inventoryDeck[param1][1][0], this.inventoryDeck[param1][1][1], 3, 1, this.inventoryDeck[param1][0][10]));
            _loc5_.atk.text = this.inventoryDeck[param1][0][1] + int(this.getWeapon(this.inventoryDeck[param1][1][0], this.inventoryDeck[param1][1][1], 1, 1, this.inventoryDeck[param1][0][10]));
            _loc5_.hp.text = this.inventoryDeck[param1][0][2] + int(this.getWeapon(this.inventoryDeck[param1][1][0], this.inventoryDeck[param1][1][1], 2, 1, this.inventoryDeck[param1][0][10]));
            _loc5_.portr.gotoAndStop(this.inventoryDeck[param1][0][7] * 10 + this.inventoryDeck[param1][1][0]);
            _loc5_.cType.gotoAndStop(this.inventoryDeck[param1][1][0]);
            _loc5_.mouseChildren = false;
            _loc5_.mouseEnabled = false;
            _loc5_.name = "sToken_" + param1;
            _loc5_.x = param2;
            _loc5_.y = param3;
            _loc5_.scaleX = param4 / 100;
            _loc5_.scaleY = param4 / 100;
            _loc5_.cacheAsBitmap = true;
            this.inventory.army2.squadHolder.addChild(_loc5_);
         }
      }

      public function invScroll(param1:int):void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         if (this.inventory.army1.currentFrame == 1)
         {
            _loc2_ = this.inventory.army1.portHolder;
            _loc3_ = 420 - 60 * this.cardInventory.length;
         }
         if (this.inventory.army1.currentFrame == 2 && this.inventory.army2.currentFrame == 1)
         {
            _loc2_ = this.inventory.army1.gearHolder;
            _loc3_ = 420 - 60 * this.gearInventory.length;
         }
         if (this.inventory.army1.currentFrame == 2 && this.inventory.army2.currentFrame == 2)
         {
            _loc2_ = this.inventory.army1.gearHolder;
            _loc3_ = 420 - 60 * this.tempGearArray.length;
         }
         switch (true)
         {
            case param1 == 0 && _loc2_.y <= 60:
               _loc2_.y += 15;
               if (_loc2_.y >= 60)
               {
                  _loc2_.y = 60;
               }
               break;
            case param1 == 1 && _loc2_.y >= _loc3_:
               _loc2_.y -= 15;
               if (_loc2_.y <= _loc3_)
               {
                  _loc2_.y = _loc3_;
                  break;
               }
         }
      }

      public function invPage(param1:int):void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         if (this.inventory.army1.currentFrame == 1)
         {
            _loc2_ = this.inventory.army1.portHolder;
            _loc3_ = 420 - 60 * this.cardInventory.length;
         }
         if (this.inventory.army1.currentFrame == 2 && this.inventory.army2.currentFrame == 1)
         {
            _loc2_ = this.inventory.army1.gearHolder;
            _loc3_ = 420 - 60 * this.gearInventory.length;
         }
         if (this.inventory.army1.currentFrame == 2 && this.inventory.army2.currentFrame == 2)
         {
            _loc2_ = this.inventory.army1.gearHolder;
            _loc3_ = 420 - 60 * this.tempGearArray.length;
         }
         switch (true)
         {
            case param1 == 3 && _loc2_.y >= _loc3_:
               _loc2_.y -= 360;
               if (_loc2_.y <= _loc3_)
               {
                  _loc2_.y = _loc3_;
               }
               break;
            case param1 == 1 && _loc2_.y <= 60:
               _loc2_.y += 360;
               if (_loc2_.y >= 60)
               {
                  _loc2_.y = 60;
               }
               break;
            case param1 == 2:
               _loc2_.y = _loc3_;
               break;
            case param1 == 0:
               _loc2_.y = 60;
         }
      }

      public function unloadInventory():void
      {
         removeChild(this.inventory);
         removeChild(this.mainMask);
         this.inventory = null;
      }

      public function sortBy(param1:int):void
      {
         var sort:int = param1;
         var sortOnClass:Function = function(param1:Array, param2:Array):int
         {
            if (param1[1][0] > param2[1][0])
            {
               return 1;
            }
            if (param1[1][0] < param2[1][0])
            {
               return -1;
            }
            if (param1[1][1] > param2[1][1])
            {
               return -1;
            }
            if (param1[1][1] < param2[1][1])
            {
               return 1;
            }
            if (param1[0][7] > param2[0][7])
            {
               return 1;
            }
            if (param1[0][7] < param2[0][7])
            {
               return -1;
            }
            return 0;
         };
         var sortOnType:Function = function(param1:Array, param2:Array):int
         {
            if (param1[0][7] > param2[0][7])
            {
               return 1;
            }
            if (param1[0][7] < param2[0][7])
            {
               return -1;
            }
            if (param1[1][0] > param2[1][0])
            {
               return 1;
            }
            if (param1[1][0] < param2[1][0])
            {
               return -1;
            }
            return 0;
         };
         var sortOnRune:Function = function(param1:Array, param2:Array):int
         {
            if (param1[2][0] > param2[2][0])
            {
               return -1;
            }
            if (param1[2][0] < param2[2][0])
            {
               return 1;
            }
            if (param1[2][1] > param2[2][1])
            {
               return -1;
            }
            if (param1[2][1] < param2[2][1])
            {
               return 1;
            }
            if (param1[1][0] > param2[1][0])
            {
               return 1;
            }
            if (param1[1][0] < param2[1][0])
            {
               return -1;
            }
            return 0;
         };
         var sortOnSquad:Function = function(param1:Array, param2:Array):int
         {
            if (param1[0][8] != -1 && param2[0][8] == -1)
            {
               return -1;
            }
            if (param1[0][8] == -1 && param2[0][8] != -1)
            {
               return 1;
            }
            if (param1[0][8] > param2[0][8])
            {
               return 1;
            }
            if (param1[0][8] < param2[0][8])
            {
               return -1;
            }
            if (param1[1][0] > param2[1][0])
            {
               return 1;
            }
            if (param1[1][0] < param2[1][0])
            {
               return -1;
            }
            return 0;
         };
         var sortOnGear:Function = function(param1:Array, param2:Array):int
         {
            if (param1[2] > param2[2])
            {
               return 1;
            }
            if (param1[2] < param2[2])
            {
               return -1;
            }
            if (param1[0] < param2[0])
            {
               return -1;
            }
            if (param1[0] > param2[0])
            {
               return 1;
            }
            if (param1[1] > param2[1])
            {
               return 1;
            }
            if (param1[1] < param2[1])
            {
               return -1;
            }
            return 0;
         };
         switch (true)
         {
            case sort == 0 && this.sortSet != 1:
               this.sortSet = 1;
               this.cardInventory.sort(sortOnClass);
               break;
            case sort == 1 && this.sortSet != 2:
               this.sortSet = 2;
               this.cardInventory.sort(sortOnType);
               break;
            case sort == 2 && this.sortSet != 3:
               this.sortSet = 3;
               this.cardInventory.sort(sortOnSquad);
               break;
            case sort == 3 && this.sortSet != 4:
               this.sortSet = 4;
               this.cardInventory.sort(sortOnRune);
               break;
            case sort == 0 && this.sortSet != 5:
               this.sortSet = 5;
               this.cardInventory.sort(sortOnClass, Array.DESCENDING);
               break;
            case sort == 1 && this.sortSet != 6:
               this.sortSet = 6;
               this.cardInventory.sort(sortOnType, Array.DESCENDING);
               break;
            case sort == 2 && this.sortSet != 7:
               this.sortSet = 7;
               this.cardInventory.sort(sortOnSquad, Array.DESCENDING);
               break;
            case sort == 3 && this.sortSet != 8:
               this.sortSet = 8;
               this.cardInventory.sort(sortOnRune, Array.DESCENDING);
               break;
            case sort == 10:
               this.gearInventory.sort(sortOnGear);
               break;
            case sort == 11:
               this.gearInventory.sort(sortOnGear);
         }
         if (sort < 10)
         {
            this.sortUnits();
            this.resetInvList();
            this.loadInvUnits();
         }
         else if (sort == 10)
         {
            this.cleanRunes();
            this.resetGearList();
            this.loadInvGear();
         }
      }

      public function sortUnits():void
      {
         var _loc1_:int = 0;
         while (_loc1_ < this.cardInventory.length)
         {
            if (this.cardInventory[_loc1_][0][8] > -1)
            {
               this.inventoryDeck[this.cardInventory[_loc1_][0][8]][0][9] = _loc1_;
            }
            this.cardInventory[_loc1_][0][9] = _loc1_;
            _loc1_++;
         }
      }

      public function cleanRunes():void
      {
         var _loc1_:int = int(this.gearInventory.length - 1);
         while (_loc1_ >= 0)
         {
            if (this.gearInventory[_loc1_][0] == 0)
            {
               this.gearInventory.splice(_loc1_, 1);
            }
            _loc1_--;
         }
      }

      public function loadCombat(param1:int):void
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc3_:Boolean = true;
         var _loc4_:int = param1;
         this.shavee = false;
         if ((param1 == 99 || param1 == 98) && !this.specialDialogues[5] && this.gameStory >= 10)
         {
            _loc5_ = 0;
            while (_loc5_ < this.inventoryDeck.length)
            {
               if (this.inventoryDeck[_loc5_][0] != "0000")
               {
                  if (this.inventoryDeck[_loc5_][0][7] != 1)
                  {
                     _loc3_ = false;
                  }
               }
               _loc5_++;
            }
            if (_loc3_)
            {
               _loc4_ = 97;
            }
         }
         if (param1 == 2 && !this.specialDialogues[6] && this.gameStory >= 20)
         {
            _loc6_ = 0;
            while (_loc6_ < this.inventoryDeck.length)
            {
               if (this.inventoryDeck[_loc6_][0] != "0000")
               {
                  if (this.inventoryDeck[_loc6_][1][0] != 6)
                  {
                     _loc3_ = false;
                  }
               }
               _loc6_++;
            }
            if (_loc3_)
            {
               _loc4_ = 96;
            }
         }
         if (param1 == 5 && !this.specialDialogues[7] && this.gameStory >= 40)
         {
            _loc7_ = 0;
            while (_loc7_ < this.inventoryDeck.length)
            {
               if (this.inventoryDeck[_loc7_][0] != "0000")
               {
                  if (this.inventoryDeck[_loc7_][2][0] != 2 || this.inventoryDeck[_loc7_][0][6] != 1)
                  {
                     _loc3_ = false;
                  }
               }
               _loc7_++;
            }
            if (_loc3_)
            {
               _loc4_ = 95;
            }
         }
         if (param1 == 8 && !this.specialDialogues[8] && this.gameStory >= 60)
         {
            _loc2_ = 0;
            _loc8_ = 0;
            while (_loc8_ < this.inventoryDeck.length)
            {
               if (this.inventoryDeck[_loc8_][0] != "0000")
               {
                  _loc2_++;
                  if (_loc2_ > 3)
                  {
                     _loc3_ = false;
                  }
               }
               _loc8_++;
            }
            if (_loc3_)
            {
               _loc4_ = 94;
            }
         }
         if (param1 == 13 && !this.specialDialogues[9] && this.gameStory >= 90)
         {
            _loc2_ = 0;
            _loc9_ = 0;
            for (; _loc9_ < this.inventoryDeck.length; _loc9_++)
            {
               _loc10_ = new Array();
               if (this.inventoryDeck[_loc9_][0] == "0000")
               {
                  continue;
               }
               _loc2_++;
               _loc11_ = this.inventoryDeck[_loc9_][0][7] * 10 + this.inventoryDeck[_loc9_][1][0];
               _loc10_.push(_loc11_);
               _loc12_ = 0;
               while (_loc12_ < _loc10_.length - 1)
               {
                  if (_loc10_[_loc12_] == _loc11_)
                  {
                     _loc3_ = false;
                  }
                  _loc12_++;
               }
               switch (true)
               {
                  case this.inventoryDeck[_loc9_][2][0] != 0:
                     _loc3_ = false;
                     break;
                  case this.inventoryDeck[_loc9_][1][0] == 4:
                     _loc3_ = false;
                     break;
                  case this.inventoryDeck[_loc9_][1][0] == 5:
                     _loc3_ = false;
                     break;
                  case _loc11_ == 94:
                     _loc3_ = false;
                     break;
                  case _loc11_ == 95:
                     _loc3_ = false;
                     break;
               }
            }
            if (_loc2_ != 8)
            {
               _loc3_ = false;
            }
            if (_loc3_)
            {
               _loc4_ = 93;
            }
         }
         if (param1 == 20 && !this.specialDialogues[10] && this.gameStory >= 135)
         {
            _loc13_ = 0;
            while (_loc13_ < this.inventoryDeck.length)
            {
               if (this.inventoryDeck[_loc13_][0] != "0000")
               {
                  if (this.inventoryDeck[_loc13_][1][0] != 3)
                  {
                     _loc3_ = false;
                  }
               }
               _loc13_++;
            }
            if (_loc3_)
            {
               _loc4_ = 92;
            }
         }
         if (param1 == 24 && !this.specialDialogues[11] && this.gameStory >= 155)
         {
            _loc2_ = 0;
            _loc14_ = 0;
            while (_loc14_ < this.inventoryDeck.length)
            {
               if (this.inventoryDeck[_loc14_][0] != "0000")
               {
                  if (this.inventoryDeck[_loc14_][0][7] != 9 && this.inventoryDeck[_loc14_][0][7] != 10)
                  {
                     _loc3_ = false;
                  }
                  _loc2_++;
               }
               _loc14_++;
            }
            if (_loc2_ != 6)
            {
               _loc3_ = false;
            }
            if (_loc3_)
            {
               _loc4_ = 91;
            }
         }
         this.combatVerified(_loc4_);
      }

      public function combatVerified(param1:int):void
      {
         this.wipeStage();
         this.loadCombatVars(param1);
         this.loadCombatStage();
      }

      public function wipeStage():void
      {
         var _loc2_:MovieClip = null;
         var _loc1_:int = 0;
         while (_loc1_ < this.numChildren - 1)
         {
            _loc2_ = MovieClip(getChildAt(_loc1_));
            removeChild(_loc2_);
            _loc2_ = null;
            _loc1_++;
         }
      }

      public function loadCombatVars(param1:int):void
      {
         this.summoning = false;
         this.swapping = false;
         this.combatResult = false;
         this.combatState = 0;
         this.finalCombat = 0;
         this.combatSoul = 0;
         this.bType = 0;
         this.vicScreen = null;
         this.combatLevel = param1;
         this.combatHand = new Array("0000", "0000", "0000", "0000", "0000", "0000");
         switch (true)
         {
            case this.combatLevel == 1:
               this.combatStats = new Array(5, 0, 0, 5, 0, 0, 1, 1, 1, 0, 1, 5, false, 1, 2, 0);
               break;
            case this.combatLevel == 90:
               this.combatStats = new Array(10, 0, 0, 50, 0, 0, 1, 1, 99, 0, 5, 50, false, 10, 95, 0);
               break;
            case this.combatLevel == 91:
               this.combatStats = new Array(10, 0, 0, 25, 0, 0, 1, 1, 10, 0, 3, 25, false, 10, 6, 0);
               break;
            case this.combatLevel == 92:
               this.combatStats = new Array(10, 0, 0, 20, 0, 0, 1, 1, 99, 0, 10, 20, false, 10, 5, 0);
               break;
            case this.combatLevel == 93:
               this.combatStats = new Array(10, 0, 0, 10, 0, 0, 1, 1, 99, 0, 10, 10, false, 10, 4, 0);
               break;
            case this.combatLevel == 94:
               this.combatStats = new Array(10, 0, 0, 12, 0, 0, 1, 1, 15, 0, 5, 12, false, 10, 4, 0);
               break;
            case this.combatLevel == 95:
               this.combatStats = new Array(5, 0, 0, 30, 0, 0, 1, 1, 12, 0, 4, 20, false, 5, 5, 0);
               break;
            case this.combatLevel == 96:
               this.combatStats = new Array(5, 0, 0, 5, 0, 0, 1, 1, 8, 0, 5, 5, false, 5, 92, 0);
               break;
            case this.combatLevel == 97:
               this.combatStats = new Array(10, 0, 0, 10, 0, 0, 1, 1, 10, 0, 4, 10, false, 10, 4, 0);
               break;
            case this.combatLevel == 98:
               this.combatStats = new Array(10, 0, 0, 10, 0, 0, 1, 1, 15, 0, 5, 10, false, 10, 6, 0);
               break;
            case this.combatLevel == 99:
               this.combatStats = new Array(10, 0, 0, 10, 0, 0, 1, 1, 5, 0, 3, 10, false, 10, 4, 0);
               break;
            case this.combatLevel == 2:
               this.combatStats = new Array(10, 0, 0, 10, 0, 0, 1, 1, 5, 0, 3, 10, false, 10, 6, 0);
               break;
            case this.combatLevel == 3:
               this.combatStats = new Array(10, 0, 0, 10, 0, 0, 1, 1, 8, 0, 4, 10, false, 10, 2, 0);
               break;
            case this.combatLevel == 4:
               this.combatStats = new Array(10, 0, 0, 15, 0, 0, 1, 1, 10, 0, 4, 15, true, 10, 2, 0);
               break;
            case this.combatLevel == 5:
               this.combatStats = new Array(10, 0, 0, 20, 0, 0, 1, 1, 15, 0, 3, 20, true, 10, 6, 0);
               break;
            case this.combatLevel == 6:
               this.combatStats = new Array(10, 0, 0, 10, 0, 0, 1, 1, 15, 0, 5, 10, false, 10, 4, 0);
               break;
            case this.combatLevel == 7:
               this.combatStats = new Array(10, 0, 0, 5, 0, 0, 1, 1, 15, 0, 4, 5, false, 10, 5, 0);
               break;
            case this.combatLevel == 8:
               this.combatStats = new Array(10, 0, 0, 20, 0, 0, 1, 1, 15, 0, 4, 20, false, 10, 3, 0);
               break;
            case this.combatLevel == 9:
               this.combatStats = new Array(10, 0, 0, 10, 0, 0, 1, 1, 15, 0, 4, 10, false, 10, 5, 0);
               break;
            case this.combatLevel == 10:
               this.combatStats = new Array(10, 0, 0, 30, 0, 0, 1, 1, 99, 0, 5, 30, false, 10, 3, 0);
               break;
            case this.combatLevel == 11:
               this.combatStats = new Array(10, 0, 0, 15, 0, 0, 1, 1, 15, 0, 5, 15, false, 10, 4, 0);
               break;
            case this.combatLevel == 12:
               this.combatStats = new Array(10, 0, 0, 20, 0, 0, 1, 1, 15, 0, 5, 20, false, 10, 3, 0);
               break;
            case this.combatLevel == 13:
               this.combatStats = new Array(10, 0, 0, 25, 0, 0, 1, 1, 15, 0, 5, 25, false, 10, 4, 0);
               break;
            case this.combatLevel == 14:
               this.combatStats = new Array(10, 0, 0, 30, 0, 0, 1, 1, 15, 0, 5, 30, false, 10, 4, 0);
               break;
            case this.combatLevel == 15:
               this.combatStats = new Array(10, 0, 0, 30, 0, 0, 1, 1, 15, 0, 5, 30, false, 10, 4, 0);
               break;
            case this.combatLevel == 16:
               this.combatStats = new Array(10, 0, 0, 15, 0, 0, 1, 1, 15, 0, 5, 15, false, 10, 4, 0);
               break;
            case this.combatLevel == 17:
               this.combatStats = new Array(10, 0, 0, 15, 0, 0, 1, 1, 15, 0, 5, 15, false, 10, 4, 0);
               break;
            case this.combatLevel == 18:
               this.combatStats = new Array(10, 0, 0, 30, 0, 0, 1, 1, 15, 0, 5, 30, false, 10, 4, 0);
               break;
            case this.combatLevel == 19:
               this.combatStats = new Array(10, 0, 0, 30, 0, 0, 1, 1, 20, 0, 5, 30, false, 10, 5, 0);
               break;
            case this.combatLevel == 20:
               this.combatStats = new Array(10, 0, 0, 30, 0, 0, 1, 1, 20, 0, 5, 30, false, 10, 5, 0);
               break;
            case this.combatLevel == 21:
               this.combatStats = new Array(10, 0, 0, 30, 0, 0, 1, 1, 20, 0, 5, 30, false, 10, 6, 0);
               break;
            case this.combatLevel == 22:
               this.combatStats = new Array(10, 0, 0, 30, 0, 0, 1, 1, 20, 0, 5, 30, false, 10, 6, 0);
               break;
            case this.combatLevel == 23:
               this.combatStats = new Array(10, 0, 0, 30, 0, 0, 1, 1, 20, 0, 5, 30, false, 10, 95, 0);
               break;
            case this.combatLevel == 24:
               this.combatStats = new Array(10, 0, 0, 35, 0, 0, 1, 1, 15, 0, 5, 35, false, 10, 4, 0);
               break;
            case this.combatLevel == 25:
               this.combatStats = new Array(10, 0, 0, 40, 0, 0, 1, 1, 15, 0, 5, 40, false, 10, 6, 0);
               break;
            case this.combatLevel == 26:
               this.combatStats = new Array(10, 0, 0, 40, 0, 0, 1, 1, 20, 0, 5, 40, false, 10, 5, 0);
               break;
            case this.combatLevel == 27:
               this.combatStats = new Array(10, 0, 0, 40, 0, 0, 1, 1, 20, 0, 5, 40, false, 10, 95, 0);
               break;
            case this.combatLevel == 28:
               this.combatStats = new Array(10, 0, 0, 50, 0, 0, 1, 1, 15, 0, 5, 50, false, 10, 2, 0);
               break;
            case this.combatLevel == 29:
               this.combatStats = new Array(10, 0, 0, 50, 0, 0, 1, 1, 15, 0, 5, 50, false, 10, 2, 0);
               break;
            case this.combatLevel == 30:
               this.combatStats = new Array(10, 0, 0, 50, 0, 0, 1, 1, 15, 0, 5, 50, false, 10, 2, 0);
               break;
            case this.combatLevel == 31:
               this.combatStats = new Array(10, 0, 0, 50, 0, 0, 1, 1, 15, 0, 5, 50, false, 10, 2, 0);
               break;
            case this.combatLevel == 32:
               this.combatStats = new Array(10, 0, 0, 50, 0, 0, 1, 1, 15, 0, 5, 50, false, 10, 2, 0);
               break;
            default:
               this.combatStats = new Array(10, 0, 0, 10, 0, 0, 1, 1, 15, false, 10, 1, 0);
         }
         this.combatArray = new Array();
         this.combatConvert = new Array();
         this.combatConvert[0] = new Array();
         this.combatConvert[1] = new Array();
         this.combatConvert[2] = new Array();
         this.specialConvert();
         var _loc2_:int = 0;
         while (_loc2_ < 21)
         {
            this.combatArray[_loc2_] = "0000";
            _loc2_++;
         }
         this.combatDeck = new Array();
         this.skillStats = new Array();
         this.swapTool = new Array(false, null, null, null, null, 99, 99);
         this.eStats = new Array();
         this.objList = new Array();
         this.cSpecial = null;
         this.sCheck = false;
         this.combatSwap = false;
         this.eventLock = false;
         this.combatSelect = false;
         this.skillLock = false;
         this.combatTurn = 0;
         this.animationLock = false;
         this.selectedUnit = 99;
         this.combatState = 0;
         this.loopSaver = 0;
         this.gameState = 7;
         this.loadDeck();
         this.drawCard();
         this.drawCard();
         this.drawCard();
      }

      public function loadCombatStage():void
      {
         this.gameFader = new asFader();
         this.bgHolder = new asBG();
         switch (true)
         {
            case this.combatLevel == 1:
               this.bgHolder.gotoAndStop(1);
               break;
            case this.combatLevel == 2:
               this.bgHolder.gotoAndStop(1);
               break;
            case this.combatLevel == 3:
               this.bgHolder.gotoAndStop(2);
               break;
            case this.combatLevel == 4:
               this.bgHolder.gotoAndStop(2);
               break;
            case this.combatLevel == 5:
               this.bgHolder.gotoAndStop(2);
               break;
            case this.combatLevel == 6:
               this.bgHolder.gotoAndStop(2);
               break;
            case this.combatLevel == 7:
               this.bgHolder.gotoAndStop(5);
               break;
            case this.combatLevel == 8:
               this.bgHolder.gotoAndStop(4);
               break;
            case this.combatLevel == 9:
               this.bgHolder.gotoAndStop(1);
               break;
            case this.combatLevel == 10:
               this.bgHolder.gotoAndStop(1);
               break;
            case this.combatLevel == 11:
               this.bgHolder.gotoAndStop(1);
               break;
            case this.combatLevel == 12:
               this.bgHolder.gotoAndStop(1);
               break;
            case this.combatLevel == 13:
               this.bgHolder.gotoAndStop(2);
               break;
            case this.combatLevel == 14:
               this.bgHolder.gotoAndStop(2);
               break;
            case this.combatLevel == 15:
               this.bgHolder.gotoAndStop(2);
               break;
            case this.combatLevel == 16:
               this.bgHolder.gotoAndStop(2);
               break;
            case this.combatLevel == 17:
               this.bgHolder.gotoAndStop(2);
               break;
            case this.combatLevel == 18:
               this.bgHolder.gotoAndStop(4);
               break;
            case this.combatLevel == 19:
               this.bgHolder.gotoAndStop(8);
               break;
            case this.combatLevel == 20:
               this.bgHolder.gotoAndStop(8);
               break;
            case this.combatLevel == 21:
               this.bgHolder.gotoAndStop(8);
               break;
            case this.combatLevel == 22:
               this.bgHolder.gotoAndStop(8);
               break;
            case this.combatLevel == 23:
               this.bgHolder.gotoAndStop(8);
               break;
            case this.combatLevel == 24:
               this.bgHolder.gotoAndStop(10);
               break;
            case this.combatLevel == 25:
               this.bgHolder.gotoAndStop(10);
               break;
            case this.combatLevel == 26:
               this.bgHolder.gotoAndStop(10);
               break;
            case this.combatLevel == 27:
               this.bgHolder.gotoAndStop(10);
               break;
            case this.combatLevel == 28:
               this.bgHolder.gotoAndStop(10);
               break;
            case this.combatLevel == 29:
               this.bgHolder.gotoAndStop(10);
               break;
            case this.combatLevel == 30:
               this.bgHolder.gotoAndStop(10);
               break;
            case this.combatLevel == 31:
               this.bgHolder.gotoAndStop(10);
               break;
            case this.combatLevel == 32:
               this.bgHolder.gotoAndStop(10);
               break;
            case this.combatLevel == 90:
               this.bgHolder.gotoAndStop(8);
               break;
            case this.combatLevel == 91:
               this.bgHolder.gotoAndStop(10);
               break;
            case this.combatLevel == 92:
               this.bgHolder.gotoAndStop(8);
               break;
            case this.combatLevel == 93:
               this.bgHolder.gotoAndStop(2);
               break;
            case this.combatLevel == 94:
               this.bgHolder.gotoAndStop(4);
               break;
            case this.combatLevel == 95:
               this.bgHolder.gotoAndStop(2);
               break;
            case this.combatLevel == 96:
               this.bgHolder.gotoAndStop(1);
               break;
            case this.combatLevel == 97:
               this.bgHolder.gotoAndStop(1);
               break;
            case this.combatLevel == 98:
               this.bgHolder.gotoAndStop(1);
               break;
            case this.combatLevel == 99:
               this.bgHolder.gotoAndStop(1);
         }
         this.obHolder = new MovieClip();
         this.obHolder.mouseEnabled = false;
         this.uiHolder = new asGUI();
         this.uiHolder.btnAction.gotoAndStop(1);
         this.uiHolder.charBar.toolTip.visible = false;
         this.uiHolder.charBar.toolTip.mouseEnabled = false;
         this.combatGrid = new asGrid();
         addChild(this.bgHolder);
         addChild(this.combatGrid);
         addChild(this.obHolder);
         addChild(this.uiHolder);
         addChild(this.gameFader);
         addChild(this.mainMask);
         this.bgHolder.cacheAsBitmap = true;
         this.combatGrid.cacheAsBitmap = true;
         this.uiHolder.cacheAsBitmap = true;
         this.bgHolder.mask = this.mainMask;
         this.combatGrid.mask = this.mainMask;
         this.obHolder.mask = this.mainMask;
         this.uiHolder.mask = this.mainMask;
         var _loc1_:int = 0;
         while (_loc1_ < 21)
         {
            this.combatGrid["grid" + _loc1_].mouseChildren = false;
            _loc1_++;
         }
      }

      public function loadChar():void
      {
         var _loc1_:MovieClip = null;
         switch (true)
         {
            case this.combatLevel == 5:
               this.charMod = 2;
               break;
            case this.combatLevel == 8:
               this.charMod = 3;
               break;
            case this.combatLevel == 10:
               this.charMod = 8;
               break;
            case this.combatLevel == 18:
               this.charMod = 2;
               break;
            case this.combatLevel == 24:
               this.charMod = 4;
               break;
            case this.combatLevel == 25:
               this.charMod = 5;
               break;
            case this.combatLevel == 26:
               this.charMod = 2;
               break;
            case this.combatLevel == 27:
               this.charMod = 3;
               break;
            case this.combatLevel == 28:
               this.charMod = 2;
               break;
            case this.combatLevel == 29:
               this.charMod = 4;
               break;
            case this.combatLevel == 30:
               this.charMod = 5;
               break;
            case this.combatLevel == 31:
               this.charMod = 3;
               break;
            case this.combatLevel == 94:
               this.charMod = 91;
               break;
            case this.combatLevel == 95:
               this.charMod = 95;
               break;
            case this.combatLevel == 97:
               this.charMod = 94;
               break;
            default:
               this.charMod = 1;
         }
         this.uiHolder.charBar.toolTip.toolTip.text = this.getTooltip(this.combatLevel);
         _loc1_ = new asChar_2(100, 240, this.charMod, 0);
         this.bgHolder.addChild(_loc1_);
         if (this.charMod != 1)
         {
            _loc1_.scaleX *= -1;
         }
         this.objList.push(_loc1_);
         this.combatState = 1;
      }

      public function loadBoss():void
      {
         switch (true)
         {
            case this.combatLevel == 1:
               this.boss = new asChar_2(700, 240, 2, 1);
               this.bType = 2;
               break;
            case this.combatLevel == 2:
               this.boss = new asChar_2(700, 240, 54, 1);
               this.bType = 54;
               break;
            case this.combatLevel == 3:
               this.boss = new asChar_2(700, 240, 51, 1);
               this.bType = 51;
               break;
            case this.combatLevel == 4:
               this.boss = new asChar_2(700, 240, 51, 1);
               this.bType = 51;
               break;
            case this.combatLevel == 5:
               this.boss = new asChar_2(700, 240, 54, 1);
               this.bType = 54;
               break;
            case this.combatLevel == 6:
               this.boss = new asChar_2(700, 240, 53, 1);
               this.bType = 53;
               break;
            case this.combatLevel == 7:
               this.boss = new asChar_2(700, 240, 22, 1);
               this.bType = 22;
               break;
            case this.combatLevel == 8:
               this.boss = new asChar_2(700, 240, 26, 1);
               this.bType = 26;
               break;
            case this.combatLevel == 9:
               this.boss = new asChar_2(700, 240, 22, 1);
               this.bType = 22;
               break;
            case this.combatLevel == 10:
               this.boss = new asChar_2(700, 240, 66, 1);
               this.bType = 66;
               break;
            case this.combatLevel == 11:
               this.boss = new asChar_2(700, 240, 63, 1);
               this.bType = 63;
               break;
            case this.combatLevel == 12:
               this.boss = new asChar_2(700, 240, 66, 1);
               this.bType = 66;
               break;
            case this.combatLevel == 13:
               this.boss = new asChar_2(700, 240, 63, 1);
               this.bType = 63;
               break;
            case this.combatLevel == 14:
               this.boss = new asChar_2(700, 240, 62, 1);
               this.bType = 62;
               break;
            case this.combatLevel == 15:
               this.boss = new asChar_2(700, 240, 64, 1);
               this.bType = 64;
               break;
            case this.combatLevel == 16:
               this.boss = new asChar_2(700, 240, 64, 1);
               this.bType = 64;
               break;
            case this.combatLevel == 17:
               this.boss = new asChar_2(700, 240, 22, 1);
               this.bType = 22;
               break;
            case this.combatLevel == 18:
               this.boss = new asChar_2(700, 240, 26, 1);
               this.bType = 26;
               break;
            case this.combatLevel == 19:
               this.boss = new asChar_2(700, 240, 32, 1);
               this.bType = 32;
               break;
            case this.combatLevel == 20:
               this.boss = new asChar_2(700, 240, 32, 1);
               this.bType = 32;
               break;
            case this.combatLevel == 21:
               this.boss = new asChar_2(700, 240, 34, 1);
               this.bType = 34;
               break;
            case this.combatLevel == 22:
               this.boss = new asChar_2(700, 240, 34, 1);
               this.bType = 34;
               break;
            case this.combatLevel == 23:
               this.boss = new asChar_2(700, 240, 35, 1);
               this.bType = 35;
               break;
            case this.combatLevel == 24:
               this.boss = new asChar_2(700, 240, 73, 1);
               this.bType = 73;
               break;
            case this.combatLevel == 25:
               this.boss = new asChar_2(700, 240, 74, 1);
               this.bType = 74;
               break;
            case this.combatLevel == 26:
               this.boss = new asChar_2(700, 240, 72, 1);
               this.bType = 72;
               break;
            case this.combatLevel == 27:
               this.boss = new asChar_2(700, 240, 75, 1);
               this.bType = 75;
               break;
            case this.combatLevel == 28:
               this.boss = new asChar_2(700, 240, 71, 1);
               this.bType = 71;
               break;
            case this.combatLevel == 29:
               this.boss = new asChar_2(700, 240, 71, 1);
               this.bType = 71;
               break;
            case this.combatLevel == 30:
               this.boss = new asChar_2(700, 240, 71, 1);
               this.bType = 71;
               break;
            case this.combatLevel == 31:
               this.boss = new asChar_2(700, 240, 71, 1);
               this.bType = 71;
               break;
            case this.combatLevel == 32:
               this.boss = new asChar_2(700, 240, 71, 1);
               this.bType = 71;
               break;
            case this.combatLevel == 90:
               this.boss = new asChar_2(700, 240, 86, 1);
               this.bType = 86;
               break;
            case this.combatLevel == 91:
               this.boss = new asChar_2(700, 240, 104, 1);
               this.bType = 104;
               break;
            case this.combatLevel == 92:
               this.boss = new asChar_2(700, 240, 102, 1);
               this.bType = 102;
               break;
            case this.combatLevel == 93:
               this.boss = new asChar_2(700, 240, 93, 1);
               this.bType = 93;
               break;
            case this.combatLevel == 94:
               this.boss = new asChar_2(700, 240, 26, 1);
               this.bType = 26;
               break;
            case this.combatLevel == 95:
               this.boss = new asChar_2(700, 240, 12, 1);
               this.bType = 12;
               break;
            case this.combatLevel == 96:
               this.boss = new asChar_2(700, 240, 92, 1);
               this.bType = 92;
               break;
            case this.combatLevel == 97:
               this.boss = new asChar_2(700, 240, 43, 1);
               this.bType = 43;
               break;
            case this.combatLevel == 98:
               this.boss = new asChar_2(700, 240, 14, 1);
               this.bType = 14;
               break;
            case this.combatLevel == 99:
               this.boss = new asChar_2(700, 240, 8, 1);
               this.bType = 8;
               break;
            case this.combatLevel == 100:
               this.boss = new asChar_2(700, 240, 4, 1);
               this.bType = 4;
               break;
            case this.combatLevel == 101:
               this.boss = new asChar_2(700, 240, 5, 1);
               this.bType = 5;
               break;
            case this.combatLevel == 102:
               this.boss = new asChar_2(700, 240, 3, 1);
               this.bType = 3;
               break;
            case this.combatLevel == 103:
               this.boss = new asChar_2(700, 240, 3, 1);
               this.boss.visible = false;
               this.bType = 3;
               break;
            case this.combatLevel == 104:
               this.boss = new asChar_2(700, 240, 3, 1);
               this.boss.visible = false;
               this.bType = 3;
               break;
            case this.combatLevel == 105:
               this.boss = new asChar_2(700, 240, 6, 1);
               this.bType = 6;
               break;
            case this.combatLevel == 106:
               this.boss = new asChar_2(700, 240, 3, 1);
               this.boss.visible = false;
               this.bType = 3;
         }
         this.uiHolder.addChild(this.boss);
         this.objList.push(this.boss);
         if (this.combatLevel < 100)
         {
            this.combatState = 2;
         }
      }

      public function checkSpecial():void
      {
         if (this.cSpecial != null)
         {
            if (this.cSpecial.currentFrame == this.cSpecial.totalFrames)
            {
               switch (true)
               {
                  case this.charMod == 1:
                     this.evaSpec(this.charData[0]);
                     break;
                  case this.charMod == 2:
                     this.beezSpec();
                     break;
                  case this.charMod == 3 && this.combatLevel == 27:
                     this.crystalBarrierP();
                     break;
                  case this.charMod == 3 && this.combatLevel == 31:
                     this.crystalBarrierP();
                     break;
                  case this.charMod == 3:
                     this.pecSpec();
                     break;
                  case this.charMod == 4:
                     this.vanoSpec();
                     break;
                  case this.charMod == 5:
                     this.vinaSpec();
                     break;
                  case this.charMod == 8:
                     this.brigSpec();
                     break;
                  case this.charMod == 91:
                     this.barrier();
                     break;
                  case this.charMod == 94:
                     this.voodoo();
                     break;
                  case this.charMod == 95:
                     this.lullaby();
                     break;
                  case this.charMod == 100:
                     this.combatGrid.sfx.gotoAndStop(2);
                     this.mouseLock = false;
               }
               this.uiHolder.removeChild(this.cSpecial);
               removeChild(this.specMask);
               this.cSpecial = null;
            }
         }
      }

      public function getTooltip(param1:int):String
      {
         switch (true)
         {
            case this.charMod == 1 && this.charData[0] == 1:
               return "Blind Desire:" + "\n" + "Eva taunts all enemy units and corrupts the field";
            case this.charMod == 1 && this.charData[0] == 2:
               return "Penetration:" + "\n" + "Eva increases enemies vulnerability and corrupts the field";
            case this.charMod == 1 && this.charData[0] == 3:
               return "Toxic Desire:" + "\n" + "Eva poisons all enemy units and corrupts the field";
            case this.charMod == 1 && this.charData[0] == 4:
               return "Sexual Healing:" + "\n" + "Eva grants regen to allies and corrupts the field";
            case this.charMod == 1 && this.charData[0] == 5:
               return "Lust Guard:" + "\n" + "Eva raises ally defense and corrupts the field";
            case this.charMod == 2:
               return "Jealous Rage:" + "\n" + "Beezelba sacrifices her allies to kill her enemies, granting an attack bonus to a survivor";
            case this.charMod == 3 && this.combatLevel == 27:
               return "Shield Matrix:" + "\n" + "Pecunia makes her allies invulnerable while weakening her enemies";
            case this.charMod == 3 && this.combatLevel == 31:
               return "Shield Matrix:" + "\n" + "Pecunia makes her allies invulnerable while weakening her enemies";
            case this.charMod == 3:
               return "Admin Rights:" + "\n" + "Pecunia system hacks her enemies, reducing their base attack power to 0";
            case this.charMod == 4:
               return "Cold Universe:" + "\n" + "Vanorel creates a reality where life cannot exist, killing all units";
            case this.charMod == 5:
               return "Bar Fight!:" + "\n" + "Ready for a rumble, Vinara reduces the health of all units to 1";
            case this.charMod == 8:
               return "Judgement:" + "\n" + "Bridgette calls down divine judgement, damaging all enemies on the field";
            case this.charMod == 91:
               return "Shield Dome:" + "\n" + "VLAD//ROM erects a protective barrier, raising allies regen and defense";
            case this.charMod == 94:
               return "Hoodoo Voodoo:" + "\n" + "Lucky casts big mask voodoo, switching all units health and attack";
            case this.charMod == 95:
               return "Lullaby:" + "\n" + "Photovol sings a lovely song, putting all enemies to sleep";
            default:
               return "???";
         }
      }

      public function checkSpecialE():void
      {
         if (this.cSpecial != null)
         {
            if (this.cSpecial.currentFrame == this.cSpecial.totalFrames)
            {
               switch (true)
               {
                  case this.bType == 8:
                     this.judgementProc();
                     break;
                  case this.bType == 12:
                     this.crystalBoost();
                     break;
                  case this.bType == 14:
                     this.voodoo();
                     break;
                  case this.bType == 22:
                     this.naniteCloud();
                     break;
                  case this.bType == 26:
                     this.overDrive();
                     break;
                  case this.bType == 32:
                     this.howling();
                     break;
                  case this.bType == 34:
                     this.daydream();
                     break;
                  case this.bType == 35:
                     this.nightmare();
                     break;
                  case this.bType == 43:
                     this.crystalBoost();
                     break;
                  case this.bType == 51:
                     this.crystalBarrier();
                     break;
                  case this.bType == 53:
                     this.crystalBoost();
                     break;
                  case this.bType == 54:
                     this.healingWaveProc();
                     break;
                  case this.bType == 62:
                     this.dreadPlasma();
                     break;
                  case this.bType == 63:
                     this.acidSpray();
                     break;
                  case this.bType == 64:
                     this.toxicSpray();
                     break;
                  case this.bType == 66:
                     this.judgementProc();
                     break;
                  case this.bType == 71:
                     this.crystalBarrier();
                     break;
                  case this.bType == 72:
                     this.terrorShout();
                     break;
                  case this.bType == 73:
                     this.bloodletter();
                     break;
                  case this.bType == 74:
                     this.milkyWaveE();
                     break;
                  case this.bType == 75:
                     this.thunder();
                     break;
                  case this.bType == 86:
                     this.unreality();
                     break;
                  case this.bType == 92:
                     this.ioshaProc();
                     break;
                  case this.bType == 93:
                     this.jurrProc();
                     break;
                  case this.bType == 102:
                     this.drainBlood();
                     break;
                  case this.bType == 104:
                     this.milkyWaveE();
               }
               this.uiHolder.removeChild(this.cSpecial);
               removeChild(this.specMask);
               this.cSpecial = null;
            }
         }
      }

      public function combatSpecial():void
      {
         this.mouseLock = true;
         this.combatStats[6] = 0;
         this.uiHolder.charBar.updateGUI();
         switch (true)
         {
            case this.charMod == 1 && this.charData[0] == 1:
               this.cSpecial = new asSpec_E1();
               this.combatStats[7] = 2;
               break;
            case this.charMod == 1 && this.charData[0] == 2:
               this.cSpecial = new asSpec_E2();
               this.combatStats[7] = 2;
               break;
            case this.charMod == 1 && this.charData[0] == 3:
               this.cSpecial = new asSpec_E3();
               this.combatStats[7] = 2;
               break;
            case this.charMod == 1 && this.charData[0] == 4:
               this.cSpecial = new asSpec_E4();
               this.combatStats[7] = 2;
               break;
            case this.charMod == 1 && this.charData[0] == 5:
               this.cSpecial = new asSpec_E5();
               this.combatStats[7] = 2;
               break;
            case this.charMod == 2:
               this.cSpecial = new asSpec_2();
               this.combatStats[7] = 0;
               break;
            case this.charMod == 3 && this.combatLevel == 27:
               this.cSpecial = new asSpec_3P();
               this.combatStats[7] = 2;
               break;
            case this.charMod == 3 && this.combatLevel == 31:
               this.cSpecial = new asSpec_3P();
               this.combatStats[7] = 2;
               break;
            case this.charMod == 3:
               this.cSpecial = new asSpec_3();
               this.combatStats[7] = 0;
               break;
            case this.charMod == 4:
               this.cSpecial = new asSpec_4();
               this.combatStats[7] = 0;
               break;
            case this.charMod == 5:
               this.cSpecial = new asSpec_5();
               this.combatStats[7] = 0;
               break;
            case this.charMod == 8:
               this.cSpecial = new asSpec_9();
               this.combatStats[7] = 0;
               break;
            case this.charMod == 91:
               this.cSpecial = new asSpec_91();
               this.combatStats[7] = 0;
               break;
            case this.charMod == 94:
               this.cSpecial = new asSpec_94();
               this.combatStats[7] = 0;
               break;
            case this.charMod == 95:
               this.cSpecial = new asSpec_95();
               this.combatStats[7] = 0;
               break;
            case this.charMod == 100:
               this.cSpecial = new asSpec_100();
               this.combatStats[7] = 1;
         }
         this.uiHolder.addChild(this.cSpecial);
         addChild(this.specMask);
         this.cSpecial.mask = this.specMask;
      }

      public function enemySpecial(param1:int):void
      {
         this.mouseLock = true;
         this.uiHolder.enemyBar.updateGUI();
         switch (true)
         {
            case param1 == 8:
               this.cSpecial = new asSpec_9();
               break;
            case param1 == 9:
               this.cSpecial = new asSpec_9();
               break;
            case param1 == 12:
               this.cSpecial = new asSpec_12();
               break;
            case param1 == 14:
               this.cSpecial = new asSpec_14();
               break;
            case param1 == 22:
               this.cSpecial = new asSpec_22();
               break;
            case param1 == 26:
               this.cSpecial = new asSpec_26();
               break;
            case param1 == 32:
               this.cSpecial = new asSpec_32();
               break;
            case param1 == 34:
               this.cSpecial = new asSpec_34();
               break;
            case param1 == 35:
               this.cSpecial = new asSpec_35();
               break;
            case param1 == 43:
               this.cSpecial = new asSpec_43();
               break;
            case param1 == 51:
               this.cSpecial = new asSpec_51();
               break;
            case param1 == 53:
               this.cSpecial = new asSpec_53();
               break;
            case param1 == 54:
               this.cSpecial = new asSpec_54();
               break;
            case param1 == 62:
               this.cSpecial = new asSpec_62();
               break;
            case param1 == 63:
               this.cSpecial = new asSpec_63();
               break;
            case param1 == 64:
               this.cSpecial = new asSpec_64();
               break;
            case param1 == 66:
               this.cSpecial = new asSpec_66();
               break;
            case param1 == 71:
               this.cSpecial = new asSpec_71();
               break;
            case param1 == 72:
               this.cSpecial = new asSpec_72();
               break;
            case param1 == 73:
               this.cSpecial = new asSpec_73();
               break;
            case param1 == 74:
               this.cSpecial = new asSpec_74();
               break;
            case param1 == 75:
               this.cSpecial = new asSpec_75();
               break;
            case param1 == 86:
               this.cSpecial = new asSpec_86();
               break;
            case param1 == 92:
               this.cSpecial = new asSpec_92();
               break;
            case param1 == 93:
               this.cSpecial = new asSpec_93();
               break;
            case param1 == 102:
               this.cSpecial = new asSpec_102();
               break;
            case param1 == 104:
               this.cSpecial = new asSpec_104();
         }
         this.uiHolder.addChild(this.cSpecial);
         addChild(this.specMask);
         this.cSpecial.mask = this.specMask;
      }

      public function endMatch():void
      {
         if (!this.diaLock)
         {
            switch (true)
            {
               case this.combatLevel == 1 && this.combatStats[0] <= 0:
                  this.combatFail(1);
                  break;
               case this.combatLevel == 1 && this.combatStats[3] <= 0:
                  this.combatWin(1);
                  break;
               case this.combatLevel == 90 && this.combatStats[0] <= 0:
                  this.combatFail(90);
                  break;
               case this.combatLevel == 90 && this.combatStats[3] <= 0:
                  this.combatWin(90);
                  break;
               case this.combatLevel == 91 && this.combatStats[0] <= 0:
                  this.combatFail(91);
                  break;
               case this.combatLevel == 91 && this.combatStats[3] <= 0:
                  this.combatWin(91);
                  break;
               case this.combatLevel == 92 && this.combatStats[0] <= 0:
                  this.combatFail(92);
                  break;
               case this.combatLevel == 92 && this.combatStats[3] <= 0:
                  this.combatWin(92);
                  break;
               case this.combatLevel == 93 && this.combatStats[0] <= 0:
                  this.combatFail(93);
                  break;
               case this.combatLevel == 93 && this.combatStats[3] <= 0:
                  this.combatWin(93);
                  break;
               case this.combatLevel == 94 && this.combatStats[0] <= 0:
                  this.combatFail(94);
                  break;
               case this.combatLevel == 94 && this.combatStats[3] <= 0:
                  this.combatWin(94);
                  break;
               case this.combatLevel == 95 && this.combatStats[0] <= 0:
                  this.combatFail(95);
                  break;
               case this.combatLevel == 95 && this.combatStats[3] <= 0:
                  this.combatWin(95);
                  break;
               case this.combatLevel == 96 && this.combatStats[0] <= 0:
                  this.combatFail(96);
                  break;
               case this.combatLevel == 96 && this.combatStats[3] <= 0:
                  this.combatWin(96);
                  break;
               case this.combatLevel == 97 && this.combatStats[0] <= 0:
                  this.combatFail(97);
                  break;
               case this.combatLevel == 97 && this.combatStats[3] <= 0:
                  this.combatWin(97);
                  break;
               case this.combatLevel == 98 && this.combatStats[0] <= 0:
                  this.combatFail(98);
                  break;
               case this.combatLevel == 98 && this.combatStats[3] <= 0:
                  this.combatWin(98);
                  break;
               case this.combatLevel == 99 && this.combatStats[0] <= 0:
                  this.combatFail(99);
                  break;
               case this.combatLevel == 99 && this.combatStats[3] <= 0:
                  this.combatWin(99);
                  break;
               case this.combatLevel == 2 && this.combatStats[0] <= 0:
                  this.combatFail(2);
                  break;
               case this.combatLevel == 2 && this.combatStats[3] <= 0:
                  this.combatWin(2);
                  break;
               case this.combatLevel == 3 && this.combatStats[0] <= 0:
                  this.combatFail(3);
                  break;
               case this.combatLevel == 3 && this.combatStats[3] <= 0:
                  this.combatWin(3);
                  break;
               case this.combatLevel == 4 && this.combatStats[0] <= 0:
                  this.combatFail(4);
                  break;
               case this.combatLevel == 4 && this.combatStats[3] <= 0:
                  this.combatWin(4);
                  break;
               case this.combatLevel == 5 && this.combatStats[0] <= 0:
                  this.combatFail(5);
                  break;
               case this.combatLevel == 5 && this.combatStats[3] <= 0:
                  this.combatWin(5);
                  break;
               case this.combatLevel == 6 && this.combatStats[0] <= 0:
                  this.combatFail(6);
                  break;
               case this.combatLevel == 6 && this.combatStats[3] <= 0:
                  this.combatWin(6);
                  break;
               case this.combatLevel == 7 && this.combatStats[0] <= 0:
                  this.combatFail(7);
                  break;
               case this.combatLevel == 7 && this.combatStats[3] <= 0:
                  this.combatWin(7);
                  break;
               case this.combatLevel == 8 && this.combatStats[0] <= 0:
                  this.combatFail(8);
                  break;
               case this.combatLevel == 8 && this.combatStats[3] <= 0:
                  this.combatWin(8);
                  break;
               case this.combatLevel == 9 && this.combatStats[0] <= 0:
                  this.combatFail(9);
                  break;
               case this.combatLevel == 9 && this.combatStats[3] <= 0:
                  this.combatWin(9);
                  break;
               case this.combatLevel == 10 && this.combatStats[0] <= 0:
                  this.hideAll();
                  this.combatWin(10);
                  break;
               case this.combatLevel == 10 && this.combatStats[3] <= 0:
                  this.combatFail(10);
                  break;
               case this.combatLevel == 11 && this.combatStats[0] <= 0:
                  this.combatFail(11);
                  break;
               case this.combatLevel == 11 && this.combatStats[3] <= 0:
                  this.combatWin(11);
                  break;
               case this.combatLevel == 12 && this.combatStats[0] <= 0:
                  this.combatFail(12);
                  break;
               case this.combatLevel == 12 && this.combatStats[3] <= 0:
                  this.combatWin(12);
                  break;
               case this.combatLevel == 13 && this.combatStats[0] <= 0:
                  this.combatFail(13);
                  break;
               case this.combatLevel == 13 && this.combatStats[3] <= 0:
                  this.combatWin(13);
                  break;
               case this.combatLevel == 14 && this.combatStats[0] <= 0:
                  this.combatFail(14);
                  break;
               case this.combatLevel == 14 && this.combatStats[3] <= 0:
                  this.combatWin(14);
                  break;
               case this.combatLevel == 15 && this.combatStats[0] <= 0:
                  this.combatFail(15);
                  break;
               case this.combatLevel == 15 && this.combatStats[3] <= 0:
                  this.combatWin(15);
                  break;
               case this.combatLevel == 16 && this.combatStats[0] <= 0:
                  this.combatFail(16);
                  break;
               case this.combatLevel == 16 && this.combatStats[3] <= 0:
                  this.combatWin(16);
                  break;
               case this.combatLevel == 17 && this.combatStats[0] <= 0:
                  this.combatFail(17);
                  break;
               case this.combatLevel == 17 && this.combatStats[3] <= 0:
                  this.combatWin(17);
                  break;
               case this.combatLevel == 18 && this.combatStats[0] <= 0:
                  this.combatFail(18);
                  break;
               case this.combatLevel == 18 && this.combatStats[3] <= 0:
                  this.combatWin(18);
                  break;
               case this.combatLevel == 19 && this.combatStats[0] <= 0:
                  this.combatFail(19);
                  break;
               case this.combatLevel == 19 && this.combatStats[3] <= 0:
                  this.combatWin(19);
                  break;
               case this.combatLevel == 20 && this.combatStats[0] <= 0:
                  this.combatFail(20);
                  break;
               case this.combatLevel == 20 && this.combatStats[3] <= 0:
                  this.combatWin(20);
                  break;
               case this.combatLevel == 21 && this.combatStats[0] <= 0:
                  this.combatFail(21);
                  break;
               case this.combatLevel == 21 && this.combatStats[3] <= 0:
                  this.combatWin(21);
                  break;
               case this.combatLevel == 22 && this.combatStats[0] <= 0:
                  this.combatFail(22);
                  break;
               case this.combatLevel == 22 && this.combatStats[3] <= 0:
                  this.combatWin(22);
                  break;
               case this.combatLevel == 23 && this.combatStats[0] <= 0:
                  this.combatFail(23);
                  break;
               case this.combatLevel == 23 && this.combatStats[3] <= 0:
                  this.combatWin(23);
                  break;
               case this.combatLevel == 24 && this.combatStats[0] <= 0:
                  this.combatFail(24);
                  break;
               case this.combatLevel == 24 && this.combatStats[3] <= 0:
                  this.combatWin(24);
                  break;
               case this.combatLevel == 25 && this.combatStats[0] <= 0:
                  this.combatFail(25);
                  break;
               case this.combatLevel == 25 && this.combatStats[3] <= 0:
                  this.combatWin(25);
                  break;
               case this.combatLevel == 26 && this.combatStats[0] <= 0:
                  this.combatFail(26);
                  break;
               case this.combatLevel == 26 && this.combatStats[3] <= 0:
                  this.combatWin(26);
                  break;
               case this.combatLevel == 27 && this.combatStats[0] <= 0:
                  this.combatFail(27);
                  break;
               case this.combatLevel == 27 && this.combatStats[3] <= 0:
                  this.combatWin(27);
                  break;
               case this.combatLevel == 28 && this.combatStats[0] <= 0:
                  this.combatFail(28);
                  break;
               case this.combatLevel == 28 && this.combatStats[3] <= 0:
                  this.combatWin(28);
                  break;
               case this.combatLevel == 29 && this.combatStats[0] <= 0:
                  this.combatFail(29);
                  break;
               case this.combatLevel == 29 && this.combatStats[3] <= 0:
                  this.combatWin(29);
                  break;
               case this.combatLevel == 30 && this.combatStats[0] <= 0:
                  this.combatFail(30);
                  break;
               case this.combatLevel == 30 && this.combatStats[3] <= 0:
                  this.combatWin(30);
                  break;
               case this.combatLevel == 31 && this.combatStats[0] <= 0:
                  this.combatFail(31);
                  break;
               case this.combatLevel == 31 && this.combatStats[3] <= 0:
                  this.combatWin(31);
                  break;
               case this.combatLevel == 32 && this.combatStats[0] <= 0:
                  this.combatFail(32);
                  break;
               case this.combatLevel == 32 && this.combatStats[3] <= 0:
                  this.combatWin(32);
                  break;
               case this.combatLevel == 100 && this.combatStats[0] <= 0:
                  this.combatFail(100);
                  break;
               case this.combatLevel == 100 && this.combatStats[3] <= 0:
                  this.combatWin(100);
                  break;
               case this.combatLevel == 101 && this.combatStats[0] <= 0:
                  this.combatFail(101);
                  break;
               case this.combatLevel == 101 && this.combatStats[3] <= 0:
                  this.combatWin(101);
                  break;
               case this.combatLevel == 102 && this.combatStats[0] <= 0:
                  this.combatFail(102);
                  break;
               case this.combatLevel == 103 && this.combatStats[0] <= 0:
                  this.combatFail(103);
                  break;
               case this.combatLevel == 104 && this.combatStats[0] <= 0:
                  this.combatFail(104);
                  break;
               case this.combatLevel == 104 && this.combatStats[3] <= 0:
                  this.combatWin(104);
                  break;
               case this.combatLevel == 105 && this.combatStats[0] <= 0:
                  this.combatFail(105);
                  break;
               case this.combatLevel == 105 && this.combatStats[3] <= 0:
                  this.combatWin(105);
                  break;
               case this.combatLevel == 106 && this.combatStats[0] <= 0:
                  this.combatFail(106);
                  break;
               case this.combatLevel == 106 && this.combatStats[3] <= 0:
                  this.combatWin(106);
                  break;
               case this.combatLevel == 200:
                  this.loadBossFinal(1);
                  break;
               case this.combatLevel == 201:
                  this.loadBossFinal(2);
                  break;
               case this.combatLevel == 204:
                  this.loadBossFinal(3);
                  break;
               case this.combatLevel == 205:
                  this.loadBossFinal(4);
                  break;
               default:
                  this.endCombat();
            }
         }
      }

      public function combatFail(param1:int):void
      {
         this.combatResult = false;
         switch (true)
         {
            case param1 == 1:
               this.getDialogue(101006);
               break;
            case param1 == 90:
               this.getDialogue(101070);
               break;
            case param1 == 91:
               this.getDialogue(101073);
               break;
            case param1 == 92:
               this.getDialogue(101076);
               break;
            case param1 == 93:
               this.getDialogue(101079);
               break;
            case param1 == 94:
               this.getDialogue(101082);
               break;
            case param1 == 95:
               this.getDialogue(101085);
               break;
            case param1 == 96:
               this.getDialogue(101088);
               break;
            case param1 == 97:
               this.getDialogue(101091);
               break;
            case param1 == 98:
               this.getDialogue(101094);
               break;
            case param1 == 99:
               this.getDialogue(101097);
               break;
            case param1 == 2:
               this.getDialogue(102001);
               break;
            case param1 == 3:
               this.getDialogue(103010);
               break;
            case param1 == 4:
               this.getDialogue(104010);
               break;
            case param1 == 5:
               this.getDialogue(105010);
               break;
            case param1 == 6:
               this.getDialogue(106010);
               break;
            case param1 == 7:
               this.getDialogue(107010);
               break;
            case param1 == 8:
               this.getDialogue(108010);
               break;
            case param1 == 9:
               this.getDialogue(109010);
               break;
            case param1 == 10:
               this.getDialogue(101010);
               break;
            case param1 == 11:
               this.getDialogue(101110);
               break;
            case param1 == 12:
               this.getDialogue(101210);
               break;
            case param1 == 13:
               this.getDialogue(101310);
               break;
            case param1 == 14:
               this.getDialogue(101410);
               break;
            case param1 == 15:
               this.getDialogue(101510);
               break;
            case param1 == 16:
               this.getDialogue(101610);
               break;
            case param1 == 17:
               this.getDialogue(101710);
               break;
            case param1 == 18:
               this.getDialogue(101810);
               break;
            case param1 == 19:
               this.getDialogue(101910);
               break;
            case param1 == 20:
               this.getDialogue(102010);
               break;
            case param1 == 21:
               this.getDialogue(102110);
               break;
            case param1 == 22:
               this.getDialogue(102210);
               break;
            case param1 == 23:
               this.getDialogue(102310);
               break;
            case param1 == 24:
               this.getDialogue(102410);
               break;
            case param1 == 25:
               this.getDialogue(102510);
               break;
            case param1 == 26:
               this.getDialogue(102610);
               break;
            case param1 == 27:
               this.getDialogue(102710);
               break;
            case param1 == 28:
               this.getDialogue(102810);
               break;
            case param1 == 29:
               this.getDialogue(102910);
               break;
            case param1 == 30:
               this.getDialogue(133010);
               break;
            case param1 == 31:
               this.getDialogue(103110);
               break;
            case param1 == 32:
               this.getDialogue(103210);
               break;
            case param1 == 100:
               this.getDialogue(200010);
               break;
            case param1 == 101:
               this.getDialogue(200210);
               break;
            case param1 == 102:
               this.getDialogue(200310);
               break;
            case param1 == 103:
               this.getDialogue(200410);
               break;
            case param1 == 104:
               this.getDialogue(200510);
               break;
            case param1 == 105:
               this.getDialogue(200610);
               break;
            case param1 == 106:
               this.getDialogue(200710);
         }
      }

      public function combatWin(param1:int):void
      {
         var _loc2_:int = 0;
         this.gainConverts();
         this.combatResult = true;
         _loc2_ = 0;
         while (_loc2_ < 4)
         {
            if (this.activeMission[_loc2_][1][0] != "void")
            {
               if (this.activeMission[_loc2_][0][2] > 0)
               {
                  this.activeMission[_loc2_][0][2] = this.activeMission[_loc2_][0][2] - 1;
               }
            }
            this.activeMission[5][(_loc2_ + 1) * 10] = false;
            _loc2_++;
         }
         switch (true)
         {
            case param1 == 1:
               if (this.gameStory < 5)
               {
                  this.gameStory = 5;
                  this.createDeck();
               }
               this.getDialogue(101007);
               break;
            case param1 == 90:
               this.sCheck = true;
               this.getDialogue(101071);
               break;
            case param1 == 91:
               this.getHero(91);
               this.getDialogue(101074);
               break;
            case param1 == 92:
               this.getHero(92);
               this.getDialogue(101077);
               break;
            case param1 == 93:
               this.getHero(93);
               this.getDialogue(101080);
               break;
            case param1 == 94:
               this.getHero(94);
               this.getDialogue(101083);
               break;
            case param1 == 95:
               this.getHero(95);
               this.getDialogue(101086);
               break;
            case param1 == 96:
               this.getHero(96);
               this.getDialogue(101089);
               break;
            case param1 == 97:
               this.getHero(97);
               this.getDialogue(101092);
               break;
            case param1 == 98:
               this.getDialogue(101095);
               break;
            case param1 == 99:
               this.getDialogue(101098);
               break;
            case param1 == 2:
               if (this.gameStory < 10)
               {
                  this.gameStory = 10;
               }
               this.getDialogue(102002);
               break;
            case param1 == 3:
               if (this.gameStory < 15)
               {
                  this.gameStory = 15;
               }
               this.getDialogue(103011);
               break;
            case param1 == 4:
               if (this.gameStory < 20)
               {
                  this.gameStory = 20;
               }
               this.getDialogue(104011);
               break;
            case param1 == 5:
               if (this.gameStory < 25)
               {
                  this.gameStory = 25;
               }
               this.getDialogue(105011);
               break;
            case param1 == 6:
               if (this.gameStory < 30)
               {
                  this.gameStory = 30;
               }
               this.getDialogue(106011);
               break;
            case param1 == 100:
               if (this.gameStory < 35)
               {
                  this.gameStory = 35;
               }
               this.getDialogue(200020);
               break;
            case param1 == 7:
               if (this.gameStory < 40)
               {
                  this.gameStory = 40;
               }
               this.getDialogue(107011);
               break;
            case param1 == 8:
               if (this.gameStory < 45)
               {
                  this.gameStory = 45;
               }
               this.getDialogue(108011);
               break;
            case param1 == 9:
               if (this.gameStory < 50)
               {
                  this.gameStory = 50;
               }
               this.getDialogue(109011);
               break;
            case param1 == 10:
               if (this.gameStory < 55)
               {
                  this.gameStory = 55;
               }
               this.getDialogue(101011);
               break;
            case param1 == 11:
               if (this.gameStory < 60)
               {
                  this.gameStory = 60;
               }
               this.getDialogue(101111);
               break;
            case param1 == 12:
               if (this.gameStory < 65)
               {
                  this.gameStory = 65;
               }
               this.getDialogue(101211);
               break;
            case param1 == 13:
               if (this.gameStory < 70)
               {
                  this.gameStory = 70;
               }
               this.getDialogue(101311);
               break;
            case param1 == 14:
               if (this.gameStory < 75)
               {
                  this.gameStory = 75;
               }
               this.getDialogue(101411);
               break;
            case param1 == 15:
               if (this.gameStory < 80)
               {
                  this.gameStory = 80;
               }
               this.getDialogue(101511);
               break;
            case param1 == 16:
               if (this.gameStory < 85)
               {
                  this.gameStory = 85;
               }
               this.getDialogue(101611);
               break;
            case param1 == 101:
               if (this.gameStory < 90)
               {
                  this.gameStory = 90;
               }
               this.getDialogue(200220);
               break;
            case param1 == 104:
               if (this.gameStory < 105)
               {
                  this.gameStory = 105;
               }
               this.getDialogue(200520);
               break;
            case param1 == 17:
               if (this.gameStory < 95)
               {
                  this.gameStory = 95;
               }
               this.getDialogue(101711);
               break;
            case param1 == 18:
               if (this.gameStory < 100)
               {
                  this.gameStory = 100;
               }
               this.getDialogue(101811);
               break;
            case param1 == 19:
               if (this.gameStory < 110)
               {
                  this.gameStory = 110;
               }
               this.getDialogue(101911);
               break;
            case param1 == 20:
               if (this.gameStory < 115)
               {
                  this.gameStory = 115;
               }
               this.getDialogue(102011);
               break;
            case param1 == 21:
               if (this.gameStory < 120)
               {
                  this.gameStory = 120;
               }
               this.getDialogue(102111);
               break;
            case param1 == 22:
               if (this.gameStory < 125)
               {
                  this.gameStory = 125;
               }
               this.getDialogue(102211);
               break;
            case param1 == 105:
               if (this.gameStory < 130)
               {
                  this.gameStory = 130;
               }
               this.getDialogue(200620);
               break;
            case param1 == 23:
               if (this.gameStory < 135)
               {
                  this.gameStory = 135;
               }
               this.getDialogue(102311);
               break;
            case param1 == 24:
               if (this.gameStory < 140)
               {
                  this.gameStory = 140;
               }
               this.getDialogue(102411);
               break;
            case param1 == 25:
               if (this.gameStory < 145)
               {
                  this.gameStory = 145;
               }
               this.getDialogue(102511);
               break;
            case param1 == 26:
               if (this.gameStory < 150)
               {
                  this.gameStory = 150;
               }
               this.getDialogue(102611);
               break;
            case param1 == 27:
               if (this.gameStory < 155)
               {
                  this.gameStory = 155;
               }
               this.getDialogue(102711);
               break;
            case param1 == 28:
               this.getDialogue(102811);
               this.finalCombat = 29;
               break;
            case param1 == 29:
               this.getDialogue(102911);
               this.finalCombat = 30;
               break;
            case param1 == 30:
               this.getDialogue(133011);
               this.finalCombat = 31;
               break;
            case param1 == 31:
               this.getDialogue(103111);
               this.finalCombat = 32;
               break;
            case param1 == 32:
               if (this.gameStory < 160)
               {
                  this.gameStory = 160;
               }
               this.getDialogue(103211);
               this.finalCombat = 33;
               break;
            case param1 == 107:
               if (this.gameStory < 165)
               {
                  this.gameStory = 165;
               }
               this.endCombat();
               break;
            default:
               this.endCombat();
         }
      }

      public function loadHeroEvent(param1:int):void
      {
         this.eventLock = true;
         this.cSpecial = new asModEvent(param1);
         addChild(this.cSpecial);
         addChild(this.specMask);
         this.cSpecial.mask = this.specMask;
      }

      public function getHero(param1:int):void
      {
         if (param1 == 97)
         {
            this.specialDialogues[5] = true;
            this.specialEvents[21] = 1;
            this.cardInventory[this.cardInventory.length] = this.createCard(9, 4, 5, 1, 6);
         }
         else if (param1 == 96)
         {
            this.specialDialogues[6] = true;
            this.specialEvents[24] = 1;
            this.cardInventory[this.cardInventory.length] = this.createCard(9, 2, 5, 3, 4);
         }
         else if (param1 == 95)
         {
            this.specialDialogues[7] = true;
            this.specialEvents[25] = 1;
            this.cardInventory[this.cardInventory.length] = this.createCard(9, 5, 4, 4, 4);
         }
         else if (param1 == 94)
         {
            this.specialDialogues[8] = true;
            this.specialEvents[22] = 1;
            this.cardInventory[this.cardInventory.length] = this.createCard(9, 1, 5, 2, 6);
         }
         else if (param1 == 93)
         {
            this.specialDialogues[9] = true;
            this.specialEvents[26] = 1;
            this.cardInventory[this.cardInventory.length] = this.createCard(9, 3, 6, 5, 4);
         }
         else if (param1 == 92)
         {
            this.specialDialogues[10] = true;
            this.specialEvents[23] = 1;
            this.cardInventory[this.cardInventory.length] = this.createCard(10, 2, 6, 6, 4);
         }
         else if (param1 == 91)
         {
            this.specialDialogues[11] = true;
            this.specialEvents[27] = 1;
            this.cardInventory[this.cardInventory.length] = this.createCard(10, 4, 6, 1, 7);
         }
         else if (param1 == 90)
         {
            this.specialEvents[28] = 1;
         }
      }

      public function specialConvert():void
      {
         var _loc1_:Array = null;
         _loc1_ = new Array();
         _loc1_[0] = "0000";
         _loc1_[1] = "0000";
         _loc1_[2] = "0000";
         if (this.combatLevel == 4 && this.gameStory < 20)
         {
            _loc1_[0] = this.blankCard(5);
            _loc1_[1] = new Array(1, 4, 1);
            _loc1_[0][8] = -1;
            _loc1_[0][9] = this.cardInventory.length + this.combatConvert[0].length;
         }
         else if (this.combatLevel == 5 && this.gameStory < 25)
         {
            _loc1_[0] = this.blankCard(5);
            _loc1_[1] = new Array(4, 4, 1);
            _loc1_[0][8] = -1;
            _loc1_[0][9] = this.cardInventory.length + this.combatConvert[0].length;
         }
         else if (this.combatLevel == 8 && this.gameStory < 45)
         {
            _loc1_[1] = new Array(3, 5, 1);
         }
         else if (this.combatLevel == 10 && this.gameStory < 55)
         {
            _loc1_[1] = new Array(2, 4, 1);
         }
         else if (this.combatLevel == 18 && this.gameStory < 100)
         {
            _loc1_[1] = new Array(5, 5, 1);
         }
         if (_loc1_[0] != "0000")
         {
            this.combatConvert[0][this.combatConvert[0].length] = _loc1_[0].concat();
         }
         if (_loc1_[1] != "0000")
         {
            this.combatConvert[1][this.combatConvert[1].length] = _loc1_[1].concat();
         }
         if (_loc1_[2] != "0000")
         {
            this.combatConvert[2][this.combatConvert[2].length] = _loc1_[2].concat();
         }
      }

      public function unloadCombat():void
      {
         this.validateDeck();
         removeChild(this.bgHolder);
         removeChild(this.combatGrid);
         removeChild(this.obHolder);
         removeChild(this.uiHolder);
         removeChild(this.mainMask);
         if (this.vicScreen != null)
         {
            removeChild(this.vicScreen);
         }
         this.bgHolder = null;
         this.obHolder = null;
         this.uiHolder = null;
         this.combatGrid = null;
         this.vicScreen = null;
         if (!this.pecuWin)
         {
            switch (true)
            {
               case this.gameStory < 5:
                  this.loadMap(2);
                  break;
               case this.finalCombat != 0 && this.finalCombat != 33:
                  this.loadCombat(this.finalCombat);
                  break;
               case this.gameStory == 10:
                  this.loadChapter(5);
                  break;
               case this.gameStory == 35:
                  this.loadChapter(6);
                  break;
               case this.gameStory == 55:
                  this.loadChapter(7);
                  break;
               case this.gameStory == 165:
                  this.loadChapter(10);
                  ++this.gameStory;
                  break;
               default:
                  this.loadWorldMap();
            }
         }
         else
         {
            this.pecuWin = false;
            switch (true)
            {
               case this.combatLevel == 102:
                  this.loadBossCombat(103);
                  break;
               case this.combatLevel == 103:
                  this.loadBossCombat(104);
                  break;
               default:
                  this.loadMap(0);
            }
         }
      }

      public function validateDeck():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc1_ = 0;
         while (_loc1_ < 15)
         {
            this.inventoryDeck[_loc1_] = new Array();
            this.inventoryDeck[_loc1_][0] = "0000";
            _loc1_++;
         }
         _loc2_ = 0;
         while (_loc2_ < this.cardInventory.length)
         {
            if (this.cardInventory[_loc2_][0][8] != -1)
            {
               _loc3_ = int(this.cardInventory[_loc2_][0][8]);
               this.inventoryDeck[_loc3_] = new Array();
               _loc4_ = 0;
               while (_loc4_ < 3)
               {
                  this.inventoryDeck[_loc3_][_loc4_] = new Array();
                  this.inventoryDeck[_loc3_][_loc4_] = this.cardInventory[_loc2_][_loc4_].concat();
                  _loc4_++;
               }
            }
            _loc2_++;
         }
      }

      public function analyzeBoard():void
      {
         if (this.summoning)
         {
            this.checkSummon();
            if (this.combatStats[8] <= 0 || this.combatStats[4] < 2 || this.combatStats[9] >= this.combatStats[10] || this.combatArray[6] != "0000" && this.combatArray[13] != "0000" && this.combatArray[20] != "0000")
            {
               this.summoning = false;
            }
         }
         else if (this.combatStats[15] == 5 && this.cSpecial == null && this.combatLevel != 1)
         {
            this.combatStats[15] = 0;
            this.enemySpecial(this.bType);
         }
         else if (this.cSpecial != null)
         {
            this.checkSpecialE();
         }
         else if (this.swapping)
         {
            this.checkSwitch();
         }
         else
         {
            this.combatState = 10;
         }
      }

      public function getEnemyUnit(param1:int):Array
      {
         switch (true)
         {
            case param1 == 1:
               return new Array(new Array(4, 4), new Array(1, 2, 3), new Array(0, 0), new Array(1, 1));
            case param1 == 90:
               return new Array(new Array(8, 8), new Array(1, 2), new Array(1, 2, 3, 4, 5, 6), new Array(3, 3));
            case param1 == 91:
               return new Array(new Array(7, 7), new Array(71, 72, 73), new Array(1, 2, 3, 4, 5, 6), new Array(3, 3));
            case param1 == 92:
               return new Array(new Array(3, 3), new Array(31, 32, 33), new Array(1, 2, 3, 4, 5, 6), new Array(3, 3));
            case param1 == 93:
               return new Array(new Array(9, 9), new Array(7, 7), new Array(0, 0), new Array(1, 1));
            case param1 == 94:
               return new Array(new Array(2, 2), new Array(1, 1), new Array(0, 0), new Array(1, 1));
            case param1 == 95:
               return new Array(new Array(1, 1), new Array(1, 2, 3), new Array(1, 2, 3, 4, 5, 6), new Array(3, 3));
            case param1 == 96:
               return new Array(new Array(4, 4), new Array(1, 1), new Array(0, 0), new Array(1, 1));
            case param1 == 97:
               return new Array(new Array(4, 4), new Array(1, 2, 3), new Array(1, 2, 3, 4), new Array(2, 2));
            case param1 == 98:
               return new Array(new Array(1, 1), new Array(1, 2, 3), new Array(1, 2, 3, 4, 5, 6), new Array(1, 1));
            case param1 == 99:
               return new Array(new Array(1, 1), new Array(1, 1), new Array(0, 0), new Array(1, 1));
            case param1 == 2:
               return new Array(new Array(4, 4), new Array(1, 1), new Array(0, 0), new Array(1, 1));
            case param1 == 3:
               return new Array(new Array(5, 5), new Array(1, 1), new Array(2, 0), new Array(1, 1));
            case param1 == 4:
               return new Array(new Array(5, 5), new Array(1, 2), new Array(1, 0), new Array(1, 1));
            case param1 == 5:
               return new Array(new Array(5, 5), new Array(1, 1), new Array(1, 1), new Array(5, 5));
            case param1 == 6:
               return new Array(new Array(5, 5), new Array(1, 2), new Array(1, 0), new Array(1, 1));
            case param1 == 7:
               return new Array(new Array(2, 2), new Array(21, 22), new Array(4, 6, 0), new Array(2, 2));
            case param1 == 8:
               return new Array(new Array(2, 2), new Array(21, 22, 23), new Array(4, 6, 0), new Array(2, 2));
            case param1 == 9:
               return new Array(new Array(2, 2), new Array(21, 22), new Array(4, 6, 0), new Array(2, 2));
            case param1 == 10:
               return new Array(new Array(6, 6), new Array(61, 62), new Array(0, 0), new Array(1, 1));
            case param1 == 11:
               return new Array(new Array(6, 6), new Array(1, 2, 3), new Array(1, 2, 3, 4, 5, 6), new Array(1, 1));
            case param1 == 12:
               return new Array(new Array(6, 6), new Array(1, 2, 3), new Array(6, 6), new Array(2, 2));
            case param1 == 13:
               return new Array(new Array(6, 6), new Array(1, 2, 3), new Array(3, 4), new Array(2, 2));
            case param1 == 14:
               return new Array(new Array(6, 6), new Array(1, 2, 3), new Array(3, 3), new Array(2, 2));
            case param1 == 15:
               return new Array(new Array(6, 6), new Array(1, 2, 3), new Array(1, 2), new Array(2, 2));
            case param1 == 16:
               return new Array(new Array(6, 6), new Array(1, 2, 3), new Array(5, 5), new Array(2, 2));
            case param1 == 17:
               return new Array(new Array(2, 2), new Array(21, 22, 23), new Array(1, 2, 3, 4, 5, 6), new Array(3, 3));
            case param1 == 18:
               return new Array(new Array(2, 2), new Array(21, 22, 23), new Array(1, 2, 3, 4, 5, 6), new Array(3, 3));
            case param1 == 19:
               return new Array(new Array(3, 3), new Array(31, 32, 33), new Array(5, 5), new Array(2, 2));
            case param1 == 20:
               return new Array(new Array(3, 3), new Array(31, 32, 33), new Array(5, 4), new Array(2, 3));
            case param1 == 21:
               return new Array(new Array(3, 3), new Array(31, 32, 33), new Array(5, 5), new Array(2, 2));
            case param1 == 22:
               return new Array(new Array(3, 3), new Array(31, 32, 33), new Array(1, 2, 3, 4, 5, 6), new Array(3, 3));
            case param1 == 23:
               return new Array(new Array(3, 3), new Array(31, 32, 33), new Array(1, 4), new Array(3, 3));
            case param1 == 24:
               return new Array(new Array(7, 7), new Array(71, 72, 73), new Array(5, 5), new Array(3, 3));
            case param1 == 25:
               return new Array(new Array(7, 7), new Array(71, 72, 73), new Array(5, 5), new Array(3, 3));
            case param1 == 26:
               return new Array(new Array(7, 7), new Array(71, 72, 73), new Array(3, 4), new Array(3, 3));
            case param1 == 27:
               return new Array(new Array(7, 7), new Array(71, 72, 73), new Array(6, 6), new Array(3, 3));
            case param1 == 28:
               return new Array(new Array(7, 7), new Array(71, 72, 73), new Array(1, 2, 3, 4, 5, 6), new Array(3, 3));
            case param1 == 29:
               return new Array(new Array(7, 7), new Array(71, 72, 73), new Array(1, 2, 3, 4, 5, 6), new Array(3, 3));
            case param1 == 30:
               return new Array(new Array(7, 7), new Array(71, 72, 73), new Array(1, 2, 3, 4, 5, 6), new Array(3, 3));
            case param1 == 31:
               return new Array(new Array(7, 7), new Array(71, 72, 73), new Array(1, 2, 3, 4, 5, 6), new Array(3, 3));
            case param1 == 32:
               return new Array(new Array(7, 7), new Array(71, 72, 73), new Array(1, 2, 3, 4, 5, 6), new Array(3, 3));
            default:
               return new Array(new Array(1, 1), new Array(1, 2, 3), new Array(0, 0), new Array(1, 1));
         }
      }

      public function unitConvert(param1:int, param2:int, param3:int):void
      {
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:MovieClip = null;
         this.combatSoul -= 50;
         this.pubTarget = param2;
         _loc4_ = Math.floor(Math.random() * 100) + 1;
         _loc5_ = new Array();
         _loc5_[0] = new Array(0, 0, 0);
         _loc5_[0] = this.blankCard(this.combatArray[param2][0][7]);
         switch (true)
         {
            case this.combatLevel == 99:
               _loc5_[1] = new Array(Math.floor(Math.random() * 5) + 1, 1, 1);
               break;
            case this.combatLevel == 98:
               _loc5_[1] = new Array(Math.floor(Math.random() * 5) + 1, 2, 1);
               break;
            case this.combatLevel == 97:
               _loc5_[1] = new Array(Math.floor(Math.random() * 5) + 1, 2, 1);
               break;
            case this.combatLevel == 96:
               _loc5_[1] = new Array(Math.floor(Math.random() * 5) + 1, 2, 1);
               break;
            case this.combatLevel > 10:
               _loc5_[1] = new Array(Math.floor(Math.random() * 5) + 1, 2, 1);
               break;
            default:
               _loc5_[1] = new Array(Math.floor(Math.random() * 5) + 1, 1, 1);
         }
         _loc5_[2] = "0000";
         switch (true)
         {
            case this.combatLevel == 2:
               if (_loc4_ > 75)
               {
                  _loc5_[2] = new Array(4, 1, 2);
               }
               break;
            case this.combatLevel == 3:
               if (_loc4_ > 50)
               {
                  _loc5_[2] = new Array(2, 1, 2);
               }
               break;
            case this.combatLevel == 4:
               if (_loc4_ > 75)
               {
                  _loc5_[2] = new Array(1, 1, 2);
               }
               break;
            case this.combatLevel == 5:
               if (_loc4_ > 75)
               {
                  _loc5_[2] = new Array(3, 1, 2);
               }
               break;
            case this.combatLevel == 6:
               if (_loc4_ > 50)
               {
                  _loc5_[2] = new Array(5, 1, 2);
               }
               break;
            case this.combatLevel == 7:
               if (_loc4_ > 25)
               {
                  _loc5_[2] = new Array(1, 1, 2);
               }
               break;
            case this.combatLevel == 9:
               if (_loc4_ > 50)
               {
                  _loc5_[2] = new Array(3, 1, 2);
               }
               break;
            case this.combatLevel == 11:
               if (_loc4_ > 50)
               {
                  _loc5_[2] = new Array(6, 1, 2);
               }
               break;
            case this.combatLevel == 12:
               if (_loc4_ > 25)
               {
                  _loc5_[2] = new Array(4, 1, 2);
               }
               break;
            case this.combatLevel == 13:
               if (_loc4_ > 75)
               {
                  _loc5_[2] = new Array(1, 2, 2);
               }
               break;
            case this.combatLevel == 14:
               if (_loc4_ > 75)
               {
                  _loc5_[2] = new Array(2, 2, 2);
               }
               break;
            case this.combatLevel == 15:
               if (_loc4_ > 75)
               {
                  _loc5_[2] = new Array(3, 2, 2);
               }
               break;
            case this.combatLevel == 16:
               if (_loc4_ > 75)
               {
                  _loc5_[2] = new Array(4, 2, 2);
               }
               break;
            case this.combatLevel == 17:
               if (_loc4_ > 75)
               {
                  _loc5_[2] = new Array(6, 2, 2);
               }
               break;
            case this.combatLevel == 19:
               if (_loc4_ > 90)
               {
                  _loc5_[2] = new Array(1, 3, 2);
               }
               break;
            case this.combatLevel == 20:
               if (_loc4_ > 90)
               {
                  _loc5_[2] = new Array(2, 3, 2);
               }
               break;
            case this.combatLevel == 21:
               if (_loc4_ > 90)
               {
                  _loc5_[2] = new Array(3, 3, 2);
               }
               break;
            case this.combatLevel == 22:
               if (_loc4_ > 90)
               {
                  _loc5_[2] = new Array(4, 3, 2);
               }
               break;
            case this.combatLevel == 23:
               if (_loc4_ > 90)
               {
                  _loc5_[2] = new Array(5, 3, 2);
               }
               break;
            case this.combatLevel == 27:
               if (_loc4_ > 65)
               {
                  _loc5_[2] = new Array(6, 3, 2);
                  break;
               }
         }
         _loc5_[0][8] = -1;
         _loc5_[0][9] = this.cardInventory.length + this.combatConvert[0].length;
         if (this.combatLevel != 93 && this.combatLevel != 90)
         {
            this.combatConvert[0][this.combatConvert[0].length] = _loc5_[0].concat();
         }
         this.combatConvert[1][this.combatConvert[1].length] = _loc5_[1].concat();
         if (_loc5_[2] != "0000")
         {
            this.combatConvert[2][this.combatConvert[2].length] = _loc5_[2].concat();
         }
         _loc6_ = this.objList[this.combatArray[param2][6][0]];
         _loc6_.mySlot = this.pubTarget;
         this.clearEffects(param2);
         _loc6_.stageClip.gotoAndStop(9);
      }

      public function clearEffects(param1:*):void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         _loc2_ = this.objList[this.combatArray[param1][6][0]];
         _loc3_ = 0;
         while (_loc3_ < 10)
         {
            this.combatArray[param1][4][_loc3_] = 0;
            this.combatArray[param1][5][_loc3_] = 0;
            _loc3_++;
         }
         this.combatArray[param1][4][10] = false;
         this.combatArray[param1][5][10] = 0;
         _loc2_.updateStats(this.combatArray[param1]);
      }

      public function loadSpec(param1:int):void
      {
      }

      public function loadDeck():void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         _loc1_ = new Array();
         if (this.combatLevel != 10)
         {
            _loc3_ = 0;
            while (_loc3_ < this.inventoryDeck.length)
            {
               if (this.inventoryDeck[_loc3_][0] != "0000")
               {
                  _loc1_.push(this.inventoryDeck[_loc3_]);
               }
               _loc3_++;
            }
         }
         else
         {
            _loc4_ = 0;
            for (; _loc3_ < 4; _loc3_++)
            {
               if (this.inventoryDeck[_loc3_][0] == "0000")
               {
                  continue;
               }
               _loc1_[_loc3_] = new Array();
               switch (true)
               {
                  case _loc3_ == 0:
                     _loc1_[_loc3_] = this.createCard(4, 1, 3, 0, 1);
                     break;
                  case _loc3_ == 1:
                     _loc1_[_loc3_] = this.createCard(4, 1, 3, 0, 1);
                     break;
                  case _loc3_ == 2:
                     _loc1_[_loc3_] = this.createCard(4, 1, 3, 0, 1);
                     break;
                  case _loc3_ == 3:
                     _loc1_[_loc3_] = this.createCard(4, 5, 3, 0, 1);
                     break;
               }
            }
         }
         this.combatDeck.push(_loc1_[0]);
         _loc1_.splice(0, 1);
         if (_loc1_.length > 0)
         {
            _loc5_ = Math.floor(Math.random() * 2);
            this.combatDeck.push(_loc1_[_loc5_]);
            _loc1_.splice(_loc5_, 1);
            if (_loc1_.length < 13)
            {
               _loc2_ = int(_loc1_.length);
            }
            else
            {
               _loc2_ = 13;
            }
            while (_loc2_ > 0)
            {
               _loc6_ = Math.floor(Math.random() * _loc2_);
               this.combatDeck.push(_loc1_[_loc6_]);
               _loc1_.splice(_loc6_, 1);
               _loc2_--;
            }
         }
         if (this.combatLevel == 28 || this.combatLevel == 29 || this.combatLevel == 30 || this.combatLevel == 31)
         {
            switch (true)
            {
               case this.combatLevel == 28:
                  _loc7_ = 4;
                  _loc8_ = 0;
                  break;
               case this.combatLevel == 29:
                  _loc7_ = 5;
                  _loc8_ = 0;
                  break;
               case this.combatLevel == 30:
                  _loc7_ = 6;
                  _loc8_ = 0;
                  break;
               case this.combatLevel == 31:
                  _loc7_ = 2;
                  _loc8_ = 1;
            }
            _loc9_ = 0;
            while (_loc9_ < this.combatDeck.length)
            {
               if (this.combatDeck[_loc9_][0][7] != _loc7_ && this.combatDeck[_loc9_][0][7] < 9)
               {
                  this.combatDeck[_loc9_][0][7] = _loc7_;
                  this.combatDeck[_loc9_][0][0] = _loc7_;
                  this.combatDeck[_loc9_][0][6] = _loc8_;
               }
               if (this.combatDeck[_loc9_][0][7] == 9)
               {
                  if (this.combatDeck[_loc9_][1][0] == 1 && _loc7_ != 2)
                  {
                     this.combatDeck[_loc9_][0][6] = _loc8_;
                     this.combatDeck[_loc9_][0][7] = _loc7_;
                     this.combatDeck[_loc9_][0][0] = _loc7_;
                     this.combatDeck[_loc9_][1][1] = 6;
                     this.combatDeck[_loc9_][2][0] = 1;
                     this.combatDeck[_loc9_][2][1] = 3;
                  }
                  else if (this.combatDeck[_loc9_][1][0] == 2 && _loc7_ != 4)
                  {
                     this.combatDeck[_loc9_][0][6] = _loc8_;
                     this.combatDeck[_loc9_][0][7] = _loc7_;
                     this.combatDeck[_loc9_][0][0] = _loc7_;
                     this.combatDeck[_loc9_][1][1] = 6;
                     this.combatDeck[_loc9_][2][0] = 3;
                     this.combatDeck[_loc9_][2][1] = 3;
                  }
                  else if (this.combatDeck[_loc9_][1][0] == 3 && _loc7_ != 6)
                  {
                     this.combatDeck[_loc9_][0][6] = _loc8_;
                     this.combatDeck[_loc9_][0][7] = _loc7_;
                     this.combatDeck[_loc9_][0][0] = _loc7_;
                     this.combatDeck[_loc9_][1][1] = 9;
                     this.combatDeck[_loc9_][2][0] = 6;
                     this.combatDeck[_loc9_][2][1] = 3;
                  }
                  else if (this.combatDeck[_loc9_][1][0] == 4)
                  {
                     this.combatDeck[_loc9_][0][6] = _loc8_;
                     this.combatDeck[_loc9_][0][7] = _loc7_;
                     this.combatDeck[_loc9_][0][0] = _loc7_;
                     this.combatDeck[_loc9_][1][1] = 34;
                     this.combatDeck[_loc9_][2][0] = 5;
                     this.combatDeck[_loc9_][2][1] = 3;
                  }
                  else if (this.combatDeck[_loc9_][1][0] == 5 && _loc7_ != 5)
                  {
                     this.combatDeck[_loc9_][0][6] = _loc8_;
                     this.combatDeck[_loc9_][0][7] = _loc7_;
                     this.combatDeck[_loc9_][0][0] = _loc7_;
                     this.combatDeck[_loc9_][1][1] = 71;
                     this.combatDeck[_loc9_][2][0] = 4;
                     this.combatDeck[_loc9_][2][1] = 3;
                  }
               }
               else if (this.combatDeck[_loc9_][0][7] == 10)
               {
                  if (this.combatDeck[_loc9_][1][0] == 2)
                  {
                     this.combatDeck[_loc9_][0][6] = _loc8_;
                     this.combatDeck[_loc9_][0][7] = _loc7_;
                     this.combatDeck[_loc9_][0][0] = _loc7_;
                     this.combatDeck[_loc9_][1][1] = 6;
                     this.combatDeck[_loc9_][2][0] = 3;
                     this.combatDeck[_loc9_][2][1] = 3;
                  }
                  else if (this.combatDeck[_loc9_][1][0] == 4)
                  {
                     this.combatDeck[_loc9_][0][6] = _loc8_;
                     this.combatDeck[_loc9_][0][7] = _loc7_;
                     this.combatDeck[_loc9_][0][0] = _loc7_;
                     this.combatDeck[_loc9_][1][1] = 34;
                     this.combatDeck[_loc9_][2][0] = 5;
                     this.combatDeck[_loc9_][2][1] = 3;
                  }
               }
               _loc9_++;
            }
         }
      }

      public function combatClick(param1:MouseEvent):void
      {
         if (!this.eventLock)
         {
            if (!this.animationLock)
            {
               switch (true)
               {
                  case this.combatState == 5 && !this.skillLock && param1.target.name == "btnSpec" && this.combatStats[6] == 5:
                     this.deSelect();
                     this.combatSpecial();
                     break;
                  case this.combatState == 5 && !this.skillLock && param1.target.name == "btnAction":
                     this.deSelect();
                     this.combatState = 6;
                     break;
                  case this.combatState == 5 && param1.target.name == "grid0":
                     this.selectGrid(0);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid1":
                     this.selectGrid(1);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid2":
                     this.selectGrid(2);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid3":
                     this.selectGrid(3);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid4":
                     this.selectGrid(4);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid5":
                     this.selectGrid(5);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid6":
                     this.selectGrid(6);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid7":
                     this.selectGrid(7);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid8":
                     this.selectGrid(8);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid9":
                     this.selectGrid(9);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid10":
                     this.selectGrid(10);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid11":
                     this.selectGrid(11);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid12":
                     this.selectGrid(12);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid13":
                     this.selectGrid(13);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid14":
                     this.selectGrid(14);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid15":
                     this.selectGrid(15);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid16":
                     this.selectGrid(16);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid17":
                     this.selectGrid(17);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid18":
                     this.selectGrid(18);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid19":
                     this.selectGrid(19);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid20":
                     this.selectGrid(20);
                     break;
                  case this.combatState == 5 && !this.skillLock && param1.target.name == "token0":
                     this.selectToken(0);
                     break;
                  case this.combatState == 5 && !this.skillLock && param1.target.name == "token1":
                     this.selectToken(1);
                     break;
                  case this.combatState == 5 && !this.skillLock && param1.target.name == "token2":
                     this.selectToken(2);
                     break;
                  case this.combatState == 5 && !this.skillLock && param1.target.name == "token3":
                     this.selectToken(3);
                     break;
                  case this.combatState == 5 && !this.skillLock && param1.target.name == "token4":
                     this.selectToken(4);
                     break;
                  case this.combatState == 5 && !this.skillLock && param1.target.name == "token5":
                     this.selectToken(5);
                     break;
                  case this.combatState == 5 && !this.skillLock:
                     this.deSelect();
                     break;
                  case this.combatState == 12 && param1.target.name == "btnNext":
                     this.vicScreen.gotoAndStop(2);
                     break;
                  case this.combatState == 12 && param1.target.name == "btnSkip":
                     this.unloadCombat();
                     break;
                  case this.combatState == 12 && param1.target.name == "oneStar" && this.combatConvert[0].length >= 1:
                     this.victoryEvent(1);
                     break;
                  case this.combatState == 12 && param1.target.name == "twoStar" && this.combatConvert[0].length >= 3:
                     this.victoryEvent(2);
                     break;
                  case this.combatState == 12 && param1.target.name == "threeStar" && this.sCheck:
                     this.victoryEvent(3);
                     break;
                  case this.combatState == 12 && param1.target.name == "threeStar" && this.combatConvert[0].length >= 4:
                     this.victoryEvent(3);
               }
            }
            else if (this.skillLock)
            {
               switch (true)
               {
                  case this.combatState == 5 && param1.target.name == "btnAction":
                     this.launchSkill();
                     break;
                  case this.combatState == 5 && param1.target.name == "grid0":
                     this.selectGrid(0);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid1":
                     this.selectGrid(1);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid2":
                     this.selectGrid(2);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid3":
                     this.selectGrid(3);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid4":
                     this.selectGrid(4);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid5":
                     this.selectGrid(5);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid6":
                     this.selectGrid(6);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid7":
                     this.selectGrid(7);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid8":
                     this.selectGrid(8);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid9":
                     this.selectGrid(9);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid10":
                     this.selectGrid(10);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid11":
                     this.selectGrid(11);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid12":
                     this.selectGrid(12);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid13":
                     this.selectGrid(13);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid14":
                     this.selectGrid(14);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid15":
                     this.selectGrid(15);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid16":
                     this.selectGrid(16);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid17":
                     this.selectGrid(17);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid18":
                     this.selectGrid(18);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid19":
                     this.selectGrid(19);
                     break;
                  case this.combatState == 5 && param1.target.name == "grid20":
                     this.selectGrid(20);
               }
            }
         }
         else if (this.cSpecial != null)
         {
            if (this.cSpecial.eventType > 0)
            {
               this.cSpecial.finished = true;
            }
         }
      }

      public function combatTick():void
      {
         if (!this.eventLock)
         {
            if (!this.skillLock)
            {
               if (!this.animationLock)
               {
                  if (!this.diaLock)
                  {
                     switch (true)
                     {
                        case this.combatState == 0:
                           this.loadChar();
                           break;
                        case this.combatState == 1:
                           this.loadBoss();
                           break;
                        case this.combatState == 2:
                           this.selectStart();
                           break;
                        case this.combatState == 3:
                           this.drawNewCard();
                           this.combatTurn += 1;
                           this.checkDia();
                           break;
                        case this.combatState == 4:
                           this.prepPlayer(0);
                           break;
                        case this.combatState == 5:
                           this.charTurn();
                           break;
                        case this.combatState == 6:
                           this.prepUnits(1);
                           break;
                        case this.combatState == 7:
                           this.charActive();
                           break;
                        case this.combatState == 8:
                           this.prepPlayer(3);
                           break;
                        case this.combatState == 9:
                           this.enemyTurn();
                           break;
                        case this.combatState == 10:
                           this.prepUnits(-1);
                           break;
                        case this.combatState == 11:
                           this.enemyActive();
                           break;
                        case this.combatState == 12:
                           this.endMatch();
                     }
                  }
                  else
                  {
                     this.checkDiaEvent();
                  }
               }
               this.checkSwap();
               this.checkHand();
               this.checkObjects();
               if (this.loopSaver > 10)
               {
                  this.loopSaver = 0;
                  this.checkDead();
               }
               else
               {
                  ++ this.loopSaver;
               }
            }
         }
      }

      public function checkDiaEvent():void
      {
         if (this.dialogue.bEvent != null)
         {
            this.dialogue.bEvent.bTick();
         }
      }

      public function checkHand():void
      {
         if (this.uiHolder != null)
         {
            if (this.gameState == 8)
            {
               switch (true)
               {
                  case this.uiHolder.hand.token0.y > 0 && this.combatHand[0] != "0000":
                     this.uiHolder.hand.token0.y -= 10;
                     this.animationLock = true;
                     if (this.uiHolder.hand.token0.y < 0)
                     {
                        this.uiHolder.hand.token0 = 0;
                     }
                     break;
                  case this.uiHolder.hand.token1.y > 0 && this.combatHand[1] != "0000":
                     this.uiHolder.hand.token1.y -= 10;
                     this.animationLock = true;
                     if (this.uiHolder.hand.token1.y < 0)
                     {
                        this.uiHolder.hand.token1 = 0;
                     }
                     break;
                  case this.uiHolder.hand.token2.y > 0 && this.combatHand[2] != "0000":
                     this.uiHolder.hand.token2.y -= 10;
                     this.animationLock = true;
                     if (this.uiHolder.hand.token2.y < 0)
                     {
                        this.uiHolder.hand.token2 = 0;
                     }
                     break;
                  case this.uiHolder.hand.token3.y > 0 && this.combatHand[3] != "0000":
                     this.uiHolder.hand.token3.y -= 10;
                     this.animationLock = true;
                     if (this.uiHolder.hand.token3.y < 0)
                     {
                        this.uiHolder.hand.token3 = 0;
                     }
                     break;
                  case this.uiHolder.hand.token4.y > 0 && this.combatHand[4] != "0000":
                     this.uiHolder.hand.token4.y -= 10;
                     this.animationLock = true;
                     if (this.uiHolder.hand.token4.y < 0)
                     {
                        this.uiHolder.hand.token4 = 0;
                     }
                     break;
                  case this.uiHolder.hand.token5.y > 0 && this.combatHand[5] != "0000":
                     this.uiHolder.hand.token5.y -= 10;
                     this.animationLock = true;
                     if (this.uiHolder.hand.token5.y < 0)
                     {
                        this.uiHolder.hand.token5 = 0;
                     }
                     break;
                  case this.uiHolder.hand.token0.y == 0 && this.combatHand[0] == "0000":
                     this.uiHolder.hand.token0.y = 100;
                     break;
                  case this.uiHolder.hand.token1.y == 0 && this.combatHand[1] == "0000":
                     this.uiHolder.hand.token1.y = 100;
                     break;
                  case this.uiHolder.hand.token2.y == 0 && this.combatHand[2] == "0000":
                     this.uiHolder.hand.token2.y = 100;
                     break;
                  case this.uiHolder.hand.token3.y == 0 && this.combatHand[3] == "0000":
                     this.uiHolder.hand.token3.y = 100;
                     break;
                  case this.uiHolder.hand.token4.y == 0 && this.combatHand[4] == "0000":
                     this.uiHolder.hand.token4.y = 100;
                     break;
                  case this.uiHolder.hand.token5.y == 0 && this.combatHand[5] == "0000":
                     this.uiHolder.hand.token5.y = 100;
               }
            }
         }
      }

      public function checkDepth():void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if (this.obHolder != null)
         {
            _loc1_ = new Array();
            _loc2_ = 0;
            while (_loc2_ < this.obHolder.numChildren)
            {
               _loc1_[_loc2_] = this.obHolder.getChildAt(_loc2_);
               _loc2_++;
            }
            _loc1_.sortOn("y", Array.NUMERIC);
            _loc3_ = int(_loc1_.length - 1);
            while (_loc3_ >= 0)
            {
               if (this.obHolder.getChildIndex(_loc1_[_loc3_]) != _loc3_)
               {
                  this.obHolder.setChildIndex(_loc1_[_loc3_], _loc3_);
               }
               _loc3_--;
            }
         }
      }

      public function checkObjects():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = 0;
         while (_loc2_ < this.objList.length)
         {
            if (!this.objList[_loc2_].dead)
            {
               this.objList[_loc2_].objTick();
               if (this.objList[_loc2_].animLock)
               {
                  _loc1_ += 1;
               }
            }
            _loc2_++;
         }
         if (_loc1_ > 0)
         {
            this.animationLock = true;
         }
         else
         {
            this.animationLock = false;
         }
      }

      public function checkDead():void
      {
         var _loc1_:int = 0;
         _loc1_ = int(this.objList.length - 1);
         while (_loc1_ > 1)
         {
            if (Boolean(this.objList[_loc1_].dead) && !this.objList[_loc1_].removed)
            {
               this.obHolder.removeChild(this.objList[_loc1_]);
               this.objList[_loc1_].removed = true;
            }
            _loc1_--;
         }
      }

      public function selectStart():void
      {
         var _loc1_:int = 0;
         _loc1_ = Math.floor(Math.random() * 2);
         if (_loc1_ == 1)
         {
            this.combatState = 3;
         }
         else
         {
            this.combatState = 3;
         }
      }

      public function drawNewCard():void
      {
         if (this.combatDeck.length > 0 && this.combatHand[5] == "0000")
         {
            this.drawCard();
            this.uiHolder.hand.populate();
            this.uiHolder.charBar.updateGUI();
         }
         this.combatState = 4;
      }

      public function drawCard():void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while (_loc1_ < 6)
         {
            if (this.combatHand[_loc1_] == "0000" && this.combatDeck.length > 0)
            {
               this.combatHand[_loc1_] = this.combatDeck[0];
               this.combatHand[_loc1_][3] = this.combatHand[_loc1_][0].concat();
               this.combatHand[_loc1_][3][1] += int(this.getWeapon(this.combatHand[_loc1_][1][0], this.combatHand[_loc1_][1][1], 1, 1, this.combatHand[_loc1_][0][10]));
               this.combatHand[_loc1_][3][2] += int(this.getWeapon(this.combatHand[_loc1_][1][0], this.combatHand[_loc1_][1][1], 2, 1, this.combatHand[_loc1_][0][10]));
               this.combatHand[_loc1_][3][3] += int(this.getWeapon(this.combatHand[_loc1_][1][0], this.combatHand[_loc1_][1][1], 3, 1, this.combatHand[_loc1_][0][10]));
               this.combatHand[_loc1_][3][4] += int(this.getWeapon(this.combatHand[_loc1_][1][0], this.combatHand[_loc1_][1][1], 4, 1, this.combatHand[_loc1_][0][10]));
               this.combatHand[_loc1_][3][5] += int(this.getWeapon(this.combatHand[_loc1_][1][0], this.combatHand[_loc1_][1][1], 5, 1, this.combatHand[_loc1_][0][10]));
               this.combatDeck.splice(0, 1);
               break;
            }
            _loc1_++;
         }
      }

      public function prepPlayer(param1:int):void
      {
         if (this.combatStats[2 + param1] < 10)
         {
            this.combatStats[1 + param1] += 2;
            this.combatStats[2 + param1] += 2;
         }
         if (param1 == 0 && this.combatStats[6] < 5 && this.combatStats[7] == 0)
         {
            this.combatStats[6] += 1;
         }
         if (param1 == 3 && this.combatStats[15] < 5)
         {
            this.combatStats[15] += 1;
         }
         if (param1 == 3 && this.combatStats[7] > 0)
         {
            this.combatStats[7] = this.combatStats[7] - 1;
            if (this.combatStats[7] == 0)
            {
               this.combatGrid.sfx.gotoAndStop(1);
            }
         }
         if (param1 == 3)
         {
            this.summoning = true;
            this.swapping = true;
         }
         this.uiHolder.charBar.updateGUI();
         this.uiHolder.enemyBar.updateGUI();
         this.uiHolder.btnAction.gotoAndStop(2);
         this.combatState += 1;
      }

      public function charTurn():void
      {
         this.checkSpecial();
      }

      public function beezSpec():void
      {
         var _loc1_:int = 0;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:MovieClip = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         _loc1_ = 0;
         _loc2_ = new Array();
         _loc3_ = 0;
         _loc4_ = 0;
         _loc5_ = new Array();
         _loc6_ = 0;
         _loc8_ = 0;
         for (; _loc8_ < 21; _loc8_++)
         {
            if (this.combatArray[_loc8_] == "0000")
            {
               continue;
            }
            switch (true)
            {
               case this.combatArray[_loc8_][6][1] == 1:
                  _loc3_++;
                  _loc5_.push(_loc8_);
                  break;
               case this.combatArray[_loc8_][6][1] == -1:
                  _loc1_++;
                  _loc2_.push(_loc8_);
                  break;
            }
         }
         switch (true)
         {
            case _loc3_ > _loc1_:
               _loc6_ = _loc1_;
               break;
            case _loc3_ < _loc1_:
               _loc6_ = _loc3_;
               break;
            case _loc3_ == _loc1_:
               _loc6_ = _loc1_;
         }
         _loc9_ = 0;
         while (_loc9_ < _loc6_)
         {
            _loc7_ = this.objList[this.combatArray[_loc2_[_loc9_]][6][0]];
            this.combatArray[_loc2_[_loc9_]][3][2] = 0;
            _loc7_.updateStats(this.combatArray[_loc2_[_loc9_]]);
            this.killUnit(_loc2_[_loc9_], 0, 0);
            _loc7_.cfx.gotoAndStop(12);
            _loc7_ = this.objList[this.combatArray[_loc5_[_loc9_]][6][0]];
            this.combatArray[_loc5_[_loc9_]][3][2] = 0;
            _loc4_ += Math.floor(Math.random() * this.combatArray[_loc5_[_loc9_]][3][1]) + 1;
            _loc7_.updateStats(this.combatArray[_loc5_[_loc9_]]);
            this.killUnit(_loc5_[_loc9_], 0, 0);
            _loc7_.cfx.gotoAndStop(12);
            _loc9_++;
         }
         if (_loc3_ > _loc6_)
         {
            _loc10_ = 0;
            while (_loc10_ < _loc6_)
            {
               _loc5_.splice(0, 1);
               _loc10_++;
            }
            this.combatArray[_loc5_[0]][4][4] += _loc4_;
            this.combatArray[_loc5_[0]][5][4] += 3;
            _loc7_ = this.objList[this.combatArray[_loc5_[0]][6][0]];
            _loc7_.updateStats(this.combatArray[_loc5_[0]]);
            _loc7_.cfx.gotoAndStop(6);
         }
         this.mouseLock = false;
      }

      public function unreality():void
      {
         this.mouseLock = false;
      }

      public function naniteCloud():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(9);
                  this.combatArray[_loc1_][4][3] = 1;
                  this.combatArray[_loc1_][5][3] = 99;
               }
               else if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc2_.stageClip.gotoAndStop(6);
                  _loc2_.cfx.gotoAndStop(3);
                  this.combatArray[_loc1_][4][2] = 1;
                  this.combatArray[_loc1_][5][2] = 99;
               }
               _loc2_.updateStats(this.combatArray[_loc1_]);
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function terrorShout():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(10);
                  this.combatArray[_loc1_][4][5] = 50;
                  this.combatArray[_loc1_][5][5] = 50;
               }
               _loc2_.updateStats(this.combatArray[_loc1_]);
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function dreadPlasma():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(6);
                  this.combatArray[_loc1_][4][4] = 4;
                  this.combatArray[_loc1_][5][4] = 99;
               }
               else if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_.stageClip.gotoAndStop(6);
                  _loc2_.cfx.gotoAndStop(7);
                  this.combatArray[_loc1_][4][5] = 4;
                  this.combatArray[_loc1_][5][5] = 99;
               }
               _loc2_.updateStats(this.combatArray[_loc1_]);
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function toxicSpray():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(3);
                  this.combatArray[_loc1_][4][0] = 3;
                  this.combatArray[_loc1_][5][0] = 4;
                  this.combatArray[_loc1_][4][2] = 3;
                  this.combatArray[_loc1_][5][2] = 4;
                  this.combatArray[_loc1_][4][4] = 3;
                  this.combatArray[_loc1_][5][4] = 4;
                  this.combatArray[_loc1_][4][6] = 3;
                  this.combatArray[_loc1_][5][6] = 4;
               }
               else if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_.stageClip.gotoAndStop(6);
                  _loc2_.cfx.gotoAndStop(9);
                  this.combatArray[_loc1_][4][1] = 3;
                  this.combatArray[_loc1_][5][1] = 4;
                  this.combatArray[_loc1_][4][3] = 3;
                  this.combatArray[_loc1_][5][3] = 4;
                  this.combatArray[_loc1_][4][5] = 3;
                  this.combatArray[_loc1_][5][5] = 4;
                  this.combatArray[_loc1_][4][7] = 3;
                  this.combatArray[_loc1_][5][7] = 4;
               }
               _loc2_.updateStats(this.combatArray[_loc1_]);
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function barrier():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_.stageClip.gotoAndStop(6);
                  _loc2_.cfx.gotoAndStop(3);
                  this.combatArray[_loc1_][4][0] = 2;
                  this.combatArray[_loc1_][5][0] = 6;
                  this.combatArray[_loc1_][4][2] = 4;
                  this.combatArray[_loc1_][5][2] = 6;
               }
               _loc2_.updateStats(this.combatArray[_loc1_]);
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function overDrive():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc2_.stageClip.gotoAndStop(6);
                  _loc2_.cfx.gotoAndStop(6);
                  this.combatArray[_loc1_][4][5] = 0;
                  this.combatArray[_loc1_][5][5] = 0;
                  this.combatArray[_loc1_][0][2] = 99;
                  this.combatArray[_loc1_][3][2] = 99;
                  this.combatArray[_loc1_][3][1] = 99;
               }
               _loc2_.updateStats(this.combatArray[_loc1_]);
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function pecSpec():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(7);
                  this.combatArray[_loc1_][4][5] = 999;
                  this.combatArray[_loc1_][5][5] = 99;
               }
               _loc2_.updateStats(this.combatArray[_loc1_]);
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function evaSpec(param1:int):void
      {
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         this.combatGrid.sfx.gotoAndStop(2);
         _loc2_ = 0;
         while (_loc2_ < 21)
         {
            if (this.combatArray[_loc2_] != "0000")
            {
               _loc3_ = this.objList[this.combatArray[_loc2_][6][0]];
               switch (true)
               {
                  case param1 == 1 && this.combatArray[_loc2_][6][1] == -1:
                     _loc3_.stageClip.gotoAndStop(5);
                     this.combatArray[_loc2_][4][10] = true;
                     this.combatArray[_loc2_][5][10] = 2;
                     break;
                  case param1 == 2 && this.combatArray[_loc2_][6][1] == -1:
                     _loc3_.stageClip.gotoAndStop(5);
                     _loc3_.cfx.gotoAndStop(10);
                     this.combatArray[_loc2_][4][1] = 2;
                     this.combatArray[_loc2_][5][1] = 2;
                     break;
                  case param1 == 3 && this.combatArray[_loc2_][6][1] == -1:
                     _loc3_.stageClip.gotoAndStop(5);
                     _loc3_.cfx.gotoAndStop(9);
                     this.combatArray[_loc2_][4][3] = 2;
                     this.combatArray[_loc2_][5][3] = 2;
                     break;
                  case param1 == 4 && this.combatArray[_loc2_][6][1] == 1:
                     _loc3_.stageClip.gotoAndStop(6);
                     _loc3_.cfx.gotoAndStop(3);
                     this.combatArray[_loc2_][4][2] = 4;
                     this.combatArray[_loc2_][5][2] = 2;
                     break;
                  case param1 == 5 && this.combatArray[_loc2_][6][1] == 1:
                     _loc3_.stageClip.gotoAndStop(6);
                     _loc3_.cfx.gotoAndStop(8);
                     this.combatArray[_loc2_][4][0] = 4;
                     this.combatArray[_loc2_][5][0] = 2;
               }
               _loc3_.updateStats(this.combatArray[_loc2_]);
            }
            _loc2_++;
         }
         this.mouseLock = false;
      }

      public function ioshaProc():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(9);
                  this.combatArray[_loc1_][4][3] = 9999;
                  this.combatArray[_loc1_][5][3] = 1;
               }
               _loc2_.updateStats(this.combatArray[_loc1_]);
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function brigSpec():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(2);
                  this.combatArray[_loc1_][3][2] -= 4;
                  if (this.combatArray[_loc1_][3][2] <= 0)
                  {
                     this.combatArray[_loc1_][3][2] = 0;
                     _loc2_.updateStats(this.combatArray[_loc1_]);
                     this.killUnit(_loc1_, 0, 0);
                  }
                  else
                  {
                     _loc2_.updateStats(this.combatArray[_loc1_]);
                  }
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function healingWaveProc():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
                  _loc2_.stageClip.gotoAndStop(6);
                  _loc2_.cfx.gotoAndStop(3);
                  this.combatArray[_loc1_][3][2] = _loc2_.mHealth;
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function drainBlood():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         _loc1_ = 0;
         _loc2_ = 0;
         while (_loc2_ < 21)
         {
            if (this.combatArray[_loc2_] != "0000")
            {
               _loc3_ = this.objList[this.combatArray[_loc2_][6][0]];
               if (this.combatArray[_loc2_][6][1] == 1)
               {
                  _loc3_.stageClip.gotoAndStop(5);
                  _loc3_.cfx.gotoAndStop(11);
                  this.directDamage(_loc2_, 4);
                  _loc1_++;
               }
               if (this.combatArray[_loc2_] != "0000")
               {
                  _loc3_.updateStats(this.combatArray[_loc2_]);
               }
               this.combatStats[3] += _loc1_ * 2;
               if (this.combatStats[3] > this.combatStats[11])
               {
                  this.combatStats[3] = this.combatStats[11];
               }
            }
            _loc2_++;
         }
         this.mouseLock = false;
      }

      public function judgementProc():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(2);
                  this.combatArray[_loc1_][3][2] -= 3;
                  if (this.combatArray[_loc1_][3][2] <= 0)
                  {
                     this.combatArray[_loc1_][3][2] = 0;
                     _loc2_.updateStats(this.combatArray[_loc1_]);
                     this.killUnit(_loc1_, 0, 0);
                  }
                  else
                  {
                     _loc2_.updateStats(this.combatArray[_loc1_]);
                  }
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function thunder():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(2);
                  this.combatArray[_loc1_][4][1] = 2;
                  this.combatArray[_loc1_][5][1] = 6;
                  this.directDamage(_loc1_, 2);
               }
               if (this.combatArray[_loc1_] != "0000")
               {
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function vanoSpec():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               _loc2_.stageClip.gotoAndStop(5);
               _loc2_.cfx.gotoAndStop(13);
               this.combatArray[_loc1_][3][2] -= 9999;
               if (this.combatArray[_loc1_][3][2] <= 0)
               {
                  this.combatArray[_loc1_][3][2] = 0;
                  _loc2_.updateStats(this.combatArray[_loc1_]);
                  this.killUnit(_loc1_, 0, 0);
               }
               else
               {
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function vinaSpec():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               _loc2_.stageClip.gotoAndStop(6);
               _loc2_.cfx.gotoAndStop(6);
               this.combatArray[_loc1_][3][2] = 1;
               this.combatArray[_loc1_][0][2] = 1;
               this.combatArray[_loc1_][4][10] = true;
               this.combatArray[_loc1_][5][10] = 99;
               _loc2_.updateStats(this.combatArray[_loc1_]);
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function bloodletter():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc2_.stageClip.gotoAndStop(6);
                  _loc2_.cfx.gotoAndStop(6);
                  this.combatArray[_loc1_][4][4] = 2;
                  this.combatArray[_loc1_][5][4] = 4;
               }
               else if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(7);
                  this.combatArray[_loc1_][4][1] = 2;
                  this.combatArray[_loc1_][5][1] = 4;
                  this.combatArray[_loc1_][4][5] = 2;
                  this.combatArray[_loc1_][5][5] = 4;
               }
               _loc2_.updateStats(this.combatArray[_loc1_]);
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function milkyWave():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(13);
                  this.combatArray[_loc1_][4][3] = 2;
                  this.combatArray[_loc1_][5][3] = 6;
                  this.directDamage(_loc1_, 3);
               }
               else if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_.stageClip.gotoAndStop(6);
                  _loc2_.cfx.gotoAndStop(13);
                  this.combatArray[_loc1_][4][2] = 2;
                  this.combatArray[_loc1_][5][2] = 6;
                  this.directHeal(_loc1_, 6);
               }
               if (this.combatArray[_loc1_] != "0000")
               {
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function milkyWaveE():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(13);
                  this.combatArray[_loc1_][4][3] = 2;
                  this.combatArray[_loc1_][5][3] = 6;
                  this.directDamage(_loc1_, 3);
               }
               else if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc2_.stageClip.gotoAndStop(6);
                  _loc2_.cfx.gotoAndStop(13);
                  this.combatArray[_loc1_][4][2] = 2;
                  this.combatArray[_loc1_][5][2] = 6;
                  this.directHeal(_loc1_, 6);
               }
               if (this.combatArray[_loc1_] != "0000")
               {
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function crystalBarrier():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
                  _loc2_.stageClip.gotoAndStop(6);
                  this.combatArray[_loc1_][4][0] = 99;
                  this.combatArray[_loc1_][5][0] = 1;
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function crystalBarrierP():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         this.combatGrid.sfx.gotoAndStop(2);
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_.stageClip.gotoAndStop(6);
                  this.combatArray[_loc1_][4][0] = 99;
                  this.combatArray[_loc1_][5][0] = 2;
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
               else if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc2_.cfx.gotoAndStop(7);
                  _loc2_.stageClip.gotoAndStop(5);
                  this.combatArray[_loc1_][4][1] = 2;
                  this.combatArray[_loc1_][5][1] = 2;
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function crystalBoost():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
                  _loc2_.stageClip.gotoAndStop(6);
                  _loc2_.cfx.gotoAndStop(6);
                  this.combatArray[_loc1_][4][4] = 3;
                  this.combatArray[_loc1_][5][4] = 3;
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function jurrProc():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(13);
                  this.combatArray[_loc1_][4][3] = 2;
                  this.combatArray[_loc1_][5][3] = 6;
                  this.combatArray[_loc1_][4][5] = 4;
                  this.combatArray[_loc1_][5][5] = 6;
                  this.combatArray[_loc1_][4][10] = true;
                  this.combatArray[_loc1_][5][10] = 6;
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function badFish():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(13);
                  this.combatArray[_loc1_][4][3] = 2;
                  this.combatArray[_loc1_][5][3] = 6;
                  this.combatArray[_loc1_][4][5] = 4;
                  this.combatArray[_loc1_][5][5] = 6;
                  this.combatArray[_loc1_][4][10] = true;
                  this.combatArray[_loc1_][5][10] = 6;
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function acidSpray():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(10);
                  this.combatArray[_loc1_][4][1] = 2;
                  this.combatArray[_loc1_][5][1] = 6;
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function voodoo():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = int(this.combatArray[_loc1_][3][1]);
               _loc3_ = int(this.combatArray[_loc1_][3][2]);
               if (_loc3_ == 0)
               {
                  _loc3_ = 1;
               }
               _loc4_ = this.objList[this.combatArray[_loc1_][6][0]];
               _loc4_.stageClip.gotoAndStop(6);
               _loc4_.cfx.gotoAndStop(13);
               this.combatArray[_loc1_][3][1] = _loc3_;
               this.combatArray[_loc1_][3][2] = _loc2_;
               _loc4_.updateStats(this.combatArray[_loc1_]);
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function lullaby():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(13);
                  this.combatArray[_loc1_][4][11] = true;
                  this.combatArray[_loc1_][5][11] = 2;
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function howling():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         var _loc3_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(13);
                  this.combatArray[_loc1_][4][11] = true;
                  this.combatArray[_loc1_][5][11] = 2;
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
               else if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc3_ = this.objList[this.combatArray[_loc1_][6][0]];
                  _loc3_.stageClip.gotoAndStop(6);
                  _loc3_.cfx.gotoAndStop(6);
                  this.combatArray[_loc1_][4][4] = 4;
                  this.combatArray[_loc1_][5][4] = 2;
                  _loc3_.updateStats(this.combatArray[_loc1_]);
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function daydream():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         var _loc3_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(13);
                  this.combatArray[_loc1_][4][11] = true;
                  this.combatArray[_loc1_][5][11] = 2;
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
               else if (this.combatArray[_loc1_][6][1] == -1)
               {
                  _loc3_ = this.objList[this.combatArray[_loc1_][6][0]];
                  _loc3_.stageClip.gotoAndStop(6);
                  _loc3_.cfx.gotoAndStop(3);
                  this.combatArray[_loc1_][4][2] = 4;
                  this.combatArray[_loc1_][5][2] = 2;
                  _loc3_.updateStats(this.combatArray[_loc1_]);
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function nightmare():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               if (this.combatArray[_loc1_][6][1] == 1)
               {
                  _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
                  _loc2_.stageClip.gotoAndStop(5);
                  _loc2_.cfx.gotoAndStop(13);
                  this.combatArray[_loc1_][4][11] = true;
                  this.combatArray[_loc1_][5][11] = 2;
                  this.combatArray[_loc1_][4][1] = 4;
                  this.combatArray[_loc1_][5][1] = 2;
                  _loc2_.updateStats(this.combatArray[_loc1_]);
               }
            }
            _loc1_++;
         }
         this.mouseLock = false;
      }

      public function prepUnits(param1:int):void
      {
         var _loc2_:int = 0;
         if (param1 == 1)
         {
            this.uiHolder.btnAction.gotoAndStop(1);
         }
         _loc2_ = 0;
         while (_loc2_ < 21)
         {
            if (this.combatArray[_loc2_] != "0000" && this.combatArray[_loc2_][6][1] == param1)
            {
               this.combatArray[_loc2_][6][4] = this.combatArray[_loc2_][3][4];
               if (this.combatArray[_loc2_][1][0] == 3)
               {
                  this.combatArray[_loc2_][6][5] = 2;
               }
               else
               {
                  this.combatArray[_loc2_][6][5] = 1;
               }
               if (this.combatArray[_loc2_][4][11])
               {
                  this.combatArray[_loc2_][6][5] = 0;
                  this.combatArray[_loc2_][6][4] = 0;
               }
               if (this.combatArray[_loc2_][4][2] != 0)
               {
                  this.combatArray[_loc2_][6][2] = true;
               }
               if (this.combatArray[_loc2_][4][3] != 0)
               {
                  this.combatArray[_loc2_][6][3] = true;
               }
               if (this.combatArray[_loc2_][1][0] == 5 && this.combatArray[_loc2_][0][7] == 9)
               {
                  this.combatArray[_loc2_][6][11] = true;
               }
               this.combatArray[_loc2_][6][6] = false;
               this.combatArray[_loc2_][6][7] = false;
               this.combatArray[_loc2_][6][8] = false;
               this.combatArray[_loc2_][6][9] = false;
               this.combatArray[_loc2_][6][10] = false;
            }
            _loc2_++;
         }
         if (this.combatState == 6)
         {
            this.combatState = 7;
         }
         else
         {
            this.combatState = 11;
         }
      }

      public function charActive():void
      {
         switch (true)
         {
            case this.combatArray[20] != "0000" && this.combatArray[20][6][1] == 1 && !this.combatArray[20][6][6]:
               this.activatePlayer(20);
               break;
            case this.combatArray[13] != "0000" && this.combatArray[13][6][1] == 1 && !this.combatArray[13][6][6]:
               this.activatePlayer(13);
               break;
            case this.combatArray[6] != "0000" && this.combatArray[6][6][1] == 1 && !this.combatArray[6][6][6]:
               this.activatePlayer(6);
               break;
            case this.combatArray[19] != "0000" && this.combatArray[19][6][1] == 1 && !this.combatArray[19][6][6]:
               this.activatePlayer(19);
               break;
            case this.combatArray[12] != "0000" && this.combatArray[12][6][1] == 1 && !this.combatArray[12][6][6]:
               this.activatePlayer(12);
               break;
            case this.combatArray[5] != "0000" && this.combatArray[5][6][1] == 1 && !this.combatArray[5][6][6]:
               this.activatePlayer(5);
               break;
            case this.combatArray[18] != "0000" && this.combatArray[18][6][1] == 1 && !this.combatArray[18][6][6]:
               this.activatePlayer(18);
               break;
            case this.combatArray[11] != "0000" && this.combatArray[11][6][1] == 1 && !this.combatArray[11][6][6]:
               this.activatePlayer(11);
               break;
            case this.combatArray[4] != "0000" && this.combatArray[4][6][1] == 1 && !this.combatArray[4][6][6]:
               this.activatePlayer(4);
               break;
            case this.combatArray[17] != "0000" && this.combatArray[17][6][1] == 1 && !this.combatArray[17][6][6]:
               this.activatePlayer(17);
               break;
            case this.combatArray[10] != "0000" && this.combatArray[10][6][1] == 1 && !this.combatArray[10][6][6]:
               this.activatePlayer(10);
               break;
            case this.combatArray[3] != "0000" && this.combatArray[3][6][1] == 1 && !this.combatArray[3][6][6]:
               this.activatePlayer(3);
               break;
            case this.combatArray[16] != "0000" && this.combatArray[16][6][1] == 1 && !this.combatArray[16][6][6]:
               this.activatePlayer(16);
               break;
            case this.combatArray[9] != "0000" && this.combatArray[9][6][1] == 1 && !this.combatArray[9][6][6]:
               this.activatePlayer(9);
               break;
            case this.combatArray[2] != "0000" && this.combatArray[2][6][1] == 1 && !this.combatArray[2][6][6]:
               this.activatePlayer(2);
               break;
            case this.combatArray[15] != "0000" && this.combatArray[15][6][1] == 1 && !this.combatArray[15][6][6]:
               this.activatePlayer(15);
               break;
            case this.combatArray[8] != "0000" && this.combatArray[8][6][1] == 1 && !this.combatArray[8][6][6]:
               this.activatePlayer(8);
               break;
            case this.combatArray[1] != "0000" && this.combatArray[1][6][1] == 1 && !this.combatArray[1][6][6]:
               this.activatePlayer(1);
               break;
            case this.combatArray[14] != "0000" && this.combatArray[14][6][1] == 1 && !this.combatArray[14][6][6]:
               this.activatePlayer(14);
               break;
            case this.combatArray[7] != "0000" && this.combatArray[7][6][1] == 1 && !this.combatArray[7][6][6]:
               this.activatePlayer(7);
               break;
            case this.combatArray[0] != "0000" && this.combatArray[0][6][1] == 1 && !this.combatArray[0][6][6]:
               this.activatePlayer(0);
               break;
            default:
               this.checkDurs(1);
               this.combatState = 8;
         }
      }

      public function checkDurs(param1:int):*
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         while (_loc2_ < 21)
         {
            if (this.combatArray[_loc2_] != "0000" && this.combatArray[_loc2_][6][1] == param1)
            {
               switch (true)
               {
                  case this.combatArray[_loc2_][5][2] > 0:
                     this.combatArray[_loc2_][5][2] = this.combatArray[_loc2_][5][2] - 1;
                  case this.combatArray[_loc2_][5][4] > 0:
                     this.combatArray[_loc2_][5][4] = this.combatArray[_loc2_][5][4] - 1;
                  case this.combatArray[_loc2_][5][6] > 0:
                     this.combatArray[_loc2_][5][6] = this.combatArray[_loc2_][5][6] - 1;
                  case this.combatArray[_loc2_][5][8] > 0:
                     this.combatArray[_loc2_][5][8] = this.combatArray[_loc2_][5][8] - 1;
                  case this.combatArray[_loc2_][5][3] > 0:
                     this.combatArray[_loc2_][5][3] = this.combatArray[_loc2_][5][3] - 1;
                  case this.combatArray[_loc2_][5][5] > 0:
                     this.combatArray[_loc2_][5][5] = this.combatArray[_loc2_][5][5] - 1;
                  case this.combatArray[_loc2_][5][7] > 0:
                     this.combatArray[_loc2_][5][7] = this.combatArray[_loc2_][5][7] - 1;
                  case this.combatArray[_loc2_][5][9] > 0:
                     this.combatArray[_loc2_][5][9] = this.combatArray[_loc2_][5][9] - 1;
                  case this.combatArray[_loc2_][5][10] > 0:
                     this.combatArray[_loc2_][5][10] = this.combatArray[_loc2_][5][10] - 1;
                  case this.combatArray[_loc2_][5][11] > 0:
                     this.combatArray[_loc2_][5][11] = this.combatArray[_loc2_][5][11] - 1;
               }
            }
            if (this.combatArray[_loc2_] != "0000" && this.combatArray[_loc2_][6][1] == param1 * -1)
            {
               switch (true)
               {
                  case this.combatArray[_loc2_][5][0] > 0:
                     this.combatArray[_loc2_][5][0] = this.combatArray[_loc2_][5][0] - 1;
                  case this.combatArray[_loc2_][5][1] > 0:
                     this.combatArray[_loc2_][5][1] = this.combatArray[_loc2_][5][1] - 1;
               }
            }
            if (this.combatArray[_loc2_] != "0000")
            {
               _loc3_ = 0;
               while (_loc3_ < 12)
               {
                  if (this.combatArray[_loc2_][5][_loc3_] == 0)
                  {
                     if (_loc3_ == 10)
                     {
                        this.combatArray[_loc2_][4][10] = false;
                     }
                     else if (_loc3_ == 11)
                     {
                        this.combatArray[_loc2_][4][11] = false;
                     }
                     else
                     {
                        this.combatArray[_loc2_][4][_loc3_] = 0;
                     }
                  }
                  _loc3_++;
               }
               this.objList[this.combatArray[_loc2_][6][0]].updateStats(this.combatArray[_loc2_]);
            }
            _loc2_++;
         }
      }

      public function activatePlayer(param1:int):void
      {
         switch (true)
         {
            case this.combatArray[param1][6][5] > 0 && this.combatArray[param1][3][5] >= 1 && this.combatArray[param1 + 1] != "0000" && this.combatArray[param1 + 1][6][1] == -1:
               this.unitAttack(param1, param1 + 1);
               break;
            case this.combatArray[param1][6][5] > 0 && this.combatArray[param1][3][5] >= 2 && this.combatArray[param1 + 2] != "0000" && this.combatArray[param1 + 2][6][1] == -1:
               this.unitAttack(param1, param1 + 2);
               break;
            case this.combatArray[param1][6][5] > 0 && this.combatArray[param1][3][5] >= 3 && this.combatArray[param1 + 3] != "0000" && this.combatArray[param1 + 3][6][1] == -1:
               this.unitAttack(param1, param1 + 3);
               break;
            case this.combatArray[param1][6][5] > 0 && this.combatArray[param1][3][5] == 1 && (param1 + 1 == 6 || param1 + 1 == 13 || param1 + 1 == 20):
               this.unitStrike(param1, -1);
               break;
            case this.combatArray[param1][6][5] > 0 && this.combatArray[param1][3][5] == 2 && (param1 + 2 == 6 || param1 + 2 == 13 || param1 + 2 == 20):
               this.unitStrike(param1, -1);
               break;
            case this.combatArray[param1][6][5] > 0 && this.combatArray[param1][3][5] == 3 && (param1 + 3 == 6 || param1 + 3 == 13 || param1 + 3 == 20):
               this.unitStrike(param1, -1);
               break;
            case this.combatArray[param1][3][5] >= 3 && (param1 == 3 || param1 == 10 || param1 == 17) && this.combatArray[param1][6][4] > 0:
               this.combatArray[param1][6][4] = 0;
               break;
            case this.combatArray[param1][3][5] >= 2 && (param1 == 4 || param1 == 11 || param1 == 18) && this.combatArray[param1][6][4] > 0:
               this.combatArray[param1][6][4] = 0;
               break;
            case this.combatArray[param1][3][5] >= 1 && (param1 == 5 || param1 == 12 || param1 == 19) && this.combatArray[param1][6][4] > 0:
               this.combatArray[param1][6][4] = 0;
               break;
            case this.combatArray[param1][6][4] > 0 && (param1 == 5 || param1 == 12 || param1 == 19):
               this.combatArray[param1][6][4] = 0;
               break;
            case this.combatArray[param1][6][4] > 0 && this.combatArray[param1 + 1] == "0000":
               this.unitMove(param1, param1 + 1, 1);
               break;
            case this.combatArray[param1][6][4] > 1 && (param1 == 4 || param1 == 11 || param1 == 18):
               this.combatArray[param1][6][4] = 1;
               break;
            case this.combatArray[param1][6][4] > 1 && this.combatArray[param1 + 2] == "0000" && this.combatArray[param1 + 1][6][1] == 1:
               this.unitMove(param1, param1 + 2, 2);
               break;
            case this.combatArray[param1][6][4] > 2 && (param1 == 3 || param1 == 10 || param1 == 17):
               this.combatArray[param1][6][4] = 2;
               break;
            case this.combatArray[param1][6][4] > 2 && this.combatArray[param1 + 3] == "0000" && this.combatArray[param1 + 1][6][1] == 1 && this.combatArray[param1 + 2][6][1] == 1:
               this.unitMove(param1, param1 + 2, 3);
               break;
            case this.combatArray[param1][1][0] == 2 && !this.combatArray[param1][6][7] && !this.combatArray[param1][4][11]:
               this.rageProc(param1);
               break;
            case this.combatArray[param1][1][0] == 4 && !this.combatArray[param1][6][8] && !this.combatArray[param1][4][11]:
               this.mendProc(param1, 1);
               break;
            case this.combatArray[param1][6][2]:
               this.regenProc(param1);
               break;
            case this.combatArray[param1][6][3]:
               this.poisonProc(param1);
               break;
            case this.combatArray[param1][6][11]:
               this.sleepProc(param1);
               break;
            default:
               this.objList[this.combatArray[param1][6][0]].stageClip.gotoAndStop(2);
               this.combatArray[param1][6][6] = true;
         }
      }

      public function enemyTurn():void
      {
         this.analyzeBoard();
         this.uiHolder.btnAction.gotoAndStop(3);
      }

      public function enemyActive():void
      {
         if (!this.swapTool[0])
         {
            switch (true)
            {
               case this.combatArray[14] != "0000" && this.combatArray[14][6][1] == -1 && !this.combatArray[14][6][6]:
                  this.activateEnemy(14);
                  break;
               case this.combatArray[7] != "0000" && this.combatArray[7][6][1] == -1 && !this.combatArray[7][6][6]:
                  this.activateEnemy(7);
                  break;
               case this.combatArray[0] != "0000" && this.combatArray[0][6][1] == -1 && !this.combatArray[0][6][6]:
                  this.activateEnemy(0);
                  break;
               case this.combatArray[15] != "0000" && this.combatArray[15][6][1] == -1 && !this.combatArray[15][6][6]:
                  this.activateEnemy(15);
                  break;
               case this.combatArray[8] != "0000" && this.combatArray[8][6][1] == -1 && !this.combatArray[8][6][6]:
                  this.activateEnemy(8);
                  break;
               case this.combatArray[1] != "0000" && this.combatArray[1][6][1] == -1 && !this.combatArray[1][6][6]:
                  this.activateEnemy(1);
                  break;
               case this.combatArray[16] != "0000" && this.combatArray[16][6][1] == -1 && !this.combatArray[16][6][6]:
                  this.activateEnemy(16);
                  break;
               case this.combatArray[9] != "0000" && this.combatArray[9][6][1] == -1 && !this.combatArray[9][6][6]:
                  this.activateEnemy(9);
                  break;
               case this.combatArray[2] != "0000" && this.combatArray[2][6][1] == -1 && !this.combatArray[2][6][6]:
                  this.activateEnemy(2);
                  break;
               case this.combatArray[17] != "0000" && this.combatArray[17][6][1] == -1 && !this.combatArray[17][6][6]:
                  this.activateEnemy(17);
                  break;
               case this.combatArray[10] != "0000" && this.combatArray[10][6][1] == -1 && !this.combatArray[10][6][6]:
                  this.activateEnemy(10);
                  break;
               case this.combatArray[3] != "0000" && this.combatArray[3][6][1] == -1 && !this.combatArray[3][6][6]:
                  this.activateEnemy(3);
                  break;
               case this.combatArray[18] != "0000" && this.combatArray[18][6][1] == -1 && !this.combatArray[18][6][6]:
                  this.activateEnemy(18);
                  break;
               case this.combatArray[11] != "0000" && this.combatArray[11][6][1] == -1 && !this.combatArray[11][6][6]:
                  this.activateEnemy(11);
                  break;
               case this.combatArray[4] != "0000" && this.combatArray[4][6][1] == -1 && !this.combatArray[4][6][6]:
                  this.activateEnemy(4);
                  break;
               case this.combatArray[19] != "0000" && this.combatArray[19][6][1] == -1 && !this.combatArray[19][6][6]:
                  this.activateEnemy(19);
                  break;
               case this.combatArray[12] != "0000" && this.combatArray[12][6][1] == -1 && !this.combatArray[12][6][6]:
                  this.activateEnemy(12);
                  break;
               case this.combatArray[5] != "0000" && this.combatArray[5][6][1] == -1 && !this.combatArray[5][6][6]:
                  this.activateEnemy(5);
                  break;
               case this.combatArray[20] != "0000" && this.combatArray[20][6][1] == -1 && !this.combatArray[20][6][6]:
                  this.activateEnemy(20);
                  break;
               case this.combatArray[13] != "0000" && this.combatArray[13][6][1] == -1 && !this.combatArray[13][6][6]:
                  this.activateEnemy(13);
                  break;
               case this.combatArray[6] != "0000" && this.combatArray[6][6][1] == -1 && !this.combatArray[6][6][6]:
                  this.activateEnemy(6);
                  break;
               default:
                  this.checkDurs(-1);
                  this.combatState = 3;
            }
         }
      }

      public function activateEnemy(param1:int):void
      {
         this.objList[this.combatArray[param1][6][0]].mySlot = param1;
         switch (true)
         {
            case this.combatArray[param1][6][5] > 0 && this.combatArray[param1][3][5] >= 1 && this.combatArray[param1 - 1] != "0000" && this.combatArray[param1 - 1][6][1] == 1:
               this.unitAttack(param1, param1 - 1);
               break;
            case this.combatArray[param1][6][5] > 0 && this.combatArray[param1][3][5] >= 2 && this.combatArray[param1 - 2] != "0000" && this.combatArray[param1 - 2][6][1] == 1:
               this.unitAttack(param1, param1 - 2);
               break;
            case this.combatArray[param1][6][5] > 0 && this.combatArray[param1][3][5] >= 3 && this.combatArray[param1 - 3] != "0000" && this.combatArray[param1 - 3][6][1] == 1:
               this.unitAttack(param1, param1 - 3);
               break;
            case this.combatArray[param1][6][5] > 0 && this.combatArray[param1][3][5] == 1 && (param1 - 1 == 0 || param1 - 1 == 7 || param1 - 1 == 14):
               if (this.combatLevel != 100)
               {
                  this.unitStrike(param1, 1);
                  break;
               }
               this.respawnClone(param1);
               break;
            case this.combatArray[param1][6][5] > 0 && this.combatArray[param1][3][5] == 2 && (param1 - 2 == 0 || param1 - 2 == 7 || param1 - 2 == 14):
               if (this.combatLevel != 100)
               {
                  this.unitStrike(param1, 1);
                  break;
               }
               this.respawnClone(param1);
               break;
            case this.combatArray[param1][6][5] > 0 && this.combatArray[param1][3][5] == 3 && (param1 - 3 == 0 || param1 - 3 == 7 || param1 - 3 == 14):
               if (this.combatLevel != 100)
               {
                  this.unitStrike(param1, 1);
                  break;
               }
               this.respawnClone(param1);
               break;
            case this.combatArray[param1][3][5] >= 3 && (param1 == 3 || param1 == 10 || param1 == 17) && this.combatArray[param1][6][4] > 0:
               this.combatArray[param1][6][4] = 0;
               break;
            case this.combatArray[param1][3][5] >= 2 && (param1 == 2 || param1 == 9 || param1 == 16) && this.combatArray[param1][6][4] > 0:
               this.combatArray[param1][6][4] = 0;
               break;
            case this.combatArray[param1][3][5] >= 1 && (param1 == 1 || param1 == 8 || param1 == 15) && this.combatArray[param1][6][4] > 0:
               this.combatArray[param1][6][4] = 0;
               break;
            case this.combatArray[param1][6][4] > 0 && (param1 == 1 || param1 == 8 || param1 == 15):
               this.combatArray[param1][6][4] = 0;
               break;
            case this.combatArray[param1][6][4] > 0 && this.combatArray[param1 - 1] == "0000":
               this.unitMove(param1, param1 - 1, 1);
               break;
            case this.combatArray[param1][6][4] > 1 && (param1 == 2 || param1 == 9 || param1 == 16):
               this.combatArray[param1][6][4] = 1;
               break;
            case this.combatArray[param1][6][4] > 1 && this.combatArray[param1 - 2] == "0000" && this.combatArray[param1 - 1][6][1] == -1:
               this.unitMove(param1, param1 - 2, 2);
               break;
            case this.combatArray[param1][6][4] > 2 && (param1 == 3 || param1 == 10 || param1 == 17):
               this.combatArray[param1][6][4] = 2;
               break;
            case this.combatArray[param1][6][4] > 2 && this.combatArray[param1 - 3] == "0000" && this.combatArray[param1 - 1][6][1] == -1 && this.combatArray[param1 - 2][6][1] == -1:
               this.unitMove(param1, param1 - 2, 3);
               break;
            case this.combatArray[param1][1][0] == 2 && !this.combatArray[param1][6][7]:
               this.rageProc(param1);
               break;
            case this.combatArray[param1][1][0] == 4 && !this.combatArray[param1][6][8]:
               this.mendProc(param1, -1);
               break;
            case this.combatArray[param1][6][2]:
               this.regenProc(param1);
               break;
            case this.combatArray[param1][6][3]:
               this.poisonProc(param1);
               break;
            case this.combatLevel != 104:
               this.objList[this.combatArray[param1][6][0]].stageClip.gotoAndStop(2);
               this.combatArray[param1][6][6] = true;
               break;
            default:
               this.combatArray[param1][6][6] = true;
         }
      }

      public function hideAll():void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while (_loc1_ < this.objList.length)
         {
            this.objList[_loc1_].visible = false;
            _loc1_++;
         }
      }

      public function endCombat():void
      {
         if (this.vicScreen == null && this.combatResult && this.combatLevel != 400)
         {
            this.hideAll();
            this.gainExp();
            this.vicScreen = new asVictory();
            addChild(this.vicScreen);
            this.vicScreen.mouseEnabled = false;
            this.vicScreen.gotoAndStop(1);
         }
         else if (this.vicScreen != null)
         {
            if (this.vicScreen.currentFrame >= 2 && this.vicScreen.currentFrame < 15)
            {
               this.vicScreen.nextFrame();
               this.vicScreen.stop();
            }
            else if (this.vicScreen.currentFrame == 15)
            {
               this.loadConquest();
               this.vicScreen.nextFrame();
               this.vicScreen.stop();
            }
            else if (this.vicScreen.currentFrame >= 16 && this.vicScreen.currentFrame < 30)
            {
               this.vicScreen.nextFrame();
               this.vicScreen.stop();
            }
         }
         else if (this.combatLevel == 400)
         {
            this.unloadCombat();
         }
         else if (!this.combatResult)
         {
            this.unloadCombat();
         }
      }

      public function gainExp():void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while (_loc1_ < this.cardInventory.length)
         {
            if (this.cardInventory[_loc1_][0][8] >= 0)
            {
               this.cardInventory[_loc1_][0][11] += 1;
               if (this.cardInventory[_loc1_][0][11] > this.cardInventory[_loc1_][0][10] * 5)
               {
                  this.cardInventory[_loc1_][0][11] = 0;
                  if (this.cardInventory[_loc1_][0][10] < 4)
                  {
                     ++ this.cardInventory[_loc1_][0][10];
                     ++this.inventoryDeck[this.cardInventory[_loc1_][0][8]][0][10];
                  }
               }
            }
            _loc1_++;
         }
      }

      public function victoryEvent(param1:int):void
      {
         this.eventLock = true;
         if (this.sCheck)
         {
            this.euType = 9;
            param1 = 8;
         }
         this.cSpecial = new asModEvent(this.euType * 10 + param1);
         this.vicScreen.visible = false;
         switch (true)
         {
            case this.euType == 2 && param1 == 2:
               this.cSpecial.x = 0;
               this.cSpecial.y = 62;
               break;
            case this.euType == 4 && param1 == 1:
               this.cSpecial.x = 322;
               this.cSpecial.y = 417;
               break;
            case this.euType == 4 && param1 == 2:
               this.cSpecial.x = 322.05;
               this.cSpecial.y = 415.95;
               break;
            case this.euType == 5 && param1 == 1:
               this.cSpecial.x = -114.65;
               this.cSpecial.y = 479.05;
         }
         addChild(this.cSpecial);
         addChild(this.specMask);
         this.cSpecial.mask = this.specMask;
      }

      public function loadConquest():void
      {
         switch (true)
         {
            case this.sCheck:
               this.vicScreen.oneStar.gotoAndStop(19);
               this.vicScreen.twoStar.gotoAndStop(19);
               this.vicScreen.threeStar.gotoAndStop(19);
               break;
            case this.combatConvert[0].length >= 4:
               this.vicScreen.oneStar.gotoAndStop(this.euType + 10);
               this.vicScreen.twoStar.gotoAndStop(this.euType + 10);
               this.vicScreen.threeStar.gotoAndStop(this.euType + 10);
               if (this.specialEvents[this.euType] < 3)
               {
                  this.specialEvents[this.euType] = 3;
               }
               break;
            case this.combatConvert[0].length >= 3:
               this.vicScreen.oneStar.gotoAndStop(this.euType + 10);
               this.vicScreen.twoStar.gotoAndStop(this.euType + 10);
               this.vicScreen.threeStar.gotoAndStop(this.euType);
               if (this.specialEvents[this.euType] < 2)
               {
                  this.specialEvents[this.euType] = 2;
               }
               break;
            case this.combatConvert[0].length >= 1:
               this.vicScreen.oneStar.gotoAndStop(this.euType + 10);
               this.vicScreen.twoStar.gotoAndStop(this.euType);
               this.vicScreen.threeStar.gotoAndStop(this.euType);
               if (this.specialEvents[this.euType] < 1)
               {
                  this.specialEvents[this.euType] = 1;
               }
               break;
            default:
               this.vicScreen.oneStar.gotoAndStop(this.euType);
               this.vicScreen.twoStar.gotoAndStop(this.euType);
               this.vicScreen.threeStar.gotoAndStop(this.euType);
         }
         this.vicScreen.oneStar.mouseChildren = false;
         this.vicScreen.twoStar.mouseChildren = false;
         this.vicScreen.threeStar.mouseChildren = false;
         this.vicScreen.vicHigh.gotoAndStop(1);
      }

      public function vicSelect(param1:int):void
      {
         switch (true)
         {
            case param1 == -3:
               this.vicScreen.vicHigh.gotoAndStop(1);
               break;
            case param1 == -2:
               this.vicScreen.vicHigh.gotoAndStop(1);
               break;
            case param1 == -1:
               this.vicScreen.vicHigh.gotoAndStop(1);
               break;
            case param1 == 1 && this.combatConvert[0].length >= 1:
               this.vicScreen.vicHigh.gotoAndStop(2);
               break;
            case param1 == 2 && this.combatConvert[0].length >= 3:
               this.vicScreen.vicHigh.gotoAndStop(3);
               break;
            case param1 == 3 && this.combatConvert[0].length >= 4:
               this.vicScreen.vicHigh.gotoAndStop(4);
         }
      }

      public function gainConverts():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         _loc1_ = 0;
         while (_loc1_ < this.combatConvert[0].length)
         {
            _loc4_ = new Array();
            _loc4_[0] = this.combatConvert[0][_loc1_].concat();
            _loc4_[1] = new Array(6, 1);
            _loc4_[2] = new Array(0, 1);
            this.cardInventory.push(_loc4_);
            _loc1_++;
         }
         _loc2_ = 0;
         while (_loc2_ < this.combatConvert[1].length)
         {
            _loc5_ = new Array();
            _loc5_ = this.combatConvert[1][_loc2_].concat();
            this.gearInventory.push(_loc5_);
            _loc2_++;
         }
         _loc3_ = 0;
         while (_loc3_ < this.combatConvert[2].length)
         {
            _loc6_ = new Array();
            _loc6_ = this.combatConvert[2][_loc3_].concat();
            this.gearInventory.push(_loc6_);
            _loc3_++;
         }
      }

      public function lowestHealth(param1:int, param2:int):int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc3_ = 99;
         _loc4_ = 100;
         _loc5_ = 0;
         while (_loc5_ < 21)
         {
            if (this.combatArray[_loc5_] != "0000" && this.combatArray[_loc5_][6][1] == param1 && (param2 == 99 || this.combatArray[_loc5_][4][param2] == 0))
            {
               if (this.combatArray[_loc5_][3][2] < _loc4_)
               {
                  _loc3_ = _loc5_;
                  _loc4_ = int(this.combatArray[_loc5_][3][2]);
               }
            }
            _loc5_++;
         }
         return _loc3_;
      }

      public function highestHealth(param1:int, param2:int):int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc3_ = 99;
         _loc4_ = 0;
         _loc5_ = 0;
         while (_loc5_ < 21)
         {
            if (this.combatArray[_loc5_] != "0000" && this.combatArray[_loc5_][6][1] == param1 && (param2 == 99 || this.combatArray[_loc5_][4][param2] == 0))
            {
               if (this.combatArray[_loc5_][3][2] > _loc4_)
               {
                  _loc3_ = _loc5_;
                  _loc4_ = int(this.combatArray[_loc5_][3][2]);
               }
            }
            _loc5_++;
         }
         return _loc3_;
      }

      public function lowestAttack(param1:int, param2:int):int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc3_ = 99;
         _loc4_ = 100;
         _loc5_ = 0;
         while (_loc5_ < 21)
         {
            if (this.combatArray[_loc5_] != "0000" && this.combatArray[_loc5_][6][1] == param1 && (param2 == 99 || this.combatArray[_loc5_][4][param2] == 0))
            {
               if (this.combatArray[_loc5_][3][1] < _loc4_)
               {
                  _loc3_ = _loc5_;
                  _loc4_ = int(this.combatArray[_loc5_][3][1]);
               }
            }
            _loc5_++;
         }
         return _loc3_;
      }

      public function highestAttack(param1:int, param2:int):int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc3_ = 99;
         _loc4_ = 0;
         _loc5_ = 0;
         while (_loc5_ < 21)
         {
            if (this.combatArray[_loc5_] != "0000" && this.combatArray[_loc5_][6][1] == param1 && (param2 == 99 || this.combatArray[_loc5_][4][param2] == 0))
            {
               if (this.combatArray[_loc5_][3][1] > _loc4_)
               {
                  _loc3_ = _loc5_;
                  _loc4_ = int(this.combatArray[_loc5_][3][1]);
               }
            }
            _loc5_++;
         }
         return _loc3_;
      }

      public function lowestHealthPer(param1:int, param2:int):int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _loc3_ = 99;
         _loc4_ = 100;
         _loc5_ = 0;
         while (_loc5_ < 21)
         {
            if (this.combatArray[_loc5_] != "0000" && this.combatArray[_loc5_][6][1] == param1 && (param2 == 99 || this.combatArray[_loc5_][4][param2] == 0))
            {
               _loc6_ = this.combatArray[_loc5_][3][2] / this.combatArray[_loc5_][3][8] * 100;
               if (_loc6_ < _loc4_)
               {
                  _loc3_ = _loc5_;
                  _loc4_ = _loc6_;
               }
            }
            _loc5_++;
         }
         return _loc3_;
      }

      public function checkSummon():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         var _loc13_:Array = null;
         var _loc14_:int = 0;
         _loc1_ = 0;
         _loc2_ = 0;
         _loc4_ = 0;
         _loc5_ = 99;
         _loc6_ = 0;
         _loc8_ = 0;
         _loc9_ = 1;
         _loc11_ = new Array();
         _loc12_ = 0;
         while (_loc12_ < 21)
         {
            switch (true)
            {
               case this.combatArray[_loc12_] != "0000" && this.combatArray[_loc12_][6][1] == -1:
                  _loc1_ += 1;
                  break;
               case this.combatArray[_loc12_] != "0000" && this.combatArray[_loc12_][6][1] == 1:
                  _loc2_ += 1;
                  break;
            }
            _loc12_++;
         }
         if (_loc1_ <= _loc2_)
         {
            _loc3_ = true;
         }
         else
         {
            _loc3_ = false;
         }
         switch (true)
         {
            case this.combatArray[6] == "0000" && this.combatArray[5] != "0000" && this.combatArray[5][6][1] == 1:
               _loc4_ = 6;
               _loc5_ = 0;
               break;
            case this.combatArray[13] == "0000" && this.combatArray[12] != "0000" && this.combatArray[12][6][1] == 1:
               _loc4_ = 13;
               _loc5_ = 0;
               break;
            case this.combatArray[20] == "0000" && this.combatArray[19] != "0000" && this.combatArray[19][6][1] == 1:
               _loc4_ = 20;
               _loc5_ = 0;
               break;
            case this.combatArray[6] == "0000" && this.combatArray[5] == "0000" && this.combatArray[4] != "0000" && this.combatArray[4][6][1] == 1:
               _loc4_ = 6;
               _loc5_ = 1;
               break;
            case this.combatArray[13] == "0000" && this.combatArray[12] == "0000" && this.combatArray[11] != "0000" && this.combatArray[11][6][1] == 1:
               _loc4_ = 13;
               _loc5_ = 1;
               break;
            case this.combatArray[20] == "0000" && this.combatArray[19] == "0000" && this.combatArray[18] != "0000" && this.combatArray[18][6][1] == 1:
               _loc4_ = 20;
               _loc5_ = 1;
               break;
            case this.combatArray[6] == "0000" && this.combatArray[4] == "0000" && this.combatArray[5] == "0000" && this.combatArray[3] != "0000" && this.combatArray[3][6][1] == 1:
               _loc4_ = 6;
               _loc5_ = 2;
               break;
            case this.combatArray[13] == "0000" && this.combatArray[11] == "0000" && this.combatArray[12] == "0000" && this.combatArray[10] != "0000" && this.combatArray[10][6][1] == 1:
               _loc4_ = 13;
               _loc5_ = 2;
               break;
            case this.combatArray[20] == "0000" && this.combatArray[19] == "0000" && this.combatArray[19] == "0000" && this.combatArray[17] != "0000" && this.combatArray[17][6][1] == 1:
               _loc4_ = 20;
               _loc5_ = 2;
         }
         if (_loc5_ == 99)
         {
            _loc13_ = new Array();
            if (this.combatArray[6] == "0000")
            {
               _loc13_.push(6);
            }
            if (this.combatArray[13] == "0000")
            {
               _loc13_.push(13);
            }
            if (this.combatArray[20] == "0000")
            {
               _loc13_.push(20);
            }
            _loc4_ = _loc14_ = int(_loc13_[Math.floor(Math.random() * _loc13_.length)]);
            _loc5_ = 3;
         }
         _loc7_ = Math.floor(Math.random() * 5) + 1;
         if (this.combatLevel == 1 || this.combatLevel == 93)
         {
            _loc7_ = 3;
         }
         else if (this.combatLevel == 96)
         {
            _loc7_ = 6;
         }
         else
         {
            switch (true)
            {
               case _loc5_ == 0 && _loc7_ == 1:
                  _loc7_ = 1;
                  break;
               case _loc5_ == 0 && _loc7_ == 2:
                  _loc7_ = 1;
                  break;
               case _loc5_ == 0 && _loc7_ == 3:
                  _loc7_ = 1;
                  break;
               case _loc5_ == 0 && _loc7_ == 4:
                  _loc7_ = 3;
                  break;
               case _loc5_ == 0 && _loc7_ == 5:
                  _loc7_ = 3;
                  break;
               case _loc5_ == 1 && _loc7_ == 1:
                  _loc7_ = 2;
                  break;
               case _loc5_ == 1 && _loc7_ == 2:
                  _loc7_ = 2;
                  break;
               case _loc5_ == 1 && _loc7_ == 3:
                  _loc7_ = 2;
                  break;
               case _loc5_ == 1 && _loc7_ == 4:
                  _loc7_ = 4;
                  break;
               case _loc5_ == 1 && _loc7_ == 5:
                  _loc7_ = 4;
                  break;
               case _loc5_ == 2 && _loc7_ == 1:
                  _loc7_ = 5;
                  break;
               case _loc5_ == 2 && _loc7_ == 2:
                  _loc7_ = 5;
                  break;
               case _loc5_ == 2 && _loc7_ == 3:
                  _loc7_ = 3;
                  break;
               case _loc5_ == 2 && _loc7_ == 4:
                  _loc7_ = 3;
                  break;
               case _loc5_ == 2 && _loc7_ == 5:
                  _loc7_ = 3;
                  break;
               case _loc5_ == 3 && _loc7_ == 1:
                  _loc7_ = 1;
                  break;
               case _loc5_ == 3 && _loc7_ == 2:
                  _loc7_ = 2;
                  break;
               case _loc5_ == 3 && _loc7_ == 3:
                  _loc7_ = 3;
                  break;
               case _loc5_ == 3 && _loc7_ == 4:
                  _loc7_ = 4;
                  break;
               case _loc5_ == 3 && _loc7_ == 5:
                  _loc7_ = 5;
            }
         }
         _loc11_ = this.getEnemyUnit(this.combatLevel);
         this.euType = _loc11_[0][0];
         if (this.combatStats[4] > 3 && _loc11_[1].length == 3)
         {
            _loc6_ = int(_loc11_[1][2]);
         }
         else if (this.combatStats[4] > 2 && _loc11_[1].length == 2)
         {
            _loc6_ = int(_loc11_[1][1]);
         }
         else if (this.combatStats[4] > 1)
         {
            _loc6_ = int(_loc11_[1][0]);
         }
         _loc10_ = int(_loc11_[0][Math.floor(Math.random() * _loc11_[0].length)]);
         _loc8_ = int(_loc11_[2][Math.floor(Math.random() * _loc11_[2].length)]);
         _loc9_ = int(_loc11_[3][Math.floor(Math.random() * _loc11_[3].length)]);
         if (_loc4_ != 0 && _loc4_ != 99 && _loc6_ != 0 && this.combatStats[8] > 0)
         {
            if (this.combatLevel != 1 && this.combatStats[9] < this.combatStats[10])
            {
               this.combatStats[9] += 1;
               this.combatArray[_loc4_] = this.createEnemy(_loc10_, _loc7_, _loc6_, _loc8_, _loc9_);
               this.placeToken(_loc4_);
               this.combatStats[8] = this.combatStats[8] - 1;
            }
            else if (this.combatLevel == 1)
            {
               switch (true)
               {
                  case this.combatArray[2] == "0000":
                     this.combatArray[6] = this.createEnemy(_loc10_, _loc7_, 4, _loc8_, _loc9_);
                     this.placeToken(6);
                     break;
                  case this.combatArray[9] == "0000":
                     this.combatArray[13] = this.createEnemy(_loc10_, _loc7_, 4, _loc8_, _loc9_);
                     this.placeToken(13);
                     break;
                  case this.combatArray[16] == "0000":
                     this.combatArray[20] = this.createEnemy(_loc10_, _loc7_, 4, _loc8_, _loc9_);
                     this.placeToken(20);
               }
               this.combatStats[8] = this.combatStats[8] - 1;
            }
         }
         else
         {
            this.summoning = false;
         }
      }

      public function tutorialSummon():void
      {
         this.combatArray[13] = this.createEnemy(4, 6, 4, 1, 0);
         this.placeToken(13);
      }

      public function checkSwitch():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000" && this.combatArray[_loc1_][6][1] == -1 && !this.combatArray[_loc1_][4][10] && !this.combatArray[_loc1_][4][11])
            {
               if (_loc1_ < 7 && _loc1_ - (this.combatArray[_loc1_][3][4] + this.combatArray[_loc1_][3][5]) <= 0)
               {
                  this.checkSriker(_loc1_ - 0, 1);
               }
               else if (_loc1_ < 14 && _loc1_ > 7 && _loc1_ - (this.combatArray[_loc1_][3][4] + this.combatArray[_loc1_][3][5]) <= 7)
               {
                  this.checkSriker(_loc1_ - 7, 2);
               }
               else if (_loc1_ > 14 && _loc1_ - (this.combatArray[_loc1_][3][4] + this.combatArray[_loc1_][3][5]) <= 14)
               {
                  this.checkSriker(_loc1_ - 14, 3);
               }
            }
            _loc1_++;
         }
         _loc2_ = 0;
         for (; _loc2_ < 21; _loc2_++)
         {
            if (!(this.combatArray[_loc2_] != "0000" && this.combatArray[_loc2_][6][1] == -1 && !this.combatArray[_loc2_][4][10] && !this.combatArray[_loc2_][4][11]))
            {
               continue;
            }
            switch (true)
            {
               case _loc2_ == 6 && this.combatArray[13] == "0000" && this.combatArray[12] != "0000" && this.combatArray[12][6][1] == 1:
                  this.swap(6, 13);
                  break;
               case _loc2_ == 6 && this.combatArray[20] == "0000" && this.combatArray[13] == "0000" && this.combatArray[19] != "0000" && this.combatArray[19][6][1] == 1:
                  this.swap(6, 20);
                  break;
               case _loc2_ == 6 && this.combatArray[13] == "0000" && this.combatArray[12] == "0000" && this.combatArray[11] != "0000" && this.combatArray[11][6][1] == 1:
                  this.swap(6, 13);
                  break;
               case _loc2_ == 6 && this.combatArray[20] == "0000" && this.combatArray[13] == "0000" && this.combatArray[19] == "0000" && this.combatArray[18] != "0000" && this.combatArray[18][6][1] == 1:
                  this.swap(6, 20);
                  break;
               case _loc2_ == 6 && this.combatArray[13] == "0000" && this.combatArray[12] == "0000" && this.combatArray[11] == "0000" && this.combatArray[10] != "0000" && this.combatArray[10][6][1] == 1:
                  this.swap(6, 13);
                  break;
               case _loc2_ == 6 && this.combatArray[20] == "0000" && this.combatArray[13] == "0000" && this.combatArray[19] == "0000" && this.combatArray[18] == "0000" && this.combatArray[17] != "0000" && this.combatArray[17][6][1] == 1:
                  this.swap(6, 20);
                  break;
               case _loc2_ == 13 && this.combatArray[6] == "0000" && this.combatArray[5] != "0000" && this.combatArray[5][6][1] == 1:
                  this.swap(13, 6);
                  break;
               case _loc2_ == 13 && this.combatArray[20] == "0000" && this.combatArray[19] != "0000" && this.combatArray[19][6][1] == 1:
                  this.swap(13, 20);
                  break;
               case _loc2_ == 13 && this.combatArray[6] == "0000" && this.combatArray[5] == "0000" && this.combatArray[4] != "0000" && this.combatArray[4][6][1] == 1:
                  this.swap(13, 6);
                  break;
               case _loc2_ == 13 && this.combatArray[20] == "0000" && this.combatArray[19] == "0000" && this.combatArray[18] != "0000" && this.combatArray[18][6][1] == 1:
                  this.swap(13, 20);
                  break;
               case _loc2_ == 13 && this.combatArray[6] == "0000" && this.combatArray[5] == "0000" && this.combatArray[4] == "0000" && this.combatArray[3] != "0000" && this.combatArray[3][6][1] == 1:
                  this.swap(13, 6);
                  break;
               case _loc2_ == 13 && this.combatArray[20] == "0000" && this.combatArray[19] == "0000" && this.combatArray[18] == "0000" && this.combatArray[17] != "0000" && this.combatArray[17][6][1] == 1:
                  this.swap(13, 20);
                  break;
               case _loc2_ == 20 && this.combatArray[13] == "0000" && this.combatArray[13] == "0000" && this.combatArray[12] != "0000" && this.combatArray[12][6][1] == 1:
                  this.swap(20, 6);
                  break;
               case _loc2_ == 20 && this.combatArray[6] == "0000" && this.combatArray[5] != "0000" && this.combatArray[5][6][1] == 1:
                  this.swap(20, 13);
                  break;
               case _loc2_ == 20 && this.combatArray[13] == "0000" && this.combatArray[13] == "0000" && this.combatArray[12] == "0000" && this.combatArray[11] != "0000" && this.combatArray[11][6][1] == 1:
                  this.swap(20, 6);
                  break;
               case _loc2_ == 20 && this.combatArray[6] == "0000" && this.combatArray[5] == "0000" && this.combatArray[4] != "0000" && this.combatArray[4][6][1] == 1:
                  this.swap(20, 13);
                  break;
               case _loc2_ == 20 && this.combatArray[13] == "0000" && this.combatArray[13] == "0000" && this.combatArray[12] == "0000" && this.combatArray[11] == "0000" && this.combatArray[10] != "0000" && this.combatArray[10][6][1] == 1:
                  this.swap(20, 6);
                  break;
               case _loc2_ == 20 && this.combatArray[6] == "0000" && this.combatArray[5] == "0000" && this.combatArray[4] == "0000" && this.combatArray[3] != "0000" && this.combatArray[3][6][1] == 1:
                  this.swap(20, 13);
                  break;
               case _loc2_ == 5 && this.combatArray[13] == "0000" && this.combatArray[12] == "0000" && this.combatArray[11] != "0000" && this.combatArray[11][6][1] == 1:
                  this.swap(5, 12);
                  break;
               case _loc2_ == 5 && this.combatArray[13] == "0000" && this.combatArray[12] == "0000" && this.combatArray[20] == "0000" && this.combatArray[19] == "0000" && this.combatArray[18] != "0000" && this.combatArray[18][6][1] == 1:
                  this.swap(5, 19);
                  break;
               case _loc2_ == 5 && this.combatArray[13] == "0000" && this.combatArray[12] == "0000" && this.combatArray[11] == "0000" && this.combatArray[10] != "0000" && this.combatArray[10][6][1] == 1:
                  this.swap(5, 12);
                  break;
               case _loc2_ == 5 && this.combatArray[13] == "0000" && this.combatArray[12] == "0000" && this.combatArray[20] == "0000" && this.combatArray[19] == "0000" && this.combatArray[18] == "0000" && this.combatArray[17] != "0000" && this.combatArray[17][6][1] == 1:
                  this.swap(5, 19);
                  break;
               case _loc2_ == 12 && this.combatArray[6] == "0000" && this.combatArray[5] == "0000" && this.combatArray[4] != "0000" && this.combatArray[4][6][1] == 1:
                  this.swap(12, 5);
                  break;
               case _loc2_ == 12 && this.combatArray[20] == "0000" && this.combatArray[19] == "0000" && this.combatArray[18] != "0000" && this.combatArray[18][6][1] == 1:
                  this.swap(12, 19);
                  break;
               case _loc2_ == 12 && this.combatArray[6] == "0000" && this.combatArray[5] == "0000" && this.combatArray[4] == "0000" && this.combatArray[3] != "0000" && this.combatArray[3][6][1] == 1:
                  this.swap(12, 5);
                  break;
               case _loc2_ == 12 && this.combatArray[20] == "0000" && this.combatArray[19] == "0000" && this.combatArray[18] == "0000" && this.combatArray[17] != "0000" && this.combatArray[17][6][1] == 1:
                  this.swap(12, 19);
                  break;
               case _loc2_ == 19 && this.combatArray[13] == "0000" && this.combatArray[12] == "0000" && this.combatArray[6] == "0000" && this.combatArray[5] == "0000" && this.combatArray[4] != "0000" && this.combatArray[4][6][1] == 1:
                  this.swap(19, 5);
                  break;
               case _loc2_ == 19 && this.combatArray[13] == "0000" && this.combatArray[12] == "0000" && this.combatArray[11] != "0000" && this.combatArray[11][6][1] == 1:
                  this.swap(19, 12);
                  break;
               case _loc2_ == 19 && this.combatArray[13] == "0000" && this.combatArray[12] == "0000" && this.combatArray[6] == "0000" && this.combatArray[5] == "0000" && this.combatArray[4] == "0000" && this.combatArray[3] != "0000" && this.combatArray[3][6][1] == 1:
                  this.swap(19, 5);
                  break;
               case _loc2_ == 19 && this.combatArray[13] == "0000" && this.combatArray[12] == "0000" && this.combatArray[11] == "0000" && this.combatArray[10] != "0000" && this.combatArray[10][6][1] == 1:
                  this.swap(19, 12);
                  break;
            }
         }
         _loc3_ = 0;
         for (; _loc3_ < 21; _loc3_++)
         {
            if (!(this.combatArray[_loc3_] != "0000" && this.combatArray[_loc3_][6][1] == -1 && !this.combatArray[_loc3_][4][10] && !this.combatArray[_loc3_][4][11]))
            {
               continue;
            }
            switch (true)
            {
               case _loc3_ > 13 && this.combatArray[_loc3_ - 1] != "0000" && this.combatArray[_loc3_ - 1][6][1] == -1 && (this.combatArray[_loc3_ - 7] == "0000" || this.combatArray[_loc3_ - 7] != "0000" && this.combatArray[_loc3_ - 7][6][1] == -1) && this.combatArray[_loc3_ - 15] == "0000" && this.combatArray[_loc3_ - 14] == "0000":
                  this.swap(_loc3_, _loc3_ - 14);
                  break;
               case _loc3_ > 6 && this.combatArray[_loc3_ - 1] != "0000" && this.combatArray[_loc3_ - 1][6][1] == -1 && this.combatArray[_loc3_ - 8] == "0000" && this.combatArray[_loc3_ - 7] == "0000":
                  this.swap(_loc3_, _loc3_ - 7);
                  break;
               case _loc3_ < 14 && this.combatArray[_loc3_ - 1] != "0000" && this.combatArray[_loc3_ - 1][6][1] == -1 && this.combatArray[_loc3_ + 6] == "0000" && this.combatArray[_loc3_ + 7] == "0000":
                  this.swap(_loc3_, _loc3_ + 7);
                  break;
               case _loc3_ < 7 && this.combatArray[_loc3_ - 1] != "0000" && this.combatArray[_loc3_ - 1][6][1] == -1 && (this.combatArray[_loc3_ + 7] == "0000" || this.combatArray[_loc3_ + 7] != "0000" && this.combatArray[_loc3_ + 7][6][1] == -1) && this.combatArray[_loc3_ + 13] == "0000" && this.combatArray[_loc3_ + 14] == "0000":
                  this.swap(_loc3_, _loc3_ + 14);
                  break;
            }
         }
         this.swapping = false;
      }

      public function checkSriker(param1:int, param2:int):void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         _loc3_ = new Array(true, true, true);
         _loc4_ = 99;
         _loc5_ = 0;
         while (_loc5_ < 3)
         {
            _loc6_ = true;
            _loc7_ = param1;
            while (_loc7_ >= 0)
            {
               if (this.combatArray[_loc7_ + 7 * _loc5_] != "0000" && this.combatArray[_loc7_ + 7 * _loc5_][6][1] == 1)
               {
                  _loc6_ = false;
               }
               if (this.combatArray[_loc7_ + 7 * _loc5_] != "0000" && this.combatArray[_loc7_ + 7 * _loc5_][6][1] == -1 && Boolean(this.combatArray[_loc7_ + 7 * _loc5_][4][10]))
               {
                  _loc6_ = false;
               }
               if (this.combatArray[7 * _loc5_] != "0000")
               {
                  _loc6_ = false;
               }
               _loc7_--;
            }
            if (!_loc6_)
            {
               _loc3_[_loc5_] = false;
            }
            else
            {
               _loc3_[_loc5_] = true;
            }
            _loc5_++;
         }
         switch (true)
         {
            case param2 == 1 && _loc3_[1]:
               _loc4_ = 2;
               break;
            case param2 == 1 && _loc3_[2] && this.combatArray[param1 + 7] == "0000":
               _loc4_ = 3;
               break;
            case param2 == 1 && _loc3_[2] && this.combatArray[param1 + 7] != "0000" && this.combatArray[param1 + 7][6][1] == -1:
               _loc4_ = 3;
               break;
            case param2 == 2 && _loc3_[0]:
               _loc4_ = 1;
               break;
            case param2 == 2 && _loc3_[2]:
               _loc4_ = 3;
               break;
            case param2 == 3 && _loc3_[0] && this.combatArray[param1 + 7] != "0000" && this.combatArray[param1 + 7][6][1] == -1:
               _loc4_ = 1;
               break;
            case param2 == 3 && _loc3_[0] && this.combatArray[param1 + 7] == "0000":
               _loc4_ = 1;
               break;
            case param2 == 3 && _loc3_[1]:
               _loc4_ = 2;
         }
         if (_loc3_[param2 - 1])
         {
            _loc4_ = 99;
         }
         if (_loc4_ != 99 && !this.combatArray[param1 + 7 * (param2 - 1)][6][10])
         {
            this.swap(param1 + (param2 - 1) * 7, param1 + (_loc4_ - 1) * 7);
         }
      }

      public function createEnemy(param1:int, param2:int, param3:int, param4:int, param5:int):Array
      {
         var _loc6_:Array = null;
         _loc6_ = new Array();
         _loc6_[0] = this.blankCard(param1);
         _loc6_[1] = new Array(param2, param3);
         _loc6_[2] = new Array(param4, param5);
         _loc6_[3] = _loc6_[0].concat();
         _loc6_[3][1] += int(this.getWeapon(param2, param3, 1, 0, 1));
         _loc6_[3][2] += int(this.getWeapon(param2, param3, 2, 0, 1));
         _loc6_[3][3] += int(this.getWeapon(param2, param3, 3, 0, 1));
         _loc6_[3][4] += int(this.getWeapon(param2, param3, 4, 0, 1));
         _loc6_[3][5] += int(this.getWeapon(param2, param3, 5, 0, 1));
         return _loc6_;
      }

      public function unitMove(param1:*, param2:*, param3:*):void
      {
         var _loc4_:MovieClip = null;
         _loc4_ = this.objList[this.combatArray[param1][6][0]];
         _loc4_.stageClip.gotoAndStop(3);
         if (this.combatArray[param1][6][1] == 1)
         {
            if (_loc4_.x < this.combatGrid["grid" + param2].x)
            {
               _loc4_.x += 10;
            }
            else
            {
               _loc4_.x = this.combatGrid["grid" + param2].x;
            }
         }
         else if (_loc4_.x > this.combatGrid["grid" + param2].x)
         {
            _loc4_.x -= 10;
         }
         else
         {
            _loc4_.x = this.combatGrid["grid" + param2].x;
         }
         if (_loc4_.x == this.combatGrid["grid" + param2].x)
         {
            this.combatArray[param1][6][4] -= param3;
            if (this.combatArray[param1][6][4] <= 0)
            {
               _loc4_.stageClip.gotoAndStop(2);
            }
            this.combatArray[param2] = this.combatArray[param1];
            this.combatArray[param1] = "0000";
            switch (true)
            {
               case param2 == 0:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 6;
                  break;
               case param2 == 1:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 5;
                  break;
               case param2 == 2:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 4;
                  break;
               case param2 == 3:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 3;
                  break;
               case param2 == 4:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 2;
                  break;
               case param2 == 5:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 1;
                  break;
               case param2 == 6:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 0;
                  break;
               case param2 == 7:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 6;
                  break;
               case param2 == 8:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 5;
                  break;
               case param2 == 9:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 4;
                  break;
               case param2 == 10:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 3;
                  break;
               case param2 == 11:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 2;
                  break;
               case param2 == 12:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 1;
                  break;
               case param2 == 13:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 0;
                  break;
               case param2 == 14:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 6;
                  break;
               case param2 == 15:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 5;
                  break;
               case param2 == 16:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 4;
                  break;
               case param2 == 17:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 3;
                  break;
               case param2 == 18:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 2;
                  break;
               case param2 == 19:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 1;
                  break;
               case param2 == 20:
                  _loc4_.y = this.combatGrid["grid" + param2].y + 0;
            }
            if (this.combatLevel == 103)
            {
               this.pecuLoc = param2;
               this.summoning = true;
            }
         }
      }

      public function unitAttack(param1:*, param2:*):void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _loc3_ = this.objList[this.combatArray[param1][6][0]];
         _loc4_ = this.objList[this.combatArray[param2][6][0]];
         _loc3_.stageClip.gotoAndStop(4);
         if (this.combatLevel < 100)
         {
            _loc4_.stageClip.gotoAndStop(5);
         }
         else
         {
            _loc4_.stageClip.gotoAndStop(10);
         }
         switch (true)
         {
            case this.combatArray[param1][1][0] == 4:
               _loc4_.cfx.gotoAndStop(2);
               break;
            case this.combatArray[param1][1][0] == 5:
               _loc4_.cfx.gotoAndStop(4);
         }
         if (this.combatArray[param1][1][0] == 2 && this.combatArray[param1][1][1] == 5)
         {
            _loc4_.cfx.gotoAndStop(9);
            this.combatArray[param2][4][3] = 9999;
            this.combatArray[param2][5][3] = 99;
         }
         if (this.combatArray[param1][1][0] == 1)
         {
            this.combatArray[param2][4][10] = true;
            this.combatArray[param2][5][10] = 3;
         }
         _loc5_ = int(_loc3_.uAttack) - this.combatArray[param2][4][0] + this.combatArray[param2][4][1];
         if (_loc5_ <= 0)
         {
            _loc5_ = 0;
         }
         if (this.combatArray[param1][1][0] == 2 && this.combatArray[param1][1][1] == 6)
         {
            _loc3_.cfx.gotoAndStop(3);
            this.combatArray[param1][3][2] += Math.round(_loc5_ / 2);
            if (this.combatArray[param1][3][2] > _loc3_.mHealth)
            {
               this.combatArray[param1][3][2] = _loc3_.mHealth;
            }
            _loc3_.updateStats(this.combatArray[param1]);
         }
         if (this.combatLevel < 100)
         {
            this.combatArray[param2][3][2] -= _loc5_;
            if (this.combatArray[param1][1][0] == 5)
            {
               this.splashDamage(param2, Math.floor(_loc5_ / 2));
            }
            if (this.combatArray[param2][3][2] <= 0 && this.combatArray[param1][6][1] == 1)
            {
               this.combatArray[param2][3][2] = 0;
               _loc4_.updateStats(this.combatArray[param2]);
               this.killUnit(param2, this.combatArray[param1][0][7], param1);
            }
            else if (this.combatArray[param2][3][2] <= 0 && this.combatArray[param1][6][1] == -1)
            {
               this.combatArray[param2][3][2] = 0;
               _loc4_.updateStats(this.combatArray[param2]);
               this.killUnit(param2, 0, 0);
            }
            else
            {
               _loc4_.updateStats(this.combatArray[param2]);
            }
         }
         else
         {
            _loc6_ = int(_loc3_.uAttack);
            if (this.charData[5] && this.combatArray[param1][0][7] != 14 && this.combatArray[param1][0][7] != 15 && this.combatArray[param1][0][7] != 16)
            {
               _loc6_ = 0;
               this.charData[5] = false;
            }
            this.combatStats[0] -= int(_loc6_);
            if (this.combatStats[0] <= 0)
            {
               this.combatStats[0] = 0;
            }
            this.uiHolder.charBar.updateGUI();
         }
         this.combatArray[param1][6][5] = this.combatArray[param1][6][5] - 1;
      }

      public function unitStrike(param1:*, param2:*):void
      {
         var _loc3_:MovieClip = null;
         if (this.combatLevel < 100)
         {
            _loc3_ = this.objList[this.combatArray[param1][6][0]];
            _loc3_.stageClip.gotoAndStop(4);
            if (param2 == -1)
            {
               this.objList[1].stageClip.gotoAndStop(5);
               switch (true)
               {
                  case this.combatArray[param1][1][0] == 4:
                     this.objList[1].cfx.gotoAndStop(2);
                     break;
                  case this.combatArray[param1][1][0] == 5:
                     this.objList[1].cfx.gotoAndStop(4);
               }
               this.combatStats[3] -= int(_loc3_.uAttack);
               if (this.combatStats[3] <= 0)
               {
                  this.combatStats[3] = 0;
               }
               this.uiHolder.enemyBar.updateGUI();
               if (this.combatStats[3] <= 0 && this.combatLevel < 100)
               {
                  this.combatState = 12;
               }
            }
            else
            {
               this.objList[0].stageClip.gotoAndStop(5);
               switch (true)
               {
                  case this.combatArray[param1][1][0] == 4:
                     this.objList[0].cfx.gotoAndStop(2);
                     break;
                  case this.combatArray[param1][1][0] == 5:
                     this.objList[0].cfx.gotoAndStop(4);
               }
               this.combatStats[0] -= int(_loc3_.uAttack);
               if (this.combatStats[0] <= 0)
               {
                  this.combatStats[0] = 0;
               }
               this.uiHolder.charBar.updateGUI();
               if (this.combatStats[0] <= 0 && this.combatLevel < 100)
               {
                  this.combatState = 12;
               }
            }
         }
         this.combatArray[param1][6][5] = this.combatArray[param1][6][5] - 1;
      }

      public function launchSkill():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while (_loc3_ < 21)
         {
            if (this.combatGrid["grid" + _loc3_].currentFrame == 5)
            {
               _loc1_ = _loc3_;
            }
            _loc3_++;
         }
         _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
         this.launchSkill_sub(_loc1_, _loc2_);
         this.deSelect();
         this.bgHolder.removeChild(this.stageShade);
         this.uiHolder.removeChild(this.spellIcon);
         this.spellIcon = null;
         this.uiHolder.btnAction.gotoAndStop(2);
      }

      public function launchSkill_sub(param1:int, param2:MovieClip):void
      {
         this.objList[this.skillStats[0]].stageClip.gotoAndStop(6);
         switch (true)
         {
            case this.skillStats[1] == 0:
               param2.cfx.gotoAndStop(8);
               param2.stageClip.gotoAndStop(6);
               break;
            case this.skillStats[1] == 1:
               param2.cfx.gotoAndStop(10);
               param2.stageClip.gotoAndStop(5);
               break;
            case this.skillStats[1] == 2:
               param2.cfx.gotoAndStop(3);
               param2.stageClip.gotoAndStop(6);
               break;
            case this.skillStats[1] == 3:
               param2.cfx.gotoAndStop(9);
               param2.stageClip.gotoAndStop(5);
               break;
            case this.skillStats[1] == 4:
               param2.cfx.gotoAndStop(6);
               param2.stageClip.gotoAndStop(6);
               break;
            case this.skillStats[1] == 5:
               param2.cfx.gotoAndStop(7);
               param2.stageClip.gotoAndStop(5);
               break;
            case this.skillStats[1] == 20:
               param2.cfx.gotoAndStop(11);
               param2.stageClip.gotoAndStop(5);
               break;
            case this.skillStats[1] == 22:
               param2.cfx.gotoAndStop(3);
               param2.stageClip.gotoAndStop(6);
               break;
            case this.skillStats[1] == 31:
               param2.cfx.gotoAndStop(13);
               param2.stageClip.gotoAndStop(6);
         }
         if (this.skillStats[1] < 8)
         {
            if (this.combatArray[param1][4][this.skillStats[1]] <= this.skillStats[2])
            {
               this.combatArray[param1][4][this.skillStats[1]] = this.skillStats[2];
               this.combatArray[param1][5][this.skillStats[1]] = this.skillStats[3];
            }
            param2.updateStats(this.combatArray[param1]);
         }
         else
         {
            switch (true)
            {
               case this.skillStats[1] == 20:
                  this.directDamage(param1, this.skillStats[2]);
                  break;
               case this.skillStats[1] == 22:
                  this.directHeal(param1, this.skillStats[2]);
                  break;
               case this.skillStats[1] == 31:
                  this.voodooSingle(param1);
            }
         }
         this.skillLock = false;
      }

      public function directDamage(param1:int, param2:int):void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:int = 0;
         _loc3_ = this.objList[this.combatArray[param1][6][0]];
         _loc4_ = param2 - this.combatArray[param1][4][0];
         if (_loc4_ <= 0)
         {
            _loc4_ = 0;
         }
         else
         {
            _loc4_ += this.combatArray[param1][4][1];
         }
         this.combatArray[param1][3][2] -= _loc4_;
         _loc3_.updateStats(this.combatArray[param1]);
         if (this.combatArray[param1][3][2] <= 0)
         {
            this.combatArray[param1][3][2] = 0;
            _loc3_.updateStats(this.combatArray[param1]);
            this.killUnit(param1, 1, 0);
         }
         else
         {
            _loc3_.updateStats(this.combatArray[param1]);
         }
      }

      public function directHeal(param1:int, param2:int):void
      {
         var _loc3_:MovieClip = null;
         _loc3_ = this.objList[this.combatArray[param1][6][0]];
         this.combatArray[param1][3][2] += param2;
         if (this.combatArray[param1][3][2] > _loc3_.mHealth)
         {
            this.combatArray[param1][3][2] = _loc3_.mHealth;
         }
         _loc3_.updateStats(this.combatArray[param1]);
      }

      public function voodooSingle(param1:int):void
      {
         var _loc2_:MovieClip = null;
         _loc2_ = this.objList[this.combatArray[param1][6][0]];
         this.combatArray[param1][3][1] += 5;
         this.combatArray[param1][3][2] -= 5;
         this.combatArray[param1][0][2] -= 5;
         if (this.combatArray[param1][3][2] <= 0)
         {
            this.combatArray[param1][3][2] = 0;
            _loc2_.updateStats(this.combatArray[param1]);
            this.killUnit(param1, 1, 0);
         }
         else
         {
            _loc2_.updateStats(this.combatArray[param1]);
         }
      }

      public function activateEnemySkill(param1:int, param2:int, param3:int, param4:int, param5:int):void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:MovieClip = null;
         this.skillStats = new Array(param1, int(this.getRune(param3, param4, param5, 1)), int(this.getRune(param3, param4, param5, 2)), int(this.getRune(param3, param4, param5, 3)), int(this.getRune(param3, param4, param5, 4)));
         _loc6_ = int(this.getRune(param3, param4, param5, 4));
         _loc7_ = 0;
         if (_loc6_ == 1 || _loc6_ == -1)
         {
            _loc8_ = 0;
            while (_loc8_ < 21)
            {
               if (this.combatArray[_loc8_] != "0000" && this.combatArray[_loc8_][6][1] == param2 * _loc6_)
               {
                  _loc7_ += 1;
               }
               _loc8_++;
            }
            if (_loc7_ != 0)
            {
               switch (true)
               {
                  case this.skillStats[1] == 0:
                     _loc9_ = this.highestAttack(-1, 0);
                     break;
                  case this.skillStats[1] == 1:
                     _loc9_ = this.highestHealth(1, 1);
                     break;
                  case this.skillStats[1] == 2:
                     _loc9_ = this.lowestHealth(-1, 2);
                     break;
                  case this.skillStats[1] == 3:
                     _loc9_ = this.highestHealth(1, 3);
                     break;
                  case this.skillStats[1] == 4:
                     _loc9_ = this.lowestAttack(-1, 4);
                     break;
                  case this.skillStats[1] == 5:
                     _loc9_ = this.highestAttack(1, 5);
                     break;
                  case this.skillStats[1] == 20:
                     _loc9_ = this.lowestHealth(1, 99);
                     break;
                  case this.skillStats[1] == 22:
                     _loc9_ = this.lowestHealthPer(-1, 99);
               }
               if (_loc9_ != 99)
               {
                  _loc10_ = this.objList[this.combatArray[_loc9_][6][0]];
                  this.launchSkill_sub(_loc9_, _loc10_);
               }
            }
         }
         else
         {
            this.combatMassEffect(param2 * _loc6_, int(this.getRune(param3, param4, param5, 1)), int(this.getRune(param3, param4, param5, 2)), int(this.getRune(param3, param4, param5, 3)));
         }
      }

      public function activateSkill(param1:int, param2:int, param3:int, param4:int, param5:int):void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if (param3 == 2 && param4 == 6)
         {
            this.skillLock = false;
            this.barrier();
         }
         else if (param3 == 5 && param4 == 4)
         {
            this.skillLock = false;
            this.badFish();
         }
         else if (param3 == 1 && param4 == 7)
         {
            this.skillLock = false;
            this.milkyWave();
         }
         else if (param3 == 3 && param4 == 4)
         {
            this.skillLock = false;
         }
         else
         {
            this.stageShade = new asCD();
            _loc6_ = int(this.getRune(param3, param4, param5, 4));
            _loc7_ = 0;
            this.deSelect();
            if (_loc6_ == 1 || _loc6_ == -1)
            {
               _loc8_ = 0;
               while (_loc8_ < 21)
               {
                  if (this.combatArray[_loc8_] != "0000" && this.combatArray[_loc8_][6][1] == param2 * _loc6_)
                  {
                     _loc7_ += 1;
                     this.deSelPrev();
                     this.combatGrid["grid" + _loc8_].gotoAndStop(5);
                  }
                  _loc8_++;
               }
               if (_loc7_ == 0)
               {
                  this.skillLock = false;
               }
               else
               {
                  this.stageShade.mouseEnabled = false;
                  this.stageShade.mouseChildren = false;
                  this.bgHolder.addChild(this.stageShade);
                  this.uiHolder.btnAction.gotoAndStop(4);
                  this.skillStats = new Array(param1, int(this.getRune(param3, param4, param5, 1)), int(this.getRune(param3, param4, param5, 2)), int(this.getRune(param3, param4, param5, 3)), int(this.getRune(param3, param4, param5, 4)));
                  this.spellIcon = new asSpell();
                  this.spellIcon.spellName_2.text = this.uiHolder.overLay.spellName_2.text;
                  this.spellIcon.spellDesc_2.text = this.uiHolder.overLay.spellDesc_2.text;
                  this.uiHolder.addChild(this.spellIcon);
               }
            }
            else if (_loc6_ == 3)
            {
               _loc9_ = 0;
               while (_loc9_ < 21)
               {
                  if (this.combatArray[_loc9_] != "0000")
                  {
                     _loc7_ += 1;
                     this.deSelPrev();
                     this.combatGrid["grid" + _loc9_].gotoAndStop(5);
                  }
                  _loc9_++;
               }
               if (_loc7_ == 0)
               {
                  this.skillLock = false;
               }
               else
               {
                  this.stageShade.mouseEnabled = false;
                  this.stageShade.mouseChildren = false;
                  this.bgHolder.addChild(this.stageShade);
                  this.uiHolder.btnAction.gotoAndStop(4);
                  this.skillStats = new Array(param1, int(this.getRune(param3, param4, param5, 1)), int(this.getRune(param3, param4, param5, 2)), int(this.getRune(param3, param4, param5, 3)), int(this.getRune(param3, param4, param5, 4)));
                  this.spellIcon = new asSpell();
                  this.spellIcon.spellName_2.text = this.uiHolder.overLay.spellName_2.text;
                  this.spellIcon.spellDesc_2.text = this.uiHolder.overLay.spellDesc_2.text;
                  this.uiHolder.addChild(this.spellIcon);
               }
            }
            else
            {
               this.skillStats = new Array(param1, int(this.getRune(param3, param4, param5, 1)), int(this.getRune(param3, param4, param5, 2)), int(this.getRune(param3, param4, param5, 3)), int(this.getRune(param3, param4, param5, 4)));
               this.combatMassEffect(param2 * _loc6_, int(this.getRune(param3, param4, param5, 1)), int(this.getRune(param3, param4, param5, 2)), int(this.getRune(param3, param4, param5, 3)));
            }
         }
      }

      public function combatMassEffect(param1:int, param2:int, param3:int, param4:int):void
      {
         var _loc5_:int = 0;
         var _loc6_:MovieClip = null;
         if (param1 < 0)
         {
            param1 = -1;
         }
         else
         {
            param1 = 1;
         }
         _loc5_ = 0;
         for (; _loc5_ < 21; _loc5_++)
         {
            if (!(this.combatArray[_loc5_] != "0000" && this.combatArray[_loc5_][6][1] == param1))
            {
               continue;
            }
            _loc6_ = this.objList[this.combatArray[_loc5_][6][0]];
            switch (true)
            {
               case param2 == 6:
                  _loc6_.cfx.gotoAndStop(6);
                  _loc6_.stageClip.gotoAndStop(6);
                  if (this.combatArray[_loc5_][4][this.skillStats[1]] <= this.skillStats[2])
                  {
                     this.combatArray[_loc5_][4][this.skillStats[1]] = this.skillStats[2];
                     this.combatArray[_loc5_][5][this.skillStats[1]] = this.skillStats[3];
                  }
                  _loc6_.updateStats(this.combatArray[_loc5_]);
                  break;
               case param2 == 7:
                  _loc6_.cfx.gotoAndStop(7);
                  _loc6_.stageClip.gotoAndStop(5);
                  if (this.combatArray[_loc5_][4][this.skillStats[1]] <= this.skillStats[2])
                  {
                     this.combatArray[_loc5_][4][this.skillStats[1]] = this.skillStats[2];
                     this.combatArray[_loc5_][5][this.skillStats[1]] = this.skillStats[3];
                  }
                  _loc6_.updateStats(this.combatArray[_loc5_]);
                  break;
               case param2 == 21:
                  _loc6_.cfx.gotoAndStop(2);
                  _loc6_.stageClip.gotoAndStop(5);
                  this.directDamage(_loc5_, param3);
                  break;
               case param2 == 23:
                  _loc6_.cfx.gotoAndStop(3);
                  _loc6_.stageClip.gotoAndStop(6);
                  this.directHeal(_loc5_, param3);
                  break;
            }
         }
         this.skillLock = false;
      }

      public function regenProc(param1:int):void
      {
         var _loc2_:MovieClip = null;
         _loc2_ = this.objList[this.combatArray[param1][6][0]];
         _loc2_.stageClip.gotoAndStop(6);
         _loc2_.cfx.gotoAndStop(3);
         this.combatArray[param1][3][2] += this.combatArray[param1][4][2];
         if (this.combatArray[param1][3][2] > _loc2_.mHealth)
         {
            this.combatArray[param1][3][2] = _loc2_.mHealth;
         }
         _loc2_.updateStats(this.combatArray[param1]);
         this.combatArray[param1][6][2] = false;
      }

      public function poisonProc(param1:int):void
      {
         var _loc2_:MovieClip = null;
         _loc2_ = this.objList[this.combatArray[param1][6][0]];
         _loc2_.stageClip.gotoAndStop(5);
         _loc2_.cfx.gotoAndStop(9);
         this.combatArray[param1][3][2] -= this.combatArray[param1][4][3];
         _loc2_.updateStats(this.combatArray[param1]);
         if (this.combatArray[param1][3][2] <= 0)
         {
            if (this.combatLevel != 104)
            {
               this.combatArray[param1][3][2] = 0;
               _loc2_.updateStats(this.combatArray[param1]);
               if (this.combatArray[param1][0][7] == 14)
               {
                  _loc2_.stageClip.gotoAndStop(6);
               }
               else if (this.combatArray[param1][0][7] == 15)
               {
                  _loc2_.stageClip.gotoAndStop(6);
               }
               else if (this.combatArray[param1][0][7] == 16)
               {
                  _loc2_.stageClip.gotoAndStop(6);
               }
               else
               {
                  this.killUnit(param1, 1, 0);
               }
            }
            else if (this.combatGrid.sfx.currentFrame == 2)
            {
               this.combatStats[3] = 0;
               this.uiHolder.enemyBar.updateGUI();
               this.combatState = 8;
            }
            else
            {
               this.combatStats[3] = 200;
               this.combatArray[this.pecuLoc][3][2] = 200;
               this.uiHolder.enemyBar.updateGUI();
               this.pecuWar.updateStats(this.combatArray[this.pecuLoc]);
               this.loadDia(200307);
            }
         }
         else
         {
            this.combatArray[param1][6][3] = false;
         }
      }

      public function sleepProc(param1:int):void
      {
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         var _loc5_:int = 0;
         _loc2_ = 0;
         while (_loc2_ < 21)
         {
            if (this.combatArray[_loc2_] != "0000")
            {
               if (this.combatArray[_loc2_][6][1] == -1)
               {
                  _loc4_ = this.objList[this.combatArray[_loc2_][6][0]];
                  _loc4_.stageClip.gotoAndStop(5);
                  _loc4_.cfx.gotoAndStop(13);
                  _loc5_ = Math.floor(Math.random() * 100) + 1;
                  if (_loc5_ > 50)
                  {
                     this.combatArray[_loc2_][4][11] = true;
                     this.combatArray[_loc2_][5][11] = 2;
                     _loc4_.updateStats(this.combatArray[_loc2_]);
                  }
               }
            }
            _loc2_++;
         }
         _loc3_ = this.objList[this.combatArray[param1][6][0]];
         _loc3_.stageClip.gotoAndStop(6);
         this.combatArray[param1][6][11] = false;
      }

      public function rageProc(param1:int):void
      {
         var _loc2_:MovieClip = null;
         _loc2_ = this.objList[this.combatArray[param1][6][0]];
         _loc2_.stageClip.gotoAndStop(6);
         _loc2_.cfx.gotoAndStop(6);
         this.combatArray[param1][3][1] += 1;
         this.combatArray[param1][6][7] = true;
         _loc2_.updateStats(this.combatArray[param1]);
      }

      public function mendProc(param1:int, param2:int):void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = undefined;
         var _loc8_:MovieClip = null;
         _loc3_ = this.objList[this.combatArray[param1][6][0]];
         _loc4_ = 100;
         _loc5_ = param1;
         _loc6_ = 0;
         while (_loc6_ < 21)
         {
            if (this.combatArray[_loc6_] != "0000")
            {
               if (this.combatArray[_loc6_][6][1] == param2)
               {
                  _loc7_ = Math.floor(this.combatArray[_loc6_][3][2] / this.objList[this.combatArray[_loc6_][6][0]].mHealth * 100);
                  if (_loc7_ < _loc4_)
                  {
                     _loc4_ = _loc7_;
                     _loc5_ = _loc6_;
                  }
               }
            }
            _loc6_++;
         }
         if (_loc4_ != 100)
         {
            _loc8_ = this.objList[this.combatArray[_loc5_][6][0]];
            _loc3_.stageClip.gotoAndStop(6);
            _loc8_.stageClip.gotoAndStop(6);
            _loc8_.cfx.gotoAndStop(3);
            this.combatArray[_loc5_][3][2] += 2;
            if (this.combatArray[_loc5_][3][2] > _loc8_.mHealth)
            {
               this.combatArray[_loc5_][3][2] = _loc8_.mHealth;
            }
            _loc8_.updateStats(this.combatArray[_loc5_]);
         }
         this.combatArray[param1][6][8] = true;
      }

      public function splashDamage(param1:*, param2:*):void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if (param2 <= 0)
         {
            param2 = 1;
         }
         _loc4_ = 0;
         _loc5_ = int(this.combatArray[param1][6][1]);
         _loc6_ = 1;
         while (_loc6_ < 5)
         {
            _loc3_ = null;
            switch (true)
            {
               case _loc6_ == 1 && param1 - 1 >= 0 && this.combatArray[param1 - 1] != "0000" && this.combatArray[param1 - 1][6][1] == _loc5_:
                  _loc4_ = param1 - 1;
                  _loc3_ = this.objList[this.combatArray[param1 - 1][6][0]];
                  break;
               case _loc6_ == 2 && param1 + 1 <= 20 && this.combatArray[param1 + 1] != "0000" && this.combatArray[param1 + 1][6][1] == _loc5_:
                  _loc4_ = param1 + 1;
                  _loc3_ = this.objList[this.combatArray[param1 + 1][6][0]];
                  break;
               case _loc6_ == 3 && param1 - 7 >= 0 && this.combatArray[param1 - 7] != "0000" && this.combatArray[param1 - 7][6][1] == _loc5_:
                  _loc4_ = param1 - 7;
                  _loc3_ = this.objList[this.combatArray[param1 - 7][6][0]];
                  break;
               case _loc6_ == 4 && param1 + 7 <= 20 && this.combatArray[param1 + 7] != "0000" && this.combatArray[param1 + 7][6][1] == _loc5_:
                  _loc4_ = param1 + 7;
                  _loc3_ = this.objList[this.combatArray[param1 + 7][6][0]];
            }
            if (_loc3_ != null)
            {
               _loc3_.stageClip.gotoAndStop(5);
               _loc3_.cfx.gotoAndStop(5);
               _loc7_ = param2;
               _loc7_ = _loc7_ - this.combatArray[_loc4_][4][0];
               _loc7_ = _loc7_ + this.combatArray[_loc4_][4][1];
               if (_loc7_ < 0)
               {
                  _loc7_ = 0;
               }
               this.combatArray[_loc4_][3][2] -= _loc7_;
               if (this.combatArray[_loc4_][3][2] <= 0)
               {
                  this.combatArray[_loc4_][3][2] = 0;
                  _loc3_.updateStats(this.combatArray[_loc4_]);
                  this.killUnit(_loc4_, 1, 0);
               }
               else
               {
                  _loc3_.updateStats(this.combatArray[_loc4_]);
               }
            }
            _loc6_++;
         }
      }

      public function killUnit(param1:int, param2:int, param3:int):void
      {
         if (this.combatLevel != 104)
         {
            this.combatSoul += 50;
            switch (true)
            {
               case this.combatArray[param1][6][1] == -1 && this.combatGrid.sfx.currentFrame == 2 && param2 > 0:
                  this.unitConvert(param2, param1, param3);
                  break;
               default:
                  this.unitDeath(param1);
            }
         }
      }

      public function endEvent():void
      {
         removeChild(this.cSpecial);
         removeChild(this.specMask);
         this.cSpecial = null;
         if (this.vicScreen != null)
         {
            this.vicScreen.visible = true;
         }
         this.eventLock = false;
      }

      public function unitDeath(param1:int):void
      {
         var _loc2_:MovieClip = null;
         _loc2_ = this.objList[this.combatArray[param1][6][0]];
         if (this.combatArray[param1][6][1] == -1)
         {
            this.combatStats[9] = this.combatStats[9] - 1;
            this.combatStats[4] += this.combatArray[param1][3][3];
            this.uiHolder.enemyBar.updateGUI;
         }
         else
         {
            this.combatStats[1] += this.combatArray[param1][3][3];
            this.uiHolder.charBar.updateGUI;
         }
         if (_loc2_.stageClip.currentFrame != 7 && _loc2_.stageClip.currentFrame != 9)
         {
            _loc2_.stageClip.gotoAndStop(7);
         }
         this.combatArray[param1] = "0000";
      }

      public function selectGrid(param1:int):void
      {
         switch (true)
         {
            case this.skillLock && this.combatGrid["grid" + param1].currentFrame == 2:
               this.deSelPrev();
               this.combatGrid["grid" + param1].gotoAndStop(5);
               break;
            case !this.skillLock && this.combatGrid["grid" + param1].currentFrame == 2 && this.selectedUnit < 6:
               this.placeToken(param1);
               break;
            case !this.skillLock && this.combatArray[param1] != "0000" && this.selectedUnit == 99 && this.combatArray[param1][6][1] == 1 && !this.combatArray[param1][4][10]:
               this.deSelect();
               this.loadOverlay(param1, 1, 1);
               this.selectedUnit = param1 + 10;
               this.swapSelect(param1);
               break;
            case !this.skillLock && this.combatGrid["grid" + param1].currentFrame == 2 && this.selectedUnit != 99:
               this.mouseLock = true;
               this.swap(this.selectedUnit - 10, param1);
               break;
            case !this.skillLock && this.combatArray[param1] != "0000" && this.combatArray[param1][6][1] == 1:
               this.deSelect();
               this.loadOverlay(param1, 1, 1);
               break;
            case !this.skillLock && this.combatArray[param1] != "0000" && this.combatArray[param1][6][1] == -1:
               this.deSelect();
               this.loadOverlay(param1, -1, 1);
               break;
            case !this.skillLock && this.combatArray[param1] == "0000":
               this.deSelect();
         }
      }

      public function deSelPrev():void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatGrid["grid" + _loc1_].currentFrame == 5)
            {
               this.combatGrid["grid" + _loc1_].gotoAndStop(2);
            }
            _loc1_++;
         }
      }

      public function checkSwap():void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Array = null;
         if (this.swapTool[0])
         {
            this.animationLock = true;
            _loc1_ = false;
            _loc2_ = false;
            if (this.swapTool[1].x > this.swapTool[2].x)
            {
               this.swapTool[1].x -= 2;
               if (this.swapTool[1].x < this.swapTool[2].x)
               {
                  this.swapTool[1].x = this.swapTool[2].x;
               }
            }
            else if (this.swapTool[1].x < this.swapTool[2].x)
            {
               this.swapTool[1].x += 2;
               if (this.swapTool[1].x > this.swapTool[2].x)
               {
                  this.swapTool[1].x = this.swapTool[2].x;
               }
            }
            if (this.swapTool[1].y > this.swapTool[2].y)
            {
               this.swapTool[1].y -= 20;
               if (this.swapTool[1].y < this.swapTool[2].y)
               {
                  this.swapTool[1].y = this.swapTool[2].y;
               }
            }
            else if (this.swapTool[1].y < this.swapTool[2].y)
            {
               this.swapTool[1].y += 20;
               if (this.swapTool[1].y > this.swapTool[2].y)
               {
                  this.swapTool[1].y = this.swapTool[2].y;
               }
            }
            if (this.swapTool[1].x == this.swapTool[2].x && this.swapTool[1].y == this.swapTool[2].y)
            {
               switch (true)
               {
                  case this.swapTool[6] == 0:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 0;
                     break;
                  case this.swapTool[6] == 1:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 1;
                     break;
                  case this.swapTool[6] == 2:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 2;
                     break;
                  case this.swapTool[6] == 3:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 3;
                     break;
                  case this.swapTool[6] == 4:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 2;
                     break;
                  case this.swapTool[6] == 5:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 1;
                     break;
                  case this.swapTool[6] == 6:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 0;
                     break;
                  case this.swapTool[6] == 7:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 0;
                     break;
                  case this.swapTool[6] == 8:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 1;
                     break;
                  case this.swapTool[6] == 9:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 2;
                     break;
                  case this.swapTool[6] == 10:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 3;
                     break;
                  case this.swapTool[6] == 11:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 2;
                     break;
                  case this.swapTool[6] == 12:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 1;
                     break;
                  case this.swapTool[6] == 13:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 0;
                     break;
                  case this.swapTool[6] == 14:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 0;
                     break;
                  case this.swapTool[6] == 15:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 1;
                     break;
                  case this.swapTool[6] == 16:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 2;
                     break;
                  case this.swapTool[6] == 17:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 3;
                     break;
                  case this.swapTool[6] == 18:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 2;
                     break;
                  case this.swapTool[6] == 19:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 1;
                     break;
                  case this.swapTool[6] == 20:
                     this.swapTool[1].y = this.combatGrid["grid" + this.swapTool[6]].y + 0;
               }
               _loc1_ = true;
            }
            else
            {
               _loc1_ = false;
            }
            if (this.swapTool[3] != null)
            {
               if (this.swapTool[3].x > this.swapTool[4].x)
               {
                  this.swapTool[3].x -= 2;
                  if (this.swapTool[3].x < this.swapTool[4].x)
                  {
                     this.swapTool[3].x = this.swapTool[4].x;
                  }
               }
               else if (this.swapTool[3].x < this.swapTool[4].x)
               {
                  this.swapTool[3].x += 2;
                  if (this.swapTool[3].x > this.swapTool[4].x)
                  {
                     this.swapTool[3].x = this.swapTool[4].x;
                  }
               }
               if (this.swapTool[3].y > this.swapTool[4].y)
               {
                  this.swapTool[3].y -= 20;
                  if (this.swapTool[3].y < this.swapTool[4].y)
                  {
                     this.swapTool[3].y = this.swapTool[4].y;
                  }
               }
               else if (this.swapTool[3].y < this.swapTool[4].y)
               {
                  this.swapTool[3].y += 20;
                  if (this.swapTool[3].y > this.swapTool[4].y)
                  {
                     this.swapTool[3].y = this.swapTool[4].y;
                  }
               }
               if (this.swapTool[3].x == this.swapTool[4].x && this.swapTool[3].y == this.swapTool[4].y)
               {
                  switch (true)
                  {
                     case this.swapTool[5] == 0:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 0;
                        break;
                     case this.swapTool[5] == 1:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 1;
                        break;
                     case this.swapTool[5] == 2:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 2;
                        break;
                     case this.swapTool[5] == 3:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 3;
                        break;
                     case this.swapTool[5] == 4:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 2;
                        break;
                     case this.swapTool[5] == 5:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 1;
                        break;
                     case this.swapTool[5] == 6:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 0;
                        break;
                     case this.swapTool[5] == 7:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 0;
                        break;
                     case this.swapTool[5] == 8:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 1;
                        break;
                     case this.swapTool[5] == 9:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 2;
                        break;
                     case this.swapTool[5] == 10:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 3;
                        break;
                     case this.swapTool[5] == 11:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 2;
                        break;
                     case this.swapTool[5] == 12:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 1;
                        break;
                     case this.swapTool[5] == 13:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 0;
                        break;
                     case this.swapTool[5] == 14:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 0;
                        break;
                     case this.swapTool[5] == 15:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 1;
                        break;
                     case this.swapTool[5] == 16:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 2;
                        break;
                     case this.swapTool[5] == 17:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 3;
                        break;
                     case this.swapTool[5] == 18:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 2;
                        break;
                     case this.swapTool[5] == 19:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 1;
                        break;
                     case this.swapTool[5] == 20:
                        this.swapTool[3].y = this.combatGrid["grid" + this.swapTool[5]].y + 0;
                  }
                  _loc2_ = true;
               }
               else
               {
                  _loc2_ = false;
               }
            }
            else
            {
               _loc2_ = true;
            }
            if (_loc1_ && _loc2_)
            {
               this.swapTool[0] = false;
               this.swapTool[1] = null;
               this.swapTool[2] = null;
               this.swapTool[3] = null;
               this.swapTool[4] = null;
               _loc3_ = this.combatArray[this.swapTool[5]];
               this.combatArray[this.swapTool[5]] = this.combatArray[this.swapTool[6]];
               this.combatArray[this.swapTool[6]] = _loc3_;
               this.combatArray[this.swapTool[6]][6][10] = true;
               this.animationLock = false;
               this.mouseLock = false;
               this.checkDepth();
            }
         }
         else
         {
            this.mouseLock = false;
         }
      }

      public function swap(param1:int, param2:int):void
      {
         this.deSelect();
         this.swapTool[0] = true;
         this.swapTool[1] = MovieClip(this.objList[this.combatArray[param1][6][0]]);
         this.swapTool[2] = MovieClip(this.combatGrid["grid" + param2]);
         if (this.combatArray[param2] != "0000")
         {
            this.swapTool[3] = MovieClip(this.objList[this.combatArray[param2][6][0]]);
            this.swapTool[4] = MovieClip(this.combatGrid["grid" + param1]);
         }
         this.swapTool[5] = param1;
         this.swapTool[6] = param2;
         this.animationLock = true;
      }

      public function swapSelect(param1:int):void
      {
         if (param1 < 7)
         {
            if (this.combatArray[param1 + 7] == "0000" || this.combatArray[param1 + 7][6][1] == 1 && !this.combatArray[param1 + 7][4][10])
            {
               this.combatGrid["grid" + (param1 + 7)].gotoAndStop(2);
            }
            if ((this.combatArray[param1 + 14] == "0000" || this.combatArray[param1 + 14][6][1] == 1 && !this.combatArray[param1 + 14][4][10]) && (this.combatArray[param1 + 7] == "0000" || this.combatArray[param1 + 7][6][1] == 1))
            {
               this.combatGrid["grid" + (param1 + 14)].gotoAndStop(2);
            }
            if (this.combatGrid["grid" + (param1 + 7)].currentFrame == 1 && this.combatGrid["grid" + (param1 + 14)].currentFrame == 1)
            {
               this.deSelect();
               this.loadOverlay(param1, 1, 1);
            }
         }
         else if (param1 < 14)
         {
            if (this.combatArray[param1 - 7] == "0000" || this.combatArray[param1 - 7][6][1] == 1 && !this.combatArray[param1 - 7][4][10])
            {
               this.combatGrid["grid" + (param1 - 7)].gotoAndStop(2);
            }
            if (this.combatArray[param1 + 7] == "0000" || this.combatArray[param1 + 7][6][1] == 1 && !this.combatArray[param1 + 7][4][10])
            {
               this.combatGrid["grid" + (param1 + 7)].gotoAndStop(2);
            }
            if (this.combatGrid["grid" + (param1 + 7)].currentFrame == 1 && this.combatGrid["grid" + (param1 - 7)].currentFrame == 1)
            {
               this.deSelect();
               this.loadOverlay(param1, 1, 1);
            }
         }
         else
         {
            if (this.combatArray[param1 - 7] == "0000" || this.combatArray[param1 - 7][6][1] == 1 && !this.combatArray[param1 - 7][4][10])
            {
               this.combatGrid["grid" + (param1 - 7)].gotoAndStop(2);
            }
            if ((this.combatArray[param1 - 14] == "0000" || this.combatArray[param1 - 14][6][1] == 1 && !this.combatArray[param1 - 14][4][10]) && (this.combatArray[param1 - 7] == "0000" || this.combatArray[param1 - 7][6][1] == 1))
            {
               this.combatGrid["grid" + (param1 - 14)].gotoAndStop(2);
            }
            if (this.combatGrid["grid" + (param1 - 7)].currentFrame == 1 && this.combatGrid["grid" + (param1 - 14)].currentFrame == 1)
            {
               this.deSelect();
               this.loadOverlay(param1, 1, 1);
            }
         }
      }

      public function loadOverlay(param1:int, param2:int, param3:int):void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if (param3 != 0)
         {
            _loc4_ = int(this.combatArray[param1][3][4]);
            _loc5_ = int(this.combatArray[param1][3][5]);
            if (param2 == 1)
            {
               switch (true)
               {
                  case param1 < 6 && param1 + _loc4_ > 5:
                     _loc4_ = 5 - param1;
                     break;
                  case param1 < 13 && param1 + _loc4_ > 12:
                     _loc4_ = 12 - param1;
                     break;
                  case param1 < 20 && param1 + _loc4_ > 19:
                     _loc4_ = 19 - param1;
               }
               switch (true)
               {
                  case param1 < 6 && param1 + (_loc4_ + _loc5_) > 6:
                     _loc5_ = 6 - (_loc4_ + param1);
                     break;
                  case param1 < 13 && param1 + (_loc4_ + _loc5_) > 13:
                     _loc5_ = 13 - (_loc4_ + param1);
                     break;
                  case param1 < 20 && param1 + (_loc4_ + _loc5_) > 20:
                     _loc5_ = 20 - (_loc4_ + param1);
               }
               _loc6_ = 1;
               while (_loc6_ <= _loc4_ + _loc5_)
               {
                  if (_loc6_ <= _loc4_)
                  {
                     this.combatGrid["grid" + (param1 + _loc6_)].gotoAndStop(3);
                  }
                  else
                  {
                     this.combatGrid["grid" + (param1 + _loc6_)].gotoAndStop(5);
                  }
                  _loc6_++;
               }
            }
            else
            {
               switch (true)
               {
                  case param1 > 14 && param1 - _loc4_ < 15:
                     _loc4_ = Math.abs(15 - param1);
                     break;
                  case param1 > 7 && param1 - _loc4_ < 8:
                     _loc4_ = Math.abs(8 - param1);
                     break;
                  case param1 > 0 && param1 - _loc4_ < 1:
                     _loc4_ = Math.abs(1 - param1);
               }
               switch (true)
               {
                  case param1 > 14 && param1 - (_loc4_ + _loc5_) < 14:
                     _loc5_ = Math.abs(14 - (param1 - _loc4_));
                     break;
                  case param1 > 7 && param1 - (_loc4_ + _loc5_) < 7:
                     _loc5_ = Math.abs(7 - (param1 - _loc4_));
                     break;
                  case param1 > 0 && param1 - (_loc4_ + _loc5_) < 0:
                     _loc5_ = Math.abs(0 - (param1 - _loc4_));
               }
               _loc7_ = 1;
               while (_loc7_ <= _loc4_ + _loc5_)
               {
                  if (_loc7_ <= _loc4_)
                  {
                     this.combatGrid["grid" + (param1 - _loc7_)].gotoAndStop(4);
                  }
                  else
                  {
                     this.combatGrid["grid" + (param1 - _loc7_)].gotoAndStop(5);
                  }
                  _loc7_++;
               }
            }
         }
         this.uiHolder.overLay.populate(param1, param2);
         this.uiHolder.overLay.y = 0;
      }

      public function selectToken(param1:int):void
      {
         this.deSelect();
         if (this.combatHand[param1] != "0000")
         {
            this.loadOverlay(param1, 3, 0);
            this.selectedUnit = param1;
            if (this.combatHand[param1][3][3] <= this.combatStats[1])
            {
               this.loadNewSelect();
            }
         }
      }

      public function loadNewSelect():void
      {
         this.combatSelect = true;
         if (this.combatArray[0] == "0000")
         {
            this.combatGrid.grid0.gotoAndStop(2);
         }
         if (this.combatArray[7] == "0000")
         {
            this.combatGrid.grid7.gotoAndStop(2);
         }
         if (this.combatArray[14] == "0000")
         {
            this.combatGrid.grid14.gotoAndStop(2);
         }
      }

      public function deSelect():void
      {
         var _loc1_:int = 0;
         this.uiHolder.overLay.y = -100;
         this.combatSelect = false;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            this.combatGrid["grid" + _loc1_].gotoAndStop(1);
            _loc1_++;
         }
         this.selectedUnit = 99;
      }

      public function placeToken(param1:int):void
      {
         var _loc2_:MovieClip = null;
         if (this.combatLevel != 106)
         {
            if (param1 == 0 || param1 == 7 || param1 == 14)
            {
               this.combatArray[param1] = this.combatHand[this.selectedUnit];
               this.combatStats[1] -= this.combatHand[this.selectedUnit][3][3];
               this.uiHolder.charBar.updateGUI();
            }
            else
            {
               this.combatStats[4] -= this.combatArray[param1][3][3];
               this.uiHolder.enemyBar.updateGUI();
            }
         }
         this.combatArray[param1][4] = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, false, false);
         this.combatArray[param1][5] = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
         this.combatArray[param1][6] = new Array(this.objList.length, 1, false, false, 0, 0, false, false);
         if (param1 == 0 || param1 == 7 || param1 == 14)
         {
            this.combatHand.splice(this.selectedUnit, 1);
            this.combatHand[5] = "0000";
            this.uiHolder.hand.populate();
         }
         this.deSelect();
         switch (true)
         {
            case this.combatLevel == 106:
               this.combatArray[param1][6][1] = -1;
               _loc2_ = new asUnit_2(this.combatGrid["grid" + param1].x, this.combatGrid["grid" + param1].y, this.combatArray[param1][3][7], this.combatArray[param1][1][0]);
               break;
            case param1 == 0:
               this.combatArray[param1][6][1] = 1;
               _loc2_ = new asUnit_2(this.combatGrid.grid0.x, this.combatGrid.grid0.y, this.combatArray[param1][3][7], this.combatArray[param1][1][0]);
               break;
            case param1 == 7:
               this.combatArray[param1][6][1] = 1;
               _loc2_ = new asUnit_2(this.combatGrid.grid7.x, this.combatGrid.grid7.y, this.combatArray[param1][3][7], this.combatArray[param1][1][0]);
               break;
            case param1 == 14:
               this.combatArray[param1][6][1] = 1;
               _loc2_ = new asUnit_2(this.combatGrid.grid14.x, this.combatGrid.grid14.y, this.combatArray[param1][3][7], this.combatArray[param1][1][0]);
               break;
            case param1 == 10:
               this.combatArray[param1][6][1] = -1;
               _loc2_ = new asUnit_2(this.combatGrid.grid10.x, this.combatGrid.grid10.y, this.combatArray[param1][3][7], this.combatArray[param1][1][0]);
               break;
            case param1 == 6:
               this.combatArray[param1][6][1] = -1;
               _loc2_ = new asUnit_2(this.combatGrid.grid6.x, this.combatGrid.grid6.y, this.combatArray[param1][3][7], this.combatArray[param1][1][0]);
               break;
            case param1 == 13:
               this.combatArray[param1][6][1] = -1;
               _loc2_ = new asUnit_2(this.combatGrid.grid13.x, this.combatGrid.grid13.y, this.combatArray[param1][3][7], this.combatArray[param1][1][0]);
               break;
            case param1 == 20:
               this.combatArray[param1][6][1] = -1;
               _loc2_ = new asUnit_2(this.combatGrid.grid20.x, this.combatGrid.grid20.y, this.combatArray[param1][3][7], this.combatArray[param1][1][0]);
         }
         this.obHolder.addChild(_loc2_);
         if (param1 == 6 || param1 == 13 || param1 == 20 || param1 == 10)
         {
            _loc2_.scaleX *= -1;
            _loc2_.stats.scaleX *= -1;
         }
         this.objList.push(_loc2_);
         _loc2_.updateStats(this.combatArray[param1]);
         _loc2_ = null;
         this.checkDepth();
      }

      public function createCard(param1:int, param2:int, param3:int, param4:int, param5:int):Array
      {
         var _loc6_:Array = null;
         _loc6_ = new Array();
         _loc6_[0] = this.blankCard(param1);
         _loc6_[1] = new Array(param2, param3);
         _loc6_[2] = new Array(param4, param5);
         return _loc6_;
      }

      public function blankCard(param1:int):Array
      {
         switch (true)
         {
            case param1 == 1:
               return new Array(1, 2, 4, 2, 1, 1, 1, 1, -1, 0, 1, 0);
            case param1 == 2:
               return new Array(2, 1, 6, 2, 1, 1, 1, 2, -1, 0, 1, 0);
            case param1 == 3:
               return new Array(3, 3, 2, 2, 1, 1, 1, 3, -1, 0, 1, 0);
            case param1 == 4:
               return new Array(4, 3, 2, 2, 1, 1, 0, 4, -1, 0, 1, 0);
            case param1 == 5:
               return new Array(5, 2, 4, 2, 1, 1, 0, 5, -1, 0, 1, 0);
            case param1 == 6:
               return new Array(6, 1, 6, 2, 1, 1, 0, 6, -1, 0, 1, 0);
            case param1 == 7:
               return new Array(7, 2, 6, 2, 1, 1, 0, 7, -1, 0, 1, 0);
            case param1 == 8:
               return new Array(8, 5, 10, 2, 1, 1, 0, 8, -1, 0, 1, 0);
            case param1 == 9:
               return new Array(9, 1, 2, 2, 1, 1, 2, 9, -1, 0, 1, 0);
            case param1 == 10:
               return new Array(10, 1, 2, 2, 1, 1, 2, 10, -1, 0, 1, 0);
            case param1 == 11:
               return new Array(11, 10, 20, 1, 1, 1, 2, 11, -1, 0, 1, 0);
            case param1 == 12:
               return new Array(12, 15, 15, 1, 2, 1, 2, 12, -1, 0, 1, 0);
            case param1 == 13:
               return new Array(13, 20, 10, 1, 3, 1, 2, 13, -1, 0, 1, 0);
            case param1 == 14:
               return new Array(14, 0, 10, 0, 0, 0, 2, 14, -1, 0, 1, 0);
            case param1 == 15:
               return new Array(15, 0, 10, 0, 0, 0, 2, 15, -1, 0, 1, 0);
            case param1 == 16:
               return new Array(16, 0, 10, 0, 0, 0, 2, 16, -1, 0, 1, 0);
            case param1 == 17:
               return new Array(17, 0, 30, 0, 0, 0, 0, 17, -1, 0, 1, 0);
            case param1 == 18:
               return new Array(18, 50, 75, 0, 0, 0, 2, 18, -1, 0, 1, 0);
            case param1 == 19:
               return new Array(19, 0, 1, 0, 0, 0, 2, 19, -1, 0, 1, 0);
            case param1 == 20:
               return new Array(20, 50, 400, 0, 0, 0, 2, 20, -1, 0, 1, 0);
            case param1 == 21:
               return new Array(21, 50, 200, 0, 0, 0, 2, 21, -1, 0, 1, 0);
            case param1 == 22:
               return new Array(22, 0, 9999, 0, 0, 0, 0, 22, -1, 0, 1, 0);
            case param1 == 23:
               return new Array(23, 0, 9999, 0, 0, 0, 0, 23, -1, 0, 1, 0);
            case param1 == 24:
               return new Array(24, 0, 9999, 0, 0, 0, 0, 24, -1, 0, 1, 0);
            default:
               return new Array(0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0);
         }
      }

      public function charClass(param1:int):void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         _loc2_ = 0;
         _loc3_ = new Array(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false);
         if (this.charData != null && this.charData[16] != null)
         {
            _loc2_ = int(this.charData[16]);
         }
         if (this.charData != null && this.charData[17] != null)
         {
            _loc3_ = this.charData[17].concat();
         }
         switch (true)
         {
            case param1 == 1:
               this.charData = new Array(1, 10, 125, 2, 1, false, false, 0, 0, new Array(), 1, 125, null, null, null, null);
               break;
            case param1 == 2:
               this.charData = new Array(2, 10, 100, 2, 1, false, false, 0, 0, new Array(), 1.5, 100, null, null, null, null);
               break;
            case param1 == 3:
               this.charData = new Array(3, 10, 100, 3, 1, false, false, 0, 0, new Array(), 1.5, 100, null, null, null, null);
               break;
            case param1 == 4:
               this.charData = new Array(4, 10, 125, 1, 2, false, false, 0, 0, new Array(), 1, 125, null, null, null, null);
               break;
            case param1 == 5:
               this.charData = new Array(5, 10, 75, 1, 3, false, false, 0, 0, new Array(), 2, 75, null, null, null, null);
         }
         switch (true)
         {
            case this.exileClasses[1] > 59 && param1 == 1:
               this.charData[1] += 15;
               break;
            case this.exileClasses[1] > 39 && param1 == 1:
               this.charData[1] += 10;
               break;
            case this.exileClasses[1] > 19 && param1 == 1:
               this.charData[1] += 5;
               break;
            case this.exileClasses[2] > 59 && param1 == 2:
               this.charData[1] += 15;
               break;
            case this.exileClasses[2] > 39 && param1 == 2:
               this.charData[1] += 10;
               break;
            case this.exileClasses[2] > 19 && param1 == 2:
               this.charData[1] += 5;
               break;
            case this.exileClasses[3] > 59 && param1 == 3:
               this.charData[1] += 15;
               break;
            case this.exileClasses[3] > 39 && param1 == 3:
               this.charData[1] += 10;
               break;
            case this.exileClasses[3] > 19 && param1 == 3:
               this.charData[1] += 5;
               break;
            case this.exileClasses[4] > 59 && param1 == 4:
               this.charData[1] += 15;
               break;
            case this.exileClasses[4] > 39 && param1 == 4:
               this.charData[1] += 10;
               break;
            case this.exileClasses[4] > 19 && param1 == 4:
               this.charData[1] += 5;
               break;
            case this.exileClasses[5] > 59 && param1 == 5:
               this.charData[1] += 15;
               break;
            case this.exileClasses[5] > 39 && param1 == 5:
               this.charData[1] += 10;
               break;
            case this.exileClasses[5] > 19 && param1 == 5:
               this.charData[1] += 5;
         }
         switch (true)
         {
            case this.exileClasses[1] > 69 && param1 == 1:
               this.charData[2] += 100;
               this.charData[11] += 100;
               break;
            case this.exileClasses[1] > 49 && param1 == 1:
               this.charData[2] += 75;
               this.charData[11] += 75;
               break;
            case this.exileClasses[1] > 29 && param1 == 1:
               this.charData[2] += 50;
               this.charData[11] += 50;
               break;
            case this.exileClasses[1] > 9 && param1 == 1:
               this.charData[2] += 25;
               this.charData[11] += 25;
               break;
            case this.exileClasses[2] > 69 && param1 == 2:
               this.charData[2] += 100;
               this.charData[11] += 100;
               break;
            case this.exileClasses[2] > 49 && param1 == 2:
               this.charData[2] += 75;
               this.charData[11] += 75;
               break;
            case this.exileClasses[2] > 29 && param1 == 2:
               this.charData[2] += 50;
               this.charData[11] += 50;
               break;
            case this.exileClasses[2] > 9 && param1 == 2:
               this.charData[2] += 25;
               this.charData[11] += 25;
               break;
            case this.exileClasses[3] > 69 && param1 == 3:
               this.charData[2] += 100;
               this.charData[11] += 100;
               break;
            case this.exileClasses[3] > 49 && param1 == 3:
               this.charData[2] += 75;
               this.charData[11] += 75;
               break;
            case this.exileClasses[3] > 29 && param1 == 3:
               this.charData[2] += 50;
               this.charData[11] += 50;
               break;
            case this.exileClasses[3] > 9 && param1 == 3:
               this.charData[2] += 25;
               this.charData[11] += 25;
               break;
            case this.exileClasses[4] > 69 && param1 == 4:
               this.charData[2] += 100;
               this.charData[11] += 100;
               break;
            case this.exileClasses[4] > 49 && param1 == 4:
               this.charData[2] += 75;
               this.charData[11] += 75;
               break;
            case this.exileClasses[4] > 29 && param1 == 4:
               this.charData[2] += 50;
               this.charData[11] += 50;
               break;
            case this.exileClasses[4] > 9 && param1 == 4:
               this.charData[2] += 25;
               this.charData[11] += 25;
               break;
            case this.exileClasses[5] > 69 && param1 == 5:
               this.charData[2] += 100;
               this.charData[11] += 100;
               break;
            case this.exileClasses[5] > 49 && param1 == 5:
               this.charData[2] += 75;
               this.charData[11] += 75;
               break;
            case this.exileClasses[5] > 29 && param1 == 5:
               this.charData[2] += 50;
               this.charData[11] += 50;
               break;
            case this.exileClasses[5] > 9 && param1 == 5:
               this.charData[2] += 25;
               this.charData[11] += 25;
         }
         this.charData[16] = _loc2_;
         this.charData[17] = _loc3_.concat();
      }

      public function getWeapon(param1:int, param2:int, param3:int, param4:int, param5:int):String
      {
         var _loc6_:Array = null;
         switch (true)
         {
            case param1 == 1 && param2 == 1:
               _loc6_ = new Array("Tank", 0, 6, 0, 1, 0, 1, "Taunt", "Iron Scale", 1);
               break;
            case param1 == 1 && param2 == 2:
               _loc6_ = new Array("Tank", 1, 9, 1, 1, 0, 1, "Taunt", "Steel Plate", 2);
               break;
            case param1 == 1 && param2 == 3:
               _loc6_ = new Array("Tank", 2, 12, 2, 1, 0, 1, "Taunt", "Defender's Gear", 3);
               break;
            case param1 == 1 && param2 == 4:
               _loc6_ = new Array("Tank", 1, 12, 0, 1, 0, 1, "Taunt", "Crystal Ward", 2);
               break;
            case param1 == 2 && param2 == 1:
               _loc6_ = new Array("Fighter", 1, 2, 0, 1, 0, 2, "Enrage", "Light Chainmail", 1);
               break;
            case param1 == 2 && param2 == 2:
               _loc6_ = new Array("Fighter", 2, 4, 1, 1, 0, 2, "Enrage", "Reinforced Links", 2);
               break;
            case param1 == 2 && param2 == 3:
               _loc6_ = new Array("Fighter", 3, 6, 2, 1, 0, 2, "Enrage", "Knight's Garb", 3);
               break;
            case param1 == 2 && param2 == 4:
               _loc6_ = new Array("Fighter", 2, 6, 0, 1, 0, 2, "Enrage", "Angel Breaker", 2);
               break;
            case param1 == 3 && param2 == 1:
               _loc6_ = new Array("Scout", 0, 2, 0, 2, 0, 3, "Quickstrike", "Tanned Hide", 1);
               break;
            case param1 == 3 && param2 == 2:
               _loc6_ = new Array("Scout", 1, 3, 1, 2, 0, 3, "Quickstrike", "Studded Leather", 2);
               break;
            case param1 == 3 && param2 == 3:
               _loc6_ = new Array("Scout", 2, 4, 2, 2, 0, 3, "Quickstrike", "Rogue's Attire", 3);
               break;
            case param1 == 3 && param2 == 5:
               _loc6_ = new Array("Scout", 1, 4, 0, 2, 0, 3, "Quickstrike", "Heart Strikers", 2);
               break;
            case param1 == 4 && param2 == 1:
               _loc6_ = new Array("Healer", 1, 2, 0, 0, 1, 4, "Mend", "Cloth Robe", 1);
               break;
            case param1 == 4 && param2 == 2:
               _loc6_ = new Array("Healer", 2, 4, 1, 0, 1, 4, "Mend", "Silk Wrapping", 2);
               break;
            case param1 == 4 && param2 == 3:
               _loc6_ = new Array("Healer", 3, 6, 2, 0, 1, 4, "Mend", "Cleric's Finest", 3);
               break;
            case param1 == 4 && param2 == 4:
               _loc6_ = new Array("Healer", 2, 6, 0, 0, 1, 4, "Mend", "Crystal Heart", 2);
               break;
            case param1 == 5 && param2 == 1:
               _loc6_ = new Array("Mage", 2, 0, 0, 0, 2, 5, "Impact", "Pearl Stud", 1);
               break;
            case param1 == 5 && param2 == 2:
               _loc6_ = new Array("Mage", 3, 1, 1, 0, 2, 5, "Impact", "Gold Statue", 2);
               break;
            case param1 == 5 && param2 == 3:
               _loc6_ = new Array("Mage", 4, 2, 2, 0, 2, 5, "Impact", "Wizard's Fetish", 3);
               break;
            case param1 == 5 && param2 == 5:
               _loc6_ = new Array("Mage", 3, 2, 0, 0, 2, 5, "Impact", "Glass Cannon", 1);
               break;
            case param1 == 1 && param2 == 5:
               _loc6_ = new Array("Tank", 1, 20, 0, 1, 0, 1, "Taunt", "Defense Matrix", 2);
               break;
            case param1 == 2 && param2 == 5:
               _loc6_ = new Array("Fighter", 2, 8, 0, 2, 0, 2, "Enrage", "Ninja Tabi", 2);
               break;
            case param1 == 2 && param2 == 6:
               _loc6_ = new Array("Fighter", 2, 16, 0, 1, 0, 2, "Enrage", "Broken Crown", 2);
               break;
            case param1 == 3 && param2 == 6:
               _loc6_ = new Array("Scout", 2, 4, 0, 2, 0, 3, "Quickstrike", "Castiron Frypan", 2);
               break;
            case param1 == 4 && param2 == 5:
               _loc6_ = new Array("Healer", 2, 6, 0, 0, 2, 4, "Mend", "Life Tree Bark", 2);
               break;
            case param1 == 4 && param2 == 6:
               _loc6_ = new Array("Healer", 2, 10, 0, 0, 2, 4, "Mend", "Staff of Ren", 2);
               break;
            case param1 == 5 && param2 == 4:
               _loc6_ = new Array("Mage", 6, 2, 0, 0, 2, 5, "Impact", "Opera Gown", 3);
               break;
            case param1 == 1 && param2 == 6:
               _loc6_ = new Array("Tank", 3, 18, 0, 1, 0, 1, "Taunt", "Special Tank", 2);
               break;
            case param1 == 1 && param2 == 21:
               _loc6_ = new Array("Tank", 2, 13, 0, 1, 0, 1, "Taunt", "Tank Logic", 1);
               break;
            case param1 == 1 && param2 == 22:
               _loc6_ = new Array("Tank", 2, 15, 1, 1, 0, 1, "Taunt", "Tank Proforma", 2);
               break;
            case param1 == 1 && param2 == 23:
               _loc6_ = new Array("Tank", 2, 17, 2, 1, 0, 1, "Taunt", "Tank Algorithm", 3);
               break;
            case param1 == 1 && param2 == 31:
               _loc6_ = new Array("Tank", 3, 14, 0, 1, 0, 1, "Taunt", "Tank Dream", 1);
               break;
            case param1 == 1 && param2 == 32:
               _loc6_ = new Array("Tank", 4, 16, 1, 1, 0, 1, "Taunt", "Tank Fantasy", 2);
               break;
            case param1 == 1 && param2 == 33:
               _loc6_ = new Array("Tank", 5, 18, 2, 1, 0, 1, "Taunt", "Tank Fear", 3);
               break;
            case param1 == 1 && param2 == 71:
               _loc6_ = new Array("Tank", 3, 16, 0, 1, 0, 1, "Taunt", "Tank Moo", 1);
               break;
            case param1 == 1 && param2 == 72:
               _loc6_ = new Array("Tank", 5, 18, 1, 1, 0, 1, "Taunt", "Tank Mooo", 2);
               break;
            case param1 == 1 && param2 == 73:
               _loc6_ = new Array("Tank", 7, 20, 2, 1, 0, 1, "Taunt", "Tank Moooo", 3);
               break;
            case param1 == 1 && param2 == 61:
               _loc6_ = new Array("Tank", 1, 2, 0, 1, 0, 1, "Taunt", "Esurien Goo", 1);
               break;
            case param1 == 1 && param2 == 62:
               _loc6_ = new Array("Tank", 1, 2, 0, 1, 0, 1, "Taunt", "Esurien Goo", 2);
               break;
            case param1 == 2 && param2 == 21:
               _loc6_ = new Array("Fighter", 3, 4, 0, 1, 0, 2, "Enrage", "Fighter Logic", 1);
               break;
            case param1 == 2 && param2 == 22:
               _loc6_ = new Array("Fighter", 4, 5, 1, 1, 0, 2, "Enrage", "Fighter Proforma", 2);
               break;
            case param1 == 2 && param2 == 23:
               _loc6_ = new Array("Fighter", 5, 6, 2, 1, 0, 2, "Enrage", "Fighter Algorithm", 3);
               break;
            case param1 == 2 && param2 == 31:
               _loc6_ = new Array("Fighter", 4, 4, 0, 1, 0, 2, "Enrage", "Fighter Dream", 1);
               break;
            case param1 == 2 && param2 == 32:
               _loc6_ = new Array("Fighter", 6, 6, 1, 1, 0, 2, "Enrage", "Fighter Fantasy", 2);
               break;
            case param1 == 2 && param2 == 33:
               _loc6_ = new Array("Fighter", 8, 8, 2, 1, 0, 2, "Enrage", "Fighter Fear", 3);
               break;
            case param1 == 2 && param2 == 71:
               _loc6_ = new Array("Fighter", 5, 12, 0, 1, 0, 2, "Enrage", "Fighter Moo", 1);
               break;
            case param1 == 2 && param2 == 72:
               _loc6_ = new Array("Fighter", 7, 14, 1, 1, 0, 2, "Enrage", "Fighter Mooo", 2);
               break;
            case param1 == 2 && param2 == 73:
               _loc6_ = new Array("Fighter", 9, 16, 2, 1, 0, 2, "Enrage", "Fighter Moooo", 3);
               break;
            case param1 == 2 && param2 == 61:
               _loc6_ = new Array("Fighter", 1, 2, 0, 1, 0, 2, "Enrage", "Esurien Goo", 1);
               break;
            case param1 == 2 && param2 == 62:
               _loc6_ = new Array("Fighter", 1, 2, 0, 1, 0, 2, "Enrage", "Esurien Goo", 2);
               break;
            case param1 == 3 && param2 == 4:
               _loc6_ = new Array("Scout", 0, 0, 0, 2, 0, 3, "Quickstrike", "Ruddy Gear", 1);
               break;
            case param1 == 3 && param2 == 7:
               _loc6_ = new Array("Scout", 1, 2, -1, 2, 0, 3, "Quickstrike", "Secret Spices", 2);
               break;
            case param1 == 3 && param2 == 8:
               _loc6_ = new Array("Scout", 98, 97, 0, 5, 0, 3, "Quickstrike", "Blood Drinkers", 2);
               break;
            case param1 == 3 && param2 == 9:
               _loc6_ = new Array("Scout", 3, 8, 0, 2, 0, 3, "Quickstrike", "Special Scout", 2);
               break;
            case param1 == 3 && param2 == 21:
               _loc6_ = new Array("Scout", 9, 0, 0, 2, 0, 3, "Quickstrike", "Scout Logic", 1);
               break;
            case param1 == 3 && param2 == 22:
               _loc6_ = new Array("Scout", 9, 1, 1, 2, 0, 3, "Quickstrike", "Scout Proforma", 2);
               break;
            case param1 == 3 && param2 == 23:
               _loc6_ = new Array("Scout", 9, 2, 2, 2, 0, 3, "Quickstrike", "Scout Algorithm", 3);
               break;
            case param1 == 3 && param2 == 31:
               _loc6_ = new Array("Scout", 9, 0, 0, 2, 0, 3, "Quickstrike", "Scout Dream", 1);
               break;
            case param1 == 3 && param2 == 32:
               _loc6_ = new Array("Scout", 7, 2, 1, 2, 0, 3, "Quickstrike", "Scout Fantasy", 2);
               break;
            case param1 == 3 && param2 == 33:
               _loc6_ = new Array("Scout", 5, 4, 2, 2, 0, 3, "Quickstrike", "Scout Fear", 3);
               break;
            case param1 == 3 && param2 == 71:
               _loc6_ = new Array("Scout", 3, 8, 0, 2, 0, 3, "Quickstrike", "Scout Moo", 1);
               break;
            case param1 == 3 && param2 == 72:
               _loc6_ = new Array("Scout", 5, 10, 1, 2, 0, 3, "Quickstrike", "Scout Mooo", 2);
               break;
            case param1 == 3 && param2 == 73:
               _loc6_ = new Array("Scout", 7, 12, 2, 2, 0, 3, "Quickstrike", "Scout Moooo", 3);
               break;
            case param1 == 3 && param2 == 61:
               _loc6_ = new Array("Scout", 1, 2, 0, 2, 0, 3, "Quickstrike", "Esurien Goo", 1);
               break;
            case param1 == 3 && param2 == 62:
               _loc6_ = new Array("Scout", 1, 2, 0, 2, 0, 3, "Quickstrike", "Esurien Goo", 2);
               break;
            case param1 == 4 && param2 == 21:
               _loc6_ = new Array("Healer", 2, 3, 0, 0, 1, 4, "Mend", "Healer Logic", 1);
               break;
            case param1 == 4 && param2 == 22:
               _loc6_ = new Array("Healer", 3, 4, 1, 0, 1, 4, "Mend", "Healer Proforma", 2);
               break;
            case param1 == 4 && param2 == 23:
               _loc6_ = new Array("Healer", 4, 5, 2, 0, 1, 4, "Mend", "Healer Algorithm", 3);
               break;
            case param1 == 4 && param2 == 31:
               _loc6_ = new Array("Healer", 4, 4, 0, 0, 1, 4, "Mend", "Healer Dream", 1);
               break;
            case param1 == 4 && param2 == 32:
               _loc6_ = new Array("Healer", 5, 6, 1, 0, 1, 4, "Mend", "Healer Fantasy", 2);
               break;
            case param1 == 4 && param2 == 33:
               _loc6_ = new Array("Healer", 6, 8, 2, 0, 1, 4, "Mend", "Healer Fear", 3);
               break;
            case param1 == 4 && param2 == 34:
               _loc6_ = new Array("Healer", 6, 8, 0, 0, 1, 4, "Mend", "Special Healer", 1);
               break;
            case param1 == 4 && param2 == 71:
               _loc6_ = new Array("Healer", 5, 16, 0, 0, 1, 4, "Mend", "Healer Moo", 1);
               break;
            case param1 == 4 && param2 == 72:
               _loc6_ = new Array("Healer", 7, 18, 1, 0, 1, 4, "Mend", "Healer Mooo", 2);
               break;
            case param1 == 4 && param2 == 73:
               _loc6_ = new Array("Healer", 9, 20, 2, 0, 1, 4, "Mend", "Healer Moooo", 3);
               break;
            case param1 == 4 && param2 == 61:
               _loc6_ = new Array("Healer", 1, 2, 0, 0, 1, 4, "Mend", "Esurien Goo", 1);
               break;
            case param1 == 4 && param2 == 62:
               _loc6_ = new Array("Healer", 1, 2, 0, 0, 1, 4, "Mend", "Esurien Goo", 2);
               break;
            case param1 == 5 && param2 == 21:
               _loc6_ = new Array("Mage", 3, 2, 0, 0, 2, 5, "Impact", "Mage Logic", 1);
               break;
            case param1 == 5 && param2 == 22:
               _loc6_ = new Array("Mage", 3, 3, 1, 0, 2, 5, "Impact", "Mage Proforma", 2);
               break;
            case param1 == 5 && param2 == 23:
               _loc6_ = new Array("Mage", 3, 4, 2, 0, 2, 5, "Impact", "Mage Algorithm", 3);
               break;
            case param1 == 5 && param2 == 31:
               _loc6_ = new Array("Mage", 11, 0, 0, 0, 2, 5, "Impact", "Mage Dream", 1);
               break;
            case param1 == 5 && param2 == 32:
               _loc6_ = new Array("Mage", 7, 2, 1, 0, 2, 5, "Impact", "Mage Fantasy", 2);
               break;
            case param1 == 5 && param2 == 33:
               _loc6_ = new Array("Mage", 7, 4, 2, 0, 2, 5, "Impact", "Mage Fear", 3);
               break;
            case param1 == 5 && param2 == 71:
               _loc6_ = new Array("Mage", 7, 4, 0, 0, 2, 5, "Impact", "Mage Moo", 1);
               break;
            case param1 == 5 && param2 == 72:
               _loc6_ = new Array("Mage", 9, 6, 1, 0, 2, 5, "Impact", "Mage Mooo", 2);
               break;
            case param1 == 5 && param2 == 73:
               _loc6_ = new Array("Mage", 11, 8, 2, 0, 2, 5, "Impact", "Mage Moooo", 3);
               break;
            case param1 == 5 && param2 == 61:
               _loc6_ = new Array("Mage", 1, 2, 0, 0, 2, 5, "Impact", "Esurien Goo", 1);
               break;
            case param1 == 5 && param2 == 62:
               _loc6_ = new Array("Mage", 1, 2, 0, 0, 2, 5, "Impact", "Esurien Goo", 2);
               break;
            case param1 == 6 && param2 == 1:
               _loc6_ = new Array("None", 0, 0, 0, 0, 0, 6, "None", "Empty", 1);
               break;
            case param1 == 6 && param2 == 33:
               _loc6_ = new Array("Barrel", 0, 0, 0, 1, 1, 6, "Glug", "Barrel", 1);
               break;
            case param1 == 6 && param2 == 6:
               _loc6_ = new Array("None", 98, 97, 0, 5, 0, 6, "None", "Nude Powa", 1);
               break;
            case param1 == 6 && param2 == 4:
               _loc6_ = new Array("None", 0, -1, 2, 0, 0, 6, "None", "Birthday Suit", 1);
               break;
            default:
               _loc6_ = new Array("None", 0, 0, 0, 0, 0, 6, "None", "Empty", 1);
         }
         if (param4 == 1)
         {
            switch (true)
            {
               case this.exileClasses[1] > 19 && _loc6_[3] == 0 && _loc6_[6] == 1:
                  _loc6_[1] += 1;
                  break;
               case this.exileClasses[1] > 39 && _loc6_[3] == 1 && _loc6_[6] == 1:
                  _loc6_[1] += 1;
                  break;
               case this.exileClasses[1] > 59 && _loc6_[3] == 2 && _loc6_[6] == 1:
                  _loc6_[1] += 2;
                  break;
               case this.exileClasses[2] > 19 && _loc6_[3] == 0 && _loc6_[6] == 2:
                  _loc6_[1] += 1;
                  break;
               case this.exileClasses[2] > 39 && _loc6_[3] == 1 && _loc6_[6] == 2:
                  _loc6_[1] += 1;
                  break;
               case this.exileClasses[2] > 59 && _loc6_[3] == 2 && _loc6_[6] == 2:
                  _loc6_[1] += 2;
                  break;
               case this.exileClasses[3] > 19 && _loc6_[3] == 0 && _loc6_[6] == 3:
                  _loc6_[1] += 1;
                  break;
               case this.exileClasses[3] > 39 && _loc6_[3] == 1 && _loc6_[6] == 3:
                  _loc6_[1] += 1;
                  break;
               case this.exileClasses[3] > 59 && _loc6_[3] == 2 && _loc6_[6] == 3:
                  _loc6_[1] += 2;
                  break;
               case this.exileClasses[4] > 19 && _loc6_[3] == 0 && _loc6_[6] == 4:
                  _loc6_[1] += 1;
                  break;
               case this.exileClasses[4] > 39 && _loc6_[3] == 1 && _loc6_[6] == 4:
                  _loc6_[1] += 1;
                  break;
               case this.exileClasses[4] > 59 && _loc6_[3] == 2 && _loc6_[6] == 4:
                  _loc6_[1] += 2;
                  break;
               case this.exileClasses[5] > 19 && _loc6_[3] == 0 && _loc6_[6] == 5:
                  _loc6_[1] += 1;
                  break;
               case this.exileClasses[5] > 39 && _loc6_[3] == 1 && _loc6_[6] == 5:
                  _loc6_[1] += 1;
                  break;
               case this.exileClasses[5] > 59 && _loc6_[3] == 2 && _loc6_[6] == 5:
                  _loc6_[1] += 2;
            }
            switch (true)
            {
               case this.exileClasses[1] > 9 && _loc6_[3] == 0 && _loc6_[6] == 1:
                  _loc6_[2] += 2;
                  break;
               case this.exileClasses[1] > 29 && _loc6_[3] == 1 && _loc6_[6] == 1:
                  _loc6_[2] += 2;
                  break;
               case this.exileClasses[1] > 49 && _loc6_[3] == 2 && _loc6_[6] == 1:
                  _loc6_[2] += 4;
                  break;
               case this.exileClasses[2] > 9 && _loc6_[3] == 0 && _loc6_[6] == 2:
                  _loc6_[2] += 2;
                  break;
               case this.exileClasses[2] > 29 && _loc6_[3] == 1 && _loc6_[6] == 2:
                  _loc6_[2] += 2;
                  break;
               case this.exileClasses[2] > 49 && _loc6_[3] == 2 && _loc6_[6] == 2:
                  _loc6_[2] += 4;
                  break;
               case this.exileClasses[3] > 9 && _loc6_[3] == 0 && _loc6_[6] == 3:
                  _loc6_[2] += 2;
                  break;
               case this.exileClasses[3] > 29 && _loc6_[3] == 1 && _loc6_[6] == 3:
                  _loc6_[2] += 2;
                  break;
               case this.exileClasses[3] > 49 && _loc6_[3] == 2 && _loc6_[6] == 3:
                  _loc6_[2] += 4;
                  break;
               case this.exileClasses[4] > 9 && _loc6_[3] == 0 && _loc6_[6] == 4:
                  _loc6_[2] += 2;
                  break;
               case this.exileClasses[4] > 29 && _loc6_[3] == 1 && _loc6_[6] == 4:
                  _loc6_[2] += 2;
                  break;
               case this.exileClasses[4] > 49 && _loc6_[3] == 2 && _loc6_[6] == 4:
                  _loc6_[2] += 4;
                  break;
               case this.exileClasses[5] > 9 && _loc6_[3] == 0 && _loc6_[6] == 5:
                  _loc6_[2] += 2;
                  break;
               case this.exileClasses[5] > 29 && _loc6_[3] == 1 && _loc6_[6] == 5:
                  _loc6_[2] += 2;
                  break;
               case this.exileClasses[5] > 49 && _loc6_[3] == 2 && _loc6_[6] == 5:
                  _loc6_[2] += 4;
            }
            switch (true)
            {
               case this.exileClasses[1] > 69 && _loc6_[6] == 1:
                  _loc6_[2] += 2;
                  break;
               case this.exileClasses[2] > 69 && _loc6_[6] == 2:
                  _loc6_[2] += 2;
                  break;
               case this.exileClasses[3] > 69 && _loc6_[6] == 3:
                  _loc6_[2] += 2;
                  break;
               case this.exileClasses[4] > 69 && _loc6_[6] == 4:
                  _loc6_[2] += 2;
                  break;
               case this.exileClasses[5] > 69 && _loc6_[6] == 5:
                  _loc6_[2] += 2;
            }
         }
         switch (true)
         {
            case param5 == 2:
               _loc6_[2] += 1;
               break;
            case param5 == 3:
               _loc6_[2] += 1;
               _loc6_[1] += 1;
               break;
            case param5 == 4:
               _loc6_[2] += 2;
               _loc6_[1] += 1;
         }
         return String(_loc6_[param3]);
      }

      public function getRune(param1:int, param2:int, param3:int, param4:int):String
      {
         var _loc5_:Array = null;
         switch (true)
         {
            case param1 == 1 && param3 == 0 && param2 == 1:
               _loc5_ = new Array("Protect", 0, 2, 2, 1, "Lesser Earth Rune");
               break;
            case param1 == 1 && param3 == 0 && param2 == 2:
               _loc5_ = new Array("Protect", 0, 2, 4, 1, "Standard Earth Rune");
               break;
            case param1 == 1 && param3 == 0 && param2 == 3:
               _loc5_ = new Array("Protect", 0, 2, 6, 1, "Infused Earth Rune");
               break;
            case param1 == 1 && param3 == 0 && param2 == 5:
               _loc5_ = new Array("Mighty Guard", 0, 20, 99, 1, "Omega Earth Rune");
               break;
            case param1 == 1 && param2 == 6:
               _loc5_ = new Array("Voodoo", 31, 1, 1, 3, "Voodoo Stones");
               break;
            case param1 == 1 && param2 == 7:
               _loc5_ = new Array("Milky Wave", 35, 1, 1, 1, "Vintage Milker");
               break;
            case param1 == 1 && param3 == 1 && param2 == 1:
               _loc5_ = new Array("Curse", 1, 2, 2, -1, "Lesser Earth Rune");
               break;
            case param1 == 1 && param3 == 1 && param2 == 2:
               _loc5_ = new Array("Curse", 1, 2, 4, -1, "Standard Earth Rune");
               break;
            case param1 == 1 && param3 == 1 && param2 == 3:
               _loc5_ = new Array("Curse", 1, 2, 6, -1, "Infused Earth Rune");
               break;
            case param1 == 2 && param3 == 1 && param2 == 1:
               _loc5_ = new Array("Regen", 2, 2, 2, 1, "Lesser Water Rune");
               break;
            case param1 == 2 && param3 == 1 && param2 == 2:
               _loc5_ = new Array("Regen", 2, 3, 4, 1, "Standard Water Rune");
               break;
            case param1 == 2 && param3 == 1 && param2 == 3:
               _loc5_ = new Array("Regen", 2, 4, 6, 1, "Infused Water Rune");
               break;
            case param1 == 2 && param3 == 0 && param2 == 1:
               _loc5_ = new Array("Poison", 3, 2, 2, -1, "Lesser Water Rune");
               break;
            case param1 == 2 && param3 == 0 && param2 == 2:
               _loc5_ = new Array("Poison", 3, 3, 4, -1, "Standard Water Rune");
               break;
            case param1 == 2 && param3 == 0 && param2 == 3:
               _loc5_ = new Array("Poison", 3, 4, 6, -1, "Infused Water Rune");
               break;
            case param1 == 2 && param2 == 6:
               _loc5_ = new Array("Shield Dome", 31, 1, 1, 1, "Shield Array");
               break;
            case param1 == 3 && param3 == 0 && param2 == 1:
               _loc5_ = new Array("Boost", 4, 2, 2, 1, "Lesser Fire Rune");
               break;
            case param1 == 3 && param3 == 0 && param2 == 2:
               _loc5_ = new Array("Boost", 4, 2, 4, 1, "Standard Fire Rune");
               break;
            case param1 == 3 && param3 == 0 && param2 == 3:
               _loc5_ = new Array("Boost", 4, 3, 6, 1, "Infused Fire Rune");
               break;
            case param1 == 3 && param2 == 4:
               _loc5_ = new Array("Death Strike", 3, 9999, 1, 1, "Kai Chi Doe");
               break;
            case param1 == 3 && param3 == 1 && param2 == 1:
               _loc5_ = new Array("Weaken", 5, 2, 2, -1, "Lesser Fire Rune");
               break;
            case param1 == 3 && param3 == 1 && param2 == 2:
               _loc5_ = new Array("Weaken", 5, 2, 4, -1, "Standard Fire Rune");
               break;
            case param1 == 3 && param3 == 1 && param2 == 3:
               _loc5_ = new Array("Weaken", 5, 3, 6, -1, "Infused Fire Rune");
               break;
            case param1 == 4 && param3 == 1 && param2 == 1:
               _loc5_ = new Array("Warcry", 6, 1, 2, 2, "Lesser Air Rune");
               break;
            case param1 == 4 && param3 == 1 && param2 == 2:
               _loc5_ = new Array("Warcry", 6, 1, 4, 2, "Standard Air Rune");
               break;
            case param1 == 4 && param3 == 1 && param2 == 3:
               _loc5_ = new Array("Warcry", 6, 2, 6, 2, "Infused Air Rune");
               break;
            case param1 == 4 && param3 == 0 && param2 == 1:
               _loc5_ = new Array("Intimidate", 7, 1, 2, -2, "Lesser Air Rune");
               break;
            case param1 == 4 && param3 == 0 && param2 == 2:
               _loc5_ = new Array("Intimidate", 7, 1, 4, -2, "Standard Air Rune");
               break;
            case param1 == 4 && param3 == 0 && param2 == 3:
               _loc5_ = new Array("Intimidate", 7, 2, 6, -2, "Infused Air Rune");
               break;
            case param1 == 4 && param2 == 4:
               _loc5_ = new Array("Lullaby", 32, 50, 2, -2, "Somber Aria");
               break;
            case param1 == 5 && param3 == 0 && param2 == 1:
               _loc5_ = new Array("Heal", 22, 4, 0, 1, "Lesser Light Rune");
               break;
            case param1 == 5 && param3 == 0 && param2 == 2:
               _loc5_ = new Array("Heal", 22, 6, 0, 1, "Standard Light Rune");
               break;
            case param1 == 5 && param3 == 0 && param2 == 3:
               _loc5_ = new Array("Heal", 22, 8, 0, 1, "Infused Light Rune");
               break;
            case param1 == 5 && param3 == 1 && param2 == 1:
               _loc5_ = new Array("Flare", 20, 2, 0, -1, "Lesser Light Rune");
               break;
            case param1 == 5 && param3 == 1 && param2 == 2:
               _loc5_ = new Array("Flare", 20, 4, 0, -1, "Standard Light Rune");
               break;
            case param1 == 5 && param3 == 1 && param2 == 3:
               _loc5_ = new Array("Flare", 20, 6, 0, -1, "Infused Light Rune");
               break;
            case param1 == 5 && param2 == 4:
               _loc5_ = new Array("Burnt Fish", 33, 4, 6, -2, "Joy Cooking");
               break;
            case param1 == 6 && param3 == 1 && param2 == 1:
               _loc5_ = new Array("Rallycry", 23, 2, 0, 2, "Lesser Dark Rune");
               break;
            case param1 == 6 && param3 == 1 && param2 == 2:
               _loc5_ = new Array("Rallycry", 23, 3, 0, 2, "Standard Dark Rune");
               break;
            case param1 == 6 && param3 == 1 && param2 == 3:
               _loc5_ = new Array("Rallycry", 23, 4, 0, 2, "Infused Dark Rune");
               break;
            case param1 == 6 && param3 == 0 && param2 == 1:
               _loc5_ = new Array("Thunderstorm", 21, 2, 0, -2, "Lesser Dark Rune");
               break;
            case param1 == 6 && param3 == 0 && param2 == 2:
               _loc5_ = new Array("Thunderstorm", 21, 3, 0, -2, "Standard Dark Rune");
               break;
            case param1 == 6 && param3 == 0 && param2 == 3:
               _loc5_ = new Array("Thunderstorm", 21, 4, 0, -2, "Infused Dark Rune");
               break;
            case param1 == 6 && param2 == 4:
               _loc5_ = new Array("Ravage", 34, 4, 6, -2, "Lunar Runes");
               break;
            default:
               _loc5_ = new Array("None", 99, 0, 0, 0, "Empty");
         }
         return String(_loc5_[param4]);
      }

      public function getTitle(param1:int, param2:int):String
      {
         switch (true)
         {
            case param1 == 1 && param2 == 1:
               return "Gorger Stonewall";
            case param1 == 1 && param2 == 2:
               return "Gorger Strongfist";
            case param1 == 1 && param2 == 3:
               return "Gorger Slasher";
            case param1 == 1 && param2 == 4:
               return "Gorger Wildtamer";
            case param1 == 1 && param2 == 5:
               return "Gorger Rockboom";
            case param1 == 1 && param2 == 6:
               return "Gorger";
            case param1 == 2 && param2 == 1:
               return "Mechiza TNK002";
            case param1 == 2 && param2 == 2:
               return "Mechiza FIT143";
            case param1 == 2 && param2 == 3:
               return "Mechiza SCT653";
            case param1 == 2 && param2 == 4:
               return "Mechiza HLR211";
            case param1 == 2 && param2 == 5:
               return "Mechiza MGE112";
            case param1 == 2 && param2 == 6:
               return "Mechiza";
            case param1 == 3 && param2 == 1:
               return "Phasmos Breaker";
            case param1 == 3 && param2 == 2:
               return "Phasmos Cleaver";
            case param1 == 3 && param2 == 3:
               return "Phasmos Stalker";
            case param1 == 3 && param2 == 4:
               return "Phasmos Weaver";
            case param1 == 3 && param2 == 5:
               return "Phasmos Reaper";
            case param1 == 3 && param2 == 6:
               return "Phasmos";
            case param1 == 4 && param2 == 1:
               return "Hive Vanguard";
            case param1 == 4 && param2 == 2:
               return "Hive Blade";
            case param1 == 4 && param2 == 3:
               return "Hive Assassin";
            case param1 == 4 && param2 == 4:
               return "Hive Mender";
            case param1 == 4 && param2 == 5:
               return "Hive Caller";
            case param1 == 4 && param2 == 6:
               return "Hive Drone";
            case param1 == 5 && param2 == 1:
               return "Illosa Roar";
            case param1 == 5 && param2 == 2:
               return "Illosa Scream";
            case param1 == 5 && param2 == 3:
               return "Illosa Whisper";
            case param1 == 5 && param2 == 4:
               return "Illosa Chant";
            case param1 == 5 && param2 == 5:
               return "Illosa Screech";
            case param1 == 5 && param2 == 6:
               return "Illosa";
            case param1 == 6 && param2 == 1:
               return "Esurian Rebounder";
            case param1 == 6 && param2 == 2:
               return "Esurian Acidedge";
            case param1 == 6 && param2 == 3:
               return "Esurian Cutlerist";
            case param1 == 6 && param2 == 4:
               return "Esurian Balmer";
            case param1 == 6 && param2 == 5:
               return "Esurian Dissolver";
            case param1 == 6 && param2 == 6:
               return "Esurian";
            case param1 == 7 && param2 == 1:
               return "Bovos Siegetank";
            case param1 == 7 && param2 == 2:
               return "Bovos Crusher";
            case param1 == 7 && param2 == 3:
               return "Bovos Bleeder";
            case param1 == 7 && param2 == 4:
               return "Bovos Herder";
            case param1 == 7 && param2 == 5:
               return "Bovos Stormer";
            case param1 == 7 && param2 == 6:
               return "Bovos";
            case param1 == 9 && param2 == 1:
               return "VLAD//ROM";
            case param1 == 9 && param2 == 2:
               return "Master Ioshia";
            case param1 == 9 && param2 == 3:
               return "Chef Jurassa";
            case param1 == 9 && param2 == 4:
               return "High Mystic Lucky";
            case param1 == 9 && param2 == 5:
               return "Madam Photovol";
            case param1 == 10 && param2 == 2:
               return "Slayer Bobaksuez";
            case param1 == 10 && param2 == 4:
               return "Lady Vintabas";
            default:
               return "No name!";
         }
      }

      public function getInfo(param1:int, param2:int):String
      {
         switch (true)
         {
            case param1 == 1 && param2 == 1:
               return "Gorger的大多数战斗策略都围绕着迅速的地下移动。一个石墙可以封锁隧道并防守数天，让盟友安全撤退。";
            case param1 == 1 && param2 == 2:
               return "虽然Gorger通常比较胆小，但Strongfist却有一种罕见的疯狂，驱使他们冲向敌人。他们带着盲目的愤怒追踪目标。";
            case param1 == 1 && param2 == 3:
               return "Slasher构成了Gorger社会的基层。虽然他们可以迅速且致命，但关键是要让他们朝敌人冲锋而不是逃跑。";
            case param1 == 1 && param2 == 4:
               return "每一代，都有一些Gorger天生具有魔法潜力。Wildtamer作为Gorger神秘信仰的宗教领袖。他们也是部落的治疗者。";
            case param1 == 1 && param2 == 5:
               return "Rockboomer是那些将力量转向破坏的Gorger - 他们可以用爆炸快速创造数英里的隧道；或者在敌人阵营中清出一条路。";
            case param1 == 1 && param2 == 6:
               return "Gorger是低等恶魔，被大多数其他部落视为害虫。天性胆小，以人类的简单恐惧为食。他们生活在由庞大地下网络连接的洞穴中。";
            case param1 == 2 && param2 == 1:
               return "来自用户手册：'TNK002型号配备了轻质装甲以确保最长运行时间。虽然火力不足，但TNK系列将是最后一个倒下的机器人。'";
            case param1 == 2 && param2 == 2:
               return "来自用户手册：'FIT143型号设计有可升级的核心摩擦系统，允许按需提高刀片扭矩。对准你的敌人，看它大显身手！'";
            case param1 == 2 && param2 == 3:
               return "单位背面的印记：'无法在短回收时间内让离子刀片旋转起来。不如把这个单位派去侦察任务。该死，那本来会很酷的。-P'";
            case param1 == 2 && param2 == 4:
               return "来自广告：'厌倦了部署的单位总是故障？生物单位太疲惫？PecuLabs有答案！HLR211型号使用纳米技术修复机械和血肉单位！'";
            case param1 == 2 && param2 == 5:
               return "侧面刻着：'检查负离子过充率。上一批在部署后不久就爆炸了。伤亡率高。可能作为进攻特性推广？-P'";
            case param1 == 2 && param2 == 6:
               return "虽然是由贪婪设计来补充她姐妹们的力量，但Mechiza的MCU遭遇了AI故障，导致所有单位叛变。Pecunia对此事的唯一评论是'不退款！'";
            case param1 == 3 && param2 == 1:
               return "与其他防御者不同，Phasmos Breaker放弃了通常的盾牌，采用双持格挡风格。他们的主要任务是守护分隔虚空和梦网的薄纱。";
            case param1 == 3 && param2 == 2:
               return "Phasmos Cleaver接受了Somna的唯一任务：屠杀任何愚蠢到穿越虚空的Shavees。他们使用重剑，并在剑上施加了防腐诅咒。";
            case param1 == 3 && param2 == 3:
               return "虽然护甲轻便，Phasmos Stalker可能是其家族中最危险的角色：他们负责突破并侦察梦网。他们也充当刺客，通过跳跃梦境追踪猎物。";
            case param1 == 3 && param2 == 4:
               return "Phasmos Weaver因此得名，因为他们会在梦网裂隙出现时将其'缝合'起来。重度施加防护以对抗其奇怪的能量，他们在Somna捍卫虚空中扮演重要角色。";
            case param1 == 3 && param2 == 5:
               return "出人意料的是，Reapers是唯一与对抗Shavees无关的种族。他们使用强大的魔法从梦境中的凡人身上收集能量以供给Somna。";
            case param1 == 3 && param2 == 6:
               return "大多数人认为Somna及其Phasmos家族懒惰；很少有人知道他们一直在努力遏制梦网：一个威胁着溢出虚空的恶魔梦境。";
            case param1 == 4 && param2 == 1:
               return "The Vanguards are an esteemed position within Swarm society. Trusted with the protection of the Hive, Vanguard status is only earned after years of toiling in battle.";
            case param1 == 4 && param2 == 2:
               return "Known for their grace as well as their speed, the Blades have shunned the usual daggers for a lightweight two-hander. They are often promoted to Vanguards after they have proven their worth.";
            case param1 == 4 && param2 == 3:
               return "Assassins make up the bulk of the swarm combatants. Swift, silent, and deadly, they  move quickly and strike without remorse. Most assassins never achieve a higher status in the Swarm.";
            case param1 == 4 && param2 == 4:
               return "The production and consumption of nectar is vital to the Swarm's survival. When not in combat or tending wounds, Menders oversee the majority of nectar production and distribution.";
            case param1 == 4 && param2 == 5:
               return "Beezelba's telepathic power is strong, but as the Swarm grew, she realized she would need assistance. Imbued with a portion of her power, Callers act as telepathic signal boosters.";
            case param1 == 4 && param2 == 6:
               return "As the embodiment of Envy, Beezelba is often overcome with intense paranoia. The Swarm's telepathic network allows her to know what they are thinking at all times, granting her mind rest.";
            case param1 == 5 && param2 == 1:
               return "Roars are the bravest amongst the Illosa and act as guardians of Vanorel's territory. They use their magic to create crystalline barriers to protect themselves and others from harm.";
            case param1 == 5 && param2 == 2:
               return "Screams are the most fierce of Vanorel's children. While most Illosa are good natured in their pranks, Screams often use their illusions to deadly effect, impaling their victims on sharp spikes.";
            case param1 == 5 && param2 == 3:
               return "Whispers are rarely seen outside the boundary of the Crystal Forest and spend their days in solitude amongst its glass spires. Slow to anger, they swiftly strike with calculated, deadly accuracy.";
            case param1 == 5 && param2 == 4:
               return "The kindest of Illosa, Chants often use their illusions to bring peace to those who suffer or delight to those who weep. They are also in charge of the growth and upkeep of the Crystal Forest.";
            case param1 == 5 && param2 == 5:
               return "If Screams are the most ferocious, then Screechs are the maddest. Their illusions are often bizarre and surreal, placing their victims in a confused and bewildered state before the slaughter.";
            case param1 == 5 && param2 == 6:
               return "The Illosa are servents of Vanorel and feed on the pride and ego of humanity. Tricksters by nature, they delight in using illusions to confuse and frustrate their enemies.";
            case param1 == 6 && param2 == 1:
               return "Esurian Rebounders have consumed vast amounts of armor and metal plating. Although the alloys have dissolved, their gel has become hardened and resilient to damage.";
            case param1 == 6 && param2 == 2:
               return "The Acidedge are produced when a Rebounder replicates after consuming items imbued with hatred, fear, and anger. They develop a single, sharp tendril coated in an acidic ooze.";
            case param1 == 6 && param2 == 3:
               return "Cutlerists are bred by Gluttony with purpose: by consuming various cooking utensils, they become surprisingly agile and are considered some of the Netherworld's best chefs.";
            case param1 == 6 && param2 == 4:
               return "Esurian Balmers have consumed various healing elixirs and positive magical energy, thus, their gel has become almost a perfect panacea for almost any disease or injury.";
            case param1 == 6 && param2 == 5:
               return "Unlike most other clan's mages, the Dissolvers are considered to be the lowest on the Esurian social ladder. They possess very little outside the desire to endlessly consume.";
            case param1 == 6 && param2 == 6:
               return "Esurians are bred from overconsumption. Once they feed to a certain point, they split and begin the process anew. As worshippers of Gluttony, they take on the attributes of the consumed.";
            case param1 == 7 && param2 == 1:
               return "Bovos are very good at two things: breaking walls and being walls. The Siegetanks are the latter. Hundreds of pounds of pure muscle and grit, these behemoths are a living, breathing fortification.";
            case param1 == 7 && param2 == 2:
               return "The Bovos believe in simplicity in war. While most other demon clans run around with their fancy swords and intricate combat technics, the Crushers find a swing of their oversized mace much more efficient.";
            case param1 == 7 && param2 == 3:
               return "They laughed when Irania told them she had formed a squad of Bovos scouts. They insisted scouts needed stealth and a guile lost to the Bovos. They stopped laughing when the Bleeders came crashing through the walls.";
            case param1 == 7 && param2 == 4:
               return "At first, Irania frowed upon the idea of some of the Bovos turning their power to healing, but eventually acknoweldged their strategic use. Unlike other healers, the Herders are found often on the front lines.";
            case param1 == 7 && param2 == 5:
               return "Bred for melee combat, the Bovos rarely have any in their ranks with magical ability. In battle, the Stormers cloud the field - distracting ranged threats so their counterparts can close distance and strike.";
            case param1 == 7 && param2 == 6:
               return "Irania never felt any demon clan was worthy of her. But one day, she found her self fighting an ancient minotaur. While he was no match, he did manage to land a single blow. Impressed, Irania mated him on the spot.";
            case param1 == 9 && param2 == 1:
               return "Note found tucked in User Manual: 'Well of course I could pull out the dark energy generator and add an enhanced defensive shield matrix. But why would you want me to? -P'";
            case param1 == 9 && param2 == 2:
               return "Ioshia was an experiment designed by Beezelba to create a more powerful drone assassin. However, she was able to break Beezelba's psionic bonds and left the swarm, obsessed with perfecting her arts.";
            case param1 == 9 && param2 == 3:
               return "Master Chef. Queen of Cutlerists. While most Esurians are great cooks, Chef Jurassa happened to absorb a cookbook that somehow found its way from the Mortal Realm. Just don't order the fish.";
            case param1 == 9 && param2 == 4:
               return "Lucky was an especially gifted Wildtamer who was looked upon favorably by the Gorger Mask Spirits. Not belonging to any Gorger clan, he prefers to wander the Nether, helping those who need it.";
            case param1 == 9 && param2 == 5:
               return "Madam Photovol is one of Vanorel's prized performers. She is know across the Netherealm, and even beyond, for not only her entrancing voice, but also her ability to weave beautiful illusions for the crowd.";
            case param1 == 10 && param2 == 2:
               return "Can nightmares themselves feel fear? If they could, then it would be the shadow of Bobaksuez that would cause them panic. Fur burned white from Twillrot, Bobaksuez has slain legions in Somna's name.";
            case param1 == 10 && param2 == 4:
               return "It was Vintabas that managed to change Irania's mind about 'wasting' soldiers in healing roles.  The first of her kind, she proved her breed's worth by mixing savage offense with constant health recovery.";
            default:
               return "No information";
         }
      }

      public function getDescription(param1:String, param2:int, param3:int):String
      {
         switch (true)
         {
            case param1 == "Protect":
               return "保护目标单位，减少受到的伤害 " + param2 + " 持续 " + param3 + " 回合";
            case param1 == "Curse":
               return "诅咒目标单位，增加受到的伤害 " + param2 + " 持续 " + param3 + " 回合";
            case param1 == "Regen":
               return "祝福目标单位，恢复 " + param2 + " 点生命值，持续 " + param3 + " 回合";
            case param1 == "Poison":
               return "使目标单位中毒，造成 " + param2 + " 点伤害，持续 " + param3 + " 回合";
            case param1 == "Boost":
               return "增强目标单位的力量，提升 " + param2 + " 点攻击力，持续 " + param3 + " 回合";
            case param1 == "Weaken":
               return "削弱目标单位的力量，降低 " + param2 + " 点攻击力，持续 " + param3 + " 回合";
            case param1 == "Warcry":
               return "增强所有友军的力量，提升 " + param2 + " 点攻击力，持续 " + param3 + " 回合";
            case param1 == "Intimidate":
               return "削弱所有敌人的力量，降低 " + param2 + " 点攻击力，持续 " + param3 + " 回合";
            case param1 == "Heal":
               return "恢复目标单位 " + param2 + " 点生命值";
            case param1 == "Flare":
               return "用火焰打击目标敌人，造成 " + param2 + " 点直接伤害";
            case param1 == "Rallycry":
               return "恢复场上所有友军 " + param2 + " 点生命值";
            case param1 == "Thunderstorm":
               return "用闪电打击所有敌人，对每个目标造成 " + param2 + " 点直接伤害";
            case param1 == "Taunt":
               return "被此单位攻击的目标在2回合内无法切换位置";
            case param1 == "Enrage":
               return "此单位在控制者的每个回合结束后获得1点攻击力";
            case param1 == "Quickstrike":
               return "此单位每回合可以进行两次攻击";
            case param1 == "Mend":
               return "此单位在回合结束时为受伤的友军恢复2点生命值";
            case param1 == "Impact":
               return "此单位的攻击对周围敌人造成50%的攻击伤害";
            case param1 == "Mighty Guard":
               return "使单位免疫普通伤害";
            case param1 == "Voodoo":
               return "Lucky降低目标5点生命值并给予其5点攻击力";
            case param1 == "Death Strike":
               return "被Master Ioshia攻击的敌人会在下一回合结束时死亡";
            case param1 == "Lullaby":
               return "每回合Photovol有50%的几率使敌人陷入恍惚状态";
            case param1 == "Shield Dome":
               return "VLAD//ROM建立防护罩，为所有友军提供保护和恢复效果，持续6回合";
            case param1 == "Burnt Fish":
               return "Jurassa嘲讽、削弱并使所有敌人中毒，持续6回合";
            case param1 == "Ravage":
               return "Bobaksuez的攻击吞噬目标的灵魂，治疗自身一半造成的伤害";
            case param1 == "Milky Wave":
               return "Vintabas治疗和恢复友军，同时伤害和使敌人中毒";
            default:
               return "";
         }
      }

      public function loadBossCombat(param1:int):void
      {
         this.bossVars(param1);
         this.bossStage();
         this.loadEva();
         this.loadBoss();
      }

      public function bossVars(param1:int):void
      {
         var _loc2_:int = 0;
         this.gameState = 12;
         this.combatLevel = param1;
         this.euType = 10;
         this.vinTint = 0;
         this.combatState = 0;
         this.defaultGrid = 7;
         this.currentGrid = 7;
         this.targetGrid = 7;
         this.bossDam = 0;
         this.pecuNuke = 0;
         this.pecuDamage = false;
         this.activeAbility = 0;
         this.skillType = 0;
         this.skillTarget = -1;
         this.mouseLock = true;
         this.skillLock = false;
         this.selecting = false;
         this.combatHand = this.getHand();
         this.combatArray = new Array();
         this.rocksArray = new Array();
         this.combatTurn = 0;
         this.combatConvert = new Array();
         this.combatConvert[0] = new Array();
         this.combatConvert[1] = new Array();
         this.combatConvert[2] = new Array();
         this.bossLoot();
         this.objList = new Array();
         _loc2_ = 0;
         while (_loc2_ < 21)
         {
            this.combatArray[_loc2_] = "0000";
            _loc2_++;
         }
         switch (true)
         {
            case this.combatLevel == 100:
               this.combatStats = new Array(100, 0, 0, 100, 0, 0, 0, 0, 99, 0, 99, 100, true, 100, 2, 0, 0, 0);
               break;
            case this.combatLevel == 101:
               this.combatStats = new Array(100, 0, 0, 750, 0, 0, 0, 0, 99, 0, 99, 750, true, 100, 101, 0, 0, 0);
               break;
            case this.combatLevel == 102:
               this.combatStats = new Array(100, 0, 0, 100, 0, 0, 0, 0, 99, 0, 99, 100, true, 100, 3, 0, 0, 0);
               break;
            case this.combatLevel == 103:
               this.combatStats = new Array(100, 0, 0, 400, 0, 0, 0, 0, 99, 0, 99, 400, true, 100, 3, 0, 0, 0);
               break;
            case this.combatLevel == 104:
               this.combatStats = new Array(100, 0, 0, 200, 0, 0, 0, 0, 99, 0, 99, 200, true, 100, 3, 0, 0, 0);
               break;
            case this.combatLevel == 105:
               this.combatStats = new Array(100, 0, 0, 100, 0, 0, 0, 0, 99, 0, 99, 100, true, 100, 6, 0, 0, 0);
               break;
            case this.combatLevel == 106:
               this.combatStats = new Array(100, 0, 0, 999, 0, 0, 0, 0, 99, 0, 99, 999, true, 100, 3, 0, 0, 0);
               break;
            default:
               this.combatStats = new Array(100, 0, 0, 100, 0, 0, 0, 0, 99, 0, 99, 100, true, 100, 2, 0, 0, 0);
         }
         this.combatStats[0] = this.charData[2];
         this.combatStats[13] = this.charData[11];
      }

      public function bossLoot():void
      {
         var _loc1_:int = 0;
         var _loc2_:Array = null;
         _loc1_ = 1;
         while (_loc1_ < 32)
         {
            _loc2_ = new Array();
            _loc2_[1] = "0000";
            _loc2_[2] = "0000";
            switch (true)
            {
               case this.combatLevel == 100 && _loc1_ == 1:
                  _loc2_[1] = new Array(1, 2, 1);
                  break;
               case this.combatLevel == 100 && _loc1_ == 2:
                  _loc2_[1] = new Array(2, 2, 1);
                  break;
               case this.combatLevel == 100 && _loc1_ == 3:
                  _loc2_[1] = new Array(3, 2, 1);
                  break;
               case this.combatLevel == 100 && _loc1_ == 4:
                  _loc2_[1] = new Array(4, 2, 1);
                  break;
               case this.combatLevel == 100 && _loc1_ == 5:
                  _loc2_[1] = new Array(5, 2, 1);
                  break;
               case this.combatLevel == 100 && _loc1_ == 6:
                  _loc2_[2] = new Array(3, 1, 2);
                  break;
               case this.combatLevel == 100 && _loc1_ == 7:
                  _loc2_[2] = new Array(4, 1, 2);
                  break;
               case this.combatLevel == 100 && _loc1_ == 8:
                  _loc2_[2] = new Array(5, 1, 2);
                  break;
               case this.combatLevel == 100 && _loc1_ == 9:
                  _loc2_[2] = new Array(6, 1, 2);
                  break;
               case this.combatLevel == 101 && _loc1_ == 10:
                  _loc2_[1] = new Array(1, 3, 1);
                  break;
               case this.combatLevel == 101 && _loc1_ == 11:
                  _loc2_[1] = new Array(2, 3, 1);
                  break;
               case this.combatLevel == 101 && _loc1_ == 12:
                  _loc2_[1] = new Array(3, 3, 1);
                  break;
               case this.combatLevel == 101 && _loc1_ == 13:
                  _loc2_[1] = new Array(4, 3, 1);
                  break;
               case this.combatLevel == 101 && _loc1_ == 14:
                  _loc2_[1] = new Array(5, 3, 1);
                  break;
               case this.combatLevel == 101 && _loc1_ == 15:
                  _loc2_[2] = new Array(3, 2, 2);
                  break;
               case this.combatLevel == 101 && _loc1_ == 16:
                  _loc2_[2] = new Array(4, 2, 2);
                  break;
               case this.combatLevel == 101 && _loc1_ == 17:
                  _loc2_[2] = new Array(5, 2, 2);
                  break;
               case this.combatLevel == 101 && _loc1_ == 18:
                  _loc2_[2] = new Array(6, 2, 2);
                  break;
               case this.combatLevel == 104 && _loc1_ == 19:
                  _loc2_[1] = new Array(1, 2, 2);
                  break;
               case this.combatLevel == 104 && _loc1_ == 20:
                  _loc2_[1] = new Array(2, 2, 2);
                  break;
               case this.combatLevel == 104 && _loc1_ == 21:
                  _loc2_[1] = new Array(3, 2, 2);
                  break;
               case this.combatLevel == 104 && _loc1_ == 22:
                  _loc2_[1] = new Array(4, 2, 2);
                  break;
               case this.combatLevel == 104 && _loc1_ == 23:
                  _loc2_[1] = new Array(5, 2, 1);
                  break;
               case this.combatLevel == 104 && _loc1_ == 24:
                  _loc2_[2] = new Array(1, 3, 2);
                  break;
               case this.combatLevel == 104 && _loc1_ == 25:
                  _loc2_[2] = new Array(2, 3, 2);
                  break;
               case this.combatLevel == 104 && _loc1_ == 26:
                  _loc2_[2] = new Array(3, 3, 2);
                  break;
               case this.combatLevel == 104 && _loc1_ == 27:
                  _loc2_[2] = new Array(4, 3, 2);
                  break;
               case this.combatLevel == 105 && _loc1_ == 28:
                  _loc2_[2] = new Array(6, 3, 2);
                  break;
               case this.combatLevel == 105 && _loc1_ == 29:
                  _loc2_[2] = new Array(6, 3, 2);
                  break;
               case this.combatLevel == 105 && _loc1_ == 30:
                  _loc2_[2] = new Array(6, 3, 2);
                  break;
               case this.combatLevel == 105 && _loc1_ == 31:
                  _loc2_[2] = new Array(6, 3, 2);
            }
            if (_loc2_[1] != "0000")
            {
               this.combatConvert[1][this.combatConvert[1].length] = _loc2_[1].concat();
            }
            if (_loc2_[2] != "0000")
            {
               this.combatConvert[2][this.combatConvert[2].length] = _loc2_[2].concat();
            }
            _loc1_++;
         }
      }

      public function bossStage():void
      {
         var _loc1_:int = 0;
         this.gameFader = new asFader();
         this.gameFader.stop();
         this.bgHolder = new asBG();
         switch (true)
         {
            case this.combatLevel == 100:
               this.bgHolder.gotoAndStop(3);
               break;
            case this.combatLevel == 101:
               this.bgHolder.gotoAndStop(6);
               break;
            case this.combatLevel == 102:
               this.bgHolder.gotoAndStop(7);
               break;
            case this.combatLevel == 103:
               this.bgHolder.gotoAndStop(7);
               break;
            case this.combatLevel == 104:
               this.bgHolder.gotoAndStop(7);
               break;
            case this.combatLevel == 105:
               this.bgHolder.gotoAndStop(9);
               break;
            case this.combatLevel == 106:
               this.bgHolder.gotoAndStop(11);
         }
         this.obHolder = new MovieClip();
         this.obHolder.mouseEnabled = false;
         this.uiHolder = new asGUI();
         this.uiHolder.btnAction.gotoAndStop(1);
         this.combatGrid = new asGrid();
         addChild(this.bgHolder);
         addChild(this.combatGrid);
         addChild(this.obHolder);
         addChild(this.uiHolder);
         addChild(this.gameFader);
         addChild(this.mainMask);
         this.bgHolder.mask = this.mainMask;
         this.combatGrid.mask = this.mainMask;
         this.obHolder.mask = this.mainMask;
         this.uiHolder.mask = this.mainMask;
         this.uiHolder.hand.handGlow.gotoAndStop(1);
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            this.combatGrid["grid" + _loc1_].mouseChildren = false;
            _loc1_++;
         }
      }

      public function loadEva():void
      {
         var _loc1_:MovieClip = null;
         this.charMod = 100;
         _loc1_ = new asBoss(-100, this.combatGrid.grid7.y, this.charData[0]);
         this.obHolder.addChild(_loc1_);
         this.objList.push(_loc1_);
         this.combatArray[7] = new Array(0, 0, 0, 0, 0, 0, 0);
         this.combatArray[7][0] = new Array();
         this.combatArray[7][1] = new Array(this.charData[0], 1);
         this.combatArray[7][2] = new Array(0, 1);
         this.combatArray[7][3] = new Array();
         this.combatArray[7][4] = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, false);
         this.combatArray[7][5] = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
         this.combatArray[7][6] = new Array(0, 1);
         if (this.combatLevel == 102)
         {
            this.combatArray[10] = this.createEnemy(19, 6, 1, 0, 1);
            this.placeToken(10);
         }
         if (this.combatLevel == 104)
         {
            this.pecuVars = new Array(3, false, 0, 0, 0, 0);
            this.combatArray[13] = this.createEnemy(21, 6, 1, 0, 1);
            this.placeToken(13);
         }
         this.combatState = 1;
      }

      public function checkEva():void
      {
         if (this.objList[0].x < this.combatGrid.grid7.x)
         {
            this.objList[0].x += 10;
         }
         else
         {
            this.objList[0].x = this.combatGrid.grid7.x;
            this.objList[0].stageClip.gotoAndStop(2);
            this.combatState = 2;
         }
      }

      public function getHand():Array
      {
         switch (true)
         {
            case this.combatLevel == 102:
               return new Array("0000", "0000", "0000", "0000", "0000", "0000");
            case this.charData[0] == 1:
               return new Array("1001", "1002", "1003", "1004", "0000", "1006");
            default:
               return new Array("0000", "0000", "0000", "0000", "0000", "0000");
         }
      }

      public function getMove():int
      {
         switch (true)
         {
            case this.charData[0] == 1:
               return 2;
            case this.charData[0] == 2:
               return 2;
            case this.charData[0] == 3:
               return 3;
            case this.charData[0] == 4:
               return 1;
            case this.charData[0] == 5:
               return 1;
            default:
               return 1;
         }
      }

      public function bossTick():void
      {
         if (!this.eventLock)
         {
            if (!this.diaLock)
            {
               if (this.combatStats[0] == 0)
               {
                  this.combatState = 8;
               }
               if (!this.animationLock)
               {
                  switch (true)
                  {
                     case this.combatState == 1:
                        this.checkEva();
                        break;
                     case this.combatState == 2:
                        this.prepEva();
                        break;
                     case this.combatState == 3:
                        this.evaTurn();
                        break;
                     case this.combatState == 4:
                        this.evaAction();
                        break;
                     case this.combatState == 5:
                        this.prepEnemy();
                        break;
                     case this.combatState == 6:
                        this.prepUnits(-1);
                        break;
                     case this.combatState == 7:
                        this.bossEnemyActive();
                        break;
                     case this.combatState == 8:
                        this.endMatch();
                  }
               }
               else
               {
                  switch (true)
                  {
                     case this.combatState == 1:
                        this.checkEva();
                        break;
                     case this.combatState == 3:
                        this.evaTurn();
                        break;
                     case this.combatState == 4:
                        this.evaAction();
                        break;
                     case this.combatState == 8:
                        this.endMatch();
                  }
               }
               this.checkDead();
               this.checkDepth();
               this.checkObjects();
            }
         }
         else
         {
            this.monitorBossEvent();
         }
      }

      public function monitorBossEvent():void
      {
         if (this.cSpecial != null)
         {
            if (this.combatLevel < 200)
            {
               this.cSpecial.stop();
               if (this.cSpecial.currentFrame != this.cSpecial.totalFrames)
               {
                  this.cSpecial.nextFrame();
                  this.cSpecial.stop();
               }
               else
               {
                  this.uiHolder.removeChild(this.cSpecial);
                  removeChild(this.specMask);
                  this.cSpecial = null;
                  this.eventLock = false;
                  this.animationLock = true;
                  switch (true)
                  {
                     case this.combatLevel == 100:
                        this.vanShatterImpact();
                        break;
                     case this.combatLevel == 101:
                        this.headacheImpact();
                        break;
                     case this.combatLevel == 104:
                        this.pecuDagger();
                        break;
                     case this.combatLevel == 106:
                        this.gateExtermImpact();
                  }
               }
            }
         }
      }

      public function bossClick(param1:MouseEvent):void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if (!this.eventLock)
         {
            if (param1.target.name == "btnFlee" && !this.skillLock)
            {
               this.combatState = 8;
               this.combatFail(this.combatLevel);
            }
            else if (!this.animationLock && !this.skillLock)
            {
               switch (true)
               {
                  case this.combatState == 3 && param1.target.name == "btnSpec" && this.combatStats[6] == 5:
                     this.bossDeSpell();
                     this.combatSpecial();
                     break;
                  case this.combatState == 3 && param1.target.name == "token11" && !this.selecting:
                     if (this.uiHolder.hand.handGlow.currentFrame != 2 && this.uiHolder.hand.token11.alpha == 1)
                     {
                        this.selecting = true;
                        this.uiHolder.hand.handGlow.gotoAndStop(2);
                        this.bossMarker(1);
                        this.uiHolder.charBar.updateBossAtk(this.bossDam);
                     }
                     break;
                  case this.combatState == 3 && param1.target.name == "token12" && !this.selecting:
                     if (this.uiHolder.hand.handGlow.currentFrame != 3 && this.uiHolder.hand.token12.alpha == 1)
                     {
                        this.selecting = true;
                        this.uiHolder.hand.handGlow.gotoAndStop(3);
                        this.bossMarker(2);
                        this.uiHolder.charBar.updateBossAtk(this.bossDam);
                     }
                     break;
                  case this.combatState == 3 && param1.target.name == "token13" && !this.selecting:
                     if (this.uiHolder.hand.handGlow.currentFrame != 4 && this.uiHolder.hand.token13.alpha == 1)
                     {
                        this.selecting = true;
                        this.uiHolder.hand.handGlow.gotoAndStop(4);
                        this.bossMarker(3);
                        this.uiHolder.charBar.updateBossAtk(this.bossDam);
                     }
                     break;
                  case this.combatState == 3 && param1.target.name == "token14" && !this.selecting:
                     if (this.uiHolder.hand.handGlow.currentFrame != 5 && this.uiHolder.hand.token14.alpha == 1)
                     {
                        this.selecting = true;
                        this.uiHolder.hand.handGlow.gotoAndStop(5);
                        this.bossMarker(4);
                        this.uiHolder.charBar.updateBossAtk(this.bossDam);
                     }
                     break;
                  case this.combatState == 3 && param1.target.name == "token15" && !this.selecting:
                     if (this.uiHolder.hand.handGlow.currentFrame != 6 && this.uiHolder.hand.token15.alpha == 1)
                     {
                        this.selecting = true;
                        this.uiHolder.hand.handGlow.gotoAndStop(6);
                        this.bossMarker(5);
                        this.uiHolder.charBar.updateBossAtk(this.bossDam);
                     }
                     break;
                  case this.combatState == 3 && param1.target.name == "token16" && !this.selecting:
                     if (this.uiHolder.hand.handGlow.currentFrame != 7 && this.uiHolder.hand.token16.alpha == 1)
                     {
                        this.selecting = true;
                        this.uiHolder.hand.handGlow.gotoAndStop(7);
                        this.bossMarker(6);
                        this.uiHolder.charBar.updateBossAtk(this.bossDam);
                     }
                     break;
                  case this.combatState == 3 && param1.target.name == "btnReset":
                     this.resetMoves();
                     break;
                  case this.combatState == 3 && param1.target.name == "btnCancel":
                     this.uiHolder.charBar.updateBossAtk(this.bossDam);
                     this.bossDeSpell();
                     break;
                  case this.combatState == 3 && param1.target.name == "btnAction" && param1.target.currentFrame == 2:
                     this.endEvaTurn();
                     break;
                  case this.combatState == 8:
                     this.unloadCombat();
               }
               _loc2_ = 0;
               while (_loc2_ < 21)
               {
                  if (this.combatState == 3 && param1.target.name == "grid" + _loc2_)
                  {
                     this.bossGridClick(_loc2_);
                  }
                  _loc2_++;
               }
            }
            else if (this.skillLock)
            {
               switch (true)
               {
                  case this.combatState == 3 && param1.target.name == "btnCancel":
                     this.uiHolder.charBar.updateBossAtk(this.bossDam);
                     this.bossDeSpell();
                     break;
                  case this.combatState == 3 && param1.target.name == "btnAction" && param1.target.currentFrame == 2:
                     this.endEvaTurn();
               }
               _loc3_ = 0;
               while (_loc3_ < 21)
               {
                  if (this.combatState == 3 && param1.target.name == "grid" + _loc3_ && (this.combatGrid["grid" + _loc3_].currentFrame == 2 || this.combatGrid["grid" + _loc3_].currentFrame == 5))
                  {
                     this.bossSpellClick(_loc3_);
                  }
                  _loc3_++;
               }
            }
         }
         else if (this.cSpecial != null && this.combatLevel >= 200)
         {
            if (this.cSpecial.eventType > 0 && this.cSpecial.eventType != this.cSpecial.maxType)
            {
               this.cSpecial.loadNextEvent();
            }
            else if (this.cSpecial.eventType != 0)
            {
               this.uiHolder.removeChild(this.cSpecial);
               removeChild(this.specMask);
               this.cSpecial = null;
               this.eventLock = false;
               this.combatLevel = 0;
            }
         }
      }

      public function bossMarker(param1:int):void
      {
         this.skillLock = true;
         this.skillType = this.charData[0] * 10 + param1;
         this.skillTemp = this.charData[0] * 10 + param1;
         switch (true)
         {
            case param1 == 1 && this.charData[0] == 1:
               this.rangeBasic(1);
               this.getDamage(11);
               break;
            case param1 == 1 && this.charData[0] == 2:
               this.rangeBasic(1);
               this.getDamage(12);
               break;
            case param1 == 1 && this.charData[0] == 3:
               this.rangeBasic(1);
               this.getDamage(13);
               break;
            case param1 == 1 && this.charData[0] == 4:
               this.rangeBasic(2);
               this.getDamage(14);
               break;
            case param1 == 1 && this.charData[0] == 5:
               this.rangeBasic(3);
               this.getDamage(15);
               break;
            case param1 == 2 && this.charData[0] == 1:
               this.rangeSelf();
               this.getDamage(21);
               break;
            case param1 == 2 && this.charData[0] == 2:
               this.rangeSelf();
               this.getDamage(22);
               break;
            case param1 == 2 && this.charData[0] == 3:
               this.bossCart();
               this.rangeMove(0);
               this.getDamage(23);
               break;
            case param1 == 2 && this.charData[0] == 4:
               this.rangeSelf();
               this.getDamage(24);
               break;
            case param1 == 2 && this.charData[0] == 5:
               this.rangeSelf();
               this.getDamage(25);
               break;
            case param1 == 3 && this.charData[0] == 1:
               this.bossSlam();
               this.getDamage(31);
               break;
            case param1 == 3 && this.charData[0] == 2:
               this.rangeEnemies(1);
               this.getDamage(32);
               break;
            case param1 == 3 && this.charData[0] == 3:
               this.bossDash();
               this.getDamage(33);
               break;
            case param1 == 3 && this.charData[0] == 4:
               this.bossDash();
               this.getDamage(34);
               break;
            case param1 == 3 && this.charData[0] == 5:
               this.bossPort();
               this.getDamage(35);
               break;
            case param1 == 4 && this.charData[0] == 1:
               this.rangeSelf();
               this.getDamage(41);
               break;
            case param1 == 4 && this.charData[0] == 2:
               this.rangeSelf();
               this.getDamage(42);
               break;
            case param1 == 4 && this.charData[0] == 3:
               this.rangeSelf();
               this.getDamage(43);
               break;
            case param1 == 4 && this.charData[0] == 4:
               this.rangeSelf();
               this.getDamage(44);
               break;
            case param1 == 4 && this.charData[0] == 5:
               this.rangeEnemies(2);
               this.getDamage(45);
               break;
            case param1 == 5 && this.charData[0] == 1:
               this.rangeAoE();
               this.getDamage(0);
               break;
            case param1 == 5 && this.charData[0] == 2:
               this.rangeAoE();
               this.getDamage(0);
               break;
            case param1 == 5 && this.charData[0] == 3:
               this.rangeAoE();
               this.getDamage(0);
               break;
            case param1 == 5 && this.charData[0] == 4:
               this.rangeAoE();
               this.getDamage(0);
               break;
            case param1 == 5 && this.charData[0] == 5:
               this.rangeAoE();
               this.getDamage(0);
               break;
            case param1 == 6 && this.charData[0] == 1:
               this.rangeSelf();
               this.getDamage(61);
               break;
            case param1 == 6 && this.charData[0] == 2:
               this.bossWhirl();
               this.getDamage(62);
               break;
            case param1 == 6 && this.charData[0] == 3:
               this.bossShadow();
               this.getDamage(63);
               break;
            case param1 == 6 && this.charData[0] == 4:
               this.rangeEnemies(0);
               this.getDamage(64);
               break;
            case param1 == 6 && this.charData[0] == 5:
               this.rangeEnemies(0);
               this.getDamage(65);
         }
      }

      public function getDamage(param1:int):void
      {
         switch (true)
         {
            case param1 == 11:
               this.bossDam = Math.floor(this.charData[1] * this.charData[10] + this.combatArray[this.currentGrid][4][4]);
               break;
            case param1 == 12:
               this.bossDam = Math.floor(this.charData[1] * this.charData[10] + this.combatArray[this.currentGrid][4][4]);
               break;
            case param1 == 13:
               this.bossDam = Math.floor(this.charData[1] * this.charData[10] + this.combatArray[this.currentGrid][4][4]);
               break;
            case param1 == 14:
               this.bossDam = Math.floor(this.charData[1] * this.charData[10] + this.combatArray[this.currentGrid][4][4]);
               break;
            case param1 == 15:
               this.bossDam = Math.floor(this.charData[1] * this.charData[10] + this.combatArray[this.currentGrid][4][4]);
               break;
            case param1 == 31:
               this.bossDam = Math.floor((this.charData[1] * this.charData[10] + this.combatArray[this.currentGrid][4][4]) * 2);
               break;
            case param1 == 32:
               this.bossDam = Math.floor(this.charData[1] * this.charData[10] + this.combatArray[this.currentGrid][4][4]);
               break;
            case param1 == 33:
               this.bossDam = Math.floor(this.charData[1] * this.charData[10] + this.combatArray[this.currentGrid][4][4]);
               break;
            case param1 == 62:
               this.bossDam = Math.floor((this.charData[1] * this.charData[10] + this.combatArray[this.currentGrid][4][4]) * 2);
               break;
            case param1 == 63:
               this.bossDam = Math.floor((this.charData[1] * this.charData[10] + this.combatArray[this.currentGrid][4][4]) * 2);
               break;
            case param1 == 64:
               this.bossDam = Math.floor((this.charData[1] * this.charData[10] + this.combatArray[this.currentGrid][4][4]) * 2);
               break;
            case param1 == 65:
               this.bossDam = Math.floor((this.charData[1] * this.charData[10] + this.combatArray[this.currentGrid][4][4]) * 2);
               break;
            default:
               this.bossDam = 0;
         }
      }

      public function rangeAoE():void
      {
         this.skillLock = true;
         this.uiHolder.btnAction.gotoAndStop(4);
         this.uiHolder.charBar.deckIcon.gotoAndStop(3);
         if (this.currentGrid > 6)
         {
            this.combatGrid["grid" + (this.currentGrid - 7)].gotoAndStop(2);
         }
         if (this.currentGrid < 14)
         {
            this.combatGrid["grid" + (this.currentGrid + 7)].gotoAndStop(2);
         }
         if (this.currentGrid != 0 && this.currentGrid != 7 && this.currentGrid != 14)
         {
            this.combatGrid["grid" + (this.currentGrid - 1)].gotoAndStop(2);
         }
         this.combatGrid["grid" + (this.currentGrid + 1)].gotoAndStop(2);
      }

      public function rangeEnemies(param1:int):void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if (param1 == 0)
         {
            _loc2_ = 0;
            while (_loc2_ < 21)
            {
               if (this.combatArray[_loc2_] != "0000" && this.combatArray[_loc2_][6][1] == -1)
               {
                  this.combatGrid["grid" + _loc2_].gotoAndStop(5);
               }
               if (this.combatLevel != 103 && this.combatLevel != 104)
               {
                  this.combatGrid["grid13"].gotoAndStop(5);
               }
               _loc2_++;
            }
         }
         else if (param1 == 1)
         {
            switch (true)
            {
               case this.currentGrid < 7:
                  _loc3_ = 7;
                  break;
               case this.currentGrid < 14:
                  _loc3_ = 14;
                  break;
               case this.currentGrid < 21:
                  _loc3_ = 21;
            }
            _loc4_ = 1;
            while (_loc4_ < 3)
            {
               if (this.currentGrid + _loc4_ < _loc3_)
               {
                  this.combatGrid["grid" + (this.currentGrid + _loc4_)].gotoAndStop(5);
                  if (_loc3_ == 7)
                  {
                     this.combatGrid["grid" + (this.currentGrid + _loc4_ + 7)].gotoAndStop(5);
                     this.combatGrid["grid" + (this.currentGrid + _loc4_ + 14)].gotoAndStop(5);
                  }
                  else if (_loc3_ == 14)
                  {
                     this.combatGrid["grid" + (this.currentGrid + _loc4_ - 7)].gotoAndStop(5);
                     this.combatGrid["grid" + (this.currentGrid + _loc4_ + 7)].gotoAndStop(5);
                  }
                  else if (_loc3_ == 21)
                  {
                     this.combatGrid["grid" + (this.currentGrid + _loc4_ - 7)].gotoAndStop(5);
                     this.combatGrid["grid" + (this.currentGrid + _loc4_ - 14)].gotoAndStop(5);
                  }
               }
               _loc4_++;
            }
         }
         else if (param1 == 2)
         {
            _loc5_ = 0;
            while (_loc5_ < 21)
            {
               if (this.combatArray[_loc5_] != "0000" && this.combatArray[_loc5_][6][1] == -1)
               {
                  this.combatGrid["grid" + _loc5_].gotoAndStop(5);
               }
               _loc5_++;
            }
         }
      }

      public function rangeMove(param1:int):void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if (param1 == 0)
         {
            switch (true)
            {
               case this.currentGrid < 7:
                  _loc2_ = 0;
                  break;
               case this.currentGrid < 14:
                  _loc2_ = 7;
                  break;
               case this.currentGrid < 21:
                  _loc2_ = 14;
            }
            _loc3_ = 1;
            while (_loc3_ < 6)
            {
               if (this.currentGrid - _loc3_ > _loc2_)
               {
                  this.combatGrid["grid" + (this.currentGrid - _loc3_)].gotoAndStop(4);
               }
               _loc3_++;
            }
            this.combatGrid["grid" + _loc2_].gotoAndStop(5);
         }
      }

      public function rangeSelf():void
      {
         this.combatGrid["grid" + this.currentGrid].gotoAndStop(5);
      }

      public function rangeBasic(param1:int):void
      {
         var _loc2_:int = 0;
         _loc2_ = 1;
         while (_loc2_ <= param1)
         {
            if (this.currentGrid < 7 && this.currentGrid + _loc2_ < 7)
            {
               this.combatGrid["grid" + (this.currentGrid + _loc2_)].gotoAndStop(5);
            }
            else if (this.currentGrid >= 7)
            {
               if (this.currentGrid < 14 && this.currentGrid + _loc2_ < 14)
               {
                  this.combatGrid["grid" + (this.currentGrid + _loc2_)].gotoAndStop(5);
               }
               else if (this.currentGrid >= 14)
               {
                  if (this.currentGrid + _loc2_ < 21)
                  {
                     this.combatGrid["grid" + (this.currentGrid + _loc2_)].gotoAndStop(5);
                  }
               }
            }
            _loc2_++;
         }
      }

      public function prepEva():void
      {
         if (this.combatStats[0] == 0)
         {
            this.combatState = 8;
         }
         else
         {
            this.combatTurn += 1;
            this.updateEvaBuffs(1);
            this.checkEvaRegen();
            this.bossDam = 0;
            this.charData[5] = false;
            if (this.combatLevel != 102)
            {
               if (this.combatStats[2] < 10)
               {
                  this.combatStats[2] += 2;
               }
               if (this.combatStats[1] < 10)
               {
                  this.combatStats[1] += 2;
                  if (this.combatStats[1] > 10)
                  {
                     this.combatStats[1] = 10;
                  }
               }
               if (this.combatStats[6] < 5 && this.combatStats[7] == 0)
               {
                  this.combatStats[6] += 1;
               }
            }
            if (this.combatLevel == 104)
            {
               this.pecuVars[0] = 3;
               this.pecuVars[1] = false;
            }
            if (this.combatStats[7] > 0)
            {
               this.combatStats[7] = this.combatStats[7] - 1;
               if (this.combatStats[7] == 0)
               {
                  this.combatGrid.sfx.gotoAndStop(1);
               }
            }
            this.defaultGrid = this.currentGrid;
            this.combatStats[16] = this.getMove();
            this.uiHolder.charBar.updateGUI();
            this.uiHolder.hand.updateHand();
            this.uiHolder.btnAction.gotoAndStop(2);
            this.combatState = 3;
         }
      }

      public function checkEvaRegen():void
      {
         if (this.combatArray[this.currentGrid][5][2] > 0)
         {
            this.animationLock = true;
            this.objList[0].stageClip.gotoAndStop(7);
            this.combatStats[0] += this.combatArray[this.currentGrid][4][2];
            if (this.combatStats[0] > this.combatStats[13])
            {
               this.combatStats[0] = this.combatStats[13];
            }
            this.uiHolder.hand.updateHand();
            this.uiHolder.charBar.updateGUI();
         }
      }

      public function prepEnemy():void
      {
         if (this.combatStats[3] == 0 && this.combatGrid.sfx.currentFrame == 2)
         {
            this.combatState = 8;
         }
         else if (this.combatStats[3] == 0 && this.combatGrid.sfx.currentFrame != 2)
         {
            switch (true)
            {
               case this.combatLevel == 100:
                  this.combatStats[3] = 100;
                  this.loadDia(200107);
                  break;
               case this.combatLevel == 101:
                  this.combatStats[3] = 500;
                  this.loadDia(200207);
                  break;
               case this.combatLevel == 105:
                  this.combatState = 8;
            }
            this.uiHolder.enemyBar.updateGUI();
         }
         else if (!this.animationLock)
         {
            if (this.summoning)
            {
               if (this.combatStats[15] < 5)
               {
                  this.combatStats[15] += 1;
               }
               this.uiHolder.enemyBar.updateGUI();
               this.updateEvaBuffs(2);
               this.combatState = 6;
            }
            else
            {
               switch (true)
               {
                  case this.combatLevel == 100:
                     this.getVanoralAction();
                     break;
                  case this.combatLevel == 101:
                     this.getVinaraAction();
                     break;
                  case this.combatLevel == 102:
                     this.getPecuniaAction_1();
                     break;
                  case this.combatLevel == 103:
                     this.getPecuniaAction_2();
                     break;
                  case this.combatLevel == 104:
                     this.getPecuniaAction_3();
                     break;
                  case this.combatLevel == 105:
                     this.getSomnaAction();
                     break;
                  case this.combatLevel == 106:
                     this.getGateGuardAction();
               }
            }
         }
      }

      public function updateEvaBuffs(param1:int):void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while (_loc2_ < 11)
         {
            if (this.combatArray[this.currentGrid][5][_loc2_] > 0)
            {
               switch (true)
               {
                  case _loc2_ == 0 && param1 == 1:
                     -- this.combatArray[this.currentGrid][5][_loc2_];
                     break;
                  case _loc2_ == 2 && param1 == 2:
                     -- this.combatArray[this.currentGrid][5][_loc2_];
                     break;
                  case _loc2_ == 4 && param1 == 2:
                     -- this.combatArray[this.currentGrid][5][_loc2_];
               }
               if (this.combatArray[this.currentGrid][5][_loc2_] == 0)
               {
                  if (_loc2_ == 10)
                  {
                     this.combatArray[this.currentGrid][4][_loc2_] = false;
                     this.objList[0].updateStats(this.combatArray[this.currentGrid]);
                  }
                  else
                  {
                     this.combatArray[this.currentGrid][4][_loc2_] = 0;
                     this.objList[0].updateStats(this.combatArray[this.currentGrid]);
                  }
               }
            }
            _loc2_++;
         }
         if (this.charData[7] > 0 && param1 == 1)
         {
            this.charData[7] = this.charData[7] - 1;
            if (this.charData[7] == 0)
            {
               this.charData[6] = false;
               this.objList[0].updateStats(this.combatArray[this.currentGrid]);
            }
         }
      }

      public function bossEnemyActive():void
      {
         switch (true)
         {
            case this.combatArray[14] != "0000" && this.combatArray[14][6][1] == -1 && !this.combatArray[14][6][6]:
               this.activateEnemy(14);
               break;
            case this.combatArray[7] != "0000" && this.combatArray[7][6][1] == -1 && !this.combatArray[7][6][6]:
               this.activateEnemy(7);
               break;
            case this.combatArray[0] != "0000" && this.combatArray[0][6][1] == -1 && !this.combatArray[0][6][6]:
               this.activateEnemy(0);
               break;
            case this.combatArray[15] != "0000" && this.combatArray[15][6][1] == -1 && !this.combatArray[15][6][6]:
               this.activateEnemy(15);
               break;
            case this.combatArray[8] != "0000" && this.combatArray[8][6][1] == -1 && !this.combatArray[8][6][6]:
               this.activateEnemy(8);
               break;
            case this.combatArray[1] != "0000" && this.combatArray[1][6][1] == -1 && !this.combatArray[1][6][6]:
               this.activateEnemy(1);
               break;
            case this.combatArray[16] != "0000" && this.combatArray[16][6][1] == -1 && !this.combatArray[16][6][6]:
               this.activateEnemy(16);
               break;
            case this.combatArray[9] != "0000" && this.combatArray[9][6][1] == -1 && !this.combatArray[9][6][6]:
               this.activateEnemy(9);
               break;
            case this.combatArray[2] != "0000" && this.combatArray[2][6][1] == -1 && !this.combatArray[2][6][6]:
               this.activateEnemy(2);
               break;
            case this.combatArray[17] != "0000" && this.combatArray[17][6][1] == -1 && !this.combatArray[17][6][6]:
               this.activateEnemy(17);
               break;
            case this.combatArray[10] != "0000" && this.combatArray[10][6][1] == -1 && !this.combatArray[10][6][6]:
               this.activateEnemy(10);
               break;
            case this.combatArray[3] != "0000" && this.combatArray[3][6][1] == -1 && !this.combatArray[3][6][6]:
               this.activateEnemy(3);
               break;
            case this.combatArray[18] != "0000" && this.combatArray[18][6][1] == -1 && !this.combatArray[18][6][6]:
               this.activateEnemy(18);
               break;
            case this.combatArray[11] != "0000" && this.combatArray[11][6][1] == -1 && !this.combatArray[11][6][6]:
               this.activateEnemy(11);
               break;
            case this.combatArray[4] != "0000" && this.combatArray[4][6][1] == -1 && !this.combatArray[4][6][6]:
               this.activateEnemy(4);
               break;
            case this.combatArray[19] != "0000" && this.combatArray[19][6][1] == -1 && !this.combatArray[19][6][6]:
               this.activateEnemy(19);
               break;
            case this.combatArray[12] != "0000" && this.combatArray[12][6][1] == -1 && !this.combatArray[12][6][6]:
               this.activateEnemy(12);
               break;
            case this.combatArray[5] != "0000" && this.combatArray[5][6][1] == -1 && !this.combatArray[5][6][6]:
               this.activateEnemy(5);
               break;
            case this.combatArray[20] != "0000" && this.combatArray[20][6][1] == -1 && !this.combatArray[20][6][6]:
               this.activateEnemy(20);
               break;
            case this.combatArray[13] != "0000" && this.combatArray[13][6][1] == -1 && !this.combatArray[13][6][6]:
               this.activateEnemy(13);
               break;
            case this.combatArray[6] != "0000" && this.combatArray[6][6][1] == -1 && !this.combatArray[6][6][6]:
               this.activateEnemy(6);
               break;
            case this.combatLevel == 104:
               this.prepPecu();
               break;
            default:
               this.combatState = 2;
         }
      }

      public function bossGridClick(param1:int):void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if (this.combatArray[param1] != "0000")
         {
            if (this.combatArray[param1][6][1] == 1 && this.combatStats[16] > 0)
            {
               this.bossDeSpell();
               if (!this.selecting)
               {
                  this.selecting = true;
                  if (param1 < 6)
                  {
                     if (param1 != 5 && this.combatArray[param1 + 1] == "0000")
                     {
                        this.combatGrid["grid" + (param1 + 1)].gotoAndStop(2);
                     }
                     if (param1 != 0 && this.combatArray[param1 - 1] == "0000")
                     {
                        this.combatGrid["grid" + (param1 - 1)].gotoAndStop(2);
                     }
                     if (this.combatArray[param1 + 7] == "0000")
                     {
                        this.combatGrid["grid" + (param1 + 7)].gotoAndStop(2);
                     }
                  }
                  else if (param1 < 13)
                  {
                     if (param1 != 12 && this.combatArray[param1 + 1] == "0000")
                     {
                        this.combatGrid["grid" + (param1 + 1)].gotoAndStop(2);
                     }
                     if (param1 != 7 && this.combatArray[param1 - 1] == "0000")
                     {
                        this.combatGrid["grid" + (param1 - 1)].gotoAndStop(2);
                     }
                     if (this.combatArray[param1 + 7] == "0000")
                     {
                        this.combatGrid["grid" + (param1 + 7)].gotoAndStop(2);
                     }
                     if (this.combatArray[param1 - 7] == "0000")
                     {
                        this.combatGrid["grid" + (param1 - 7)].gotoAndStop(2);
                     }
                  }
                  else if (param1 < 20)
                  {
                     if (param1 != 19 && this.combatArray[param1 + 1] == "0000")
                     {
                        this.combatGrid["grid" + (param1 + 1)].gotoAndStop(2);
                     }
                     if (param1 != 14 && this.combatArray[param1 - 1] == "0000")
                     {
                        this.combatGrid["grid" + (param1 - 1)].gotoAndStop(2);
                     }
                     if (this.combatArray[param1 - 7] == "0000")
                     {
                        this.combatGrid["grid" + (param1 - 7)].gotoAndStop(2);
                     }
                  }
               }
               else
               {
                  _loc2_ = 0;
                  while (_loc2_ < 21)
                  {
                     this.combatGrid["grid" + _loc2_].gotoAndStop(1);
                     _loc2_++;
                  }
                  this.selecting = false;
               }
            }
         }
         else if (this.combatGrid["grid" + param1].currentFrame == 2)
         {
            this.selecting = false;
            _loc3_ = 0;
            while (_loc3_ < 21)
            {
               this.combatGrid["grid" + _loc3_].gotoAndStop(1);
               _loc3_++;
            }
            if (param1 == this.currentGrid - 1)
            {
               this.objList[0].stageClip.gotoAndStop(11);
            }
            else if (param1 == this.currentGrid + 1)
            {
               this.objList[0].stageClip.gotoAndStop(3);
            }
            this.combatStats[16] = this.combatStats[16] - 1;
            this.uiHolder.charBar.updateGUI();
            this.targetGrid = param1;
         }
      }

      public function evaTurn():void
      {
         this.checkSpecial();
         if (this.targetGrid != this.currentGrid)
         {
            this.animationLock = true;
            if (this.objList[0].x > this.combatGrid["grid" + this.targetGrid].x)
            {
               this.objList[0].x -= 10;
               if (this.objList[0].x <= this.combatGrid["grid" + this.targetGrid].x)
               {
                  this.objList[0].x = this.combatGrid["grid" + this.targetGrid].x;
               }
            }
            else if (this.objList[0].x < this.combatGrid["grid" + this.targetGrid].x)
            {
               this.objList[0].x += 10;
               if (this.objList[0].x >= this.combatGrid["grid" + this.targetGrid].x)
               {
                  this.objList[0].x = this.combatGrid["grid" + this.targetGrid].x;
               }
            }
            if (this.objList[0].y > this.combatGrid["grid" + this.targetGrid].y)
            {
               this.objList[0].y -= 10;
               if (this.objList[0].y <= this.combatGrid["grid" + this.targetGrid].y)
               {
                  this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y;
               }
            }
            else if (this.objList[0].y < this.combatGrid["grid" + this.targetGrid].y)
            {
               this.objList[0].y += 10;
               if (this.objList[0].y >= this.combatGrid["grid" + this.targetGrid].y)
               {
                  this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y;
               }
            }
            if (this.objList[0].x == this.combatGrid["grid" + this.targetGrid].x && this.objList[0].y == this.combatGrid["grid" + this.targetGrid].y)
            {
               switch (true)
               {
                  case this.targetGrid == 0:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 6;
                     break;
                  case this.targetGrid == 1:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 5;
                     break;
                  case this.targetGrid == 2:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 4;
                     break;
                  case this.targetGrid == 3:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 3;
                     break;
                  case this.targetGrid == 4:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 2;
                     break;
                  case this.targetGrid == 5:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 1;
                     break;
                  case this.targetGrid == 6:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 0;
                     break;
                  case this.targetGrid == 7:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 6;
                     break;
                  case this.targetGrid == 8:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 5;
                     break;
                  case this.targetGrid == 9:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 4;
                     break;
                  case this.targetGrid == 10:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 3;
                     break;
                  case this.targetGrid == 11:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 2;
                     break;
                  case this.targetGrid == 12:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 1;
                     break;
                  case this.targetGrid == 13:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 0;
                     break;
                  case this.targetGrid == 14:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 6;
                     break;
                  case this.targetGrid == 15:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 5;
                     break;
                  case this.targetGrid == 16:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 4;
                     break;
                  case this.targetGrid == 17:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 3;
                     break;
                  case this.targetGrid == 18:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 2;
                     break;
                  case this.targetGrid == 19:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 1;
                     break;
                  case this.targetGrid == 20:
                     this.objList[0].y = this.combatGrid["grid" + this.targetGrid].y + 0;
               }
               this.objList[0].stageClip.gotoAndStop(2);
               this.combatArray[this.targetGrid] = new Array();
               this.combatArray[this.targetGrid][0] = this.combatArray[this.currentGrid][0].concat();
               this.combatArray[this.targetGrid][1] = this.combatArray[this.currentGrid][1].concat();
               this.combatArray[this.targetGrid][2] = this.combatArray[this.currentGrid][2].concat();
               this.combatArray[this.targetGrid][3] = this.combatArray[this.currentGrid][3].concat();
               this.combatArray[this.targetGrid][4] = this.combatArray[this.currentGrid][4].concat();
               this.combatArray[this.targetGrid][5] = this.combatArray[this.currentGrid][5].concat();
               this.combatArray[this.targetGrid][6] = this.combatArray[this.currentGrid][6].concat();
               this.combatArray[this.currentGrid] = "0000";
               this.currentGrid = this.targetGrid;
            }
         }
      }

      public function resetMoves():void
      {
         var _loc1_:int = 0;
         if (this.defaultGrid != this.currentGrid)
         {
            this.combatArray[this.defaultGrid] = new Array();
            this.combatArray[this.defaultGrid][0] = this.combatArray[this.currentGrid][0].concat();
            this.combatArray[this.defaultGrid][1] = this.combatArray[this.currentGrid][1].concat();
            this.combatArray[this.defaultGrid][2] = this.combatArray[this.currentGrid][2].concat();
            this.combatArray[this.defaultGrid][3] = this.combatArray[this.currentGrid][3].concat();
            this.combatArray[this.defaultGrid][4] = this.combatArray[this.currentGrid][4].concat();
            this.combatArray[this.defaultGrid][5] = this.combatArray[this.currentGrid][5].concat();
            this.combatArray[this.defaultGrid][6] = this.combatArray[this.currentGrid][6].concat();
            this.combatArray[this.currentGrid] = "0000";
            this.objList[0].x = this.combatGrid["grid" + this.defaultGrid].x;
            this.objList[0].y = this.combatGrid["grid" + this.defaultGrid].y;
         }
         this.currentGrid = this.defaultGrid;
         this.targetGrid = this.defaultGrid;
         this.combatStats[16] = this.getMove();
         this.uiHolder.charBar.updateGUI();
         this.selecting = false;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            this.combatGrid["grid" + _loc1_].gotoAndStop(1);
            _loc1_++;
         }
         this.bossDeSpell();
      }

      public function endEvaTurn():void
      {
         var _loc1_:int = 0;
         this.skillLock = false;
         this.selecting = false;
         this.damageArray = new Array();
         if (this.uiHolder.charBar.bossAtk.currentFrame != 1)
         {
            this.uiHolder.charBar.bossAtk.gotoAndStop(1);
         }
         this.activeAbility = this.uiHolder.hand.handGlow.currentFrame - 1;
         this.uiHolder.hand.handGlow.gotoAndStop(1);
         this.uiHolder.btnAction.gotoAndStop(1);
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatGrid["grid" + _loc1_].currentFrame == 5)
            {
               this.damageArray.push(_loc1_);
            }
            this.combatGrid["grid" + _loc1_].gotoAndStop(1);
            _loc1_++;
         }
         this.combatState = 4;
      }

      public function evaAction():void
      {
         this.uiHolder.charBar.deckIcon.gotoAndStop(2);
         if (!this.animationLock)
         {
            switch (true)
            {
               case this.skillType == 11:
                  this.executeAttack(1);
                  break;
               case this.skillType == 12:
                  this.executeBlock();
                  break;
               case this.skillType == 13:
                  this.executeSlam();
                  break;
               case this.skillType == 14:
                  this.executeBuff(0);
                  break;
               case this.skillType == 15:
                  this.executePecuDia();
                  break;
               case this.skillType == 16:
                  this.executeBuff(10);
                  break;
               case this.skillType == 21:
                  this.executeAttack(2);
                  break;
               case this.skillType == 22:
                  this.executeBlock();
                  break;
               case this.skillType == 23:
                  this.executeCleave();
                  break;
               case this.skillType == 24:
                  this.executeBuff(4);
                  break;
               case this.skillType == 25:
                  this.executePecuDia();
                  break;
               case this.skillType == 26:
                  this.executeWhirl();
                  break;
               case this.skillType == 31:
                  this.executeAttack(3);
                  break;
               case this.skillType == 32:
                  this.executeCart();
                  break;
               case this.skillType == 33:
                  this.executeDash();
                  break;
               case this.skillType == 34:
                  this.executeToxin();
                  break;
               case this.skillType == 35:
                  this.executePecuDia();
                  break;
               case this.skillType == 36:
                  this.executeShadow();
                  break;
               case this.skillType == 41:
                  this.executeAttack(4);
                  break;
               case this.skillType == 42:
                  this.executeHeal();
                  break;
               case this.skillType == 43:
                  this.executeDash();
                  break;
               case this.skillType == 44:
                  this.executeBuff(2);
                  break;
               case this.skillType == 45:
                  this.executePecuDia();
                  break;
               case this.skillType == 46:
                  this.executeAngel();
                  break;
               case this.skillType == 51:
                  this.executeAttack(5);
                  break;
               case this.skillType == 52:
                  this.executeBlock();
                  break;
               case this.skillType == 53:
                  this.executePort();
                  break;
               case this.skillType == 54:
                  this.executeBuff(-5);
                  break;
               case this.skillType == 55:
                  this.executePecuDia();
                  break;
               case this.skillType == 56:
                  this.executeRain();
                  break;
               case this.skillType == 0:
                  this.summoning = false;
                  this.checkDia();
                  this.combatState = 5;
                  break;
               default:
                  this.checkDia();
                  this.combatState = 5;
            }
         }
         else
         {
            switch (true)
            {
               case this.skillType == 32:
                  this.executeCart();
                  break;
               case this.skillType == 33:
                  this.executeDash();
                  break;
               case this.skillType == 43:
                  this.executeDash();
            }
         }
      }

      public function bossDeSpell():void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            this.combatGrid["grid" + _loc1_].gotoAndStop(1);
            _loc1_++;
         }
         this.uiHolder.btnAction.gotoAndStop(2);
         this.uiHolder.charBar.deckIcon.gotoAndStop(2);
         this.uiHolder.hand.handGlow.gotoAndStop(1);
         this.charData[8] = 0;
         this.charData[9] = new Array();
         this.skillType = 0;
         this.selecting = false;
         this.skillTarget = -1;
         this.skillLock = false;
      }

      public function bossSpellClick(param1:int):void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         _loc2_ = false;
         _loc3_ = 0;
         for (; _loc3_ < 21; _loc3_++)
         {
            if (this.combatGrid["grid" + _loc3_].currentFrame != 5)
            {
               continue;
            }
            switch (true)
            {
               case this.skillType == 13:
                  this.bossDeSpell();
                  this.skillType = 13;
                  this.bossSlam();
                  _loc2_ = true;
                  break;
               case this.skillType == 53:
                  this.bossDeSpell();
                  this.skillType = 53;
                  this.bossPort();
                  _loc2_ = true;
                  break;
               case this.skillType == 15:
                  this.bossDeSpell();
                  this.skillType = 15;
                  _loc2_ = true;
                  break;
               case this.skillType == 25:
                  this.bossDeSpell();
                  this.skillType = 25;
                  _loc2_ = true;
                  break;
               case this.skillType == 35:
                  this.bossDeSpell();
                  this.skillType = 35;
                  _loc2_ = true;
                  break;
               case this.skillType == 45:
                  this.bossDeSpell();
                  this.skillType = 45;
                  _loc2_ = true;
                  break;
               case this.skillType == 55:
                  this.bossDeSpell();
                  this.skillType = 55;
                  _loc2_ = true;
                  break;
            }
         }
         if (!_loc2_)
         {
            this.combatGrid["grid" + param1].gotoAndStop(5);
            if (this.skillType == 13)
            {
               switch (true)
               {
                  case param1 == 0:
                     this.combatGrid["grid" + (param1 + 1)].gotoAndStop(5);
                     this.combatGrid["grid" + (param1 + 7)].gotoAndStop(5);
                     break;
                  case param1 < 7:
                     this.combatGrid["grid" + (param1 + 1)].gotoAndStop(5);
                     this.combatGrid["grid" + (param1 - 1)].gotoAndStop(5);
                     this.combatGrid["grid" + (param1 + 7)].gotoAndStop(5);
                     break;
                  case param1 == 7:
                     this.combatGrid["grid" + (param1 + 1)].gotoAndStop(5);
                     this.combatGrid["grid" + (param1 + 7)].gotoAndStop(5);
                     this.combatGrid["grid" + (param1 - 7)].gotoAndStop(5);
                     break;
                  case param1 < 14:
                     this.combatGrid["grid" + (param1 + 1)].gotoAndStop(5);
                     this.combatGrid["grid" + (param1 - 1)].gotoAndStop(5);
                     this.combatGrid["grid" + (param1 + 7)].gotoAndStop(5);
                     this.combatGrid["grid" + (param1 - 7)].gotoAndStop(5);
                     break;
                  case param1 == 14:
                     this.combatGrid["grid" + (param1 - 7)].gotoAndStop(5);
                     this.combatGrid["grid" + (param1 + 1)].gotoAndStop(5);
                     break;
                  case param1 < 21:
                     this.combatGrid["grid" + (param1 + 1)].gotoAndStop(5);
                     this.combatGrid["grid" + (param1 - 1)].gotoAndStop(5);
                     this.combatGrid["grid" + (param1 - 7)].gotoAndStop(5);
               }
               this.combatGrid["grid" + this.currentGrid].gotoAndStop(2);
            }
            this.skillTarget = param1;
            this.uiHolder.btnAction.gotoAndStop(2);
         }
      }

      public function bossPort():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.skillLock = true;
         this.uiHolder.btnAction.gotoAndStop(4);
         this.uiHolder.charBar.deckIcon.gotoAndStop(3);
         switch (true)
         {
            case this.currentGrid < 7:
               _loc1_ = 6;
               _loc2_ = 0;
               break;
            case this.currentGrid < 14:
               _loc1_ = 13;
               _loc2_ = 7;
               break;
            case this.currentGrid < 21:
               _loc1_ = 20;
               _loc2_ = 14;
         }
         _loc3_ = 0;
         while (_loc3_ < 4)
         {
            if (this.currentGrid + _loc3_ < _loc1_)
            {
               if (this.combatArray[this.currentGrid + _loc3_] == "0000")
               {
                  this.combatGrid["grid" + (this.currentGrid + _loc3_)].gotoAndStop(2);
               }
               if (this.currentGrid + _loc3_ + 7 < 20 && this.combatArray[this.currentGrid + _loc3_ + 7] == "0000")
               {
                  this.combatGrid["grid" + (this.currentGrid + _loc3_ + 7)].gotoAndStop(2);
               }
               if (this.currentGrid + _loc3_ - 7 >= 0 && this.combatArray[this.currentGrid + _loc3_ - 7] == "0000")
               {
                  this.combatGrid["grid" + (this.currentGrid + _loc3_ - 7)].gotoAndStop(2);
               }
            }
            if (this.currentGrid - _loc3_ >= _loc2_)
            {
               if (this.combatArray[this.currentGrid - _loc3_] == "0000")
               {
                  this.combatGrid["grid" + (this.currentGrid - _loc3_)].gotoAndStop(2);
               }
               if (this.currentGrid - _loc3_ + 7 < 20 && this.combatArray[this.currentGrid - _loc3_ + 7] == "0000")
               {
                  this.combatGrid["grid" + (this.currentGrid - _loc3_ + 7)].gotoAndStop(2);
               }
               if (this.currentGrid - _loc3_ - 7 >= 0 && this.combatArray[this.currentGrid - _loc3_ - 7] == "0000")
               {
                  this.combatGrid["grid" + (this.currentGrid - _loc3_ - 7)].gotoAndStop(2);
               }
            }
            _loc3_++;
         }
      }

      public function bossSlam():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this.skillLock = true;
         this.uiHolder.btnAction.gotoAndStop(4);
         this.uiHolder.charBar.deckIcon.gotoAndStop(3);
         _loc1_ = 0;
         while (_loc1_ < 12)
         {
            _loc2_ = 99;
            switch (true)
            {
               case _loc1_ == 0 && this.currentGrid != 5 && this.currentGrid != 12 && this.currentGrid != 19:
                  _loc2_ = this.currentGrid + 1;
                  break;
               case _loc1_ == 1 && this.currentGrid != 5 && this.currentGrid != 12 && this.currentGrid != 19 && this.currentGrid != 4 && this.currentGrid != 11 && this.currentGrid != 18:
                  _loc2_ = this.currentGrid + 2;
                  break;
               case _loc1_ == 2 && this.currentGrid != 0 && this.currentGrid != 7 && this.currentGrid != 14:
                  _loc2_ = this.currentGrid - 1;
                  break;
               case _loc1_ == 3 && this.currentGrid != 0 && this.currentGrid != 7 && this.currentGrid != 14 && this.currentGrid != 1 && this.currentGrid != 8 && this.currentGrid != 15:
                  _loc2_ = this.currentGrid - 2;
                  break;
               case _loc1_ == 4 && this.currentGrid != 5 && this.currentGrid != 12 && this.currentGrid != 19:
                  _loc2_ = this.currentGrid - 6;
                  break;
               case _loc1_ == 5 && this.currentGrid != 0 && this.currentGrid != 7 && this.currentGrid != 14:
                  _loc2_ = this.currentGrid - 8;
                  break;
               case _loc1_ == 6 && this.currentGrid != 5 && this.currentGrid != 12 && this.currentGrid != 19:
                  _loc2_ = this.currentGrid + 8;
                  break;
               case _loc1_ == 7 && this.currentGrid != 0 && this.currentGrid != 7 && this.currentGrid != 14:
                  _loc2_ = this.currentGrid + 6;
                  break;
               case _loc1_ == 8:
                  _loc2_ = this.currentGrid + 7;
                  break;
               case _loc1_ == 9:
                  _loc2_ = this.currentGrid - 7;
                  break;
               case _loc1_ == 10:
                  _loc2_ = this.currentGrid - 14;
                  break;
               case _loc1_ == 11:
                  _loc2_ = this.currentGrid + 14;
            }
            if (_loc2_ >= 0 && _loc2_ < 21 && this.combatArray[_loc2_] == "0000")
            {
               this.combatGrid["grid" + _loc2_].gotoAndStop(2);
            }
            _loc1_++;
         }
         this.combatGrid["grid" + this.currentGrid].gotoAndStop(2);
      }

      public function bossCart():void
      {
         if (this.currentGrid == 0 || this.currentGrid == 7 || this.currentGrid == 14)
         {
            this.uiHolder.hand.handGlow.gotoAndStop(1);
            this.skillType = 0;
         }
      }

      public function bossShadow():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this.charData[8] = 3;
         this.charData[9] = new Array();
         if (this.combatLevel != 103 && this.combatLevel != 104)
         {
            this.charData[9].push(6);
            this.charData[9].push(13);
            this.charData[9].push(20);
            _loc2_ = 0;
            while (_loc2_ < 21)
            {
               switch (true)
               {
                  case _loc2_ != 6 && _loc2_ != 13 && _loc2_ != 20:
                     if (this.combatArray[_loc2_] != "0000" && this.combatArray[_loc2_][6][1] == -1)
                     {
                        this.charData[9].push(_loc2_);
                     }
                     break;
               }
               _loc2_++;
            }
         }
         else
         {
            this.charData[9].push(this.pecuLoc);
            this.charData[9].push(this.pecuLoc);
            this.charData[9].push(this.pecuLoc);
         }
         while (this.charData[9].length > 3)
         {
            this.charData[9].splice(0, 1);
         }
         this.tempX = this.objList[0].x;
         this.tempY = this.objList[0].y;
         _loc1_ = 0;
         while (_loc1_ < this.charData[9].length)
         {
            this.combatGrid["grid" + this.charData[9][_loc1_]].gotoAndStop(5);
            _loc1_++;
         }
      }

      public function bossDash():void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc1_ = new Array();
         _loc2_ = 1;
         while (_loc2_ < 4)
         {
            if (this.currentGrid < 6 && this.currentGrid + _loc2_ < 6)
            {
               if (this.combatArray[this.currentGrid + _loc2_] == "0000")
               {
                  _loc1_.push(this.currentGrid + _loc2_);
               }
            }
            else if (this.currentGrid > 6 && this.currentGrid < 13 && this.currentGrid + _loc2_ < 13)
            {
               if (this.combatArray[this.currentGrid + _loc2_] == "0000")
               {
                  _loc1_.push(this.currentGrid + _loc2_);
               }
            }
            else if (this.currentGrid > 13 && this.currentGrid < 20 && this.currentGrid + _loc2_ < 20)
            {
               if (this.combatArray[this.currentGrid + _loc2_] == "0000")
               {
                  _loc1_.push(this.currentGrid + _loc2_);
               }
            }
            _loc2_++;
         }
         if (_loc1_.length > 0)
         {
            this.dashGrid = _loc1_[_loc1_.length - 1];
            _loc3_ = 1;
            while (_loc3_ < this.dashGrid - this.currentGrid)
            {
               if (this.skillType == 43)
               {
                  this.combatGrid["grid" + (this.currentGrid + _loc3_)].gotoAndStop(3);
               }
               else
               {
                  this.combatGrid["grid" + (this.currentGrid + _loc3_)].gotoAndStop(5);
               }
               _loc3_++;
            }
            this.combatGrid["grid" + this.dashGrid].gotoAndStop(5);
         }
         else
         {
            this.uiHolder.hand.handGlow.gotoAndStop(1);
            this.skillType = 0;
         }
      }

      public function bossWhirl():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         switch (true)
         {
            case this.currentGrid < 7:
               _loc1_ = 7;
               _loc2_ = 1;
               break;
            case this.currentGrid < 14:
               _loc1_ = 14;
               _loc2_ = 8;
               break;
            case this.currentGrid < 21:
               _loc1_ = 21;
               _loc2_ = 15;
         }
         _loc3_ = 0;
         while (_loc3_ < 4)
         {
            if (this.currentGrid + _loc3_ < _loc1_)
            {
               this.combatGrid["grid" + (this.currentGrid + _loc3_)].gotoAndStop(5);
               if (this.currentGrid + _loc3_ + 7 < 21)
               {
                  this.combatGrid["grid" + (this.currentGrid + _loc3_ + 7)].gotoAndStop(5);
               }
               if (this.currentGrid + _loc3_ + 14 < 21)
               {
                  this.combatGrid["grid" + (this.currentGrid + _loc3_ + 14)].gotoAndStop(5);
               }
               if (this.currentGrid + _loc3_ - 7 >= 0)
               {
                  this.combatGrid["grid" + (this.currentGrid + _loc3_ - 7)].gotoAndStop(5);
               }
               if (this.currentGrid + _loc3_ - 14 >= 0)
               {
                  this.combatGrid["grid" + (this.currentGrid + _loc3_ - 14)].gotoAndStop(5);
               }
            }
            if (this.currentGrid - _loc3_ >= _loc2_)
            {
               this.combatGrid["grid" + (this.currentGrid - _loc3_)].gotoAndStop(5);
               if (this.currentGrid - _loc3_ + 7 < 21)
               {
                  this.combatGrid["grid" + (this.currentGrid - _loc3_ + 7)].gotoAndStop(5);
               }
               if (this.currentGrid - _loc3_ + 14 < 21)
               {
                  this.combatGrid["grid" + (this.currentGrid - _loc3_ + 14)].gotoAndStop(5);
               }
               if (this.currentGrid - _loc3_ - 7 >= 0)
               {
                  this.combatGrid["grid" + (this.currentGrid - _loc3_ - 7)].gotoAndStop(5);
               }
               if (this.currentGrid - _loc3_ - 14 >= 0)
               {
                  this.combatGrid["grid" + (this.currentGrid - _loc3_ - 14)].gotoAndStop(5);
               }
            }
            _loc3_++;
         }
         if (this.currentGrid == 0 || this.currentGrid == 7 || this.currentGrid == 14)
         {
            this.combatGrid.grid0.gotoAndStop(1);
            this.combatGrid.grid7.gotoAndStop(1);
            this.combatGrid.grid14.gotoAndStop(1);
         }
         this.combatGrid["grid" + this.currentGrid].gotoAndStop(1);
      }

      public function executeAngel():void
      {
         var _loc1_:int = 0;
         this.animationLock = true;
         this.combatStats[1] -= 8;
         _loc1_ = this.damageArray.length * this.bossDam;
         this.combatStats[0] += _loc1_;
         if (this.combatStats[0] > this.combatStats[13])
         {
            this.combatStats[0] = this.combatStats[13];
         }
         this.uiHolder.hand.updateHand();
         this.uiHolder.charBar.updateGUI();
         this.objList[0].stageClip.gotoAndStop(9);
         this.skillType = 0;
      }

      public function executeAttack(param1:int):void
      {
         this.animationLock = true;
         this.combatStats[1] = this.combatStats[1] - 1;
         this.uiHolder.hand.updateHand();
         this.uiHolder.charBar.updateGUI();
         this.objList[0].stageClip.gotoAndStop(4);
         this.skillType = 0;
      }

      public function executeBlock():void
      {
         this.animationLock = true;
         this.combatStats[1] = this.combatStats[1] - 1;
         this.uiHolder.hand.updateHand();
         this.charData[5] = true;
         this.uiHolder.charBar.updateGUI();
         this.objList[0].stageClip.gotoAndStop(5);
         this.skillType = 0;
      }

      public function executeBuff(param1:int):void
      {
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         this.animationLock = true;
         switch (true)
         {
            case param1 == 0:
               this.combatStats[1] -= 6;
               this.combatArray[this.currentGrid][4][0] = 10;
               this.combatArray[this.currentGrid][5][0] = 4;
               this.objList[0].stageClip.gotoAndStop(7);
               break;
            case param1 == 2:
               this.combatStats[1] -= 6;
               this.combatArray[this.currentGrid][4][2] = 10;
               this.combatArray[this.currentGrid][5][2] = 4;
               this.objList[0].stageClip.gotoAndStop(7);
               break;
            case param1 == 4:
               this.combatStats[1] -= 6;
               this.combatArray[this.currentGrid][4][4] = 10;
               this.combatArray[this.currentGrid][5][4] = 4;
               this.objList[0].stageClip.gotoAndStop(7);
               break;
            case param1 == 10:
               this.combatStats[1] -= 8;
               this.combatArray[this.currentGrid][4][0] = 9999;
               this.combatArray[this.currentGrid][5][0] = 1;
               this.objList[0].stageClip.gotoAndStop(9);
         }
         if (param1 == -5)
         {
            this.combatStats[1] -= 6;
            _loc2_ = 0;
            while (_loc2_ < 21)
            {
               if (this.combatArray[_loc2_] != "0000" && this.combatArray[_loc2_][6][1] == -1)
               {
                  _loc3_ = this.objList[this.combatArray[_loc2_][6][0]];
                  this.combatArray[_loc2_][4][5] = 5;
                  this.combatArray[_loc2_][5][5] = 4;
                  _loc3_.stageClip.gotoAndStop(5);
                  _loc3_.cfx.gotoAndStop(7);
                  _loc3_.updateStats(this.combatArray[_loc2_]);
                  this.combatArray[this.currentGrid][4][4] = 10;
                  this.combatArray[this.currentGrid][5][4] = 4;
                  this.objList[0].stageClip.gotoAndStop(7);
                  this.objList[0].cfx.gotoAndStop(6);
               }
               _loc2_++;
            }
         }
         this.uiHolder.hand.updateHand();
         this.uiHolder.charBar.updateGUI();
         this.objList[0].updateStats(this.combatArray[this.currentGrid]);
         this.skillType = 0;
      }

      public function executeCart():void
      {
         var _loc1_:int = 0;
         if (this.targetGrid == this.currentGrid)
         {
            switch (true)
            {
               case this.currentGrid < 6:
                  this.targetGrid = 0;
                  break;
               case this.currentGrid < 13:
                  this.targetGrid = 7;
                  break;
               case this.currentGrid < 20:
                  this.targetGrid = 14;
            }
            this.animationLock = true;
            this.objList[0].stageClip.gotoAndStop(5);
            this.combatStats[1] = this.combatStats[1] - 1;
            this.uiHolder.hand.updateHand();
            this.uiHolder.charBar.updateGUI();
         }
         if (this.objList[0].x > this.combatGrid["grid" + this.targetGrid].x)
         {
            this.objList[0].x -= 20;
            if (this.objList[0].x <= this.combatGrid["grid" + this.targetGrid].x)
            {
               this.objList[0].x = this.combatGrid["grid" + this.targetGrid].x;
            }
         }
         else if (this.objList[0].x == this.combatGrid["grid" + this.targetGrid].x)
         {
            this.objList[0].stageClip.gotoAndStop(12);
            this.combatArray[this.targetGrid] = new Array();
            _loc1_ = 0;
            while (_loc1_ < 7)
            {
               this.combatArray[this.targetGrid][_loc1_] = new Array();
               _loc1_++;
            }
            this.combatArray[this.targetGrid][0] = this.combatArray[this.currentGrid][0].concat();
            this.combatArray[this.targetGrid][1] = this.combatArray[this.currentGrid][1].concat();
            this.combatArray[this.targetGrid][2] = this.combatArray[this.currentGrid][2].concat();
            this.combatArray[this.targetGrid][3] = this.combatArray[this.currentGrid][3].concat();
            this.combatArray[this.targetGrid][4] = this.combatArray[this.currentGrid][4].concat();
            this.combatArray[this.targetGrid][5] = this.combatArray[this.currentGrid][5].concat();
            this.combatArray[this.targetGrid][6] = this.combatArray[this.currentGrid][6].concat();
            this.combatArray[this.currentGrid] = "0000";
            this.currentGrid = this.targetGrid;
            this.defaultGrid = this.targetGrid;
            this.charData[5] = true;
            this.skillType = 0;
         }
      }

      public function executeCleave():void
      {
         this.animationLock = true;
         this.combatStats[1] -= 4;
         this.uiHolder.hand.updateHand();
         this.uiHolder.charBar.updateGUI();
         this.objList[0].stageClip.gotoAndStop(6);
         this.skillType = 0;
      }

      public function executeDash():void
      {
         if (this.targetGrid == this.currentGrid)
         {
            this.targetGrid = this.dashGrid;
            this.animationLock = true;
            this.objList[0].stageClip.gotoAndStop(6);
            this.combatStats[1] -= 4;
            this.uiHolder.hand.updateHand();
            this.uiHolder.charBar.updateGUI();
         }
         if (this.objList[0].x < this.combatGrid["grid" + this.targetGrid].x)
         {
            this.objList[0].x += 20;
            if (this.objList[0].x >= this.combatGrid["grid" + this.targetGrid].x)
            {
               this.objList[0].x = this.combatGrid["grid" + this.targetGrid].x;
            }
         }
         else if (this.objList[0].x == this.combatGrid["grid" + this.targetGrid].x)
         {
            if (this.skillType == 33)
            {
               this.objList[0].stageClip.gotoAndStop(2);
               this.charData[5] = false;
            }
            else if (this.skillType == 43)
            {
               this.objList[0].stageClip.gotoAndStop(12);
               this.charData[5] = true;
            }
            if (this.targetGrid != this.currentGrid)
            {
               this.combatArray[this.targetGrid] = new Array();
               this.combatArray[this.targetGrid][0] = this.combatArray[this.currentGrid][0].concat();
               this.combatArray[this.targetGrid][1] = this.combatArray[this.currentGrid][1].concat();
               this.combatArray[this.targetGrid][2] = this.combatArray[this.currentGrid][2].concat();
               this.combatArray[this.targetGrid][3] = this.combatArray[this.currentGrid][3].concat();
               this.combatArray[this.targetGrid][4] = this.combatArray[this.currentGrid][4].concat();
               this.combatArray[this.targetGrid][5] = this.combatArray[this.currentGrid][5].concat();
               this.combatArray[this.targetGrid][6] = this.combatArray[this.currentGrid][6].concat();
               this.combatArray[this.currentGrid] = "0000";
            }
            this.currentGrid = this.targetGrid;
            this.defaultGrid = this.targetGrid;
            this.skillType = 0;
         }
      }

      public function executeHeal():void
      {
         this.animationLock = true;
         this.combatStats[1] = this.combatStats[1] - 1;
         this.combatStats[0] += Math.floor(this.combatStats[13] * 0.2);
         if (this.combatStats[0] > this.combatStats[13])
         {
            this.combatStats[0] = this.combatStats[13];
         }
         this.uiHolder.hand.updateHand();
         this.uiHolder.charBar.updateGUI();
         this.objList[0].stageClip.gotoAndStop(5);
         this.skillType = 0;
      }

      public function executePort():void
      {
         this.animationLock = true;
         this.combatStats[1] -= 4;
         this.uiHolder.hand.updateHand();
         this.uiHolder.charBar.updateGUI();
         this.objList[0].stageClip.gotoAndStop(6);
         this.skillType = 0;
      }

      public function executeRain():void
      {
         this.animationLock = true;
         this.combatStats[1] -= 8;
         this.uiHolder.hand.updateHand();
         this.uiHolder.charBar.updateGUI();
         this.objList[0].stageClip.gotoAndStop(9);
         this.skillType = 0;
      }

      public function executeShadow():void
      {
         if (this.charData[8] > 0)
         {
            -- this.charData[8];
            this.animationLock = true;
            this.objList[0].x = this.combatGrid["grid" + (this.charData[9][this.charData[8]] - 1)].x;
            this.objList[0].y = this.combatGrid["grid" + (this.charData[9][this.charData[8]] - 1)].y;
            this.objList[0].stageClip.gotoAndStop(9);
            this.executeDamage(this.charData[8]);
         }
         else
         {
            this.combatStats[1] -= 8;
            this.objList[0].x = this.tempX;
            this.objList[0].y = this.tempY;
            this.objList[0].stageClip.gotoAndStop(2);
            this.uiHolder.hand.updateHand();
            this.uiHolder.charBar.updateGUI();
            this.skillType = 0;
         }
      }

      public function executeSlam():void
      {
         this.animationLock = true;
         this.combatStats[1] -= 4;
         this.uiHolder.hand.updateHand();
         this.uiHolder.charBar.updateGUI();
         this.objList[0].stageClip.gotoAndStop(6);
         this.skillType = 0;
      }

      public function executeToxin():void
      {
         this.animationLock = true;
         this.charData[6] = true;
         this.charData[7] = 4;
         this.objList[0].updateStats(this.combatArray[this.currentGrid]);
         this.combatStats[1] -= 6;
         this.uiHolder.hand.updateHand();
         this.uiHolder.charBar.updateGUI();
         this.objList[0].stageClip.gotoAndStop(7);
         this.skillType = 0;
      }

      public function executeWhirl():void
      {
         this.animationLock = true;
         this.combatStats[1] -= 8;
         this.uiHolder.hand.updateHand();
         this.uiHolder.charBar.updateGUI();
         this.objList[0].stageClip.gotoAndStop(9);
         this.skillType = 0;
      }

      public function executeDamage(param1:int):*
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:MovieClip = null;
         var _loc5_:MovieClip = null;
         _loc2_ = false;
         if (param1 == -1)
         {
            _loc3_ = 0;
            while (_loc3_ < this.damageArray.length)
            {
               if (this.combatArray[this.damageArray[_loc3_]] != "0000")
               {
                  if (this.combatArray[this.damageArray[_loc3_]][6][1] == -1)
                  {
                     if (this.combatLevel == 104 && this.pecuWar.stageClip.currentFrame == 6)
                     {
                        this.pecuWhirl();
                     }
                     else
                     {
                        _loc4_ = this.objList[this.combatArray[this.damageArray[_loc3_]][6][0]];
                        _loc4_.stageClip.gotoAndStop(5);
                        switch (true)
                        {
                           case this.skillTemp == 41:
                              _loc4_.cfx.gotoAndStop(4);
                              break;
                           case this.skillTemp == 46:
                              _loc4_.cfx.gotoAndStop(4);
                              break;
                           case this.skillTemp == 51:
                              _loc4_.cfx.gotoAndStop(11);
                              break;
                           case this.skillTemp == 56:
                              _loc4_.cfx.gotoAndStop(11);
                        }
                        this.combatArray[this.damageArray[_loc3_]][3][2] -= this.bossDam;
                        if (this.charData[6])
                        {
                           this.combatArray[this.damageArray[_loc3_]][4][3] = 10;
                           this.combatArray[this.damageArray[_loc3_]][5][3] = 3;
                        }
                        _loc4_.updateStats(this.combatArray[this.damageArray[_loc3_]]);
                        if (this.combatArray[this.damageArray[_loc3_]][3][2] <= 0)
                        {
                           if (this.combatLevel != 104)
                           {
                              this.combatArray[this.damageArray[_loc3_]][3][2] = 0;
                              _loc4_.updateStats(this.combatArray[this.damageArray[_loc3_]]);
                              if (this.combatArray[this.damageArray[_loc3_]][0][7] == 14 || this.combatArray[this.damageArray[_loc3_]][0][7] == 15 || this.combatArray[this.damageArray[_loc3_]][0][7] == 16)
                              {
                                 _loc4_.stageClip.gotoAndStop(6);
                              }
                              else
                              {
                                 this.killUnit(this.damageArray[_loc3_], 0, 0);
                              }
                           }
                           else if (this.combatGrid.sfx.currentFrame == 2)
                           {
                              this.combatStats[3] = 0;
                              this.uiHolder.enemyBar.updateGUI();
                              this.combatState = 8;
                           }
                           else
                           {
                              this.combatStats[3] = 200;
                              this.combatArray[this.pecuLoc][3][2] = 200;
                              this.uiHolder.enemyBar.updateGUI();
                              this.pecuWar.updateStats(this.combatArray[this.pecuLoc]);
                              this.loadDia(200307);
                           }
                        }
                     }
                  }
               }
               else if (this.damageArray[_loc3_] == 6 || this.damageArray[_loc3_] == 13 || this.damageArray[_loc3_] == 20)
               {
                  if (!_loc2_)
                  {
                     this.executeStrike();
                     _loc2_ = true;
                  }
               }
               _loc3_++;
            }
         }
         else if (this.combatArray[this.charData[9][this.charData[8]]] != "0000")
         {
            _loc5_ = this.objList[this.combatArray[this.charData[9][this.charData[8]]][6][0]];
            _loc5_.stageClip.gotoAndStop(5);
            this.combatArray[this.charData[9][this.charData[8]]][3][2] -= this.bossDam;
            if (this.charData[6])
            {
               this.combatArray[this.charData[9][this.charData[8]]][4][3] = 10;
               this.combatArray[this.charData[9][this.charData[8]]][5][3] = 3;
            }
            _loc5_.updateStats(this.combatArray[this.charData[9][this.charData[8]]]);
            if (this.combatArray[this.charData[9][this.charData[8]]][3][2] <= 0)
            {
               if (this.combatLevel != 104)
               {
                  this.combatArray[this.charData[9][this.charData[8]]][3][2] = 0;
                  _loc5_.updateStats(this.combatArray[this.charData[9][this.charData[8]]]);
                  if (this.combatArray[this.charData[9][this.charData[8]]][0][7] == 14 || this.combatArray[this.charData[9][this.charData[8]]][0][7] == 15 || this.combatArray[this.charData[9][this.charData[8]]][0][7] == 16)
                  {
                     _loc5_.stageClip.gotoAndStop(6);
                  }
                  else
                  {
                     this.killUnit(this.charData[9][this.charData[8]], 0, 0);
                  }
               }
               else if (this.combatGrid.sfx.currentFrame == 2)
               {
                  this.combatStats[3] = 0;
                  this.uiHolder.enemyBar.updateGUI();
                  this.combatState = 8;
               }
               else
               {
                  this.combatStats[3] = 200;
                  this.combatArray[this.pecuLoc][3][2] = 200;
                  this.uiHolder.enemyBar.updateGUI();
                  this.pecuWar.updateStats(this.combatArray[this.pecuLoc]);
                  this.loadDia(200307);
               }
            }
         }
         else if (this.charData[9][this.charData[8]] == 6 || this.charData[9][this.charData[8]] == 13 || this.charData[9][this.charData[8]] == 20)
         {
            if (!_loc2_)
            {
               if (this.skillType == 36)
               {
                  this.bossDam = Math.floor((this.charData[1] + this.combatArray[this.currentGrid][4][4]) * this.charData[10]);
               }
               this.executeStrike();
               _loc2_ = true;
            }
         }
      }

      public function executeStrike():*
      {
         if (this.combatLevel != 103 && this.combatLevel != 104)
         {
            this.combatStats[3] -= this.bossDam;
            this.boss.stageClip.gotoAndStop(5);
            switch (true)
            {
               case this.skillTemp == 41:
                  this.boss.cfx.gotoAndStop(4);
                  break;
               case this.skillTemp == 46:
                  this.boss.cfx.gotoAndStop(4);
                  break;
               case this.skillTemp == 51:
                  this.boss.cfx.gotoAndStop(11);
                  break;
               case this.skillTemp == 56:
                  this.boss.cfx.gotoAndStop(11);
            }
            if (this.combatStats[3] < 0)
            {
               this.combatStats[3] = 0;
            }
            this.uiHolder.enemyBar.updateGUI();
         }
      }

      public function loadBossFinal(param1:int):void
      {
         this.eventLock = true;
         switch (true)
         {
            case param1 == 1:
               this.specialEvents[14] = 1;
               this.cSpecial = new asModEvent(141);
               break;
            case param1 == 2:
               this.specialEvents[15] = 1;
               this.cSpecial = new asModEvent(151);
               break;
            case param1 == 3:
               this.specialEvents[13] = 1;
               this.cSpecial = new asModEvent(131);
               break;
            case param1 == 4:
               this.specialEvents[16] = 1;
               this.cSpecial = new asModEvent(161);
         }
         this.uiHolder.addChild(this.cSpecial);
         addChild(this.specMask);
         this.cSpecial.mask = this.specMask;
      }

      public function getVanoralAction():void
      {
         if (this.cSpecial == null)
         {
            switch (true)
            {
               case this.combatTurn == 1:
                  this.vanSummonClones();
                  break;
               case this.combatTurn == 2:
                  this.vanStellarBeam();
                  break;
               case this.combatTurn == 3:
                  this.vanStellarBeam();
                  break;
               case this.combatTurn == 4:
                  this.vanGravWell();
                  break;
               case this.combatTurn == 5:
                  this.vanStellarBeam();
                  break;
               case this.combatTurn == 6:
                  this.vanCrush();
                  break;
               case this.combatTurn == 7:
                  this.vanSummonClones();
                  break;
               case this.combatTurn == 8:
                  this.vanStellarBeam();
                  break;
               case this.combatTurn == 9:
                  this.vanStellarBeam();
                  break;
               case this.combatTurn == 10:
                  this.vanGravWell();
                  break;
               case this.combatTurn == 11:
                  this.vanStellarBeam();
                  break;
               case this.combatTurn == 12:
                  this.combatTurn = 6;
                  this.vanCrush();
                  break;
               default:
                  this.summoning = true;
            }
         }
      }

      public function vanCrush():void
      {
         this.eventLock = true;
         this.combatStats[15] = 0;
         this.uiHolder.enemyBar.updateGUI();
         this.cSpecial = new asSpecVan();
         this.uiHolder.addChild(this.cSpecial);
         addChild(this.specMask);
         this.cSpecial.mask = this.specMask;
      }

      public function vanGravWell():void
      {
         this.animationLock = true;
         this.boss.stageClip.gotoAndStop(15);
         this.summoning = true;
      }

      public function vanGravityImpact():void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc1_ = new Array();
         _loc2_ = 0;
         while (_loc2_ < 21)
         {
            if (this.combatArray[_loc2_] != "0000")
            {
               if (this.combatArray[_loc2_][6][1] == -1)
               {
                  _loc1_.push(_loc2_);
               }
            }
            _loc2_++;
         }
         if (_loc1_.length != 0)
         {
            _loc4_ = _loc1_[Math.floor(Math.random() * _loc1_.length)] - 1;
            if (_loc4_ != this.currentGrid)
            {
               this.objList[0].x = this.combatGrid["grid" + _loc4_].x;
               this.objList[0].y = this.combatGrid["grid" + _loc4_].y;
               this.combatArray[_loc4_] = new Array();
               this.combatArray[_loc4_][0] = this.combatArray[this.currentGrid][0].concat();
               this.combatArray[_loc4_][1] = this.combatArray[this.currentGrid][1].concat();
               this.combatArray[_loc4_][2] = this.combatArray[this.currentGrid][2].concat();
               this.combatArray[_loc4_][3] = this.combatArray[this.currentGrid][3].concat();
               this.combatArray[_loc4_][4] = this.combatArray[this.currentGrid][4].concat();
               this.combatArray[_loc4_][5] = this.combatArray[this.currentGrid][5].concat();
               this.combatArray[_loc4_][6] = this.combatArray[this.currentGrid][6].concat();
               this.combatArray[this.currentGrid] = "0000";
               this.currentGrid = _loc4_;
               this.defaultGrid = _loc4_;
               this.targetGrid = _loc4_;
            }
         }
         _loc3_ = 25;
         this.objList[0].stageClip.gotoAndStop(10);
         this.objList[0].cfx.gotoAndStop(13);
         _loc3_ -= this.combatArray[this.currentGrid][4][0];
         if (_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         this.combatStats[0] -= _loc3_;
         if (this.combatStats[0] <= 0)
         {
            this.combatStats[0] = 0;
         }
         this.uiHolder.charBar.updateGUI();
      }

      public function vanShatterImpact():void
      {
         this.boss.stageClip.gotoAndStop(14);
         this.summoning = true;
      }

      public function vanCrushImpact():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         var _loc4_:MovieClip = null;
         _loc1_ = 0;
         _loc2_ = 0;
         while (_loc2_ < 21)
         {
            if (this.combatArray[_loc2_] != "0000")
            {
               if (this.combatArray[_loc2_][6][1] == -1)
               {
                  _loc1_ += 1;
                  _loc4_ = this.objList[this.combatArray[_loc2_][6][0]];
                  _loc4_.stageClip.gotoAndStop(5);
                  this.combatArray[_loc2_][3][2] -= 9999;
                  _loc4_.updateStats(this.combatArray[_loc2_]);
                  if (this.combatArray[_loc2_][3][2] <= 0)
                  {
                     this.combatArray[_loc2_][3][2] = 0;
                     _loc4_.updateStats(this.combatArray[_loc2_]);
                     this.killUnit(_loc2_, 0, 0);
                  }
               }
            }
            _loc2_++;
         }
         _loc3_ = 200 - 100 * _loc1_;
         if (_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if (_loc3_ > 0)
         {
            this.objList[0].stageClip.gotoAndStop(10);
            this.objList[0].cfx.gotoAndStop(13);
            _loc3_ -= this.combatArray[this.currentGrid][4][0];
            if (_loc3_ < 0)
            {
               _loc3_ = 0;
            }
            this.combatStats[0] -= _loc3_;
            if (this.combatStats[0] <= 0)
            {
               this.combatStats[0] = 0;
            }
            this.uiHolder.charBar.updateGUI();
         }
      }

      public function vanStellarBeam():void
      {
         var _loc1_:int = 0;
         switch (true)
         {
            case this.currentGrid < 7:
               _loc1_ = 1;
               break;
            case this.currentGrid < 14:
               _loc1_ = 2;
               break;
            case this.currentGrid < 21:
               _loc1_ = 3;
         }
         _loc1_ = 10 + _loc1_;
         this.boss.stageClip.gotoAndStop(_loc1_);
         this.summoning = true;
      }

      public function vanStellarImpact():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         switch (true)
         {
            case this.currentGrid < 7 && this.combatArray[6] != "0000":
               _loc1_ = 6;
               break;
            case this.currentGrid < 7 && this.combatArray[5] != "0000":
               _loc1_ = 5;
               break;
            case this.currentGrid < 7 && this.combatArray[4] != "0000":
               _loc1_ = 4;
               break;
            case this.currentGrid < 7 && this.combatArray[3] != "0000":
               _loc1_ = 3;
               break;
            case this.currentGrid < 7 && this.combatArray[2] != "0000":
               _loc1_ = 2;
               break;
            case this.currentGrid < 7 && this.combatArray[1] != "0000":
               _loc1_ = 1;
               break;
            case this.currentGrid < 7 && this.combatArray[0] != "0000":
               _loc1_ = 0;
               break;
            case this.currentGrid < 14 && this.combatArray[13] != "0000":
               _loc1_ = 13;
               break;
            case this.currentGrid < 14 && this.combatArray[12] != "0000":
               _loc1_ = 12;
               break;
            case this.currentGrid < 14 && this.combatArray[11] != "0000":
               _loc1_ = 11;
               break;
            case this.currentGrid < 14 && this.combatArray[10] != "0000":
               _loc1_ = 10;
               break;
            case this.currentGrid < 14 && this.combatArray[9] != "0000":
               _loc1_ = 9;
               break;
            case this.currentGrid < 14 && this.combatArray[8] != "0000":
               _loc1_ = 8;
               break;
            case this.currentGrid < 14 && this.combatArray[7] != "0000":
               _loc1_ = 7;
               break;
            case this.currentGrid < 21 && this.combatArray[20] != "0000":
               _loc1_ = 20;
               break;
            case this.currentGrid < 21 && this.combatArray[19] != "0000":
               _loc1_ = 19;
               break;
            case this.currentGrid < 21 && this.combatArray[18] != "0000":
               _loc1_ = 18;
               break;
            case this.currentGrid < 21 && this.combatArray[17] != "0000":
               _loc1_ = 17;
               break;
            case this.currentGrid < 21 && this.combatArray[16] != "0000":
               _loc1_ = 16;
               break;
            case this.currentGrid < 21 && this.combatArray[15] != "0000":
               _loc1_ = 15;
               break;
            case this.currentGrid < 21 && this.combatArray[14] != "0000":
               _loc1_ = 14;
         }
         _loc2_ = 50;
         if (this.combatArray[_loc1_][6][1] != 1)
         {
            _loc3_ = this.objList[this.combatArray[_loc1_][6][0]];
            _loc3_.stageClip.gotoAndStop(5);
            this.combatArray[_loc1_][3][2] -= _loc2_;
            _loc3_.updateStats(this.combatArray[_loc1_]);
            if (this.combatArray[_loc1_][3][2] <= 0)
            {
               this.combatArray[_loc1_][3][2] = 0;
               _loc3_.updateStats(this.combatArray[_loc1_]);
               this.killUnit(_loc1_, 0, 0);
            }
         }
         else
         {
            this.objList[0].stageClip.gotoAndStop(10);
            _loc2_ -= this.combatArray[this.currentGrid][4][0];
            if (_loc2_ < 0)
            {
               _loc2_ = 0;
            }
            if (this.charData[5])
            {
               _loc2_ = 0;
               this.charData[5] = false;
            }
            this.combatStats[0] -= int(_loc2_);
            if (this.combatStats[0] <= 0)
            {
               this.combatStats[0] = 0;
            }
            this.uiHolder.charBar.updateGUI();
         }
      }

      public function vanSummonClones():void
      {
         var _loc1_:int = 0;
         _loc1_ = 1;
         while (_loc1_ < 5)
         {
            switch (true)
            {
               case _loc1_ == 1:
                  this.combatArray[6] = this.createEnemy(11, 6, 1, 0, 1);
                  this.placeToken(6);
                  break;
               case _loc1_ == 2:
                  this.combatArray[13] = this.createEnemy(13, 6, 1, 0, 1);
                  this.placeToken(13);
                  break;
               case _loc1_ == 3:
                  this.combatArray[20] = this.createEnemy(12, 6, 1, 0, 1);
                  this.placeToken(20);
                  break;
               default:
                  this.summoning = true;
                  break;
            }
            _loc1_++;
         }
      }

      public function respawnClone(param1:int):void
      {
         var _loc2_:MovieClip = null;
         _loc2_ = this.objList[this.combatArray[param1][6][0]];
         this.combatArray[param1][6][5] = 0;
         this.combatArray[param1][6][4] = 0;
         this.tempY = param1 + 5;
         this.tempX = param1;
         _loc2_.stageClip.gotoAndStop(8);
      }

      public function respawnCloneLoc():void
      {
         var _loc1_:MovieClip = null;
         _loc1_ = this.objList[this.combatArray[this.tempX][6][0]];
         _loc1_.x = this.combatGrid["grid" + this.tempY].x;
         _loc1_.y = this.combatGrid["grid" + this.tempY].y;
         this.combatArray[this.tempY] = new Array();
         this.combatArray[this.tempY][0] = this.combatArray[this.tempX][0].concat();
         this.combatArray[this.tempY][1] = this.combatArray[this.tempX][1].concat();
         this.combatArray[this.tempY][2] = this.combatArray[this.tempX][2].concat();
         this.combatArray[this.tempY][3] = this.combatArray[this.tempX][3].concat();
         this.combatArray[this.tempY][4] = this.combatArray[this.tempX][4].concat();
         this.combatArray[this.tempY][5] = this.combatArray[this.tempX][5].concat();
         this.combatArray[this.tempY][6] = this.combatArray[this.tempX][6].concat();
         this.combatArray[this.tempX] = "0000";
      }

      public function getVinaraAction():void
      {
         if (this.cSpecial == null)
         {
            switch (true)
            {
               case this.combatTurn == 1:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 3:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 5:
                  this.wineFlood();
                  break;
               case this.combatTurn == 7:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 9:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 11:
                  this.beerFlood();
                  break;
               case this.combatTurn == 13:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 15:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 17:
                  this.vinHeadache();
                  break;
               case this.combatTurn == 18:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 20:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 22:
                  this.beerFlood();
                  break;
               case this.combatTurn == 24:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 26:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 28:
                  this.wineFlood();
                  break;
               case this.combatTurn == 30:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 32:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 34:
                  this.vinHeadache();
                  break;
               case this.combatTurn == 35:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 37:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 39:
                  this.wineFlood();
                  break;
               case this.combatTurn == 41:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 43:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 45:
                  this.beerFlood();
                  break;
               case this.combatTurn == 47:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 49:
                  this.vinBarrelToss();
                  break;
               case this.combatTurn == 51:
                  this.vinHeadache();
                  this.combatTurn = 18;
                  break;
               default:
                  this.summoning = true;
            }
         }
      }

      public function vinBarrelToss():void
      {
         var _loc1_:int = 0;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         _loc1_ = Math.floor(Math.random() * 6);
         switch (true)
         {
            case _loc1_ == 0:
               _loc2_ = new Array(1, 2, 3);
               break;
            case _loc1_ == 1:
               _loc2_ = new Array(1, 3, 2);
               break;
            case _loc1_ == 2:
               _loc2_ = new Array(2, 1, 3);
               break;
            case _loc1_ == 3:
               _loc2_ = new Array(2, 3, 1);
               break;
            case _loc1_ == 4:
               _loc2_ = new Array(3, 1, 2);
               break;
            case _loc1_ == 5:
               _loc2_ = new Array(3, 2, 1);
               break;
            default:
               _loc2_ = new Array(1, 2, 3);
         }
         _loc3_ = 1;
         while (_loc3_ < 5)
         {
            switch (true)
            {
               case _loc3_ == 1:
                  this.combatArray[6] = this.createEnemy(_loc2_[0] + 13, 6, 33, 0, 1);
                  this.placeToken(6);
                  break;
               case _loc3_ == 2:
                  this.combatArray[13] = this.createEnemy(_loc2_[1] + 13, 6, 33, 0, 1);
                  this.placeToken(13);
                  break;
               case _loc3_ == 3:
                  this.combatArray[20] = this.createEnemy(_loc2_[2] + 13, 6, 33, 0, 1);
                  this.placeToken(20);
                  break;
               default:
                  this.summoning = true;
                  break;
            }
            _loc3_++;
         }
      }

      public function vinBarrelExplode(param1:int, param2:int):void
      {
         if (this.combatArray[param1 - 1] != "0000")
         {
            if (this.combatArray[param1 - 1][6][1] == 1)
            {
               switch (true)
               {
                  case param2 == 1 && this.vinTint == 0:
                     this.vinTint = 1;
                     this.tintColor(this.objList[0], 16515327, 0.45);
                     break;
                  case param2 == 2 && this.vinTint == 0:
                     this.vinTint = 2;
                     this.tintColor(this.objList[0], 16744192, 0.45);
                     break;
                  case param2 == 1 && this.vinTint == 1:
                     this.vinTint = 1;
                     this.tintColor(this.objList[0], 16515327, 0.45);
                     break;
                  case param2 == 2 && this.vinTint == 1:
                     this.vinTint = 3;
                     this.tintColor(this.objList[0], 65280, 0.45);
                     break;
                  case param2 == 1 && this.vinTint == 2:
                     this.vinTint = 3;
                     this.tintColor(this.objList[0], 65280, 0.45);
                     break;
                  case param2 == 2 && this.vinTint == 2:
                     this.vinTint = 2;
                     this.tintColor(this.objList[0], 16744192, 0.45);
                     break;
                  case param2 == 3:
                     this.vinTint = 0;
                     this.tintColor(this.objList[0], 16777215, 0);
                     this.explodingBarrel();
               }
            }
         }
         if (this.combatArray[param1 + 1] != "0000")
         {
            if (this.combatArray[param1 + 1][6][1] == 1)
            {
               switch (true)
               {
                  case param2 == 1 && this.vinTint == 0:
                     this.vinTint = 1;
                     this.tintColor(this.objList[0], 16515327, 0.45);
                     break;
                  case param2 == 2 && this.vinTint == 0:
                     this.vinTint = 2;
                     this.tintColor(this.objList[0], 16744192, 0.45);
                     break;
                  case param2 == 1 && this.vinTint == 1:
                     this.vinTint = 1;
                     this.tintColor(this.objList[0], 16515327, 0.45);
                     break;
                  case param2 == 2 && this.vinTint == 1:
                     this.vinTint = 3;
                     this.tintColor(this.objList[0], 16777215, 0.45);
                     break;
                  case param2 == 1 && this.vinTint == 2:
                     this.vinTint = 3;
                     this.tintColor(this.objList[0], 16777215, 0.45);
                     break;
                  case param2 == 2 && this.vinTint == 2:
                     this.vinTint = 2;
                     this.tintColor(this.objList[0], 16744192, 0.45);
                     break;
                  case param2 == 3:
                     this.vinTint = 0;
                     this.tintColor(this.objList[0], 16777215, 0);
                     this.explodingBarrel();
               }
            }
         }
      }

      internal function explodingBarrel():void
      {
         var _loc1_:int = 0;
         _loc1_ = 50;
         _loc1_ -= this.combatArray[this.currentGrid][4][0];
         if (_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         if (this.charData[5])
         {
            _loc1_ = 0;
            this.charData[5] = false;
         }
         this.combatStats[0] -= int(_loc1_);
         if (_loc1_ > 0)
         {
            this.objList[0].stageClip.gotoAndStop(10);
         }
         if (this.combatStats[0] <= 0)
         {
            this.combatStats[0] = 0;
         }
         this.uiHolder.charBar.updateGUI();
      }

      internal function tintColor(param1:MovieClip, param2:Number, param3:Number):void
      {
         var _loc4_:Color = null;
         _loc4_ = new Color();
         _loc4_.setTint(param2, param3);
         param1.transform.colorTransform = _loc4_;
      }

      internal function wineFlood():void
      {
         this.animationLock = true;
         this.boss.stageClip.gotoAndStop(14);
         this.summoning = true;
      }

      internal function beerFlood():void
      {
         this.animationLock = true;
         this.boss.stageClip.gotoAndStop(15);
         this.summoning = true;
      }

      internal function vinWineImpact():void
      {
         var _loc1_:* = undefined;
         _loc1_ = 50;
         _loc1_ -= this.combatArray[this.currentGrid][4][0];
         switch (true)
         {
            case this.vinTint == 0:
               break;
            case this.vinTint == 1:
               _loc1_ = 0;
               break;
            case this.vinTint == 2:
               _loc1_ *= 2;
               break;
            case this.vinTint == 3:
               _loc1_ *= 2;
         }
         if (_loc1_ > 0)
         {
            this.objList[0].stageClip.gotoAndStop(10);
            this.combatStats[0] -= _loc1_;
            if (this.combatStats[0] <= 0)
            {
               this.combatStats[0] = 0;
            }
            this.uiHolder.charBar.updateGUI();
         }
      }

      internal function vinBeerImpact():void
      {
         var _loc1_:* = undefined;
         _loc1_ = 50;
         _loc1_ -= this.combatArray[this.currentGrid][4][0];
         switch (true)
         {
            case this.vinTint == 0:
               break;
            case this.vinTint == 1:
               _loc1_ *= 2;
               break;
            case this.vinTint == 2:
               _loc1_ = 0;
               break;
            case this.vinTint == 3:
               _loc1_ *= 2;
         }
         if (_loc1_ > 0)
         {
            this.objList[0].stageClip.gotoAndStop(10);
            this.combatStats[0] -= _loc1_;
            if (this.combatStats[0] <= 0)
            {
               this.combatStats[0] = 0;
            }
            this.uiHolder.charBar.updateGUI();
         }
      }

      internal function headacheImpact():void
      {
         this.boss.stageClip.gotoAndStop(16);
         this.summoning = true;
      }

      internal function headacheDamage():void
      {
         var _loc1_:* = undefined;
         _loc1_ = 500;
         _loc1_ -= this.combatArray[this.currentGrid][4][0];
         switch (true)
         {
            case this.vinTint == 0:
               break;
            case this.vinTint == 1:
               _loc1_ *= 2;
               break;
            case this.vinTint == 2:
               _loc1_ *= 2;
               break;
            case this.vinTint == 3:
               _loc1_ = 0;
         }
         if (_loc1_ > 0)
         {
            this.objList[0].stageClip.gotoAndStop(10);
            this.combatStats[0] -= _loc1_;
            if (this.combatStats[0] <= 0)
            {
               this.combatStats[0] = 0;
            }
            this.uiHolder.charBar.updateGUI();
         }
      }

      internal function vinHeadache():void
      {
         this.eventLock = true;
         this.combatStats[15] = 0;
         this.uiHolder.enemyBar.updateGUI();
         this.cSpecial = new asSpecVin();
         this.uiHolder.addChild(this.cSpecial);
         addChild(this.specMask);
         this.cSpecial.mask = this.specMask;
      }

      public function getPecuniaAction_1():void
      {
         if (this.cSpecial == null)
         {
            if (this.pecuNuke != 1 && this.pecuNuke != 3)
            {
               switch (true)
               {
                  case this.combatTurn == 1:
                     this.loadPecuGuns(6);
                     this.loadPecuGuns(13);
                     this.loadPecuGuns(20);
                     break;
                  case this.combatTurn == 2:
                     this.firePecuGuns(0, 6);
                     break;
                  case this.combatTurn == 3:
                     this.firePecuGuns(7, 13);
                     break;
                  case this.combatTurn == 4:
                     this.firePecuGuns(14, 20);
                     break;
                  case this.combatTurn == 5:
                     this.firePecuGuns(0, 6);
                     this.firePecuGuns(7, 13);
                     break;
                  case this.combatTurn == 6:
                     this.firePecuGuns(0, 6);
                     this.firePecuGuns(14, 20);
                     break;
                  case this.combatTurn == 7:
                     this.firePecuGuns(7, 13);
                     this.firePecuGuns(14, 20);
                     break;
                  case this.combatTurn == 8:
                     this.firePecuGuns(0, 6);
                     break;
                  case this.combatTurn == 9:
                     this.firePecuGuns(7, 13);
                     break;
                  case this.combatTurn == 10:
                     this.firePecuGuns(14, 20);
                     break;
                  case this.combatTurn == 11:
                     this.firePecuGuns(0, 6);
                     this.firePecuGuns(7, 13);
                     this.firePecuGuns(14, 20);
                     break;
                  case this.combatTurn == 12:
                     this.firePecuGuns(0, 6);
                     this.firePecuGuns(7, 13);
                     this.firePecuGuns(14, 20);
                     this.combatTurn = 10;
                     break;
                  default:
                     this.summoning = true;
               }
               if (this.pecuNuke == 2)
               {
                  -- this.pecuNuke;
               }
            }
            else if (this.pecuNuke == 1)
            {
               this.pecuTikiNuke();
               this.pecuNuke = 0;
            }
            else if (this.pecuNuke == 3)
            {
               this.pecuPhase2();
            }
         }
      }

      public function loadPecuGuns(param1:int):void
      {
         this.combatArray[param1] = this.createEnemy(18, 6, 1, 0, 1);
         this.placeToken(param1);
         this.summoning = true;
      }

      public function firePecuGuns(param1:int, param2:int):void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:* = undefined;
         if (this.combatArray[param2] == "0000")
         {
            this.loadPecuGuns(param2);
         }
         else
         {
            _loc3_ = this.objList[this.combatArray[param2][6][0]];
            this.animationLock = true;
            _loc3_.stageClip.gotoAndStop(4);
            if (this.currentGrid >= param1 && this.currentGrid < param2)
            {
               _loc4_ = 50;
               _loc4_ = _loc4_ - this.combatArray[this.currentGrid][4][0];
               if (_loc4_ > 0)
               {
                  this.objList[0].stageClip.gotoAndStop(10);
                  this.combatStats[0] -= _loc4_;
                  if (this.combatStats[0] <= 0)
                  {
                     this.combatStats[0] = 0;
                  }
                  this.uiHolder.charBar.updateGUI();
               }
            }
         }
         this.summoning = true;
      }

      public function pecuTikiNuke():void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:* = undefined;
         _loc1_ = this.objList[this.combatArray[10][6][0]];
         _loc1_.stageClip.gotoAndStop(6);
         if (this.currentGrid == 9 || this.currentGrid == 11 || this.currentGrid == 3 || this.currentGrid == 17)
         {
            _loc2_ = 50;
            _loc2_ -= this.combatArray[this.currentGrid][4][0];
            if (_loc2_ > 0)
            {
               this.objList[0].stageClip.gotoAndStop(10);
               this.combatStats[0] -= _loc2_;
               if (this.combatStats[0] <= 0)
               {
                  this.combatStats[0] = 0;
               }
               this.uiHolder.charBar.updateGUI();
            }
         }
      }

      public function executePecuDia():void
      {
         if (this.skillTarget == 10)
         {
            this.pecuNuke = 2;
            if (this.combatStats[2] < 10)
            {
               this.combatStats[2] += 2;
            }
            if (this.combatStats[1] < 10)
            {
               this.combatStats[1] += 2;
               if (this.combatStats[1] > 10)
               {
                  this.combatStats[1] = 10;
               }
            }
            this.uiHolder.charBar.updateGUI();
            switch (true)
            {
               case this.combatStats[2] == 2:
                  this.loadDia(201400);
                  break;
               case this.combatStats[2] == 4:
                  this.loadDia(201401);
                  break;
               case this.combatStats[2] == 6:
                  this.loadDia(201402);
                  break;
               case this.combatStats[2] == 8:
                  this.loadDia(201403);
                  break;
               case this.combatStats[2] == 10:
                  this.loadDia(201404);
            }
         }
         this.skillType = 0;
      }

      public function pecuPhase2():void
      {
         this.pecuLoc = -1;
         this.pecuWin = true;
         this.unloadCombat();
      }

      public function getPecuniaAction_2():void
      {
         this.checkPecuLoad();
         if (this.cSpecial == null)
         {
            switch (true)
            {
               case this.combatTurn == 1:
                  this.pecuLoad();
                  break;
               case this.combatTurn == 2:
                  this.pecuWarMove();
                  break;
               case this.combatTurn == 3:
                  this.pecuWarAttack(1);
                  break;
               case this.combatTurn == 4:
                  this.pecuWarAttack(2);
                  break;
               case this.combatTurn == 5 && !this.pecuWar.dead:
                  this.pecuWarMove();
                  break;
               case this.combatTurn == 6 && !this.pecuWar.dead:
                  this.pecuWarAttack(1);
                  break;
               case this.combatTurn == 7 && !this.pecuWar.dead:
                  this.pecuWarAttack(2);
                  this.combatTurn = 4;
                  break;
               case this.boss.visible:
                  this.pecuPhase3();
                  break;
               default:
                  this.summoning = true;
            }
         }
      }

      public function pecuLoad():void
      {
         this.combatArray[13] = this.createEnemy(20, 6, 1, 0, 1);
         this.placeToken(13);
         this.pecuLoc = 13;
         this.pecuWar = this.objList[this.combatArray[13][6][0]];
         this.summoning = true;
      }

      public function checkPecuLoad():void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000" && this.combatArray[_loc1_][6][1] == -1)
            {
               this.pecuLoc = _loc1_;
               this.pecuWar = this.objList[this.combatArray[this.pecuLoc][6][0]];
               break;
            }
            _loc1_++;
         }
         if (this.pecuWar != null)
         {
            this.combatStats[3] = this.pecuWar.uHealth;
         }
         if (this.combatStats[3] <= 0 && this.combatLevel == 103)
         {
            this.combatStats[3] = 1;
         }
         if (this.combatStats[3] < 0)
         {
            this.combatStats[3] = 0;
         }
         this.uiHolder.enemyBar.updateGUI();
      }

      public function pecuWarMove():void
      {
         if (this.pecuLoc != 8 && this.currentGrid != this.pecuLoc - 1)
         {
            this.unitMove(this.pecuLoc, this.pecuLoc - 1, 0);
         }
         else if (this.pecuLoc == 8)
         {
            this.pecuWarBurn();
         }
         else if (this.currentGrid == this.pecuLoc - 1)
         {
            this.pecuWarPrepKB();
         }
      }

      public function pecuWarBurn():void
      {
         this.pecuWar.stageClip.gotoAndStop(6);
         this.summoning = true;
      }

      public function executeWarBurn():void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = undefined;
         _loc1_ = false;
         switch (true)
         {
            case this.currentGrid < 6 && this.currentGrid >= this.pecuLoc - 8:
               _loc1_ = true;
               break;
            case this.currentGrid > 13 && this.currentGrid >= this.pecuLoc + 6:
               _loc1_ = true;
               break;
            case this.currentGrid > 6 && this.currentGrid < 13 && this.currentGrid >= this.pecuLoc - 1:
               _loc1_ = true;
         }
         if (_loc1_)
         {
            _loc2_ = 50;
            _loc2_ -= this.combatArray[this.currentGrid][4][0];
            if (_loc2_ > 0)
            {
               this.objList[0].stageClip.gotoAndStop(10);
               this.combatStats[0] -= _loc2_;
               if (this.combatStats[0] <= 0)
               {
                  this.combatStats[0] = 0;
               }
               this.uiHolder.charBar.updateGUI();
            }
         }
      }

      public function pecuWarPrepKB():void
      {
         if (!this.pecuDamage)
         {
            this.pecuDamage = true;
            this.pecuWar.stageClip.gotoAndStop(9);
         }
         this.pecuWarKnockback();
      }

      public function pecuWarKnockback():void
      {
         var _loc1_:int = 0;
         this.targetGrid = 7;
         if (this.objList[0].x > this.combatGrid["grid" + this.targetGrid].x)
         {
            this.objList[0].x -= 20;
            if (this.objList[0].x <= this.combatGrid["grid" + this.targetGrid].x)
            {
               this.objList[0].x = this.combatGrid["grid" + this.targetGrid].x;
            }
         }
         else if (this.objList[0].x == this.combatGrid["grid" + this.targetGrid].x)
         {
            this.objList[0].stageClip.gotoAndStop(2);
            this.combatArray[this.targetGrid] = new Array();
            _loc1_ = 0;
            while (_loc1_ < 7)
            {
               this.combatArray[this.targetGrid][_loc1_] = new Array();
               _loc1_++;
            }
            this.combatArray[this.targetGrid][0] = this.combatArray[this.currentGrid][0].concat();
            this.combatArray[this.targetGrid][1] = this.combatArray[this.currentGrid][1].concat();
            this.combatArray[this.targetGrid][2] = this.combatArray[this.currentGrid][2].concat();
            this.combatArray[this.targetGrid][3] = this.combatArray[this.currentGrid][3].concat();
            this.combatArray[this.targetGrid][4] = this.combatArray[this.currentGrid][4].concat();
            this.combatArray[this.targetGrid][5] = this.combatArray[this.currentGrid][5].concat();
            this.combatArray[this.targetGrid][6] = this.combatArray[this.currentGrid][6].concat();
            this.combatArray[this.currentGrid] = "0000";
            this.currentGrid = this.targetGrid;
            this.defaultGrid = this.targetGrid;
            this.pecuDamage = false;
            this.summoning = true;
         }
      }

      public function executeWarKick():void
      {
         var _loc1_:* = undefined;
         _loc1_ = 50;
         _loc1_ -= this.combatArray[this.currentGrid][4][0];
         if (this.charData[5])
         {
            _loc1_ = 0;
            this.charData[5] = false;
         }
         if (_loc1_ > 0)
         {
            this.combatStats[0] -= _loc1_;
            if (this.combatStats[0] <= 0)
            {
               this.combatStats[0] = 0;
            }
            this.uiHolder.charBar.updateGUI();
         }
         this.pecuWar.stageClip.gotoAndStop(9);
      }

      public function pecuWarAttack(param1:int):void
      {
         switch (true)
         {
            case this.currentGrid < 6 && this.currentGrid >= this.pecuLoc - 7:
               this.pecuWarBurn();
               break;
            case this.currentGrid > 13 && this.currentGrid >= this.pecuLoc + 7:
               this.pecuWarBurn();
               break;
            case this.currentGrid > 6 && this.currentGrid < 13 && this.currentGrid > this.pecuLoc:
               this.pecuWarBurn();
               break;
            case param1 == 1:
               this.pecuTurret();
               break;
            case param1 == 2:
               this.pecuCannon();
         }
      }

      public function pecuTurret():void
      {
         this.pecuWar.stageClip.gotoAndStop(4);
         this.summoning = true;
      }

      public function executeWarGun():void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = undefined;
         _loc1_ = false;
         switch (true)
         {
            case this.currentGrid < 6 && this.currentGrid <= this.pecuLoc - 7:
               _loc1_ = true;
               break;
            case this.currentGrid > 13 && this.currentGrid <= this.pecuLoc + 7:
               _loc1_ = true;
         }
         if (_loc1_)
         {
            _loc2_ = 50;
            _loc2_ -= this.combatArray[this.currentGrid][4][0];
            if (this.charData[5])
            {
               _loc2_ = 0;
               this.charData[5] = false;
            }
            if (_loc2_ > 0)
            {
               this.objList[0].stageClip.gotoAndStop(10);
               this.combatStats[0] -= _loc2_;
               if (this.combatStats[0] <= 0)
               {
                  this.combatStats[0] = 0;
               }
               this.uiHolder.charBar.updateGUI();
            }
         }
      }

      public function pecuCannon():void
      {
         this.pecuWar.stageClip.gotoAndStop(8);
         this.summoning = true;
      }

      public function executeWarNuke():void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = undefined;
         _loc1_ = false;
         switch (true)
         {
            case this.currentGrid > 6 && this.currentGrid < this.pecuLoc:
               _loc1_ = true;
               break;
            case this.currentGrid < this.pecuLoc - 8:
               _loc1_ = true;
               break;
            case this.currentGrid > 13 && this.currentGrid < this.pecuLoc + 6:
               _loc1_ = true;
         }
         if (_loc1_)
         {
            _loc2_ = 75;
            _loc2_ -= this.combatArray[this.currentGrid][4][0];
            if (_loc2_ > 0)
            {
               this.objList[0].stageClip.gotoAndStop(10);
               this.combatStats[0] -= _loc2_;
               if (this.combatStats[0] <= 0)
               {
                  this.combatStats[0] = 0;
               }
               this.uiHolder.charBar.updateGUI();
            }
         }
      }

      public function pecuPhase3():void
      {
         this.pecuLoc = 13;
         this.pecuWin = true;
         this.unloadCombat();
      }

      public function getPecuniaAction_3():void
      {
         if (this.cSpecial == null)
         {
            this.checkPecuLoad();
            if (this.combatStats[3] > 0)
            {
               switch (true)
               {
                  case this.combatStats[15] == 5:
                     this.pecuVars[1] = false;
                     this.pecuDaggerPrep();
                     break;
                  case this.combatStats[15] == 3:
                     this.pecuVars[1] = false;
                     this.pecuWar.stageClip.gotoAndStop(9);
                     break;
                  case this.pecuWar.stageClip.currentFrame == 10:
                     this.pecuVars[1] = false;
                     this.summoning = true;
                     break;
                  case !this.pecuVars[1]:
                     this.pecuCheckRange();
                     break;
                  case this.pecuVars[1]:
                     this.pecuMove();
                     break;
                  default:
                     this.summoning = true;
               }
            }
         }
      }

      public function prepPecu():void
      {
         if (this.pecuVars[2] > 0)
         {
            -- this.pecuVars[2];
         }
         if (this.pecuVars[3] > 0)
         {
            -- this.pecuVars[3];
         }
         if (this.pecuVars[5] > 0)
         {
            -- this.pecuVars[5];
         }
         this.combatState = 2;
      }

      public function pecuStealth():void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         switch (true)
         {
            case this.pecuLoc < 4:
               _loc1_ = this.pecuLoc + 2;
               break;
            case this.pecuLoc < 7:
               _loc1_ = 6;
               break;
            case this.pecuLoc < 11:
               _loc1_ = this.pecuLoc + 2;
               break;
            case this.pecuLoc < 14:
               _loc1_ = 13;
               break;
            case this.pecuLoc < 18:
               _loc1_ = this.pecuLoc + 2;
               break;
            case this.pecuLoc < 21:
               _loc1_ = 20;
         }
         if (_loc1_ == this.currentGrid)
         {
            _loc1_--;
         }
         this.pecuWar.x = this.combatGrid["grid" + _loc1_].x;
         this.pecuWar.y = this.combatGrid["grid" + _loc1_].y;
         this.pecuVars[4] = _loc1_;
         this.pecuValidate();
         this.summoning = true;
      }

      public function pecuCheckRange():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         switch (true)
         {
            case this.currentGrid < 6:
               _loc1_ = 1;
               break;
            case this.currentGrid < 13:
               _loc1_ = 2;
               break;
            case this.currentGrid < 20:
               _loc1_ = 3;
         }
         switch (true)
         {
            case this.pecuLoc < 7:
               _loc2_ = 1;
               break;
            case this.pecuLoc < 14:
               _loc2_ = 2;
               break;
            case this.pecuLoc < 21:
               _loc2_ = 3;
         }
         switch (true)
         {
            case this.combatStats[15] == 4:
               this.pecuBlock();
               break;
            case this.pecuVars[3] == 0 && (this.pecuLoc - this.currentGrid == 1 || this.pecuLoc - this.currentGrid == -1) && _loc1_ == _loc2_ && !this.pecuDamage:
               this.pecuVars[3] = 2;
               this.pecuVars[0] = 0;
               this.pecuWhirl();
               break;
            case this.pecuVars[0] > 0:
               this.pecuMoveSelect();
               break;
            case this.pecuVars[2] == 0 && this.pecuLoc - this.currentGrid < 3 && _loc1_ == _loc2_:
               this.pecuDash();
               break;
            case this.pecuVars[5] == 0:
               this.pecuBlock();
               break;
            default:
               this.summoning = true;
         }
      }

      public function pecuDash():void
      {
         this.pecuVars[2] = 2;
         this.pecuVars[0] = 0;
         this.pecuVars[1] = true;
         this.pecuDamage = false;
         switch (true)
         {
            case this.pecuLoc < 7:
               this.pecuVars[4] = 0;
               break;
            case this.pecuLoc < 14:
               this.pecuVars[4] = 7;
               break;
            default:
               this.pecuVars[4] = 14;
         }
         this.pecuWar.stageClip.gotoAndStop(4);
      }

      public function pecuDashImpact():void
      {
         var _loc1_:* = undefined;
         _loc1_ = 25;
         if (this.charData[5])
         {
            _loc1_ = 0;
            this.charData[5] = false;
         }
         _loc1_ -= this.combatArray[this.currentGrid][4][0];
         if (_loc1_ > 0)
         {
            this.objList[0].stageClip.gotoAndStop(10);
            this.combatStats[0] -= _loc1_;
            if (this.combatStats[0] <= 0)
            {
               this.combatStats[0] = 0;
            }
            this.uiHolder.charBar.updateGUI();
         }
      }

      public function pecuWhirl():void
      {
         this.pecuWar.stageClip.gotoAndStop(8);
         this.summoning = true;
      }

      public function pecuWhirlImpact():void
      {
         var _loc1_:* = undefined;
         if (this.pecuLoc - this.currentGrid == 1 || this.pecuLoc - this.currentGrid == -1 || this.pecuLoc - this.currentGrid == -7 || this.pecuLoc - this.currentGrid == 7)
         {
            _loc1_ = 50;
            _loc1_ -= this.combatArray[this.currentGrid][4][0];
            if (_loc1_ > 0)
            {
               this.objList[0].stageClip.gotoAndStop(10);
               this.combatStats[0] -= _loc1_;
               if (this.combatStats[0] <= 0)
               {
                  this.combatStats[0] = 0;
               }
               this.uiHolder.charBar.updateGUI();
            }
         }
      }

      public function pecuMoveSelect():void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         switch (true)
         {
            case this.currentGrid < 6:
               _loc1_ = 1;
               break;
            case this.currentGrid < 13:
               _loc1_ = 2;
               break;
            case this.currentGrid < 20:
               _loc1_ = 3;
         }
         switch (true)
         {
            case this.pecuLoc < 7:
               _loc2_ = 1;
               break;
            case this.pecuLoc < 14:
               _loc2_ = 2;
               break;
            case this.pecuLoc < 21:
               _loc2_ = 3;
         }
         switch (true)
         {
            case _loc1_ > _loc2_ && this.currentGrid != this.pecuLoc + 7:
               this.pecuVars[4] = this.pecuLoc + 7;
               this.pecuVars[1] = true;
               this.pecuVars[0] = this.pecuVars[0] - 1;
               break;
            case _loc1_ < _loc2_ && this.currentGrid != this.pecuLoc - 7:
               this.pecuVars[4] = this.pecuLoc - 7;
               this.pecuVars[1] = true;
               this.pecuVars[0] = this.pecuVars[0] - 1;
               break;
            case this.currentGrid < this.pecuLoc && this.currentGrid != this.pecuLoc - 1:
               this.pecuWar.stageClip.gotoAndStop(3);
               this.pecuVars[4] = this.pecuLoc - 1;
               this.pecuVars[1] = true;
               this.pecuVars[0] = this.pecuVars[0] - 1;
               break;
            case this.currentGrid > this.pecuLoc && this.currentGrid != this.pecuLoc + 1:
               this.pecuWar.stageClip.gotoAndStop(13);
               this.pecuVars[4] = this.pecuLoc + 1;
               this.pecuVars[1] = true;
               this.pecuVars[0] = this.pecuVars[0] - 1;
               break;
            default:
               this.pecuVars[0] = 0;
         }
      }

      public function pecuMove():void
      {
         var _loc1_:int = 0;
         if (this.pecuWar.x < this.combatGrid["grid" + this.pecuVars[4]].x)
         {
            this.pecuWar.x += 20;
            _loc1_ = 0;
            if (this.pecuWar.x > this.combatGrid["grid" + this.pecuVars[4]].x)
            {
               this.pecuWar.x = this.combatGrid["grid" + this.pecuVars[4]].x;
            }
         }
         if (this.pecuWar.x > this.combatGrid["grid" + this.pecuVars[4]].x)
         {
            this.pecuWar.x -= 20;
            _loc1_ = 1;
            if (this.pecuWar.x < this.combatGrid["grid" + this.pecuVars[4]].x)
            {
               this.pecuWar.x = this.combatGrid["grid" + this.pecuVars[4]].x;
            }
         }
         if (this.pecuWar.y < this.combatGrid["grid" + this.pecuVars[4]].y)
         {
            this.pecuWar.y += 10;
            if (this.pecuWar.y > this.combatGrid["grid" + this.pecuVars[4]].y)
            {
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y;
            }
         }
         if (this.pecuWar.y > this.combatGrid["grid" + this.pecuVars[4]].y)
         {
            this.pecuWar.y -= 10;
            if (this.pecuWar.y < this.combatGrid["grid" + this.pecuVars[4]].y)
            {
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y;
            }
         }
         if (!this.pecuDamage && (this.pecuWar.stageClip.currentFrame == 4 || this.pecuWar.stageClip.currentFrame == 12))
         {
            if (this.pecuLoc >= this.currentGrid && this.pecuWar.x <= this.objList[0].x)
            {
               this.pecuDamage = true;
               this.pecuDashImpact();
            }
            else if (this.pecuLoc <= this.currentGrid && this.pecuWar.x >= this.objList[0].x)
            {
               this.pecuDamage = true;
               this.pecuDashImpact();
            }
         }
         if (this.pecuWar.x == this.combatGrid["grid" + this.pecuVars[4]].x && this.pecuWar.y == this.combatGrid["grid" + this.pecuVars[4]].y)
         {
            if (this.pecuWar.stageClip.currentFrame == 4)
            {
               this.pecuWar.stageClip.gotoAndStop(12);
               switch (true)
               {
                  case this.pecuLoc < 7:
                     this.pecuVars[4] = 6;
                     break;
                  case this.pecuLoc < 14:
                     this.pecuVars[4] = 13;
                     break;
                  default:
                     this.pecuVars[4] = 20;
               }
            }
            else
            {
               this.pecuVars[1] = false;
               this.pecuWar.stageClip.gotoAndStop(2);
               this.pecuValidate();
               if (this.pecuWar.stageClip.currentFrame == 12)
               {
                  this.summoning = true;
               }
            }
         }
      }

      public function pecuValidate():void
      {
         switch (true)
         {
            case this.pecuVars[4] == 0:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 6;
               break;
            case this.pecuVars[4] == 1:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 5;
               break;
            case this.pecuVars[4] == 2:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 4;
               break;
            case this.pecuVars[4] == 3:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 3;
               break;
            case this.pecuVars[4] == 4:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 2;
               break;
            case this.pecuVars[4] == 5:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 1;
               break;
            case this.pecuVars[4] == 6:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 0;
               break;
            case this.pecuVars[4] == 7:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 6;
               break;
            case this.pecuVars[4] == 8:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 5;
               break;
            case this.pecuVars[4] == 9:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 4;
               break;
            case this.pecuVars[4] == 10:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 3;
               break;
            case this.pecuVars[4] == 11:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 2;
               break;
            case this.pecuVars[4] == 12:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 1;
               break;
            case this.pecuVars[4] == 13:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 0;
               break;
            case this.pecuVars[4] == 14:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 6;
               break;
            case this.pecuVars[4] == 15:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 5;
               break;
            case this.pecuVars[4] == 16:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 4;
               break;
            case this.pecuVars[4] == 17:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 3;
               break;
            case this.pecuVars[4] == 18:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 2;
               break;
            case this.pecuVars[4] == 19:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 1;
               break;
            case this.pecuVars[4] == 20:
               this.pecuWar.y = this.combatGrid["grid" + this.pecuVars[4]].y + 0;
         }
         if (this.pecuLoc != this.pecuVars[4])
         {
            this.combatArray[this.pecuVars[4]] = new Array();
            this.combatArray[this.pecuVars[4]][0] = this.combatArray[this.pecuLoc][0].concat();
            this.combatArray[this.pecuVars[4]][1] = this.combatArray[this.pecuLoc][1].concat();
            this.combatArray[this.pecuVars[4]][2] = this.combatArray[this.pecuLoc][2].concat();
            this.combatArray[this.pecuVars[4]][3] = this.combatArray[this.pecuLoc][3].concat();
            this.combatArray[this.pecuVars[4]][4] = this.combatArray[this.pecuLoc][4].concat();
            this.combatArray[this.pecuVars[4]][5] = this.combatArray[this.pecuLoc][5].concat();
            this.combatArray[this.pecuVars[4]][6] = this.combatArray[this.pecuLoc][6].concat();
            this.combatArray[this.pecuLoc] = "0000";
            this.pecuLoc = this.pecuVars[4];
         }
      }

      public function pecuBlock():void
      {
         this.pecuVars[5] = 2;
         this.pecuWar.stageClip.gotoAndStop(6);
         this.summoning = true;
      }

      public function pecuDaggerPrep():void
      {
         this.eventLock = true;
         this.combatStats[15] = 0;
         this.uiHolder.enemyBar.updateGUI();
         this.cSpecial = new asSpec_3X();
         this.uiHolder.addChild(this.cSpecial);
         addChild(this.specMask);
         this.cSpecial.mask = this.specMask;
      }

      public function pecuDagger():void
      {
         this.tempX = this.pecuWar.x;
         this.tempY = this.pecuWar.y;
         if (this.pecuWar.stageClip.currentFrame == 10)
         {
            this.pecuDamage = true;
         }
         else
         {
            this.pecuDamage = false;
         }
         this.pecuWar.x = this.combatGrid["grid" + this.currentGrid].x - 70;
         this.pecuWar.y = this.combatGrid["grid" + this.currentGrid].y + 2;
         this.pecuWar.stageClip.gotoAndStop(11);
      }

      public function pecuDaggerImpact():void
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         if (this.pecuDamage)
         {
            _loc1_ = 800;
         }
         else if (this.charData[5])
         {
            _loc1_ = 0;
            this.charData[5] = false;
         }
         else
         {
            _loc1_ = 50;
         }
         _loc1_ -= this.combatArray[this.currentGrid][4][0];
         if (_loc1_ > 0)
         {
            this.objList[0].stageClip.gotoAndStop(10);
            this.combatStats[0] -= _loc1_;
            if (this.combatStats[0] <= 0)
            {
               this.combatStats[0] = 0;
            }
            this.uiHolder.charBar.updateGUI();
         }
         this.summoning = true;
      }

      public function pecuDaggerReset():void
      {
         this.pecuWar.x = this.tempX;
         this.pecuWar.y = this.tempY;
         this.pecuWar.stageClip.gotoAndStop(2);
      }

      public function getSomnaAction():void
      {
         if (this.cSpecial == null)
         {
            var _loc1_:Boolean = true;
            switch (0)
            {
            }
            this.summoning = true;
         }
      }

      public function getGateGuardAction():void
      {
         if (this.cSpecial == null)
         {
            switch (true)
            {
               case this.combatTurn == 1:
                  this.createSkulls();
                  this.generateWalls();
                  break;
               case this.combatTurn == 2:
                  this.activateSkulls();
                  this.generateWalls();
                  break;
               case this.combatTurn == 3:
                  this.checkSkulls();
                  this.generateWalls();
                  break;
               case this.combatTurn == 4:
                  this.checkSkulls();
                  this.skullBlast();
                  this.generateWalls();
                  break;
               case this.combatTurn == 5:
                  this.deactivateSkulls();
                  this.generateWalls();
                  break;
               case this.combatTurn == 6:
                  this.deSpawnRocks();
                  this.gateExterminate();
                  break;
               case this.combatTurn == 7:
                  this.createSkulls();
                  this.generateWalls();
                  break;
               case this.combatTurn == 8:
                  this.activateSkulls();
                  this.generateWalls();
                  break;
               case this.combatTurn == 9:
                  this.checkSkulls();
                  this.generateWalls();
                  break;
               case this.combatTurn == 10:
                  this.checkSkulls();
                  this.skullBlast();
                  this.generateWalls();
                  break;
               case this.combatTurn == 11:
                  this.deactivateSkulls();
                  this.generateWalls();
                  break;
               case this.combatTurn == 12:
                  this.deSpawnRocks();
                  this.gateExterminate();
                  break;
               case this.combatTurn == 13:
                  this.createSkulls();
                  this.generateWalls();
                  break;
               case this.combatTurn == 14:
                  this.activateSkulls();
                  this.generateWalls();
                  break;
               case this.combatTurn == 15:
                  this.checkSkulls();
                  this.generateWalls();
                  break;
               case this.combatTurn == 16:
                  this.checkSkulls();
                  this.skullBlast();
                  this.generateWalls();
                  break;
               case this.combatTurn == 17:
                  this.deactivateSkulls();
                  this.generateWalls();
                  break;
               case this.combatTurn == 18:
                  this.deSpawnRocks();
                  this.gateExterminate();
                  break;
               case this.combatTurn == 19:
                  this.createSkulls();
                  this.generateWalls();
                  break;
               case this.combatTurn == 20:
                  this.activateSkulls();
                  this.generateWalls();
                  break;
               case this.combatTurn == 21:
                  this.checkSkulls();
                  this.generateWalls();
                  break;
               case this.combatTurn == 22:
                  this.checkSkulls();
                  this.skullBlast();
                  this.generateWalls();
                  break;
               case this.combatTurn == 23:
                  this.deactivateSkulls();
                  this.generateWalls();
                  this.getDialogue(200730);
                  break;
               case this.combatTurn == 24:
                  this.deSpawnRocks();
                  this.gateExterminate();
                  break;
               default:
                  this.summoning = true;
            }
         }
      }

      public function endGateFight():void
      {
         this.objList[0].stageClip.gotoAndStop(13);
      }

      public function generateWalls():void
      {
         switch (true)
         {
            case this.combatTurn == 1:
               this.createWall(5);
               this.createWall(19);
               this.spawnRocks();
               break;
            case this.combatTurn == 2:
               this.createWall(10);
               this.createWall(18);
               break;
            case this.combatTurn == 3:
               this.createWall(1);
               this.createWall(17);
               break;
            case this.combatTurn == 4:
               this.createWall(8);
               this.createWall(4);
               break;
            case this.combatTurn == 5:
               this.createWall(15);
               this.createWall(3);
               break;
            case this.combatTurn == 7:
               this.createWall(5);
               this.createWall(12);
               this.spawnRocks();
               break;
            case this.combatTurn == 8:
               this.createWall(10);
               this.createWall(17);
               break;
            case this.combatTurn == 9:
               this.createWall(1);
               this.createWall(19);
               break;
            case this.combatTurn == 10:
               this.createWall(8);
               this.createWall(11);
               break;
            case this.combatTurn == 11:
               this.createWall(15);
               this.createWall(3);
               break;
            case this.combatTurn == 13:
               this.createWall(12);
               this.createWall(19);
               this.spawnRocks();
               break;
            case this.combatTurn == 14:
               this.createWall(9);
               this.createWall(10);
               break;
            case this.combatTurn == 15:
               this.createWall(5);
               this.createWall(4);
               break;
            case this.combatTurn == 16:
               this.createWall(3);
               this.createWall(5);
               break;
            case this.combatTurn == 17:
               this.createWall(3);
               this.createWall(4);
               this.createWall(5);
               this.createWall(1);
               this.createWall(8);
               this.createWall(15);
               break;
            case this.combatTurn == 19:
               this.spawnRocks();
               break;
            case this.combatTurn == 20:
            case this.combatTurn == 21:
            case this.combatTurn == 22:
            case this.combatTurn == 23:
         }
         this.rockImpact();
         this.summoning = true;
      }

      public function createSkulls():void
      {
         var _loc1_:int = 0;
         _loc1_ = 6;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] == "0000")
            {
               this.combatArray[_loc1_] = this.createEnemy(23, 6, 1, 0, 1);
               this.placeToken(_loc1_);
            }
            _loc1_ += 7;
         }
      }

      public function checkSkulls():void
      {
         var _loc1_:int = 0;
         _loc1_ = 6;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               if (this.combatArray[_loc1_][0][2] != this.combatArray[_loc1_][3][2])
               {
                  this.unitDeath(_loc1_);
                  this.combatArray[_loc1_] = this.createEnemy(24, 6, 1, 0, 1);
                  this.placeToken(_loc1_);
               }
            }
            _loc1_ += 7;
         }
      }

      public function skullBlast():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 6;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               _loc2_ = this.objList[this.combatArray[_loc1_][6][0]];
               _loc2_.stageClip.gotoAndStop(4);
            }
            _loc1_ += 7;
         }
      }

      public function gateExtermImpact():void
      {
         this.boss.stageClip.gotoAndStop(17);
         this.boss.visible = true;
         this.summoning = true;
      }

      public function checkSkullDamage(param1:int):void
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = undefined;
         _loc2_ = false;
         switch (true)
         {
            case param1 - 1 == this.currentGrid:
               _loc2_ = true;
               break;
            case param1 - 2 == this.currentGrid:
               _loc2_ = true;
               break;
            case param1 - 3 == this.currentGrid:
               _loc2_ = true;
               break;
            case param1 - 4 == this.currentGrid:
               _loc2_ = true;
               break;
            case param1 - 5 == this.currentGrid:
               _loc2_ = true;
               break;
            case param1 - 6 == this.currentGrid:
               _loc2_ = true;
         }
         if (_loc2_)
         {
            _loc3_ = 500;
            _loc3_ -= this.combatArray[this.currentGrid][4][0];
            if (_loc3_ > 0)
            {
               this.objList[0].stageClip.gotoAndStop(10);
               this.combatStats[0] -= _loc3_;
               if (this.combatStats[0] <= 0)
               {
                  this.combatStats[0] = 0;
               }
               this.uiHolder.charBar.updateGUI();
            }
         }
      }

      public function activateSkulls():void
      {
         var _loc1_:int = 0;
         _loc1_ = 6;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               this.unitDeath(_loc1_);
               this.combatArray[_loc1_] = this.createEnemy(22, 6, 1, 0, 1);
               this.placeToken(_loc1_);
            }
            _loc1_ += 7;
         }
      }

      public function deactivateSkulls():void
      {
         var _loc1_:int = 0;
         _loc1_ = 6;
         while (_loc1_ < 21)
         {
            if (this.combatArray[_loc1_] != "0000")
            {
               this.unitDeath(_loc1_);
               this.combatArray[_loc1_] = this.createEnemy(24, 6, 1, 0, 1);
               this.placeToken(_loc1_);
            }
            _loc1_ += 7;
         }
      }

      public function rockImpact():void
      {
         var _loc1_:* = undefined;
         if (this.currentGrid == 0 || this.currentGrid == 7 || this.currentGrid == 14)
         {
            _loc1_ = 75;
            _loc1_ -= this.combatArray[this.currentGrid][4][0];
            if (_loc1_ > 0)
            {
               this.rocksArray[0].gotoAndPlay(11);
               this.rocksArray[1].gotoAndPlay(11);
               this.rocksArray[2].gotoAndPlay(11);
               this.objList[0].stageClip.gotoAndStop(10);
               this.combatStats[0] -= _loc1_;
               if (this.combatStats[0] <= 0)
               {
                  this.combatStats[0] = 0;
               }
               this.uiHolder.charBar.updateGUI();
            }
         }
      }

      public function exterminateDamage():void
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc1_ = false;
         _loc2_ = 0;
         switch (true)
         {
            case this.currentGrid == 0:
               _loc2_ = 5;
               break;
            case this.currentGrid == 1:
               _loc2_ = 4;
               break;
            case this.currentGrid == 2:
               _loc2_ = 3;
               break;
            case this.currentGrid == 3:
               _loc1_ = true;
               break;
            case this.currentGrid == 4:
               _loc1_ = true;
               break;
            case this.currentGrid == 5:
               _loc1_ = true;
               break;
            case this.currentGrid == 7:
               _loc2_ = 5;
               break;
            case this.currentGrid == 8:
               _loc2_ = 4;
               break;
            case this.currentGrid == 9:
               _loc2_ = 3;
               break;
            case this.currentGrid == 10:
               _loc1_ = true;
               break;
            case this.currentGrid == 11:
               _loc1_ = true;
               break;
            case this.currentGrid == 12:
               _loc1_ = true;
               break;
            case this.currentGrid == 14:
               _loc2_ = 5;
               break;
            case this.currentGrid == 15:
               _loc2_ = 4;
               break;
            case this.currentGrid == 16:
               _loc2_ = 3;
               break;
            case this.currentGrid == 17:
               _loc1_ = true;
               break;
            case this.currentGrid == 18:
               _loc1_ = true;
               break;
            case this.currentGrid == 19:
               _loc1_ = true;
         }
         if (_loc2_ != 0)
         {
            _loc3_ = 0;
            _loc4_ = 1;
            while (_loc4_ <= _loc2_)
            {
               if (this.combatArray[this.currentGrid + _loc4_] != "0000")
               {
                  _loc3_++;
               }
               _loc4_++;
            }
            if (_loc3_ < 3)
            {
               _loc1_ = true;
            }
         }
         if (this.combatTurn > 23)
         {
            _loc1_ = false;
         }
         if (_loc1_)
         {
            this.objList[0].stageClip.gotoAndStop(10);
            this.combatStats[0] = 0;
            this.uiHolder.charBar.updateGUI();
         }
         else
         {
            this.wipeWalls();
         }
      }

      public function spawnRocks():void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         _loc1_ = 0;
         while (_loc1_ < 15)
         {
            _loc2_ = new asRocks();
            this.uiHolder.addChild(_loc2_);
            _loc2_.x = this.combatGrid["grid" + _loc1_].x;
            _loc2_.y = this.combatGrid["grid" + _loc1_].y;
            _loc2_.mouseEnabled = false;
            _loc2_.mouseChildren = false;
            this.rocksArray.push(_loc2_);
            _loc1_ += 7;
         }
      }

      public function deSpawnRocks():void
      {
         this.uiHolder.removeChild(this.rocksArray[0]);
         this.uiHolder.removeChild(this.rocksArray[1]);
         this.uiHolder.removeChild(this.rocksArray[2]);
         this.rocksArray = null;
         this.rocksArray = new Array();
      }

      public function wipeWalls():void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while (_loc1_ < 21)
         {
            if (_loc1_ != this.currentGrid && this.combatArray[_loc1_] != "0000")
            {
               if (_loc1_ != 6 && _loc1_ != 13 && _loc1_ != 20)
               {
                  this.unitDeath(_loc1_);
               }
            }
            _loc1_++;
         }
      }

      public function createWall(param1:int):void
      {
         if (this.currentGrid != param1 && this.combatArray[param1] == "0000")
         {
            this.combatArray[param1] = this.createEnemy(17, 6, 1, 0, 1);
            this.placeToken(param1);
         }
      }

      internal function gateExterminate():void
      {
         this.eventLock = true;
         this.combatStats[15] = 0;
         this.uiHolder.enemyBar.updateGUI();
         this.cSpecial = new asSpec_GG();
         this.uiHolder.addChild(this.cSpecial);
         addChild(this.specMask);
         this.cSpecial.mask = this.specMask;
         this.summoning = true;
      }

      internal function getMissionText(param1:int):Array
      {
         switch (true)
         {
            case param1 == 11:
               return new Array("地下隆隆", "我们发现你姐妹的军队试图利用地下通道偷偷潜入。我们应该在通道被封锁之前在那里部署守卫。");

            case param1 == 12:
               return new Array("疯狂之眼", "关于你选择的氏族有一些不好的传言在流传。我们应该派一个代表去展示他们到底有多凶猛。");

            case param1 == 13:
               return new Array("跑起来，福雷斯特", "血收获节快到了！你真应该派人参加比赛。有擅长跑步的人选吗？");

            case param1 == 14:
               return new Array("安抚灵魂", "高级神秘者Lucky报告说岛上的灵魂不喜欢你神殿周围新增的交通和噪音。我们应该让它们平静下来。");

            case param1 == 15:
               return new Array("清理道路", "我们的军队在虚空中推进时造成了大量附带损害。我们应该派一个拆除小队开始清理瓦砾。");

            case param1 == 16:
               return new Array("肮脏交易", "有人偷偷溜进来在酒吧留下这张纸条:'征求:毛发丰满的雄性。必须签署保密协议否则面临死亡。询问B'");

            case param1 == 21:
               return new Array("辐射", "Pecunia夫人在废土的一个工厂发生了爆炸。需要清理,但有大量有毒物质泄漏。");

            case param1 == 22:
               return new Array("绞肉机", "许多关键机器已经失修。大部分齿轮和机械都卡住了,我们的工具没有足够的扭矩来修理它们。");

            case param1 == 23:
               return new Array("好多牛肉", "真不敢相信我们打倒了一只虚空巨兽！它身上的肉够我们的军队吃一个月！我们只需要找人来切割尸体。");

            case param1 == 24:
               return new Array("赫卡托姆的诅咒", "我们的一位队长染上了一种奇怪的诅咒。我们的治疗师的魔法似乎都不起作用 - 我们需要尝试另一种医疗方法。");

            case param1 == 25:
               return new Array("敢死队", "在我们的领地周围出现了随机的能量干扰点。Pecunia说一次负能量爆炸应该能解决它们。");

            case param1 == 26:
               return new Array("冷酷一击", "酒吧又出现一张匿名纸条:'征求:一个隐藏在冷钢中的祝福,其快感能达到未知的部位！一次又一次地冲击,铁匠大师！'");

               // 继续翻译其他任务...
            case param1 == 31:
               return new Array("需要增援", "我们的领地边境需要更多守卫,但大多数坦克太慢了。我们需要不会被盾牌减速的防御者。");

            case param1 == 32:
               return new Array("杀光他们", "虚空中的一道裂缝在我们东部边境释放出了奇怪的生物。我们需要派遣熟悉这些东西的人去消灭它们。");

            case param1 == 33:
               return new Array("梦想终结", "一些次级恶魔领主已向Irania宣誓效忠 - 他们的防御很严密,所以我们需要一个能在位面间移动的刺客。");

            case param1 == 34:
               return new Array("修复虚空", "虚空裂缝似乎越来越常见了...这不是个好兆头...我们需要立即派人去封印它们。");

            case param1 == 35:
               return new Array("噬梦者", "我收到一个特殊请求。看来Tiki夫人想通过磨练她的能量吸收技能来更好地为您服务。她问我是否认识一个好教练？");

            case param1 == 36:
               return new Array("狼群首领", "谁一直在这里放这些纸条？这张写着:'需要公鸡做实验。优先考虑狼人。需要多个申请者,报酬微薄。'");

               // 继续翻译更多任务...
            case param1 == 41:
               return new Array("深入森林", "穿过暗影森林的商队失踪数量急剧增加。商人们请求派遣熟悉该地区的装甲支援。");

            case param1 == 42:
               return new Array("致命之舞", "一位当地恶魔领主正在为他的女儿寻找战斗教练。她想要一把更大的武器,但认为它们缺乏优雅和风格。");

            case param1 == 43:
               return new Array("公路狂怒", "情报显示敌军正试图在主干道上设置伏击点。我们应该派遣调查员,但要迅速且安静以避免惊动他们。");

            case param1 == 44:
               return new Array("甜蜜失败", "自从工头被派往前线后,蜂巢的花蜜产量就受到了影响。为了恢复产量,需要一个新的监工来填补空缺。");

            case param1 == 45:
               return new Array("注意礼仪", "虽然打人脸很有趣,但有时需要更微妙的审讯方法。我们的探索者正在请求心灵感应支援。");

            case param1 == 46:
               return new Array("蜜罐", "Amasenoz夫人说如果我们能给她找到一个合适的情人,她就会承诺支持我们的事业。她说她想要一个甜腻腻的人？");

               // 继续翻译...
            case param1 == 51:
               return new Array("盾牌升起！", "我们需要开始在领地周围布置守卫来防御你姐妹们的魔法。让我们派遣一些擅长魔法防御的专家。");

            case param1 == 52:
               return new Array("恶性循环", "我们占领的领土越多,控制道路就越困难。我们应该在主要街道上设置尖刺陷阱。有什么建议吗？");

            case param1 == 53:
               return new Array("森林中的守望者", "我们需要派一些侦察兵巡逻西部边境。那里不太热闹,所以我们应该派遣一个习惯独处的人。");

            case param1 == 54:
               return new Array("倾诉的肩膀", "我知道我们是恶魔,应该超越这些东西,但士气仍然很重要。一点同情心会带来很大改变。");

            case param1 == 55:
               return new Array("死吧,蛆虫！", "一些村庄爆发了恐怖蝇虫灾。由于它们的毒素会导致疯狂,我们应该派一个已经疯了的人去炸掉它们。");

            case param1 == 56:
               return new Array("魔法触摸", "Renra领主请求我们派人在他儿子的生日派对上表演魔术。而且他希望表演以一声巨响结束,如果你明白我的意思。");

               // 继续翻译...
            case param1 == 61:
               return new Array("一系列管道", "Pecunia夫人很生气。似乎是因为她无法合成一种抗损伤凝胶,因为找不到好的样本。");

            case param1 == 62:
               return new Array("切碎", "我们需要摧毁Irania在虚空中放置的魔像。虽然它们几乎免疫所有伤害,但对特定类型的酸很脆弱。");

            case param1 == 63:
               return new Array("酒吧食物", "这是我的个人请求 - 随着新军队和崇拜者的增加,我想我需要开始在酒吧提供食物。认识好厨师吗？");

            case param1 == 64:
               return new Array("绿色果冻", "当我们的治疗师在前线时,非魔法医生需要更多治疗药膏来处理日常伤害。");

            case param1 == 65:
               return new Array("垃圾进,垃圾出", "军队产生的废物量呈指数增长。气味很糟糕;我们应该派人去溶解它。");

            case param1 == 66:
               return new Array("灵巧敏捷", "Ribian大使向你发出挑战,要你给他找一个有效的情人。由于他...巨大的...体型,大多数情人都被撕裂了。");

               // 继续翻译...
            case param1 == 71:
               return new Array("尽你所能打我", "另一个个人请求...这里开始变得吵闹了。我需要一个能挨打却能若无其事的保镖。");

            case param1 == 72:
               return new Array("锤击面门", "巨型蠕虫已经从虚空边缘爬了上来。我们不想让它们到处游荡;在它们的鼻子上狠狠打一下应该能把它们赶走。");

            case param1 == 73:
               return new Array("身处其中", "Beezelba夫人说她有一个重要的侦察任务,但由于该地区的环境能量,我们需要一个特殊的、耐力很强的侦察兵。");

            case param1 == 74:
               return new Array("严厉的爱", "虽然我们的治疗师做得很好,但这个任务需要一个能承受更多伤害的人。我们需要一个皮厚的人。");

            case param1 == 75:
               return new Array("风暴骑士", "天气在许多战斗中都是关键因素。我们需要派人帮助我们的游击队通过控制局部气候变化。");

            case param1 == 76:
               return new Array("有奶吗？", "原来Velora夫人有哺乳癖好。谁能想到呢？她正在寻找一个能在高潮期间和之后满足她需求的情人。");
            default:
               return new Array("XX", "XX");
         }
      }

      public function endActTwo():void
      {
      }
   }
}
