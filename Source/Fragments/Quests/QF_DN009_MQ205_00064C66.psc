;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN009_MQ205_00064C66 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;store actors
Actor Courser = Alias_Courser.getActorRef()
Actor Synth = Alias_Synth.getActorRef()
Actor GunnerBoss = Alias_GunnerBoss.getActorRef()
Actor GunnerPrisoner01 = Alias_GunnerPrisoner01.getActorRef()
Actor GunnerPrisoner02 = Alias_GunnerPrisoner02.getActorRef()

Courser.setValue(Aggression, 0)
Courser.enable()
Courser.moveTo(Alias_CourserLastStandMarker.getReference())
Synth.enable()
Synth.setValue(Aggression, 0)
Synth.moveTo(Alias_SynthGateMarker01.getReference())
GunnerBoss.setValue(Aggression, 0)
GunnerBoss.RemoveFromAllFactions()
GunnerBoss.AddToFaction(CaptiveFaction)
GunnerBoss.enable()
GunnerPrisoner01.setValue(Aggression, 0)
GunnerPrisoner01.RemoveFromAllFactions()
GunnerPrisoner01.AddToFaction(CaptiveFaction)
GunnerPrisoner01.enable()
GunnerPrisoner02.setValue(Aggression, 0)
GunnerPrisoner02.RemoveFromAllFactions()
GunnerPrisoner02.AddToFaction(CaptiveFaction)
GunnerPrisoner02.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
if(getcurrentstageID() <= 15)
    DN009_IntercomBoss01.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
DN009_IntercomBoss01.Stop()
if(getcurrentstageID() <= 20)
    DN009_IntercomBoss02.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
DN009_IntercomBoss02.Stop()
if(getcurrentstageID() <= 25)
    DN009_IntercomBoss03.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
DN009_IntercomBoss03.Stop()
if(getcurrentstageID() <= 30)
    DN009_IntercomBoss04.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
DN009_IntercomBoss04.Stop()
if(getcurrentstageID() <= 35)
    DN009_IntercomBoss05.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
DN009_IntercomBoss05.Stop()
if(getcurrentstageID() <= 40)
    DN009_IntercomBoss06.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
DN009_IntercomBoss06.Stop()
if(getcurrentstageID() <= 45)
    DN009_IntercomBoss07.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Actor GunnerPrisoner01 = Alias_GunnerPrisoner01.getActorRef()
Actor GunnerPrisoner02 = Alias_GunnerPrisoner02.getActorRef()
Actor GunnerBoss = Alias_GunnerBoss.getActorRef()

GunnerPrisoner01.setValue(Health, (GunnerPrisoner01.getValue(Health) * 0.05))
GunnerPrisoner02.setValue(Health, (GunnerPrisoner02.getValue(Health) * 0.05))
GunnerBoss.setValue(Health, (GunnerBoss.getValue(Health) * 0.05))

DN009_MQ205_CourserKillPrisoner01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN CODE
;Prisoner01 is dead
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0062_Item_00
Function Fragment_Stage_0062_Item_00()
;BEGIN CODE
;Prisoner01 killed by Player
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0063_Item_00
Function Fragment_Stage_0063_Item_00()
;BEGIN CODE
;Prisoner01 killed by Courser
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
DN009_MQ205_CourserKillPrisoner01.Stop()
;Set at end of killing prisoner01 scene
 if(getStageDone(100) == 0)
    DN009_MQ205_CourserKillPrisoner02.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
