;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETravelKMK_MS04B_0014CE63 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
actor mantaMan = Alias_MantaMan.GetActorRef()
mantaMan.MoveTo(Alias_TravelMarkerA1.GetRef())
mantaMan.Enable()

; max 6 enemy types
; 1 = raiders
; 2 = dogs
; 3 = super mutants
; 4 = stingwing
; 5 = ferals
; 6 = deathclaw

int choices = 4
; night?
float hour = GameHour.GetValue()
bool night = false
if hour >= 20 || hour < 5
	choices = 5
	night = true
endif

if Game.GetPlayer().GetLevel() > 20
	choices = 6
endif

int roll = utility.RandomInt(1, choices)
if roll == 5
	; is it night? if so, ok, otherwise make them raiders
	if night == false
		roll = 1
	endif
endif

if roll == 1
	Alias_Raiders.EnableAll()
elseif roll == 2
	Alias_ViciousDogs.EnableAll()
elseif roll == 3
	Alias_SuperMutants.EnableAll()
elseif roll == 4
	Alias_Stingwing.EnableAll()
elseif roll == 5
	Alias_FeralGhouls.EnableAll()
elseif roll == 6
	Alias_Deathclaw.EnableAll()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
actor mantaMan = Alias_MantaMan.GetActorRef()
if mantaMan.IsDead() == false
  mantaMan.Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_MantaMan Auto Const

ReferenceAlias Property Alias_TravelMarkerA1 Auto Const

RefCollectionAlias Property Alias_Raiders Auto Const

RefCollectionAlias Property Alias_ViciousDogs Auto Const

RefCollectionAlias Property Alias_Deathclaw Auto Const

RefCollectionAlias Property Alias_Stingwing Auto Const

RefCollectionAlias Property Alias_SuperMutants Auto Const

RefCollectionAlias Property Alias_FeralGhouls Auto Const

GlobalVariable Property GameHour Auto Const
