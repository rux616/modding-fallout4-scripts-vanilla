;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF__01025CBE Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
debug.trace("PERK: ROBOPHOBE Invoked!") 
; store the targeted actor so we can refer to it in conditions and other scripts 
game.getPlayer().setLinkedRef(akTargetRef, perkRobophobeLink)
game.getPlayer().placeAtMe(hijackAnimFurniture).activate(game.getplayer())
; when done, pull up pip-boy interface
utility.wait(3.5)
perkRobophobeInterface.showOnPipBoy()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Terminal Property perkRobophobeInterface Auto Const
Furniture Property hijackAnimFurniture Auto Const

Keyword Property perkRobophobeLink Auto Const