;Prisoner02 is dead
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0067_Item_00
Function Fragment_Stage_0067_Item_00()
;BEGIN CODE
;Prisoner02 killed by Player
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0068_Item_00
Function Fragment_Stage_0068_Item_00()
;BEGIN CODE
;Prisoner02 killed by Courser
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
DN009_MQ205_CourserKillPrisoner02.Stop()
;Set at end of Prisoner02 scene
 if(getStageDone(100) == 0)
    DN009_CourserGunnerBoss01.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Gunner Boss is dead
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0091_Item_00
Function Fragment_Stage_0091_Item_00()
;BEGIN CODE
;Gunner Boss Killed by Player
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0092_Item_00
Function Fragment_Stage_0092_Item_00()
;BEGIN CODE
;Gunner Boss killed by Courser
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
DN009_MQ205_CourserKillPrisoner01.Stop()
DN009_MQ205_CourserKillPrisoner02.Stop()
DN009_CourserGunnerBoss01.Stop()
DN009_CourserLastStandDialogue.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Courser forcegreet done
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;stop any scenes
DN009_SynthDirectPassword.Stop()
DN009_SynthWaitingAfterGateOpened.Stop()

if(getStageDone(110))
	;Courser has forcegreeted Player
	if(getStageDone(250))
       	;Courser is dead
       	if(getStageDone(178) == 0)
       		;Synth is Alive
            		setStage(350) ;dialogue scene with Synth thanking player
        	endif
    	else
       	;Courser is alive
       	if(getStageDone(178) == 0)
       		;Synth is Alive
             		Alias_Courser.TryToEvaluatePackage()
             		DN009_MQ205_PlayerOpensSynthDoor.Start()
        	endif
    	endif
