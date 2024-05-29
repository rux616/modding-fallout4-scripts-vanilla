;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS02_000229F7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
(YangtzeReactorRef as DN158_YangtzeReactorScript).OverloadReactor()
Game.GetPlayer().PlaceAtMe(MS01SubNuke)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
MS02Donny.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Captain.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN AUTOCAST TYPE MS02Script
Quest __temp = self as Quest
MS02Script kmyQuest = __temp as MS02Script
;END AUTOCAST
;BEGIN CODE
MUSStingerShort.Add()
kmyquest.Freeze()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
alias_captain.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
game.GetPlayer().AddItem(RewardMoney, 4)
if GetStageDone(2) == true
    game.GetPlayer().AddItem(caps001, RewardCaps)
endif
if GetStageDone(3) == true
    game.GetPlayer().Additem(RewardSword, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Set when Donny first forcegreets the player to stop him doing so again

MUSDread.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Start scene MS02SeaMonsterAppears when the player enters the trigger box around Donny.
MS02SeaMonsterAppears.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set when the player has learned the location of the sea monster in the harbor

if GetStageDone(200) == false
    SetObjectiveDisplayed(100,true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set when the player enters the triggers box around the sub for the first time

SetObjectiveDisplayed(20,true)
MS02MiscObjective.CompleteQuest()
MS02MiscObjective.Stop()
YangtzeMapMarkerRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0202_Item_00
Function Fragment_Stage_0202_Item_00()
;BEGIN CODE
;Set when the captain has initially force-greeted the player.

SetObjectiveCompleted(20, true)
SetObjectiveDisplayed(320, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
;Set when the player first talks to Captain Chen, so the game knows not to play the first hello again

SetObjectiveCompleted(20, true)
SetObjectiveCompleted(100, true)
SetObjectiveDisplayed( 320, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Set when the player refuses to help the Captain at the first decision gate

SetObjectiveCompleted(20, true)
SetObjectiveCompleted(100, true)
SetObjectiveDisplayed(210, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Set when the player is told to get the warhead

SetObjectiveCompleted(500)
SetObjectiveDisplayed(300, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;Set when the player finds the warhead
if GetStageDone(700) == true
    SetObjectiveCompleted(300, true)
    SetObjectiveDisplayed(310, true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Set when the player gets the coordinates to the uranium fuel

SetObjectiveCompleted(320, true)
SetObjectiveDisplayed(500, true)

if GetStageDone(210) == true
    SetObjectiveCompleted(210, true)
endif

if game.getPlayer().GetItemCount(MS02DampeningCoil) > 0
    SetStage(700)
endif

if GetStageDone(850) == true
    SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
;Set when the player obtains the dampening rods
SetObjectiveCompleted(500)
SetObjectiveDisplayed(700)

if GetStageDone(210)
    SetObjectiveCompleted(210)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
;Set when the player optionally speaks to the captain after returning with the dampening rods

SetObjectiveCompleted(700, true)
SetObjectiveDisplayed(300, true)

Setstage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
;Set when the player installs the dampening rod

SetObjectiveCompleted(310, true)
SetObjectiveCompleted(700, true)
if GetStageDone(850) == false
    SetObjectiveDisplayed(800, true)
elseif GetStageDone(900) == false
    SetObjectiveDisplayed(850, true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
;Set when the player installs thermal coupler

SetObjectiveCompleted(800, true)
if getstageDone(800) == true
    SetObjectiveDisplayed(850, true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
;Set when the player installs the warhead

if GetStageDone(850) == false
    MS02WarheadFirst.start()
endif

if GetStageDone(800) == false
    MS02WarheadFirst.start()
endif

SetObjectiveCompleted(850, true)
SetObjectiveDisplayed(900, true)

Setstage(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
;Call this stage to turn the submarine on
(YangtzeReactorRef as DN158_YangtzeReactorScript).TurnReactorOn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
DN158.SetStage(500)

SetObjectiveCompleted(900, true)
game.GetPlayer().Additem(MS02HomingBeacon, 3)

;Update Global for Radio News
RadioDCMS02Ready.SetValue((GameDaysPassed.GetValue() + 1))
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property MS02Coolant Auto Const

MiscObject Property MS02Tubing Auto Const

MiscObject Property MS02UraniumFuel Auto Const

Scene Property MS02SeaMonsterAppears Auto Const

Scene Property MS02CaptainScenePostScanner Auto Const

ReferenceAlias Property Alias_Captain Auto Const

Potion Property pRadAway Auto Const

Quest Property DN158 Auto Const

ReferenceAlias Property Alias_DampeningRod Auto Const

GlobalVariable Property RadioDCMS02Ready Auto Const

GlobalVariable Property GameDaysPassed Auto Const

ObjectReference Property MS02ReactorLightsParent Auto Const

Quest Property MS02MiscObjective Auto Const

Explosion Property MS01SubNuke Auto Const

Scene Property MS02WarheadFirst Auto Const

Weapon Property MS02HomingBeacon Auto Const

Quest Property MS02Donny Auto Const

ObjectReference Property YangtzeReactorRef Auto Const

ObjectReference Property YangtzeMapMarkerRef Auto Const

Int Property RewardCaps Auto Const

MiscObject Property RewardMoney Auto Const

LeveledItem Property RewardSword Auto Const

MiscObject Property Caps001 Auto Const

MusicType Property MUSDread Auto Const

MusicType Property MUSStingerShort Auto Const

MiscObject Property MS02DampeningCoil Auto Const Mandatory
