;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__01083BD2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Dr. Holdren has said his hello and started the scene where he introduces himself
;Checked for the follow-up hello, in case stage 200 didn't get set in that first scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Dr. Karlin has said his hello and started the scene where he gives the player a task
;Checked for the follow-up hello, in case stage 400 didn't get set in that first scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set when Roger has finished his forcegreet hello when he talks about Bill being suspicious of him
;Used to prevent repeated forcegreeting
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Set at the end of the player's conversation with Cedric
;Acts as a condition to make Cedric move out of the player's way by changing packages
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Set if the player is able to convince the farmhands not to back up Bill Sutton's power grab
;This condition is checked during the following stage to give the player an advantage
SetStage(1000)

;Change moods
Alias_Cedric.GetActorRef().ChangeAnimArchetype(None)
Alias_Robert.GetActorRef().ChangeAnimArchetype(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Set at the end of the first standoff scene
;Used as a condition on Bill's forcegreet
Alias_Bill.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Set when the player has antagonized Bill Sutton to the point where Bill will now attack him

;Make Bill Suttno attack the player
Alias_Bill.GetActorRef().RemoveFromFaction(FarmFactionWarwick)
Alias_Bill.GetActorRef().AddToFaction(FarmFactionWarwick)
	
	if GetStageDone(40) == False
		
		;Move Cedric Hopton and make him attack the player
		Alias_Cedric.GetActorRef().MoveTo(InstM01CedricAttackMarker)
		Alias_Cedric.GetActorRef().RemoveFromFaction(FarmFactionWarwick)
		Alias_Cedric.GetActorRef().AddToFaction(WarwickHostile)
		
		;Move Robert Fitzhugh and make him attack the player
		Alias_Robert.GetActorRef().MoveTo(InstM01RobertAttackMarker)
		Alias_Robert.GetActorRef().RemoveFromFaction(FarmFactionWarwick)
		Alias_Robert.GetActorRef().AddToFaction(WarwickHostile)
	
	endif

Alias_Bill.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Set when Bill stands down and promises to leave the farm
;Used as a condition on Bill's package to go back to his quarters and pack.
;Used as a condition to check if Bill's ref will unload when the player leaves the farm.
SetStage(1200)

;Change mood
Alias_Cedric.GetActorRef().ChangeAnimArchetype(AnimArchetypeIrritated)
Alias_Bill.GetActorRef().ChangeAnimArchetype(AnimArchetypeDepressed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Set when the player enters the Warwick Homestead interior cell
;Starts the first standoff scene
InstM01StandoffScene1.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Clayton Holdren sends the player to speak to Isaac Karlin
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Isaac sends the player to Warwick Homestead to deliver the generitcally-modified seeds to the Roger Warwick synth
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;Change mood
Alias_Isaac.GetActorRef().ChangeAnimArchetype(AnimArchetypeIrritated)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
;Remove the seeds from the player's inventory and add them to Roger's inventory
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Set when the player uses the code phrase, so Roger has to sneak off with him to talk business
SetObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
;Set when Roger completes his escort package and will now forcegreet the player
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Roger Warwick asks the player to search Bill Sutton's shack and loko for evidence of a plot against Roger
SetObjectiveCompleted(20)
SetObjectiveCompleted(25)
SetObjectiveDisplayed(30)
Alias_Roger.GetRef().AddItem(Alias_Seeds.GetRef())
Game.GetPlayer().AddItem(Alias_Key.GetRef())
Alias_Roger.GetActorRef().ChangeAnimArchetype(AnimArchetypeFriendly)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
;Set when the player has found Bill Sutton's journal
;Actors move into standoff scene positions
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)

;Mood changes
Alias_Roger.GetActorRef().ChangeAnimArchetype(AnimArchetypeNervous)
Alias_June.GetActorRef().ChangeAnimArchetype(AnimArchetypeNervous)
Alias_Janey.GetActorRef().ChangeAnimArchetype(AnimArchetypeNervous)
Alias_Wally.GetActorRef().ChangeAnimArchetype(AnimArchetypeNervous)
Alias_Bill.GetActorRef().ChangeAnimArchetype(AnimArchetypeIrritated)
Alias_Cedric.GetActorRef().ChangeAnimArchetype(AnimArchetypeIrritated)
Alias_Robert.GetActorRef().ChangeAnimArchetype(AnimArchetypeNervous)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Set when the player enters the Warwick Homestead interior and sees the standoff, OR
;Set when the player has either suceeded or failed at convincing the farm hands to stand down
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
;Having dealt with Bill Sutton one way or another, the player must now return to Isaac and report on his success
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)

;Change moods
Alias_Cedric.GetActorRef().ChangeAnimArchetype(None)
Alias_Robert.GetActorRef().ChangeAnimArchetype(None)
;Alias_Roger.GetActorRef().ChangeAnimArchetype(AnimArchetypeFriendly)
Alias_June.GetActorRef().ChangeAnimArchetype(None)
Alias_Janey.GetActorRef().ChangeAnimArchetype(None)
Alias_Wally.GetActorRef().ChangeAnimArchetype(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
;Set when the player reports his success to Doctor Karlin

;Issue reward, once we decide on one
;Game.GetPlayer().AddItem()

;Finish quest
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Roger Auto Const

ReferenceAlias Property Alias_Seeds Auto Const

ReferenceAlias Property Alias_Key Auto Const

ReferenceAlias Property Alias_Bill Auto Const

Faction Property FarmFactionWarwick Auto Const

Faction Property WarwickHostile Auto Const

ReferenceAlias Property Alias_Cedric Auto Const

ReferenceAlias Property Alias_Robert Auto Const

Scene Property InstM01StandoffScene1 Auto Const

ObjectReference Property InstM01CedricAttackMarker Auto Const

ObjectReference Property InstM01RobertAttackMarker Auto Const

Keyword Property AnimArchetypeFriendly Auto Const

Keyword Property AnimArchetypeNervous Auto Const

Keyword Property AnimArchetypeIrritated Auto Const

ReferenceAlias Property Alias_June Auto Const

ReferenceAlias Property Alias_Janey Auto Const

ReferenceAlias Property Alias_Wally Auto Const

Keyword Property AnimArchetypeDepressed Auto Const

ReferenceAlias Property Alias_Isaac Auto Const
