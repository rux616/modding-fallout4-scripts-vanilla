;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06CompanionTracker_01003DE1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
int nCount = 101

while ( nCount < 116 )
   SetStage(nCount)
   nCount += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
int nCount = 101
; This is set so that only the tokens are updated, nothing else
pDLC06TrackerTokensOnly.SetValue(1)

; Iterate over all the stages
while ( nCount < 116 )
   SetStage(nCount)
   nCount += 1
endwhile

pDLC06TrackerTokensOnly.SetValue(0)

; Now cycle through DLC companions and get them set up
ActorBase aAda = (Game.GetFormFromFile(0x0100FD5A, "DLCRobot.esm") as ActorBase)
Debug.Trace(aAda)
if ( aAda.GetUniqueActor().IsInFaction(pHasBeenCompanionFaction) )
  Debug.Trace("Inside loop")
  pDLC06TrackerCompanionDLC01.SetValue(1)
  Alias_Ada.ForceRefTo(aAda.GetUniqueActor())
else
  pDLC06TrackerCompanionDLC01.SetValue(0)
endif

ActorBase aLongfellow = (Game.GetFormFromFile(0x01006E5B, "DLCCoast.esm") as ActorBase)
Debug.Trace(aLongfellow)
if ( aLongfellow.GetUniqueActor().IsInFaction(pHasBeenCompanionFaction) )
  pDLC06TrackerCompanionDLC03.SetValue(1)
  Alias_OldLongfellow.ForceRefTo(aLongfellow.GetUniqueActor())
else
  pDLC06TrackerCompanionDLC03.SetValue(0)
endif

ActorBase aGage = (Game.GetFormFromFile(0x0100881D, "DLCNukaWorld.esm") as ActorBase)
if ( aGage.GetUniqueActor().IsInFaction(pHasBeenCompanionFaction) )
  pDLC06TrackerCompanionDLC04.SetValue(1)
  Alias_Gage.ForceRefTo(aGage.GetUniqueActor())
else
  pDLC06TrackerCompanionDLC04.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
int nCount = 101

pDLC06TrackerToggleAll.SetValue(1)

while ( nCount < 116 )
   SetStage(nCount)
   nCount += 1
endwhile

