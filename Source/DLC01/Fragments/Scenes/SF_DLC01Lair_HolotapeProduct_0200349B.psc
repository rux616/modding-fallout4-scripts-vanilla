;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Scenes:SF_DLC01Lair_HolotapeProduct_0200349B Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
ObjectReference myHolotape = ProductionHolotape.GetReference()
if ((DLC01Lair != None) && (myHolotape != None))
     DLC01Lair.VoiceprintHolotapePlayed(myHolotape, 920)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC01:DLC01LairQuestScript Property DLC01Lair Auto Const Mandatory

ReferenceAlias Property ProductionHolotape Auto Const
