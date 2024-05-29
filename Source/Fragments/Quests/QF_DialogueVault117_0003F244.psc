;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueVault117_0003F244 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
AlexisHoltArgue.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
game.GetPlayer().RemoveItem(caps001, 5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
Debug.Trace(self + "SetStage 14")
Vault81Tour.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Vault81Tour.SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Start quest V81_01
V81_01.SetObjectiveDisplayed(10, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN CODE
V81_01.SetStage(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Display V81_03 Objective 100: Get Bobby off chems
V81_03.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
V81_04.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0503_Item_00
Function Fragment_Stage_0503_Item_00()
;BEGIN CODE
;Trigger scientist at scanner to comment
Vault81ScientistScanner.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
;Start the opening scene when player enters Horatio's Hairstyles via Activator or Vault81Tour
debug.trace(self + " Start haircuttingscene")
Vault81HoratiosHairstylesIntroScene.Start()
debug.trace(self + " Ran haircuttingscene")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0623_Item_00
Function Fragment_Stage_0623_Item_00()
;BEGIN CODE
Vault81SunshineDinerIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
;Player triggered Bobby and Tina intro scene via Activator.
If MS19.GetStageDone(150) == 0 
   Vault81BobbyAndTinaIntroScene.Start()
EndIf

If MS19.GetStageDone(150) == 1
   SetStage(631)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0631_Item_00
Function Fragment_Stage_0631_Item_00()
;BEGIN CODE
;Bobby and Tina's intro scene is done.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN CODE
If Vault81Tour.GetStage() == 0 || Vault81Tour.GetStage() == 100 || Vault81Tour.GetStage() == 90
  Vault81PriscillaIntroScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0642_Item_00
Function Fragment_Stage_0642_Item_00()
;BEGIN CODE
Alias_PriscillaPenske.GetRef().RemoveItem(Alias_Mutfruit.GetReference())
Game.GetPlayer().AddItem(Alias_Mutfruit.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0645_Item_00
Function Fragment_Stage_0645_Item_00()
;BEGIN CODE
Game.GetPlayer().SellItem(Fertilizer, 25)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property AlexisHoltArgue Auto Const

Quest Property Vault81Tour Auto Const

Quest Property V81_02 Auto Const


Quest Property V81_04 Auto Const

Quest Property V81_03 Auto Const

Quest Property V81_01 Auto Const

Scene Property Vault81HoratiosHairstylesIntroScene Auto Const

Scene Property Vault81ScientistScanner Auto Const

Scene Property Vault81BobbyAndTinaIntroScene Auto Const

Scene Property Vault81PriscillaIntroScene Auto Const

Potion Property V81Mutfruit Auto Const

ReferenceAlias Property Alias_Mutfruit Auto Const

ReferenceAlias Property Alias_PriscillaPenske Auto Const

MiscObject Property Fertilizer Auto Const

LeveledItem Property V81_Tools Auto Const

MiscObject Property Hammer01 Auto Const

MiscObject Property ScrewDriver01 Auto Const

MiscObject Property Hammer01_PreWar Auto Const

MiscObject Property Wrench01 Auto Const

MiscObject Property Wrench02 Auto Const

MiscObject Property Wrench03 Auto Const

Scene Property Vault81SunshineDinerIntro Auto Const

MiscObject Property Caps001 Auto Const

Quest Property MS19 Auto Const
