;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN049_0004542B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DN049QuestScript
Quest __temp = self as Quest
DN049QuestScript kmyQuest = __temp as DN049QuestScript
;END AUTOCAST
;BEGIN CODE
;On startup:
;Set up terminal text replacement.
kMyQuest.UpdateTerminalText()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Display 'Report to the Director'
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Reset the security robots.
DN049SecurityFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Security_Greeter.GetActorRef()
if (a != None)
     a.StopCombat()
     a.EvaluatePackage()
EndIf
int i = 0
While (i < Alias_Security_Robots.GetCount())
     a = Alias_Security_Robots.GetAt(i) as Actor
     a.StopCombat()
     a.EvaluatePackage()
     i = i + 1
EndWhile

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049SecurityFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;Shut down the security robots.
DN049SecurityFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Security_Greeter.GetActorRef()
if (a != None)
     a.SetUnconscious(True)
EndIf
int i = 0
While (i < Alias_Security_Robots.GetCount())
     a = Alias_Security_Robots.GetAt(i) as Actor
     a.SetUnconscious(True)
     i = i + 1
EndWhile

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049SecurityFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0056_Item_00
Function Fragment_Stage_0056_Item_00()
;BEGIN CODE
;Self Destruct the security robots.
DN049SecurityFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Security_Greeter.GetActorRef()
if ((a != None) && (!a.IsDead()))
     (a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()
EndIf
int i = 0
While (i < Alias_Security_Robots.GetCount())
     a = Alias_Security_Robots.GetAt(i) as Actor
     (a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()
     i = i + 1
EndWhile

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049SecurityFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;When the player enters the ring:
;Stop Mack's scene to cut off his dialogue.
DN049_Mad_100_MackCall.Stop()

;Trigger the Champ's Intro.
DN049_Mad_110_ChampIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;Trigger the Champ to attack.
DN049MaddensChampFaction.SetEnemy(PlayerFaction)
Alias_Mad_Champ.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0124_Item_00
Function Fragment_Stage_0124_Item_00()
;BEGIN CODE
;If the player leaves the ring before defeating the Champ, Mack calls a Ring Out.
if (!GetStageDone(125) && !GetStageDone(129) && !GetStageDone(149) && !GetStageDone(150))
     DN049_Mad_110_ChampIntro.Stop()
     DN049_Mad_124_ReactToRingOut.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
;If the player attacks the Champ with an illegal weapon, Mack calls a foul.
if (!GetStageDone(124) && !GetStageDone(129) && !GetStageDone(149) && !GetStageDone(150))
     DN049_Mad_110_ChampIntro.Stop()
     DN049_Mad_125_ReactToWeapon.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0129_Item_00
Function Fragment_Stage_0129_Item_00()
;BEGIN CODE
;If the player manages to defeat the Champ with only legal hits, Mack reacts.
DN049_Mad_129_ChampDefeated.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0149_Item_00
Function Fragment_Stage_0149_Item_00()
;BEGIN AUTOCAST TYPE DN049QuestScript
Quest __temp = self as Quest
DN049QuestScript kmyQuest = __temp as DN049QuestScript
;END AUTOCAST
;BEGIN CODE
;Set the robots in Madden's hostile.
DN049MaddensFaction.SetEnemy(PlayerFaction)
DN049MaddensChampFaction.SetEnemy(PlayerFaction)
Alias_Mad_Champ.TryToEvaluatePackage()
Alias_Mad_Champ.GetActorRef().SetValue(DMP_ReleaseHoldPosition, 1)
Alias_Mad_Danny.TryToEvaluatePackage()
Alias_Mad_Mack.TryToEvaluatePackage()

;Update terminal text replacement.
kMyQuest.UpdateTerminalText()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Reset the robots from Madden's.
DN049_Mad_100_MackCall.Stop()
DN049MaddensFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Mad_Champ.GetActorRef()
if (a != None)
     a.StopCombat()
     a.EvaluatePackage()
EndIf
a = Alias_Mad_Danny.GetActorRef()
if (a != None)
     a.StopCombat()
     a.EvaluatePackage()
EndIf
a = Alias_Mad_Mack.GetActorRef()
if (a != None)
     a.StopCombat()
     a.EvaluatePackage()
EndIf

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049MaddensFaction)

;Send the robots home.
DN049_Mad_160_MackExplain.Stop()
DN049_Mad_150_GrandReopen.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0151_Item_00
Function Fragment_Stage_0151_Item_00()
;BEGIN CODE
;Once The Champ is back in his pod, kill him.
Alias_Mad_Champ.TryToKill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_00
Function Fragment_Stage_0155_Item_00()
;BEGIN CODE
;Shut down the robots from Madden's.
DN049MaddensFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Mad_Champ.GetActorRef()
if (a != None)
     a.SetUnconscious(True)
EndIf
a = Alias_Mad_Danny.GetActorRef()
if (a != None)
     a.SetUnconscious(True)
EndIf
a = Alias_Mad_Mack.GetActorRef()
if (a != None)
     a.SetUnconscious(True)
EndIf

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049MaddensFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0156_Item_00
Function Fragment_Stage_0156_Item_00()
;BEGIN CODE
;Shut down the robots in Madden's.
DN049MaddensFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Mad_Champ.GetActorRef()
if ((a != None) && (!a.IsDead()))
     (a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()
EndIf
a = Alias_Mad_Danny.GetActorRef()
if ((a != None) && (!a.IsDead()))
     (a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()
EndIf
a = Alias_Mad_Mack.GetActorRef()
if ((a != None) && (!a.IsDead()))
     (a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
;Start Mack's explanation scene when the player enters.
DN049_Mad_160_MackExplain.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0199_Item_00
Function Fragment_Stage_0199_Item_00()
;BEGIN CODE
;Add the player to the store's faction, allowing them to loot it without triggering theft.
Game.GetPlayer().AddToFaction(DN049MaddensFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Start the Product Demo when the player enters the store.
DN049_Outlet_200_Demo.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE DN049QuestScript
Quest __temp = self as Quest
DN049QuestScript kmyQuest = __temp as DN049QuestScript
;END AUTOCAST
;BEGIN CODE
;Start the scripted Mr. Handy demo.
kMyQuest.StartOutletDemo()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN AUTOCAST TYPE DN049QuestScript
Quest __temp = self as Quest
DN049QuestScript kmyQuest = __temp as DN049QuestScript
;END AUTOCAST
;BEGIN CODE
;Start the scripted Mr. Handy demo.
kMyQuest.EndOutletDemo()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;Wake the Mr. Gutsy floor models.
int i = 0
While (i < Alias_Outlet_Gutsys.GetCount())
     (Alias_Outlet_Gutsys.GetAt(i) as Actor).SetUnconscious(False)
     (Alias_Outlet_Gutsys.GetAt(i) as Actor).EvaluatePackage()
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0221_Item_00
Function Fragment_Stage_0221_Item_00()
;BEGIN CODE
;Start combat with the Mr. Gutsy floor models.
DN049OutletGutsyDemoModelsFaction.SetEnemy(PlayerFaction)
int i = 0
While (i < Alias_Outlet_Gutsys.GetCount())
     Actor Gutsy = Alias_Outlet_Gutsys.GetAt(i) as Actor
     Gutsy.SetValue(Game.GetAggressionAV(), 2)
     Gutsy.EvaluatePackage()
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
;Demo scene resumes.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0249_Item_00
Function Fragment_Stage_0249_Item_00()
;BEGIN AUTOCAST TYPE DN049QuestScript
Quest __temp = self as Quest
DN049QuestScript kmyQuest = __temp as DN049QuestScript
;END AUTOCAST
;BEGIN CODE
;Set the robots in the Outlet hostile.
DN049OutletFaction.SetEnemy(PlayerFaction)
Alias_Outlet_Sprocket.TryToEvaluatePackage()

;Don't set the other robots hostile if they aren't already; they'd just overwhelm the player.

;Update terminal text replacement.
kMyQuest.UpdateTerminalText()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;Reset the robots from the Outlet.
DN049OutletFaction.SetEnemy(PlayerFaction, True)
DN049OutletGutsyDemoModelsFaction.SetEnemy(PlayerFaction, True)
DN049OutletHandyDemoModelsFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Outlet_Sprocket.GetActorRef()
if (a != None)
     a.StopCombat()
     a.EvaluatePackage()
EndIf

Actor[] DemoModels = new Actor[0]
int i = 0
While (i < Alias_Outlet_Handys.GetCount())
     DemoModels.Add(Alias_Outlet_Handys.GetAt(i) as Actor)
     i = i + 1
EndWhile
i = 0
While (i < Alias_Outlet_Gutsys.GetCount())
     DemoModels.Add(Alias_Outlet_Gutsys.GetAt(i) as Actor)
     i = i + 1
EndWhile
i = 0
While (i < DemoModels.Length)
     if (DemoModels[i] != None)
          DemoModels[i].Kill()
     EndIf
     i = i + 1
EndWhile

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049OutletFaction)

;Send the robots home.
DN049_Outlet_250_GrandReopen.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Shut down the robots from the Outlet.
DN049OutletFaction.SetEnemy(PlayerFaction, True)
DN049OutletGutsyDemoModelsFaction.SetEnemy(PlayerFaction, True)
DN049OutletHandyDemoModelsFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Outlet_Sprocket.GetActorRef()
if (a != None)
     a.SetUnconscious(True)
EndIf
int i = 0
While (i < Alias_Outlet_Handys.GetCount())
     a = Alias_Outlet_Handys.GetAt(i) as Actor
     a.SetUnconscious(True)
     i = i + 1
EndWhile
i = 0
While (i < Alias_Outlet_Gutsys.GetCount())
     a = Alias_Outlet_Handys.GetAt(i) as Actor
     a.SetUnconscious(True)
     i = i + 1
EndWhile

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049OutletFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0256_Item_00
Function Fragment_Stage_0256_Item_00()
;BEGIN CODE
;Shut down the robots in the Outlet.
DN049OutletFaction.SetEnemy(PlayerFaction, True)
DN049OutletGutsyDemoModelsFaction.SetEnemy(PlayerFaction, True)
DN049OutletHandyDemoModelsFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Outlet_Sprocket.GetActorRef()
if ((a != None) && (!a.IsDead()))
     (a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()
EndIf
int i = 0
While (i < Alias_Outlet_Handys.GetCount())
     a = Alias_Outlet_Handys.GetAt(i) as Actor
     if ((a != None) && (!a.IsDead()))
          (a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()
     EndIf
     i = i + 1
EndWhile
i = 0
While (i < Alias_Outlet_Gutsys.GetCount())
     a = Alias_Outlet_Handys.GetAt(i) as Actor
     if ((a != None) && (!a.IsDead()))
          (a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()
     EndIf
     i = i + 1
EndWhile

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049OutletFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
;Sprocket greets you as you enter.
DN049_Outlet_250_GrandReopen.Stop()
if (GetStageDone(210))
     DN049_Outlet_260_Return.Start()
Else
     SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0298_Item_00
Function Fragment_Stage_0298_Item_00()
;BEGIN CODE
;Player has killed Sproket, the Outlet manager robot. Clear ownership.
SetStage(299)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0299_Item_00
Function Fragment_Stage_0299_Item_00()
;BEGIN CODE
;Add the player to the store's faction, allowing them to loot it without triggering theft.
Game.GetPlayer().AddToFaction(DN049OutletFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;EVP Waitron to trigger her forcegreet.
Alias_Diner_Waitron.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;EVP Waitron to trigger her escort.
Alias_Diner_Waitron.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
;EVP Waitron to trigger her forcegreet.
Alias_Diner_Waitron.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
;Play the 'Haven't served you' scene if the player gets up (or otherwise leaves).
if (!GetStageDone(325) && !GetStageDone(349) && !GetStageDone(350))
     DN049_Diner_320_ServeYou.Stop()
     DN049_Diner_330_HaventServed.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0349_Item_00
Function Fragment_Stage_0349_Item_00()
;BEGIN AUTOCAST TYPE DN049QuestScript
Quest __temp = self as Quest
DN049QuestScript kmyQuest = __temp as DN049QuestScript
;END AUTOCAST
;BEGIN CODE
;Set the robots in the Diner hostile.
DN049DinerFaction.SetEnemy(PlayerFaction)
Alias_Diner_Waitron.TryToEvaluatePackage()
Alias_Diner_Chef.TryToEvaluatePackage()

;Update terminal text replacement.
kMyQuest.UpdateTerminalText()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
;Reset the robots from the Diner.
DN049DinerFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Diner_Waitron.GetActorRef()
if (a != None)
     a.StopCombat()
     a.EvaluatePackage()
EndIf
a = Alias_Diner_Chef.GetActorRef()
if (a != None)
     a.StopCombat()
     a.EvaluatePackage()
EndIf

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049DinerFaction)

;Send the robots home.
DN049_Diner_350_GrandReopen.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
;Shut down the robots from the Diner.
DN049DinerFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Diner_Waitron.GetActorRef()
if (a != None)
     a.SetUnconscious()
EndIf
a = Alias_Diner_Chef.GetActorRef()
if (a != None)
     a.SetUnconscious()
EndIf

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049DinerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0356_Item_00
Function Fragment_Stage_0356_Item_00()
;BEGIN CODE
;Self destruct the robots in the Diner.
DN049DinerFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Diner_Waitron.GetActorRef()
if ((a != None) && (!a.IsDead()))
     (a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()
EndIf
a = Alias_Diner_Chef.GetActorRef()
if ((a != None) && (!a.IsDead()))
     (a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()
EndIf

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049DinerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0399_Item_00
Function Fragment_Stage_0399_Item_00()
;BEGIN CODE
;Add the player to the store's faction, allowing them to loot it without triggering theft.
Game.GetPlayer().AddToFaction(DN049DinerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;EVP Reg to get him to forcegreet more quickly.
Alias_Fallons_Reg.TryToEvaluatePackage()

;Reg should follow the player when put into a follow package.
Alias_Fallons_Reg.GetActorRef().FollowerFollow()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
;Cut off Reg's intro scene, if running.
DN049_Fallons_400_Intro1.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
;Start Reg's theft scene.
DN049_Fallons_400_Intro1.Stop()
DN049_Fallons_440_TouchItems.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0449_Item_00
Function Fragment_Stage_0449_Item_00()
;BEGIN AUTOCAST TYPE DN049QuestScript
Quest __temp = self as Quest
DN049QuestScript kmyQuest = __temp as DN049QuestScript
;END AUTOCAST
;BEGIN CODE
;Set the robots in Fallon's hostile.
DN049FallonsFaction.SetEnemy(PlayerFaction)
Alias_Fallons_Reg.TryToEvaluatePackage()

;Update terminal text replacement.
kMyQuest.UpdateTerminalText()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
;Reset the robots from Fallon's
DN049FallonsFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Fallons_Reg.GetActorRef()
if (a != None)
     a.StopCombat()
     a.EvaluatePackage()
EndIf

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049FallonsFaction)

;Send the robots home.
DN049_Fallons_450_GrandReopen.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0455_Item_00
Function Fragment_Stage_0455_Item_00()
;BEGIN CODE
;Shut down the robots from Fallon's
DN049FallonsFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Fallons_Reg.GetActorRef()
if (a != None)
     a.SetUnconscious()
EndIf

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049FallonsFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0456_Item_00
Function Fragment_Stage_0456_Item_00()
;BEGIN CODE
;Self Destruct the robots in Fallon's
DN049FallonsFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Fallons_Reg.GetActorRef()
if ((a != None) && (!a.IsDead()))
     (a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()
EndIf

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049FallonsFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
;Reg greets you as you enter.
DN049_Fallons_450_GrandReopen.Stop()
DN049_Fallons_460_Greet.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0499_Item_00
Function Fragment_Stage_0499_Item_00()
;BEGIN CODE
;Add the player to the store's faction, allowing them to loot it without triggering theft.
Game.GetPlayer().AddToFaction(DN049FallonsFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Player enters the store. Candy calls out for them to take a number.
DN049_Bake_500_CallTickets.Stop()
DN049_Bake_500_TakeNumber.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0501_Item_00
Function Fragment_Stage_0501_Item_00()
;BEGIN CODE
;Resume calling numbers.
DN049_Bake_500_TakeNumber.Stop()
DN049_Bake_500_CallTickets.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0549_Item_00
Function Fragment_Stage_0549_Item_00()
;BEGIN AUTOCAST TYPE DN049QuestScript
Quest __temp = self as Quest
DN049QuestScript kmyQuest = __temp as DN049QuestScript
;END AUTOCAST
;BEGIN CODE
;Set the robots in the Bakery hostile.
DN049BakeryFaction.SetEnemy(PlayerFaction)
DN049_Bake_500_CallTickets.Stop()
Alias_Bake_Crisp.TryToEvaluatePackage()
Alias_Bake_Cooke.TryToEvaluatePackage()

;Update terminal text replacement.
kMyQuest.UpdateTerminalText()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
;Stop calling tickets.
DN049_Bake_500_CallTickets.Stop()

;Reset the robots from the Bakery.
DN049BakeryFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Bake_Crisp.GetActorRef()
if (a != None)
     a.StopCombat()
     a.EvaluatePackage()
EndIf
a = Alias_Bake_Cooke.GetActorRef()
if (a != None)
     a.StopCombat()
     a.EvaluatePackage()
EndIf

;Clear ownership on the bakery kitchen doors.
DN049_Bake_KitchenDoor01.SetFactionOwner(None)
DN049_Bake_KitchenDoor02.SetFactionOwner(None)

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049BakeryFaction)

;Send the robots home.
DN049_Bake_550_GrandReopen.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0555_Item_00
Function Fragment_Stage_0555_Item_00()
;BEGIN CODE
;Shut down the robots from the Bakery.
DN049BakeryFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Bake_Crisp.GetActorRef()
if (a != None)
     a.SetUnconscious()
EndIf
a = Alias_Bake_Cooke.GetActorRef()
if (a != None)
     a.SetUnconscious()
EndIf

;Clear ownership on the bakery kitchen doors.
DN049_Bake_KitchenDoor01.SetFactionOwner(None)
DN049_Bake_KitchenDoor02.SetFactionOwner(None)

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049BakeryFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0556_Item_00
Function Fragment_Stage_0556_Item_00()
;BEGIN CODE
;Self destruct the robots in the Bakery.
DN049BakeryFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Bake_Crisp.GetActorRef()
if ((a != None) && (!a.IsDead()))
     (a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()
EndIf
a = Alias_Bake_Cooke.GetActorRef()
if ((a != None) && (!a.IsDead()))
     (a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()
EndIf

;Clear ownership on the bakery kitchen doors.
DN049_Bake_KitchenDoor01.SetFactionOwner(None)
DN049_Bake_KitchenDoor02.SetFactionOwner(None)

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049BakeryFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0599_Item_00
Function Fragment_Stage_0599_Item_00()
;BEGIN CODE
;Add the player to the store's faction, allowing them to loot it without triggering theft.
Game.GetPlayer().AddToFaction(DN049BakeryFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Play welcome scene on entry.
DN049_Slo_600_Welcome.Start()
Alias_Slo_Bean.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
;Enable a coffee cup on the counter.
DN049_Slo_CoffeeServiceCup.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0611_Item_00
Function Fragment_Stage_0611_Item_00()
;BEGIN AUTOCAST TYPE DN049QuestScript
Quest __temp = self as Quest
DN049QuestScript kmyQuest = __temp as DN049QuestScript
;END AUTOCAST
;BEGIN CODE
;EVP Bean, causing him to use his flamethrower and set off the gas trap.
Alias_Slo_Bean.TryToEvaluatePackage()

;Force the gas trap to explode if the flamethrower fails to set it off.
kMyQuest.SetMajorStage(3, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0649_Item_00
Function Fragment_Stage_0649_Item_00()
;BEGIN AUTOCAST TYPE DN049QuestScript
Quest __temp = self as Quest
DN049QuestScript kmyQuest = __temp as DN049QuestScript
;END AUTOCAST
;BEGIN CODE
;Set the robots in Slocum's Joe hostile.
DN049SlocumFaction.SetEnemy(PlayerFaction)
Alias_Slo_Bean.TryToEvaluatePackage()

;If Bean used his flamethrower, play the Hostile scene.
if (GetStageDone(611))
     DN049_Slo_649_Hostile.Start()
EndIf

;Update terminal text replacement.
kMyQuest.UpdateTerminalText()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
;Reset the robots from Slocum's
DN049SlocumFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Slo_Bean.GetActorRef()
if (a != None)
     a.StopCombat()
     a.EvaluatePackage()
EndIf

;Stop Bean's hostile scene.
DN049_Slo_649_Hostile.Stop()

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049SlocumFaction)

;Send the robots home.
DN049_Slo_650_GrandReopen.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0655_Item_00
Function Fragment_Stage_0655_Item_00()
;BEGIN CODE
;Shut down the robots in Slocum's
DN049SlocumFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Slo_Bean.GetActorRef()
if (a != None)
     a.SetUnconscious()
EndIf

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049SlocumFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0656_Item_00
Function Fragment_Stage_0656_Item_00()
;BEGIN CODE
;Self-Destruct the robots in Slocum's
DN049SlocumFaction.SetEnemy(PlayerFaction, True)
Actor a = Alias_Slo_Bean.GetActorRef()
if ((a != None) && (!a.IsDead()))
     (a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()
EndIf

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049SlocumFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
;Play welcome scene on entry.
DN049_Slo_650_GrandReopen.Stop()
DN049_Slo_600_Welcome.Start()
Alias_Slo_Bean.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0699_Item_00
Function Fragment_Stage_0699_Item_00()
;BEGIN CODE
;Add the player to the store's faction, allowing them to loot it without triggering theft.
Game.GetPlayer().AddToFaction(DN049SlocumFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
;Manager greets you as you enter.
DN049_Bowl_700_Greet.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0701_Item_00
Function Fragment_Stage_0701_Item_00()
;BEGIN CODE
;Manager greets you as you enter.
DN049_Bowl_700_Greet.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0705_Item_00
Function Fragment_Stage_0705_Item_00()
;BEGIN CODE
;When the player reads the appropriate message on the Office Terminal,
;give them the password to the Director's terminal.
Game.GetPlayer().AddItem(DN049_DirectorTerminalPassword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
;Add the player to the store's faction, allowing them to loot it without triggering theft.
Game.GetPlayer().AddToFaction(DN049BowlingAlleyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0711_Item_00
Function Fragment_Stage_0711_Item_00()
;BEGIN CODE
;Take 5000 money from the player and give it to the manager.
if (Game.GetPlayer().GetItemCount(PrewarMoney) >= 5000)
     Game.GetPlayer().RemoveItem(PrewarMoney, 5000, False, Alias_Bowling_Manager.GetActorRef())
     ;Allow the player to pass.
     SetStage(710)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
;Player hits the trigger at the end of the reception area without paying.
if (!GetStageDone(710) && !GetStageDone(749) && !GetStageDone(750))
     DN049_Bowl_700_Greet.Stop()
     DN049_Bowl_720_HaveToPay.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0749_Item_00
Function Fragment_Stage_0749_Item_00()
;BEGIN AUTOCAST TYPE DN049QuestScript
Quest __temp = self as Quest
DN049QuestScript kmyQuest = __temp as DN049QuestScript
;END AUTOCAST
;BEGIN CODE
;Set the robots in the Bowling Alley hostile.
DN049BowlingAlleyFaction.SetEnemy(PlayerFaction)
Alias_Bowling_Manager.TryToEvaluatePackage()
int i = 0
While (i < Alias_Bowling_Attendants.GetCount())
     (Alias_Bowling_Attendants.GetAt(i) as Actor).EvaluatePackage()
     i = i + 1
EndWhile

;Update terminal text replacement.
kMyQuest.UpdateTerminalText()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
;Reset the robots from the Bowling Alley.
DN049BowlingAlleyFaction.SetEnemy(PlayerFaction, True)

Actor a = Alias_Bowling_Manager.GetActorRef()
a.StopCombat()
a.EvaluatePackage()

int i = 0
While (i < Alias_Bowling_Attendants.GetCount())
     a = Alias_Bowling_Attendants.GetAt(i) as Actor
     a.StopCombat()
     a.EvaluatePackage()
     i = i + 1
EndWhile

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049BowlingAlleyFaction)

;Send the robots home.
DN049_Bowl_GrandReopen.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0755_Item_00
Function Fragment_Stage_0755_Item_00()
;BEGIN CODE
;Shut down the robots in the Bowling Alley.
DN049BowlingAlleyFaction.SetEnemy(PlayerFaction, True)

Actor a = Alias_Bowling_Manager.GetActorRef()
a.SetUnconscious()

int i = 0
While (i < Alias_Bowling_Attendants.GetCount())
     a = Alias_Bowling_Attendants.GetAt(i) as Actor
     a.SetUnconscious(True)
     i = i + 1
EndWhile

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049BowlingAlleyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0756_Item_00
Function Fragment_Stage_0756_Item_00()
;BEGIN CODE
;Self-Destruct the robots in the Bowling Alley
Actor a = Alias_Bowling_Manager.GetActorRef()
(a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()

int i = 0
While (i < Alias_Bowling_Attendants.GetCount())
     (a as DN049_RobotSelfDestructScript).InitiateSelfDestruct()
     i = i + 1
EndWhile

;Add the player to the faction, allowing them to loot items.
Game.GetPlayer().AddToFaction(DN049BowlingAlleyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN CODE
;Play Greet 2 scene.
DN049_Bowl_760_Greet2.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0770_Item_00
Function Fragment_Stage_0770_Item_00()
;BEGIN CODE
;Enable Spare, the alternate manager.
Actor manager = Alias_Bowling_Manager.GetActorRef()
if ((manager == None) || (manager.IsDead()))
     Alias_Bowling_Spare.TryToEnable()
     Alias_Bowling_Manager.ForceRefTo(Alias_Bowling_Spare.GetActorRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0797_Item_00
Function Fragment_Stage_0797_Item_00()
;BEGIN CODE
;Player has killed the bowling manager.
;If all of the robots in the bowling alley are dead, clear ownership.
if (GetStageDone(797) && GetStageDone(798))
     SetStage(799)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0798_Item_00
Function Fragment_Stage_0798_Item_00()
;BEGIN CODE
;Player has killed the bowling attendants.
;If all of the robots in the bowling alley are dead, clear ownership.
if (GetStageDone(797) && GetStageDone(798))
     SetStage(799)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0799_Item_00
Function Fragment_Stage_0799_Item_00()
;BEGIN CODE
;Add the player to the store's faction, allowing them to loot it without triggering theft.
Game.GetPlayer().AddToFaction(DN049BowlingAlleyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
;Remove the Director's invulnerability.
Alias_Director.GetActorRef().RemovePerk(DN049DirectorImmunityPerk)

;Play the Director's approach line.
DN049_Director_800_Approach.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
;EVP the Director to end his forcegreet.
Alias_Director.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN CODE
;If the player has the General Atomics ID, give them a gold watch.
Game.GetPlayer().AddItem(WatchGold)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0848_Item_00
Function Fragment_Stage_0848_Item_00()
;BEGIN AUTOCAST TYPE DN049QuestScript
Quest __temp = self as Quest
DN049QuestScript kmyQuest = __temp as DN049QuestScript
;END AUTOCAST
;BEGIN CODE
;Update terminal text replacement.
kMyQuest.UpdateTerminalText()

;Stop the Director's radio.
DN049_Director_800_Radio.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0849_Item_00
Function Fragment_Stage_0849_Item_00()
;BEGIN CODE
;Set the Director and Security factions hostile.
DN049DirectorFaction.SetEnemy(PlayerFaction)
DN049SecurityFaction.SetEnemy(PlayerFaction)

;Complete 'Report to the Director'
SetObjectiveCompleted(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
;Set the flag stage.
SetStage(860)

;Complete 'Report to the Director'
SetObjectiveCompleted(30)

;This counts as clearing the location.
Alias_GeneralAtomicsCenterLocation.GetLocation().SetCleared(True)

;Trigger the reward music.
DN049_RewardMusicActivator.Activate(DN049_RewardMusicActivator)

;Reset the behavior of all of the robots in the stores.
SetStage(50)
SetStage(150)
SetStage(250)
SetStage(350)
SetStage(450)
SetStage(550)
SetStage(650)
SetStage(750)

;Set the radio counter back to 0.
DN049_DirectorRadio_Count.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0851_Item_00
Function Fragment_Stage_0851_Item_00()
;BEGIN CODE
;Award Grand Reopening raffle prize.
Game.GetPlayer().AddItem(DN049_LL_RafflePrize, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0852_Item_00
Function Fragment_Stage_0852_Item_00()
;BEGIN CODE
;Stop the Radio scene so we can reuse the transmitter for the Grand Reopening announcements.
DN049_Director_800_Radio.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0855_Item_00
Function Fragment_Stage_0855_Item_00()
;BEGIN CODE
;Set the flag stage.
SetStage(865)

;Complete 'Report to the Director'
SetObjectiveCompleted(30)

;Trigger the reward music.
DN049_RewardMusicActivator.Activate(DN049_RewardMusicActivator)

;Shut down all robots.
SetStage(55)
SetStage(155)
SetStage(255)
SetStage(355)
SetStage(455)
SetStage(555)
SetStage(655)
SetStage(755)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0856_Item_00
Function Fragment_Stage_0856_Item_00()
;BEGIN CODE
;Set the flag stage.
SetStage(866)

;Complete 'Report to the Director'
SetObjectiveCompleted(30)

;Self-Destruct all robots
SetStage(56)
SetStage(156)
SetStage(256)
SetStage(356)
SetStage(456)
SetStage(556)
SetStage(656)
SetStage(756)

;Wait for the explosions to start.
Utility.Wait(5)

;Trigger the reward music.
Debug.Trace("Reward music")
DN049_RewardMusicActivator.Activate(DN049_RewardMusicActivator)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0860_Item_00
Function Fragment_Stage_0860_Item_00()
;BEGIN AUTOCAST TYPE DN049QuestScript
Quest __temp = self as Quest
DN049QuestScript kmyQuest = __temp as DN049QuestScript
;END AUTOCAST
;BEGIN CODE
;Update terminal text replacement.
kMyQuest.UpdateTerminalText()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0865_Item_00
Function Fragment_Stage_0865_Item_00()
;BEGIN AUTOCAST TYPE DN049QuestScript
Quest __temp = self as Quest
DN049QuestScript kmyQuest = __temp as DN049QuestScript
;END AUTOCAST
;BEGIN CODE
;Update terminal text replacement.
kMyQuest.UpdateTerminalText()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0866_Item_00
Function Fragment_Stage_0866_Item_00()
;BEGIN AUTOCAST TYPE DN049QuestScript
Quest __temp = self as Quest
DN049QuestScript kmyQuest = __temp as DN049QuestScript
;END AUTOCAST
;BEGIN CODE
;Update terminal text replacement.
kMyQuest.UpdateTerminalText()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0899_Item_00
Function Fragment_Stage_0899_Item_00()
;BEGIN CODE
;After triggering the Grand Reopening, when the player leaves the area:
;Swap the enable state markers.
DN049_CleanupAfterReopen_Enable.Enable()
DN049_CleanupAfterReopen_Disable.Disable()
;Force the Director's radio to the next state.
DN049_DirectorRadio_Count.SetValue(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



LocationAlias Property Alias_GeneralAtomicsCenterLocation Auto Const

Faction Property PlayerFaction Auto Const
Faction Property RobotFaction Auto Const
Faction Property DN049RobotFaction Auto Const
Faction Property DN049DirectorFaction Auto Const

LeveledItem Property DN049_LL_RafflePrize Auto Const
MiscObject Property WatchGold Auto Const
MiscObject Property PrewarMoney Auto Const
Key Property DN049_DirectorTerminalPassword Auto Const

Explosion Property CarExplosion Auto Const
ActorValue Property Aggression Auto Const
ActorValue Property Health Auto Const


;Security
ReferenceAlias Property Alias_Security_Greeter Auto Const
RefCollectionAlias Property Alias_Security_Robots Auto Const
Faction Property DN049SecurityFaction Auto Const

;Madden's
ReferenceAlias Property Alias_Mad_Champ Auto Const
ReferenceAlias Property Alias_Mad_Mack Auto Const
ReferenceAlias Property Alias_Mad_Danny Auto Const
Faction Property DN049MaddensFaction Auto Const
Scene Property DN049_Mad_110_ChampIntro Auto Const
Scene Property DN049_Mad_100_MackCall Auto Const
Scene Property DN049_Mad_150_GrandReopen Auto Const
Scene Property DN049_Mad_160_MackExplain Auto Const
Perk Property DN049GenAtomicsMaddensPricesPerk Auto Const

;Outlet
ReferenceAlias Property Alias_Outlet_Sprocket Auto Const
ReferenceAlias Property Alias_Outlet_Handy_Speaker Auto Const
RefCollectionAlias Property Alias_Outlet_Gutsys Auto Const
RefCollectionAlias Property Alias_Outlet_Handys Auto Const
Faction Property DN049OutletFaction Auto Const
Faction Property DN049OutletHandyDemoModelsFaction Auto Const
Faction Property DN049OutletGutsyDemoModelsFaction Auto Const
Scene Property DN049_Outlet_200_Demo Auto Const
Scene Property DN049_Outlet_250_GrandReopen Auto Const
Scene Property DN049_Outlet_260_Return Auto Const
Scene Property DN049_Diner_320_ServeYou Auto Const
Scene Property DN049_Diner_330_HaventServed Auto Const
SPELL Property DN049_HandyShortCircuitSpell Auto Const

;Diner
ReferenceAlias Property Alias_Diner_Chef Auto Const
ReferenceAlias Property Alias_Diner_Waitron Auto Const
Faction Property DN049DinerFaction Auto Const
Scene Property DN049_Diner_350_GrandReopen Auto Const

;Fallon's
Faction Property DN049FallonsFaction Auto Const
ReferenceAlias Property Alias_Fallons_Reg Auto Const
DN049_FallonsInventoryScript Property Alias_Fallons_Inventory Auto Const
Scene Property DN049_Fallons_440_TouchItems Auto Const
Scene Property DN049_Fallons_400_Intro1 Auto Const
Scene Property DN049_Fallons_460_Greet Auto Const
Scene Property DN049_Fallons_450_GrandReopen Auto Const

;Bakery
ReferenceAlias Property Alias_Bake_Crisp Auto Const
ReferenceAlias Property Alias_Bake_Cooke Auto Const
ObjectReference Property DN049_Bake_KitchenDoor01 Auto Const
ObjectReference Property DN049_Bake_KitchenDoor02 Auto Const
Faction Property DN049BakeryFaction Auto Const
Scene Property DN049_Bake_500_CallTickets Auto Const
Scene Property DN049_Bake_500_TakeNumber Auto Const
Scene Property DN049_Bake_550_GrandReopen Auto Const

;Slocum's
ReferenceAlias Property Alias_Slo_Bean Auto Const
Faction Property DN049SlocumFaction Auto Const
Scene Property DN049_Slo_600_Welcome Auto Const
Scene Property DN049_Slo_650_GrandReopen Auto Const
ObjectReference Property DN049_Slo_CoffeeServiceCup Auto Const
Scene Property DN049_Slo_649_Hostile Auto Const

;Bowling
ReferenceAlias Property Alias_Bowling_Manager Auto Const
ReferenceAlias Property Alias_Bowling_Tenpin Auto Const
ReferenceAlias Property Alias_Bowling_Spare Auto Const
RefCollectionAlias Property Alias_Bowling_Attendants Auto Const
Faction Property DN049BowlingAlleyFaction Auto Const
Scene Property DN049_Bowl_700_Greet Auto Const
Scene Property DN049_Bowl_700_ManagerDialogue Auto Const
Scene Property DN049_Bowl_720_HaveToPay Auto Const
Scene Property DN049_Bowl_760_Greet2 Auto Const
Scene Property DN049_Bowl_GrandReopen Auto Const

;Director
ReferenceAlias Property Alias_Director Auto Const
GlobalVariable Property DN049_DirectorRadio_Count Auto Const
Scene Property DN049_Director_800_Radio Auto Const
Scene Property DN049_Director_800_Approach Auto Const
Perk Property DN049DirectorImmunityPerk Auto Const

;Post-Reopening
ObjectReference Property DN049_CleanupAfterReopen_Enable Auto Const
ObjectReference Property DN049_CleanupAfterReopen_Disable Auto Const

Faction Property DN049MaddensChampFaction Auto Const

Scene Property DN049_Mad_125_ReactToWeapon Auto Const

Scene Property DN049_Mad_129_ChampDefeated Auto Const

Scene Property DN049_Mad_124_ReactToRingout Auto Const

ActorValue Property DMP_ReleaseHoldPosition Auto Const

ObjectReference Property DN049_RewardMusicActivator Auto Const
