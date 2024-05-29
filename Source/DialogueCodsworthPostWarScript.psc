Scriptname DialogueCodsworthPostWarScript extends Quest Conditional

int property CodsworthForcegreet = 0 Auto Conditional

int property CodsworthLemonade = 0 Auto Conditional

int property CodsworthSandwhich = 0 Auto Conditional

int property CodsworthPatrol = 0 Auto Conditional

int property CodsworthHummed = 0 Auto Conditional

ReferenceAlias Property CodsworthAlias Auto

InputEnableLayer Property PlayerPCAPEnableLayer Auto Hidden

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	If (akSource == CodsworthAlias.GetActorRef()) && (asEventName == "FoodAcquired")
		UnregisterForAnimationEvent(CodsWorthAlias.GetActorRef(), "FoodAcquired")
		SetStage(20)
	EndIf
EndEvent

Function PlayerPCAPSceneStart()
	;create input layer and lock fighting so player lowers weapon
	PlayerPCAPEnableLayer = InputEnableLayer.Create()
	PlayerPCAPEnableLayer.EnableFighting(False)
EndFunction

Function PlayerPCAPSceneEnd()
	;delete layer so player has full control again
	PlayerPCAPEnableLayer = None
EndFunction