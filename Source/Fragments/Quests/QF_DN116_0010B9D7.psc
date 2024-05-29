;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN116_0010B9D7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
(Alias_MilitaryBot.GetActorReference()).SetGhost(FALSE)
(Alias_MilitaryBot.GetActorReference()).EnableAI()
(Alias_MilitaryBot.GetActorReference()).SetUnconscious(FALSE)
DN116BotStartPatrolling.Start()
utility.Wait(4)
(Alias_MilitaryBot.GetActorReference()).RemoveFromFaction(CaptiveFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Alias_MoleratAmbushActivator01.GetReference().Activate(Game.GetPlayer())
utility.Wait(8)
Alias_MoleratAmbushActivator02.GetReference().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
DN116BotStartPatrolling.Stop()
DN116BotStartDefending.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
DN116BotStartPatrolling.Stop()
DN116BotStartDefending.Stop()
DN116BotSelfDestruct.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
(Alias_MilitaryBot.GetActorReference()).Kill()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DN116BotStartPatrolling Auto Const

ReferenceAlias Property Alias_MoleratAmbushActivator01 Auto Const

ReferenceAlias Property Alias_MoleratAmbushActivator02 Auto Const

Scene Property DN116BotStartDefending Auto Const

ReferenceAlias Property Alias_MilitaryBot Auto Const

Scene Property DN116BotSelfDestruct Auto Const

Faction Property CaptiveFaction Auto Const
