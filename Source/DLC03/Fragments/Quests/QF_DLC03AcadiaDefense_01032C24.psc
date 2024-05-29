;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03AcadiaDefense_01032C24 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if (Cole.GetRef()).IsDisabled()==0
	Cole.GetRef().Disable()
Endif

;if Kasumi has been sent back home, remove her from the collection
if DLC03MQPostQuest.GetStageDone(170)
Alias_AcadiaActors.RemoveRef(Kasumi.GetReference())
endif

;fail misc pointers quest
DLC03AcadiaQuestPointers.SetStage(500)

; Make Acadia actors enemies of the player
pDLC03AcadiaFaction.SetEnemy(pPlayerFaction)

;Shut down RR quest
if DLC03Acadia_RR.IsRunning()
DLC03Acadia_RR.SetStage(600)
endif

; If we're not running the Institute version
if DLC03Acadia_Institute.GetStage() < 200 || DLC03Acadia_Institute.GetStageDone(1000)==1

; Clean up all of the essential people
	Alias_AcadiaActors.SetEssential(FALSE)
	Alias_AcadiaActors.SetProtected(FALSE)


; If BoS is attacking, make sure they're hostile as well
	if DLC03Acadia_BoS.GetStage() >= 100
		pDLC03AcadiaFaction.SetEnemy(BrotherhoodofSteelFaction)
	endif

else

; Institute needs actors to remain essential
	Alias_AcadiaActors.SetEssential(TRUE)
	Alias_AcadiaActors.SetProtected(FALSE)
;but not Kasumi
Kasumi.GetActorReference().SetEssential(False)
Kasumi.GetActorReference().SetProtected(False)
; and make Institute faction enemy of Acadia
	pDLC03AcadiaFaction.SetEnemy(InstituteFaction)
endif

;Set global that DiMA is no longer available for quest conversations, fail MQ06a if it's running and 
;kill appropriate objs in MQ06 if active
if DLC03MQ06a.IsRunning()
  DLC03MQ06a.SetStage(765)
endif

if DLC03MQ06.IsRunning()
  DLC03MQ06.SetStage(765)
endif


DLC03MQ06_DiMAUnavailable.SetValue(1)

;Fail all Acadia Misc Quests

if DLC03AcadiaM01.IsRunning()
DLC03AcadiaM01.SetStage(700)
endif

if DLC03AcadiaM02.IsRunning()
DLC03AcadiaM02.SetStage(600)
endif

if DLC03AcadiaM03.IsRunning()
DLC03AcadiaM03.SetStage(500)
endif

if DLC03AcadiaM04.IsRunning()
DLC03AcadiaM04.SetStage(1500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;set global


; update BoS quest if they're the ones responsible
if DLC03Acadia_BoS.IsRunning() && DLC03Acadia_BoS.GetStage() >= 200
	DLC03Acadia_BoS.SetStage(400)
;also set global to appropriate value
	DLC03PlayerAcadiaDestroyed.SetValue(2)
else
	DLC03PlayerAcadiaDestroyed.SetValue(1)
	
endif

; Check to see if MQ05 is running - and then advance the quest if it is
if ( pDLC03MQ05.GetStageDone(850) )
  pDLC03MQ05.SetStage(900)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03Acadia_BoS Auto Const Mandatory

Quest Property DLC03Acadia_Institute Auto Const Mandatory

ReferenceAlias Property Cole Auto Const

RefCollectionAlias Property Alias_AcadiaActors Auto Const Mandatory

Faction Property pDLC03AcadiaFaction Auto Const Mandatory

Faction Property pPlayerFaction Auto Const Mandatory

Quest Property pDLC03MQ05 Auto Const Mandatory

Faction Property BrotherhoodofSteelFaction Auto Const Mandatory

Faction Property InstituteFaction Auto Const Mandatory

GlobalVariable Property DLC03PlayerAcadiaDestroyed Auto Const Mandatory

Quest Property DLC03MQ06a Auto Const Mandatory

GlobalVariable Property DLC03MQ06_DiMAUnavailable Auto Const Mandatory

Quest Property DLC03MQ06 Auto Const Mandatory

Quest Property DLC03AcadiaQuestPointers Auto Const Mandatory

Quest Property DLC03Acadia_RR Auto Const Mandatory

ReferenceAlias Property Kasumi Auto Const

Quest Property DLC03MQPostQuest Auto Const Mandatory

Quest Property DLC03AcadiaM01 Auto Const Mandatory

Quest Property DLC03AcadiaM02 Auto Const Mandatory

Quest Property DLC03AcadiaM03 Auto Const Mandatory

Quest Property DLC03AcadiaM04 Auto Const Mandatory
