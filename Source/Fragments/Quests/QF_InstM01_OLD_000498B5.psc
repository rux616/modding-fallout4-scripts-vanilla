;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstM01_OLD_000498B5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set stage 5, which places actors, make the rumor available, etc
SetStage(5)

;Move the player
Game.GetPlayer().MoveTo(InstM03Playtest1)

;Add the player to the Institute Faction, which is necessary for some faction interactions
Game.GetPlayer().AddToFaction(InstituteFaction)

;Add the Institute map marker
InstituteMapMarker.AddToMap(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Startup stage

;Move Cedric to Goodneighbor and set his anim archetype to irritated
Alias_Cedric.GetActorRef().Moveto(InstM01CedricRelocate)
Alias_Cedric.GetActorRef().ChangeAnimArchetype(AnimArchetypeIrritated)
;END CODE
EndFunction
;END FRAGMENT

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

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;Set during Roger's first greeting line
;Conditions a subsequent "You're back..." line
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

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
;Set if the player fails the speech challenge to persuade June to help

;Conditions June's hellos for the duration of the quest, making them angrier
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
;Set if the player fails the speech challenge to persuade Janey to help

;Conditions Janey's hellos for the duration of the quest, making them angrier
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0033_Item_00
Function Fragment_Stage_0033_Item_00()
;BEGIN CODE
;Set if the player fails the speech challenge to persuade Wally to help

;Conditions Wally's hellos for the duration of the quest, making them angrier
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Set if the player bribes Cedric with 500 caps

;Remove 500 caps from the player
Game.GetPlayer().RemoveItem(Caps001, 500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0037_Item_00
Function Fragment_Stage_0037_Item_00()
;BEGIN CODE
;Set when the player fails to persuade or bribe Cedric
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Set if the player walks away or leaves Cedric during his scene
;Also set if the player fails to persuade or bribe Cedric
;Conditions some "You're back..." type dialogue
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Set at the end of the first standoff scene
;Used as a condition on Bill's forcegreet
Alias_Bill.GetActorRef().EvaluatePackage()
Alias_Roger.GetActorRef().ChangeAnimFlavor()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Set when the player has antagonized Bill Sutton to the point where Bill will now attack him

;Make Bill Sutton attack the player
Alias_Bill.GetActorRef().AddToFaction(WarwickHostile)
Alias_Bill.GetActorRef().SetValue(Aggression, 1)
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
SetStage(1100)

;Change mood
;Alias_Cedric.GetActorRef().ChangeAnimArchetype(AnimArchetypeIrritated)
Alias_Bill.GetActorRef().ChangeAnimArchetype(AnimArchetypeDepressed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
;Set by Stage 800
;Lots of setup stuff for the final standoff

;Mood changes to standoff actors
Alias_Roger.GetActorRef().ChangeAnimArchetype(AnimArchetypeNervous)
Alias_June.GetActorRef().ChangeAnimArchetype(AnimArchetypeNervous)
Alias_Janey.GetActorRef().ChangeAnimArchetype(AnimArchetypeNervous)
Alias_Wally.GetActorRef().ChangeAnimArchetype(AnimArchetypeNervous)
Alias_Bill.GetActorRef().ChangeAnimArchetype(AnimArchetypeIrritated)

;Move actors to standoff positions
Alias_Roger.GetActorRef().MoveTo(InstM01StandoffRoger)
Alias_June.GetActorRef().MoveTo(InstM01StandoffJune)
Alias_Janey.GetActorRef().MoveTo(InstM01StandoffJaney)
Alias_Wally.GetActorRef().MoveTo(InstM01StandoffWally)
Alias_Bill.GetActorRef().MoveTo(InstM01StandoffBill)

;Close the Warwick Homestead house door
Alias_Door.GetReference().SetOpen(False)

;Put Roger Warwick into the "Freeze" position
Alias_Roger.GetActorRef().ChangeAnimFlavor(AnimFlavorHandsUp)

;Remove Bill from appropriate factions
Alias_Bill.GetActorRef().RemoveFromFaction(FarmFactionWarwick)
Alias_Bill.GetActorRef().RemoveFromFaction(WorkshopNPCFaction)
Alias_Bill.GetActorRef().RemoveFromFaction(WorkshopDialogueFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Set when the player enters the Warwick Homestead interior cell
;Starts the first standoff scene
InstM01StandoffScene1.Start()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Set when Bill dies at or later than stage 800, which means he died while threatening the family

SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_01
Function Fragment_Stage_0090_Item_01()
;BEGIN CODE
;Set if Bill dies previous to stage 800, which means he was murdered by the player

;Conditions a package change to make Roger forcegreet

SetStage(91)
CompleteAllObjectives()
SetObjectiveDisplayed(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0091_Item_00
Function Fragment_Stage_0091_Item_00()
;BEGIN CODE
;Set from stage 90 if Bill died prior to stage 800 (IE the player murdered him)
;Used to condition Roger's forcegreet package where he yells at the player
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
;Set when Roger dies, which can only happen if the player murderse him (protected)

FailAllObjectives()
SetObjectiveDisplayed(60)
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
SetObjectiveCompleted(20)
SetObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
;Set when Roger completes his escort package and will now forcegreet the player
SetObjectiveCompleted(25)
SetObjectiveDisplayed(26)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0575_Item_00
Function Fragment_Stage_0575_Item_00()
;BEGIN CODE
;Set at the end of the player's initial conversation with Roger Warwick
SetObjectiveCompleted(25)
SetObjectiveCompleted(26)
SetObjectiveDisplayed(27)

;Transfer seeds to Roger
Alias_Roger.GetRef().AddItem(Alias_Seeds.GetRef())
Alias_Roger.GetActorRef().ChangeAnimArchetype(AnimArchetypeFriendly)

;Give small xp reward
;Game.RewardPlayerXP(XPMiscQuestSmall.GetValue() as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Roger Warwick asks the player to search Bill Sutton's shack and loko for evidence of a plot against Roger

SetObjectiveCompleted(27)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
;Set when the player has learned Bill's plan from Cedric

SetObjectiveCompleted(30)
SetObjectiveDisplayed(50)

;Set up the standoff
SetStage(75)

;Give small xp reward
;Game.RewardPlayerXP(XPMiscQuestSmall.GetValue() as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;NO LONGER USED

;Set when the player enters the Warwick Homestead interior and sees the standoff, OR
;Set when the player has either suceeded or failed at convincing the farm hands to stand down
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
;Set after Bill Sutton has been either killed or talked down during confrontation

SetObjectiveCompleted(50)
SetObjectiveDisplayed(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
;Roger's reward, set at the end of stage 1100

;Game.RewardPlayerXP(XPMiscQuestSmall.GetValue() as int)
Game.GetPlayer().AddItem(caps001, 250)

; make Warwick workshop player-owned
(Alias_Workshop.GetRef() as WorkshopScript).SetOwnedByPlayer(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
;Having dealt with Bill Sutton one way or another, the player must now return to Isaac and report on his success
;Set if Bill Sutton dies when Stage 1000 has been set OR
;Set if the player successfully talks Bill Suttno out of his plan and gets him to leave peacefully

SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)

;Change moods
Alias_Cedric.GetActorRef().ChangeAnimArchetype(None)
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

;Issue XP and reward, once we decide on one
;Game.RewardPlayerXP(XPMiscQuestFinal.GetValue() as int)
;Game.GetPlayer().AddItem(Stimpak, 20)

;Warwick can now get random recruitment quests
(Alias_Workshop.GetRef() as WorkshopScript).MinRecruitmentProhibitRandom = false

;Enable the giant gourd at Warwick Homestead
InstM01GourdMarker.enable()

;Start the post-quest
InstM01Post.Start()

;Finish quest
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
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

Scene Property InstM01StandoffScene1 Auto Const

Keyword Property AnimArchetypeFriendly Auto Const

Keyword Property AnimArchetypeNervous Auto Const

Keyword Property AnimArchetypeIrritated Auto Const

ReferenceAlias Property Alias_June Auto Const

ReferenceAlias Property Alias_Janey Auto Const

ReferenceAlias Property Alias_Wally Auto Const

Keyword Property AnimArchetypeDepressed Auto Const

ReferenceAlias Property Alias_Isaac Auto Const

ActorValue Property Aggression Auto Const

Faction Property WorkshopNPCFaction Auto Const

ObjectReference Property InstM01CedricRelocate Auto Const

MiscObject Property Caps001 Auto Const

ObjectReference Property InstM03Playtest1 Auto Const

Faction Property InstituteFaction Auto Const

ObjectReference Property InstituteMapMarker Auto Const

ReferenceAlias Property Alias_Workshop Auto Const

ReferenceAlias Property Alias_Door Auto Const

Keyword Property AnimFlavorHandsUp Auto Const

ObjectReference Property InstM01StandoffRoger Auto Const

ObjectReference Property InstM01StandoffJune Auto Const

ObjectReference Property InstM01StandoffJaney Auto Const

ObjectReference Property InstM01StandoffWally Auto Const

ObjectReference Property InstM01StandoffBill Auto Const

Potion Property Stimpak Auto Const

ObjectReference Property InstM01GourdMarker Auto Const

Faction Property WorkshopDialogueFaction Auto Const

Quest Property InstM01Post Auto Const