pDLC06TrackerToggleAll.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06CompanionTrackerScript
Quest __temp = self as Quest
DLC06:DLC06CompanionTrackerScript kmyQuest = __temp as DLC06:DLC06CompanionTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ToggleObjectives(Alias_Cait.GetActorRef(), 101)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06CompanionTrackerScript
Quest __temp = self as Quest
DLC06:DLC06CompanionTrackerScript kmyQuest = __temp as DLC06:DLC06CompanionTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ToggleObjectives(Alias_Curie.GetActorRef(), 102)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0103_Item_00
Function Fragment_Stage_0103_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06CompanionTrackerScript
Quest __temp = self as Quest
DLC06:DLC06CompanionTrackerScript kmyQuest = __temp as DLC06:DLC06CompanionTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ToggleObjectives(Alias_Danse.GetActorRef(), 103)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0104_Item_00
Function Fragment_Stage_0104_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06CompanionTrackerScript
Quest __temp = self as Quest
DLC06:DLC06CompanionTrackerScript kmyQuest = __temp as DLC06:DLC06CompanionTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ToggleObjectives(Alias_Deacon.GetActorRef(), 104)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06CompanionTrackerScript
Quest __temp = self as Quest
DLC06:DLC06CompanionTrackerScript kmyQuest = __temp as DLC06:DLC06CompanionTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ToggleObjectives(Alias_Dogmeat.GetActorRef(), 105)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0106_Item_00
Function Fragment_Stage_0106_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06CompanionTrackerScript
Quest __temp = self as Quest
DLC06:DLC06CompanionTrackerScript kmyQuest = __temp as DLC06:DLC06CompanionTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ToggleObjectives(Alias_Hancock.GetActorRef(), 106)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0107_Item_00
Function Fragment_Stage_0107_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06CompanionTrackerScript
Quest __temp = self as Quest
DLC06:DLC06CompanionTrackerScript kmyQuest = __temp as DLC06:DLC06CompanionTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ToggleObjectives(Alias_MacCready.GetActorRef(), 107)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0108_Item_00
Function Fragment_Stage_0108_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06CompanionTrackerScript
Quest __temp = self as Quest
DLC06:DLC06CompanionTrackerScript kmyQuest = __temp as DLC06:DLC06CompanionTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ToggleObjectives(Alias_NickValentine.GetActorRef(), 108)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0109_Item_00
Function Fragment_Stage_0109_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06CompanionTrackerScript
Quest __temp = self as Quest
DLC06:DLC06CompanionTrackerScript kmyQuest = __temp as DLC06:DLC06CompanionTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ToggleObjectives(Alias_Piper.GetActorRef(), 109)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06CompanionTrackerScript
Quest __temp = self as Quest
DLC06:DLC06CompanionTrackerScript kmyQuest = __temp as DLC06:DLC06CompanionTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ToggleObjectives(Alias_PrestonGarvey.GetActorRef(), 110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0111_Item_00
Function Fragment_Stage_0111_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06CompanionTrackerScript
Quest __temp = self as Quest
DLC06:DLC06CompanionTrackerScript kmyQuest = __temp as DLC06:DLC06CompanionTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ToggleObjectives(Alias_Strong.GetActorRef(), 111)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0112_Item_00
Function Fragment_Stage_0112_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06CompanionTrackerScript
Quest __temp = self as Quest
DLC06:DLC06CompanionTrackerScript kmyQuest = __temp as DLC06:DLC06CompanionTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ToggleObjectives(Alias_X688.GetActorRef(), 112)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0113_Item_00
Function Fragment_Stage_0113_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06CompanionTrackerScript
Quest __temp = self as Quest
DLC06:DLC06CompanionTrackerScript kmyQuest = __temp as DLC06:DLC06CompanionTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ToggleObjectives(Alias_Ada.GetActorRef(), 113)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0114_Item_00
Function Fragment_Stage_0114_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06CompanionTrackerScript
Quest __temp = self as Quest
DLC06:DLC06CompanionTrackerScript kmyQuest = __temp as DLC06:DLC06CompanionTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ToggleObjectives(Alias_OldLongfellow.GetActorRef(), 114)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06CompanionTrackerScript
Quest __temp = self as Quest
DLC06:DLC06CompanionTrackerScript kmyQuest = __temp as DLC06:DLC06CompanionTrackerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ToggleObjectives(Alias_Gage.GetActorRef(), 115)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
pDLC06TrackerToggleAll.SetValue(2)

int nCount = 101

while ( nCount < 116 )
   SetStage(nCount)
   nCount += 1
endwhile

pDLC06TrackerToggleAll.SetValue(0)

;SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property pHasBeenCompanionFaction Auto Const Mandatory

ReferenceAlias Property Alias_Cait Auto Const Mandatory

ReferenceAlias Property Alias_Curie Auto Const Mandatory

ReferenceAlias Property Alias_Danse Auto Const Mandatory

ReferenceAlias Property Alias_Deacon Auto Const Mandatory

ReferenceAlias Property Alias_dogmeat Auto Const Mandatory

ReferenceAlias Property Alias_Hancock Auto Const Mandatory

ReferenceAlias Property Alias_MacCready Auto Const Mandatory

ReferenceAlias Property Alias_NickValentine Auto Const Mandatory

ReferenceAlias Property Alias_Piper Auto Const Mandatory

ReferenceAlias Property Alias_PrestonGarvey Auto Const Mandatory

ReferenceAlias Property Alias_Strong Auto Const Mandatory

ReferenceAlias Property Alias_X688 Auto Const Mandatory

ReferenceAlias Property Alias_Ada Auto Const Mandatory

ReferenceAlias Property Alias_OldLongfellow Auto Const Mandatory

ReferenceAlias Property Alias_Gage Auto Const Mandatory

GlobalVariable Property pDLC06TrackerToggleAll Auto Const Mandatory

GlobalVariable Property pDLC06TrackerTokensOnly Auto Const Mandatory

GlobalVariable Property pDLC06TrackerCompanionDLC01 Auto Const Mandatory

GlobalVariable Property pDLC06TrackerCompanionDLC03 Auto Const Mandatory

GlobalVariable Property pDLC06TrackerCompanionDLC04 Auto Const Mandatory
