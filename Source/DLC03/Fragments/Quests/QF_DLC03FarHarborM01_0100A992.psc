;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03FarHarborM01_0100A992 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Create the Harbormen clothing reward
ObjectReference oItem = Alias_TeddyWright.GetActorRef().PlaceAtMe(pDLC03CaptainsDanceHat)
oItem.AttachMod(pmod_Legendary_Armor_Speed)
Alias_QuestReward.ForceRefTo(oItem)
oItem.Disable()

; Teddy knows who you are now
pDLC03DialogueFarHarbor.SetStage(500)

; Add the mirelurk shells to the Mirelurk death list
pDLC03_LL_MirelurkCarapace
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Update "Living on the Edge"
pDLC03FarHarborM02.SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100)

; Spawn the witness at Emmet's
Alias_Witness.GetActorRef().Enable()

; End "Living on the Edge"
pDLC03FarHarborM02.SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; Enable everyone
pM01EnableMarkerWaveFirst.Enable()

; Make the first wave of Mirelurks spawn
pM01FirstWaveTrigger.Enable()
pM01FirstWaveTrigger.Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
; Called from "DLC03FarHarborM01DropPlayerScript"

; Objectives
SetObjectiveCompleted(300)
SetObjectiveDisplayed(325)

; Enable everyone
pM01EnableMarkerWaveSecond.Enable()

; Spawn the next wave
pM01Wave2Spawner.Enable()
pM01Wave2Spawner.Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(325)
SetObjectiveDisplayed(350)

; Spawn the Queen
Alias_MirelurkQueen.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(350)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
Actor aWitness = Alias_Witness.GetActorRef()
if ( !aWitness.IsDead() )
  aWitness.MoveTo(pM01FeastMarker_Dottie) ; Make Dottie go to the Feast
else
  aWitness.Disable()  ; Or if he's dead, clean him up
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(400)

; Give a reward
Game.GivePlayerCaps(560)

; Player gets custom hat reward
ObjectReference oItem = Alias_QuestReward.GetRef()
oItem.Enable()
Game.GetPlayer().AddItem(oItem)

; Allen now likes the PC
pDLC03FarHarborAllenLikesPC.SetValue(1)

; Give the player the cool buff
Game.GetPlayer().AddItem(pDLC03FarHarborM01CaptainDance01)

; Signal reactive comments
pDLC03PlayerFarHarborHero.SetValue(1)

; Queue up the other quests for this
if ( pDLC03FarHarborFF03b.GetStageDone(400) )   ; Has Hull Breach 2 completed?
  pDLC03FarHarborFF03c.SetStage(50)   ; Queue up Hull Breach 3
elseif ( pDLC03FarHarborFF03a.GetStageDone(375) )
  pDLC03FarHarborFF03b.SetStage(50)   ; Queue up Hull Breach 2
endif
pDLC03FarHarborS01.SetStage(50)
pDLC03FarHarborS02.SetStage(50)
pDLC03FarHarborM03.SetStage(100)

; Quest ends when you leave Far Harbor after this
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
pDLC03FarHarborS01_Misc.Start()   ; Last Holdout
pDLC03FarHarborS02_Misc.Start()   ; Turn Back The Fog
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Make the Witness disappear
Alias_Witness.GetActorRef().Disable()

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pM01FirstWaveTrigger Auto Const Mandatory

ReferenceAlias Property Alias_MirelurkQueen Auto Const Mandatory

ReferenceAlias Property Alias_Witness Auto Const Mandatory

Potion Property pDLC03FarHarborM01CaptainDance01 Auto Const Mandatory

Quest Property pDLC03FarHarborFF03c Auto Const Mandatory

Quest Property pDLC03FarHarborS02 Auto Const Mandatory

Quest Property pDLC03FarHarborS01 Auto Const Mandatory

GlobalVariable Property pDLC03FarHarborAllenLikesPC Auto Const Mandatory

Quest Property pDLC03FarHarborFF03b Auto Const Mandatory

Quest Property pDLC03FarHarborFF03a Auto Const Mandatory

GlobalVariable Property pDLC03PlayerFarHarborHero Auto Const Mandatory

ObjectReference Property pM01FeastMarker_Dottie Auto Const Mandatory

Quest Property pDLC03FarHarborS01_Misc Auto Const Mandatory

Quest Property pDLC03FarHarborS02_Misc Auto Const Mandatory

ObjectReference Property pM01Wave2Spawner Auto Const Mandatory

ReferenceAlias Property Alias_QuestReward Auto Const Mandatory

Armor Property pDLC03CaptainsDanceHat Auto Const Mandatory

ReferenceAlias Property Alias_TeddyWright Auto Const Mandatory

ObjectMod Property pmod_Legendary_Armor_Speed Auto Const Mandatory

Quest Property pDLC03FarHarborM02 Auto Const Mandatory

Quest Property pDLC03FarHarborM03 Auto Const Mandatory

Quest Property pDLC03DialogueFarHarbor Auto Const Mandatory

ObjectReference Property pM01EnableMarkerWaveFirst Auto Const Mandatory

ObjectReference Property pM01EnableMarkerWaveSecond Auto Const Mandatory

LeveledItem Property pDLC03_LL_MirelurkCarapace Auto Const Mandatory
