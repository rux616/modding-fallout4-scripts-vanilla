;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoS301_12_LibertyPrimeSta_00140C30 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
MUSRewardShort01x.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
PrimeGantryREF.PlayAnimation("ready")
BoS301PrimeAlias.GetActorRef().playSubgraphAnimation("lightsStartup")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN CODE
BoS301PrimeAlias.GetActorRef().PlayIdle(IdleLibertyPrimeDiagnosticStartUp)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
BoS301PrimeAlias.GetActorRef().PlayIdle(IdleLibertyPrimeDiagnosticB)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
BoS301PrimeAlias.GetActorRef().playSubgraphAnimation("lightsTest")
BoS301PrimeAlias.GetActorRef().PlayIdle(IdleLibertyPrimeDiagnosticC)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN CODE
BoSLibertyPrimeStaticREFlights.PlayAnimation("hack25")
BoS301PrimeAlias.GetActorRef().PlayIdle(IdleLibertyPrimeDiagnosticD)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_Begin
Function Fragment_Phase_06_Begin()
;BEGIN CODE
BoS301PrimeAlias.GetActorRef().PlayIdle(IdleLibertyPrimeDiagnosticA)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN CODE
BoS301PrimeAlias.GetActorRef().PlayIdle(IdleLibertyPrimeDiagnosticD)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN CODE
BoSLibertyPrimeStaticREF.PlayAnimation("LPlook")
BoS301PrimeAlias.GetActorRef().PlayIdle(IdleLibertyPrimeDiagnosticB)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_08_Begin
Function Fragment_Phase_08_Begin()
;BEGIN CODE
BoS301PrimeAlias.GetActorRef().playSubgraphAnimation("lightsStartup")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_08_End
Function Fragment_Phase_08_End()
;BEGIN CODE
BoS301PrimeAlias.GetActorRef().PlayIdle(IdleLibertyPrimeDiagnosticC)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_End
Function Fragment_Phase_09_End()
;BEGIN CODE
BoS301PrimeAlias.GetActorRef().PlayIdle(IdleLibertyPrimeDiagnosticD)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MusicType Property MUSRewardShort01x Auto Const

ObjectReference Property BoSLibertyPrimeStaticRefLights Auto Const

ObjectReference Property BoSLibertyPrimeStaticREF Auto Const

Idle Property IdleLibertyPrimeDiagnosticA Auto Const

Idle Property IdleLibertyPrimeDiagnosticB Auto Const

Idle Property IdleLibertyPrimeDiagnosticC Auto Const

Idle Property IdleLibertyPrimeDiagnosticD Auto Const

ReferenceAlias Property BoS301PrimeAlias Auto Const

ObjectReference Property PrimeGantryREF Auto Const

Idle Property IdleLibertyPrimeDiagnosticStartUp Auto Const
