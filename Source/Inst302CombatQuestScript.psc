Scriptname Inst302CombatQuestScript extends Quest Conditional

Quest Property Inst302 Auto Const

Int Property BoSKills Auto Conditional
Int Property BoSTrigger Auto Const

Int Property RRKills Auto Conditional
Int Property RRTrigger Auto Const

Faction Property BunkerHillBoSFaction Auto Const
Faction Property BunkerHillRailroadFaction Auto Const
Faction Property PlayerFaction Auto Const


Function UpdateBoS()


;Called on death of BoS actor - script on base actors
;incrememt count by 1
BoSKills += 1

;check against threshold and set factions to enemy if met
if BoSKills >= BoSTrigger
BunkerHillBoSFaction.SetEnemy(PlayerFaction)
endif


EndFunction


Function UpdateRR()

;Called on death of RR actor - script on base actors
;increment count by 1
RRKills += 1

;check against threshold and set factions to enemy if met
if RRKills >= RRTrigger
BunkerHillRailroadFaction.SetEnemy(PlayerFaction)
endif

EndFunction