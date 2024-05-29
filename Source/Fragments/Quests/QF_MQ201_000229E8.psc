;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ201_000229E8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Turn off triggers
pIntroSceneValentinesStart.Disable()

;move everyone in position
Alias_Piper.GetActorRef().EvaluatePackage()
Alias_Nick.GetActorRef().EvaluatePackage()
Alias_Piper.GetActorRef().moveto(pMQ201PiperTravelMarker01)
Alias_Nick.GetActorRef().Moveto(pMQ201NickTravelMarker01)
Alias_Ellie.GetActorRef().moveto(MQ201EllieMoveMarker)
Game.GetPlayer().MoveTo(TestMQ106EndMarker)
Game.GetPlayer().AddItem(MQ201CyberBrain, 1)

;advance the main quest
pMQ106.SetStage(900)
pMQ106.SetStage(1000)
pMQ102.SetStage(200)
DialogueDiamondCityEntrance.SetStage(1000)
FFGoodneighbor01.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;make sure Nick and Ellie's scenes for MS07 are blocked
Alias_MS07bPostQuestTrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;disable the trigger in Nick's office and enable the one in Piper's office
Alias_MQ201aNickOfficeTrigger.GetRef().Disable()

;move piper and make sure she stays in her office
Alias_Piper.GetActorRef().Moveto(MQ201BPiperTravelMarker02)
Alias_Piper.GetActorRef().EvaluatePackage()

Alias_Nick.GetActorRef().EvaluatePackage()

;update objectives in MQ106
pMQ106.SetStage(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
;(pFollowers as FollowersScript).SetCompanion(Alias_Nick.GetActorRef())
Alias_Nick.GetActorRef().AllowCompanion()

SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
Actor NickREF = Alias_Nick.GetActorRef()

If NickREF.IsInFaction(CurrentCompanionFaction) == False
  NickREF.moveto(MQ201BNickTravelMarker02)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Actor PiperREF = Alias_Piper.GetActorRef()

;if Piper is your companion, dismiss her and move her
If PiperREF.IsInFaction(CurrentCompanionFaction) == True
  ;(Followers as FollowersScript).ClearCompanion()
  PiperREF.DisallowCompanion(SuppressDismissMessage=True)
  PiperREF.moveto(MQ201PiperSceneMoveto)
  SetStage(30)
;if Piper is NOT your companion, play the intro scene
Else
  PiperREF.moveto(pMQ201PiperTravelMarker01)
  p001_MQ201_PiperNickIntro.Start()
EndIf

Alias_Nick.GetActorRef().EvaluatePackage()
PiperREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN CODE
Actor NickREF = Alias_Nick.GetActorRef()

;always move Nick to Piper's office
NickREF.moveto(MQ201BNickMovetoMarker)

;if Nick is your companion, dismiss him
If NickREF.IsInFaction(CurrentCompanionFaction) == True
  ;(Followers as FollowersScript).ClearCompanion()
  NickREF.DisallowCompanion(SuppressDismissMessage=True)
EndIf

MQ201b_002_PiperNickIntro.Start()

NickREF.EvaluatePackage()
Alias_Piper.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
MUSSpecialMQ201PiperNick.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;trigger Nick forcegreet
Alias_Nick.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_01
Function Fragment_Stage_0030_Item_01()
;BEGIN CODE
;trigger forcegreet
Alias_Piper.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Nick.GetActorRef().AllowCompanion(True, True)
;(pFollowers as FollowersScript).SetCompanion(Alias_Nick.GetActorRef())

SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_Piper.GetActorRef().AllowCompanion(True, True)
;(pFollowers as FollowersScript).SetCompanion(Alias_Piper.GetActorRef())

SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE MQ201QuestScript
Quest __temp = self as Quest
MQ201QuestScript kmyQuest = __temp as MQ201QuestScript
;END AUTOCAST
;BEGIN CODE
;change Piper's base dialogue and make her a potential companion
pMQ201Piper.SetStage(500)

;update objectives
pMQ106.SetStage(2000)

;add Goodneighbor to the map if it isn't already
GoodneighborMapMarker.AddToMap()

;Piper is no longer essential
;WJS - not anymore
;Alias_Piper.GetActorRef().GetActorBase().SetEssential(false)

; Piper knows about Shaun
PiperKnowsShaun.SetValueInt(1)

;both Piper and Nick can be companions again
Alias_Piper.GetActorRef().AllowCompanion(False, False)
Alias_Nick.GetActorRef().AllowCompanion(False, False)

;player can now take things in Publick Occurrences if they couldn't already
Game.GetPlayer().AddToFaction(DmndPublickOwnerFaction)

;89088 - if for some reason the input layer wasn't deleted, try to delete it again
kmyquest.MQ201PlayerEnableLayer = None
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE MQ201QuestScript
Quest __temp = self as Quest
MQ201QuestScript kmyQuest = __temp as MQ201QuestScript
;END AUTOCAST
;BEGIN CODE
;make sure Nick and Ellie's scenes for MS07 are no longer blocked
If MS07bPostQuest.GetStageDone(2) == 1
  Alias_MS07bPostQuestTrigger.GetRef().Enable()
EndIf

;89088 - in case the input layer somehow manages to hang around after all the checks, delete it again on shutdown
kmyquest.MQ201PlayerEnableLayer = None
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pIntroSceneValentinesStart Auto Const

Scene Property p001_MQ201_PiperNickIntro Auto Const

ReferenceAlias Property Alias_Nick Auto Const

ReferenceAlias Property Alias_Piper Auto Const

ReferenceAlias Property Alias_Ellie Auto Const

ObjectReference Property pMQ201PiperTravelMarker01 Auto Const

ObjectReference Property pMQ201NickTravelMarker01 Auto Const

Quest Property pMQ106 Auto Const

ReferenceAlias Property Alias_CyberBrain Auto Const

Quest Property pMQ201 Auto Const

Quest Property pMQ102 Auto Const

Quest Property pFollowers Auto Const

Quest Property pMQ202 Auto Const

Quest Property pMQ201Piper Auto Const

ObjectReference Property MQ201EllieMoveMarker Auto Const

ReferenceAlias Property Alias_MQ201aNickOfficeTrigger Auto Const

Scene Property MQ201b_002_PiperNickIntro Auto Const

Quest Property Followers Auto Const

Faction Property CurrentCompanionFaction Auto Const

ObjectReference Property TestMQ106EndMarker Auto Const

Quest Property DialogueDiamondCityEntrance Auto Const

MiscObject Property MQ201CyberBrain Auto Const

Quest Property FFGoodneighbor01 Auto Const

ObjectReference Property MQ201BNickMovetoMarker Auto Const

ObjectReference Property MQ201BNickTravelMarker02 Auto Const

ObjectReference Property MQ201PiperSceneMoveto Auto Const

ObjectReference Property GoodneighborMapMarker Auto Const

GlobalVariable Property PiperKnowsShaun Auto Const

ReferenceAlias Property Alias_MS07bPostQuestTrigger Auto Const Mandatory

Quest Property MS07bPostQuest Auto Const Mandatory

Faction Property DmndPublickOwnerFaction Auto Const Mandatory

MusicType Property MUSSpecialMQ201PiperNick Auto Const Mandatory

ObjectReference Property MQ201BPiperTravelMarker02 Auto Const Mandatory
