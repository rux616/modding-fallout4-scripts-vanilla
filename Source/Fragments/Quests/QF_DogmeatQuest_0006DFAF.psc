;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DogmeatQuest_0006DFAF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; 10/8/2014 - REMOVING HEAL SUPPRESSION
;alias_dogmeat.getActorRef().addPerk(DogmeatSuppressRegen)
;alias_dogmeat.getActorRef().setValue(HealRateMult, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Actor DogmeatREF = Alias_Dogmeat.GetActorRef()

debug.trace("Dogmeat: Quest stage 1 called")
;stop scenes in case this is called from elsewhere
DogmeatIntroScene.Stop()
dogmeatIntroDialogueScene.Stop()

; allow workshop move
(DogmeatRef as WorkshopNPCScript).SetAllowMove(true)

; Start a timer to pop molerat encounter if player hangs out @ red rocket for a while after tutorial pop.
if game.getPlayer().getDistance(Alias_MoleratActivateMarker.getReference()) < 2600
	startTimer(60,451)
endif

;Dogmeat can now be a companion unless we're meeting him for the first time during MQ106
;During MQ106, Dogmeat will become a Companion at Fort Hagen
If GetStageDone(500) == 0
  SetStage(4)
EndIf

;ensure normal health regen
DogmeatREF.removePerk(DogmeatSuppressRegen)
DogmeatREF.setValue(HealRateMult, 100)

; resume normal sniffiness
(DogmeatREF as DogmeatActorScript).makeDogmeatSniffy(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
PlayerKnowsDogmeatName.setValue(1)
Alias_DogNameAlias.forceRefTo(Alias_Dogmeat.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
setObjectiveDisplayed(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Actor DogmeatREF = Alias_Dogmeat.GetActorRef()
DogmeatREF.AllowCompanion( )
DogmeatREF.SetAvailabletoBeCompanion()
Followers.setDogmeatCompanion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
Followers.SetDogmeatCompanion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
; Dismiss/remove Dogmeat as a companion
debug.trace("Dogmeat: Dismissing (stage 90)")
Followers.DismissDogmeatCompanion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
DogmeatIntroScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; currently being set by timer created in stage 1, listened for in non-fragment portion of this script.
DogmeatIntroMoleratAttack.start()
alias_RRmolerat01.getReference().enable()
alias_RRmolerat02.getReference().enable()
alias_RRmolerat03.getReference().enable()
alias_RRmolerat04.getReference().enable()
alias_RRmolerat05.getReference().enable()
alias_RRmolerat06.getReference().enable()
utility.wait(0.1)
alias_moleratactivatemarker.getReference().activate(game.getPlayer())
utility.wait(0.1)
alias_dogmeat.getActorRef().startCombat(alias_RRmolerat01.getActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
pDogmeatIntroScene.Stop()
;xDogmeatStimpakScene.start()
Alias_RRmolerat01.clear()
Alias_RRmolerat02.clear()
Alias_RRmolerat03.clear()
Alias_RRmolerat04.clear()
Alias_RRmolerat05.clear()
Alias_RRmolerat06.clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
setStage(1) ;make dogmeat a companion

Followers.SetDogmeatCompanion(Alias_Dogmeat.GetActorReference())

; be extra sure he can recover from bleedout normally now.
alias_dogmeat.getActorRef().SetNoBleedoutRecovery(false)
alias_dogmeat.getActorRef().removePerk(DogmeatSuppressRegen)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0301_Item_00
Function Fragment_Stage_0301_Item_00()
;BEGIN CODE
;alias_Dogmeat.getActorReference().say()
DogmeatIdles.barkNormal()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0302_Item_00
Function Fragment_Stage_0302_Item_00()
;BEGIN CODE
DogmeatIdles.barkAlert()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0303_Item_00
Function Fragment_Stage_0303_Item_00()
;BEGIN CODE
DogmeatIdles.BarkAngry()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0304_Item_00
Function Fragment_Stage_0304_Item_00()
;BEGIN CODE
DogmeatIdles.BarkPlayful()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
DogmeatIdles.barkCurious()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0306_Item_00
Function Fragment_Stage_0306_Item_00()
;BEGIN CODE
DogmeatIdles.GrowlPlayful()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0307_Item_00
Function Fragment_Stage_0307_Item_00()
;BEGIN CODE
DogmeatIdles.GrowlWarning()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0308_Item_00
Function Fragment_Stage_0308_Item_00()
;BEGIN CODE
DogmeatIdles.HowlSad()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0309_Item_00
Function Fragment_Stage_0309_Item_00()
;BEGIN CODE
DogmeatIdles.HowlPlayful()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
DogmeatIdles.SnarlVicious()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0311_Item_00
Function Fragment_Stage_0311_Item_00()
;BEGIN CODE
DogmeatIdles.whimperAttention()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0312_Item_00
Function Fragment_Stage_0312_Item_00()
;BEGIN CODE
DogmeatIdles.whimperPained()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0313_Item_00
Function Fragment_Stage_0313_Item_00()
;BEGIN CODE
DogmeatIdles.whimperSad()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0314_Item_00
Function Fragment_Stage_0314_Item_00()
;BEGIN CODE
alias_player.getActorRef().playIdleWithTarget(pairedDogmeatHumanInspectObject, alias_Dogmeat.getActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0315_Item_00
Function Fragment_Stage_0315_Item_00()
;BEGIN CODE
alias_player.getActorRef().playIdleWithTarget(pairedDogmeatHumanGreetPet, alias_Dogmeat.getActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0316_Item_00
Function Fragment_Stage_0316_Item_00()
;BEGIN CODE
alias_player.getActorRef().playIdleWithTarget(pairedDogmeatHumanGreetPetKneel, alias_Dogmeat.getActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0317_Item_00
Function Fragment_Stage_0317_Item_00()
;BEGIN CODE
alias_player.getActorRef().playIdleWithTarget(pairedDogmeatHumanGreetHand, alias_Dogmeat.getActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Dogmeat's script goes to its MQ106 intro state
(Alias_Dogmeat as DogmeatQuestDogmeatAliasScript).SkipToDogmeatMQ106State()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
dogmeatquest.setstage(1)
dogmeatquest.setstage(2)
alias_dogmeat.getActorRef().moveto(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Event OnTimer(int aiTimerID)
    if aiTimerID == 451
    	; 451 is the post-tutorial timer.
    	if game.getPlayer().getDistance(alias_moleratactivatemarker.getReference()) <= 2600
    		dogmeatquest.setStage(150)
    	endif
	endif
EndEvent

ReferenceAlias Property Alias_dogmeat Auto Const

Quest Property MQ102 Auto Const

Scene Property DogmeatIntroScene Auto Const

GlobalVariable Property PlayerKnowsDogmeatName Auto Const

ReferenceAlias Property Alias_DogNameAlias Auto Const

followersscript Property Followers Auto Const

ReferenceAlias Property Alias_MoleratActivateMarker Auto Const

Scene Property DogmeatStimpakScene Auto Const

Scene Property pDogmeatIntroScene Auto Const

Perk Property DogmeatSuppressRegen Auto Const

ActorValue Property HealRateMult Auto Const

Quest Property DogmeatQuest Auto Const

Idle Property PairedDogmeatHumanInspectObject Auto Const

ReferenceAlias Property Alias_Player Auto Const

Idle Property PairedDogmeatHumanGreetPet Auto Const

Idle Property PairedDogmeatHumanGreetPetKneel Auto Const

Idle Property PairedDogmeatHumanGreetHand Auto Const

Scene Property DogmeatIntroMoleratAttack Auto Const

ReferenceAlias Property Alias_RRMolerat01 Auto Const

ReferenceAlias Property Alias_RRMolerat02 Auto Const

ReferenceAlias Property Alias_RRMolerat03 Auto Const

ReferenceAlias Property Alias_RRMolerat04 Auto Const

ReferenceAlias Property Alias_RRMolerat05 Auto Const

ReferenceAlias Property Alias_RRMolerat06 Auto Const

Scene Property DogmeatIntroDialogueScene Auto Const Mandatory
