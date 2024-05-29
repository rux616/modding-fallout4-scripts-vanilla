;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_GenericBrawl_000AC018 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE GenericBrawlScript
Quest __temp = self as Quest
GenericBrawlScript kmyQuest = __temp as GenericBrawlScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartBrawl()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE GenericBrawlScript
Quest __temp = self as Quest
GenericBrawlScript kmyQuest = __temp as GenericBrawlScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.OpponentDefeated()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;forcegreet is done
Alias_Opponent.GetActorRef().EvaluatePackage()
; stop main brawl scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
debug.tracestack(self + " stage 100")
SetStage(200)
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_Opponent.GetActorRef().EvaluatePackage()
Alias_OpponentFriend.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN AUTOCAST TYPE GenericBrawlScript
Quest __temp = self as Quest
GenericBrawlScript kmyQuest = __temp as GenericBrawlScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerDefeated()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
debug.tracestack(self + " stage 200")
Actor OpponentREF = Alias_Opponent.GetActorRef()
Actor OpponentFriendREF = Alias_OpponentFriend.GetActorRef()
Actor PlayerREF = Game.GetPlayer()

ActorValue health = Game.GetHealthAV()

; if player lost, restore health to above 0
if GetStageDone(180) && PlayerREF.IsBleedingOut()
	; restore player's health to above 0
	float playerHealth = PlayerREF.GetValue(health)
	if playerHealth < 1
		playerHealth = math.abs(playerHealth) + 10
; 		debug.trace(self + " restoring " + playerHealth + " health to player")
		PlayerREF.RestoreValue(health, playerHealth)
	endif
endif

; if opponent is down, restore health to above 0
if OpponentREF.IsBleedingOut()
	; restore health to above 0
	float opponentHealth = OpponentREF.GetValue(health)
	if opponentHealth < 1
		opponentHealth = math.abs(opponentHealth) + 10
; 		debug.trace(self + " restoring " + opponentHealth + " health to opponent")
		OpponentREF.RestoreValue(health, opponentHealth)
	endif
endif

; if opponentfriend is down, restore health to above 0
if OpponentFriendREF
	If OpponentFriendREF.IsBleedingOut()
		; restore health to above 0
		float opponentFriendHealth = OpponentFriendREF.GetValue(health)
		if opponentFriendHealth < 1
			opponentFriendHealth =  math.abs(opponentFriendHealth) + 10
; 			debug.trace(self + " restoring " + opponentFriendHealth + " health to opponent's friend")
			OpponentREF.RestoreValue(health, opponentFriendHealth)
		endif
	EndIf
endif
; shut down quest if this is not a player victory
if GetStageDone(15) == false && GetStageDone(100) == false && GetStageDone(180) == false
	; player loses if not a victory
	SetStage(180)
	Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; if the player hasn't cheated, stop combat
; debug.Trace(self + "Stopping Brawl combat alarm")
Game.GetPlayer().StopCombatAlarm()

;make sure player's hired hands don't aggro
Alias_Opponent.GetActorRef().StopCombatAlarm()
If Alias_OpponentFriend.GetActorRef() != None
  Alias_OpponentFriend.GetActorRef().StopCombatAlarm()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_01
Function Fragment_Stage_0250_Item_01()
;BEGIN AUTOCAST TYPE GenericBrawlScript
Quest __temp = self as Quest
GenericBrawlScript kmyQuest = __temp as GenericBrawlScript
;END AUTOCAST
;BEGIN CODE
; clean up
kmyQuest.StartBrawl(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Weapon Property Unarmed Auto Const

ReferenceAlias Property Alias_opponent Auto Const

ReferenceAlias Property Alias_opponentFriend Auto Const
