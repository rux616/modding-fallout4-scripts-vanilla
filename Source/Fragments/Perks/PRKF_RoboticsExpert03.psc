;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
ScriptName Fragments:Perks:prkf_roboticsexpert03 extends perk Default

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODEdebug.trace("PERK: ROBOPHOBE Invoked!") 

objectReference player = game.getPlayer()

; store the targeted actor so we can refer to it in conditions and other scripts 
game.getPlayer().setLinkedRef(akTargetRef, perkRoboticsExpertLink)
game.forcefirstperson()
InputEnableLayer myLayer = InputEnableLayer.Create()
myLayer.disablePlayerControls()
; create a fake furniture for the player to interact with.
objectReference tempFurniture = game.getPlayer().placeAtMe(hijackAnimFurniture)
tempFurniture.setAngle(0.0, 0.0, tempFurniture.GetAngleZ())
Game.GetPlayer().StartSneaking()
tempFurniture.activate(game.getplayer())

; when done, pull up pip-boy interface
utility.wait(1.70) ; "exact" time is 1.67.  adding extra for flub.
debug.trace("Enter")
perkRoboticsExpertInterface.showOnPipBoy()
debug.trace("Exit")
tempFurniture.activate(game.getplayer())
myLayer.enablePlayerControls()
utility.wait(1.5)
tempFurniture.disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property perkRoboticsExpertLink Auto Const
furniture property hijackAnimFurniture auto Const
terminal property perkRoboticsExpertInterface auto Const
