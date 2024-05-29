;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_1_3_00249E2E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; 88942 - MS02 fix
if MS02.GetStageDone(850) == true && MS02.GetStageDone(500) == true
    MS02.SetStage(700)
endif

; 89222 - MS17 Fix
; Check to see if the player is in the broken state
if ( pMS17.GetStageDone(70) && pMS17.GetStageDone(500) )
   pMS17.SetStage(770)
endif

; 88531: run through Minutemen radiants and stop them if questgiver is dead
; 86527: check if attackers should be disabled on WorkshopAttackScript quests
FormList radiantQuests =  MinutemenCentralQuest.MinutemenRadiantQuestMasterList
int i = 0
while i < radiantQuests.GetSize()
	MinRecruitQuestScript minRecruitQuest = radiantQuests.GetAt(i) as MinRecruitQuestScript
	if minRecruitQuest && minRecruitQuest.IsRunning()
		minRecruitQuest.StopQuestIfQuestgiverDead()
	endif
	WorkshopAttackScript attackQuest = radiantQuests.GetAt(i) as WorkshopAttackScript
	if attackQuest && attackQuest.IsRunning()
		attackQuest.CheckForDisableAttackers()
	endif
	i += 1
endWhile

; 87169: if Min02 waiting for courtyard to be cleared, but it's already been cleared, advance quest
if Min02.IsRunning() && Min02.GetStageDone(200) && Min02.GetStageDone(250) == false && DN133.GetStageDone(100)
	debug.trace(self + " setting Min02 stage 250")
	Min02.SetStage(250)
endif

; 82239: random workshop attacks not allowed at the Castle
CastleWorkshopRef.AllowAttacks = false

; PATCH 1.3 - 80699 - Make it so Curie immediately can be Stimpaked
if ( pCOMCurieQuest.GetStageDone(500) )
  Alias_Curie.GetActorRef().AddKeyword(pPlayerCanStimpak)
endif

; patch 1.3 - 87283 - advance mama murphy's quest if the player somehow bypassed the final vision scene
If (MQ00MamaMurphy.GetStageDone(90) == 1) && (MQ00MamaMurphy.GetStageDone(700) == 0)
  MQ00MamaMurphy.SetStage(700)
EndIf

; PATCH 1.3 - 87722 - Make Hancock essential in all cases
Alias_Hancock.GetActorRef().GetActorBase().SetEssential(TRUE)

; PATCH 1.3 - 84002 - Making it so Freeform 3 in Bunker Hill ends properly if you kill all the prisoners
if ( pFFBunkerHill03.IsRunning() )
  pFFBunkerHill03.SetStage(215)
endif

;Patch 1.3 - 89054 - if the Vault 114 gear door console has been used, but the inputenablelayer is still hanging around, then reset the console so controls aren't locked and the player can use the console again
ObjectReference Vault114ConsoleREF = Alias_Vault114Console.GetRef()

If (Vault114ConsoleREF.IsActivationBlocked()) && (Vault114ConsoleREF as VaultDoorConsoleScript).VaultDoorConsoleLayer != None
  (Vault114ConsoleREF as VaultDoorConsoleScript).ResetVaultConsole()
EndIf

; Added for Patch 1.3 - 86096 - Making sure that Glory is counted as dead
if ( pRR303.GetStageDone(800) )
  Alias_Glory.GetActorRef().Enable()
  Alias_Glory.GetActorRef().Kill()
  Alias_Glory.GetActorRef().Disable()
endif

; PATCH 1.3 - 84521 - Fixes broken state for RR303 not starting properly
if ( pRR304.GetStageDone(100) )
  pRR303.SetStage(10100)
endif


; PATCH 1.3 - 89787 - make sure provisioners have new abWorkshopProvisioner ability (which is now on the CaravanActors alias on WorkshopParent)
int caravanActorIndex = 0
int caravanActorTotal = CaravanActors.GetCount()
while caravanActorIndex < caravanActorTotal
	Actor provisioner = CaravanActors.GetAt(caravanActorIndex ) as Actor
	if provisioner
		; add ability
		provisioner.AddSpell(AbWorkshopProvisioner)
	endif
	caravanActorIndex += 1
endWhile


; ADD MORE FIXES HERE:



; THIS IS THE END:
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MS02 Auto Const Mandatory

Quest Property pMS17 Auto Const Mandatory

minutemencentralscript Property MinutemenCentralQuest Auto Const Mandatory

Quest Property Min02 Auto Const Mandatory

Quest Property DN133 Auto Const Mandatory

workshopscript Property CastleWorkshopRef Auto Const

Quest Property pCOMCurieQuest Auto Const Mandatory

Keyword Property pPlayerCanStimpak Auto Const Mandatory

ReferenceAlias Property Alias_Curie Auto Const Mandatory

Quest Property MQ00MamaMurphy Auto Const Mandatory

ReferenceAlias Property Alias_Hancock Auto Const Mandatory

Quest Property pFFBunkerHill03 Auto Const Mandatory

ReferenceAlias Property Alias_Vault114Console Auto Const Mandatory

Quest Property pRR303 Auto Const Mandatory

ReferenceAlias Property Alias_Glory Auto Const Mandatory

Quest Property pRR304 Auto Const Mandatory

RefCollectionAlias Property CaravanActors Auto Const

SPELL Property AbWorkshopProvisioner Auto Const Mandatory
