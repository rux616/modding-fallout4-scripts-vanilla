;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestStim1_0002914C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;actor sits in chair, pretend we are hacking computer
utility.wait(5)

ObjectReference myDoor =Alias_Object.GetReference()
myDoor.activate(myDoor )
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Actor Auto Const
ReferenceAlias Property Alias_Object Auto Const

ReferenceAlias Property Alias_LinkedRefChild Auto Const