else
	;Courser has not forcegreeted Player
	if(getStageDone(250))
		;Courser is dead
        	if(getStageDone(178) == 0)
            		;Synth is Alive
			setStage(350) ;dialogue scene with Synth thanking player
		endif
	else
    		;Courser is Alive and has not talked to Player yet - his priority is now the Synth
   		DN009_CourserGunnerBoss01.Stop()
    		DN009_CourserLastStandDialogue.Stop()
    		DN009_MQ205_PlayerOpensSynthDoor.Start()
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0177_Item_00
Function Fragment_Stage_0177_Item_00()
;BEGIN CODE
;Courser has shut down the Synth
Actor Synth = Alias_Synth.getActorRef()
Synth.PlayIdle(IdleSynthShutdown)
Utility.wait(3.0)
Synth.Kill()
setStage(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
;DN009_CourserEndScene.start()
Alias_Courser.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
;Player has shut down the Courser
DN009_CourserLastStandDialogue02.Stop()
Actor Courser= Alias_Courser.getActorRef()
Courser.PlayIdle(IdleSynthShutdown)
Utility.wait(3.0)
Courser.Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
DN009_CourserLastStandDialogue02.Stop()
if(GetStageDone(190) == 0)
    Alias_Courser.getActorRef().setValue(Aggression, 2)
    ;Alias_Courser.getActorRef().startCombat(game.getPlayer(), true)
    Alias_Synth.TryToEvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
OutsideTriggersMarker.enable()
;clear locations
GreenetechGeneticsLocation.SetCleared()
GreenetechGeneticsInteriorLocation.SetCleared()
MQ205.setStage(40)
Alias_Synth.TryToEvaluatePackage()
    if(getStageDone(150))
        ;door has been opened
        setStage(350)
    else
       ;door has not been opened, open shutters
        Alias_Shutter.getReference().playAnimation("Play02")
        DN009_SynthWaitingAfterGateOpened.Start()
    endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
;Player is close to Synth after shutter opened, evp to get forcegreet package
DN009_SynthWaitingAfterGateOpened.Stop()
Alias_Synth.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Actor Synth = Alias_Synth.getActorRef()
Synth.ChangeAnimArchetype(AnimArchetypeSynthAfter)
Synth.EvaluatePackage()
;evp Synth so she picks up her forcegreet package
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
DN009_MQ205_SynthEndDialogue.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
DN009_SynthDirectPassword.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Actor Synth = Alias_Synth.getActorRef()

if(getStageDone(61) == false)
    Alias_GunnerPrisoner01.getActorRef().disable()
endif

if(getStageDone(66) == false)
    Alias_GunnerPrisoner02.getActorRef().disable()
endif

if(getStageDone(90) == false)
    Alias_GunnerBoss.getActorRef().disable()
endif

if(getStageDone(150))
    if(Synth.isDead() == false)
        ;move her to Ticonderoga
        Synth.moveTo(SynthRailroadMarker)
        Synth.addToFaction(RailroadFaction)
        SetStage(550)
    endif
else
    if(GetStageDone(61) == FALSE || GetStageDone(66) == FALSE || GetStageDone(90) == FALSE)
        ;at least one of the gunners is alive and the synth door hasn't been opened
        ;if Synth is alive, move her to death marker, kill her, and enable some blood
        if(Synth.isDead() == FALSE)
            Synth.Moveto(SynthDeathMarker)
            Synth.Kill()
            SynthBloodMarker.Enable()
            SetStage(550)
       endif
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
;shutdown quest
OutsideTriggersMarker.disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Courser Auto Const

ReferenceAlias Property Alias_CourserLastStandMarker Auto Const

Scene Property DN009_CourserLastStandDialogue Auto Const

Scene Property DN009_IntercomBoss01 Auto Const

Scene Property DN009_IntercomBoss02 Auto Const

Scene Property DN009_IntercomBoss03 Auto Const

Scene Property DN009_IntercomBoss04 Auto Const

ReferenceAlias Property Alias_Synth Auto Const

ReferenceAlias Property Alias_SynthSitMarker Auto Const

Scene Property DN009_CourserLastStandDialogue02 Auto Const

Scene Property DN009_SynthBeggingPlayer Auto Const

Scene Property DN009_CourserEndScene Auto Const

Scene Property DN009_MQ205_PlayerOpensSynthDoor Auto Const

ReferenceAlias Property Alias_GateMarker Auto Const

Scene Property DN009_SynthDirectPlayer Auto Const

Scene Property DN009_CourserWaitingForPlayer Auto Const

Scene Property DN009_MQ205_SynthEndDialogue Auto Const

Quest Property MQ205 Auto Const

ActorValue Property Aggression Auto Const

ReferenceAlias Property Alias_GunnerBoss Auto Const

Faction Property PlayerFaction Auto Const

Faction Property GunnerFaction Auto Const

Scene Property DN009_CourserGunnerBoss01 Auto Const

ActorValue Property Health Auto Const

ReferenceAlias Property Alias_Shutter Auto Const

Scene Property DN009_SynthDirectPassword Auto Const

ReferenceAlias Property Alias_SynthGateMarker01 Auto Const

Quest Property DN009_EscapedSynth Auto Const

Scene Property DN009_SynthWaitingAfterGateOpened Auto Const

Scene Property DN009_IntercomBoss05 Auto Const

Scene Property DN009_IntercomBoss06 Auto Const

Scene Property DN009_IntercomBoss07 Auto Const

Scene Property DN009_MQ205_CourserKillPrisoner01 Auto Const

Scene Property DN009_MQ205_CourserKillPrisoner02 Auto Const

ReferenceAlias Property Alias_GunnerPrisoner01 Auto Const

ReferenceAlias Property Alias_GunnerPrisoner02 Auto Const

Idle Property IdleSynthShutDown Auto Const

Faction Property CaptiveFaction Auto Const

Faction Property RailroadFaction Auto Const

ObjectReference Property SynthRailroadMarker Auto Const

ObjectReference Property SynthDeathMarker Auto Const

ObjectReference Property SynthBloodMarker Auto Const

ObjectReference Property OutsideTriggersMarker Auto Const

Keyword Property AnimArchetypeSynthAfter Auto Const

LocationAlias Property Alias_GreenetechGeneticsLocation Auto Const Mandatory

LocationAlias Property Alias_GreenetechGeneticsInteriorLocation Auto Const Mandatory

Location Property GreenetechGeneticsLocation Auto Const

Location Property GreenetechGeneticsInteriorLocation Auto Const
