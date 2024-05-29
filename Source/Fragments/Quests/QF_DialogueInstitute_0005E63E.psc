;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueInstitute_0005E63E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Unlock both of the BioScience door control terminals
;Necessary because they are set to locked in the editor so I can specify the key that opens them
;These terminals will become temporarily locked in quest InstM03

;Alias_BioScienceUpperTerminal.GetReference().Unlock()
Alias_BioScienceLowerTerminal.GetReference().Unlock()

;Disable the BioDcience defense turrets
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Set at the end of Alan and Max's first scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
;Set at the end of Alana and Justin's scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set at the end of Alan Binet's initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent him from greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Set at the end of Alana Secord's initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent her from greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set at the end of Allie Filmore's initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent her from greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;Set at the end of Clayton Holdren's initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent him frim greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set at the end of Dean Volkert's initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent him from greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Set at the end of Enrico Thompson's initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent him from greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Set at the end of Evan Watson's initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent him from greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0042_Item_00
Function Fragment_Stage_0042_Item_00()
;BEGIN CODE
;Set at the end of Eve's initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent her from greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
;Set at the end of Isaac Karlin's initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent him from greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Set at the end of Justin Ayo's initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent him from greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;Set at the end of Lawrence Higgs' initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent him from greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Set at the end of Liam Binet's initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent him from greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
;Set at the end of Madison Li's initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent her from greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Set at the end of Max Loken's initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent him from greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
;Set at the end of Newton Oberly's initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent him from greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Set at the end of Rosalind Orman's initial greeting scene
;Used as a condition on the greetings that starts that scene to prevent hre from greeting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Set if the player passes the speech challenge on the "Flirt" option in Eve's greeting dialogue

;This is checked by quest InstM02 and helps reduce the dififculty of the speech challenge to talk Eve down
;when she later threatens the player.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BioScienceUpperTerminal Auto Const

ReferenceAlias Property Alias_BioScienceLowerTerminal Auto Const
