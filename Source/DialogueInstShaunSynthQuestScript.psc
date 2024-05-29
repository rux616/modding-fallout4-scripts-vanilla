Scriptname DialogueInstShaunSynthQuestScript extends Quest Conditional

MiscObject Property VacuumTube Auto Const

MiscObject Property Telephone01 Auto Const

MiscObject Property AlarmClock Auto Const

MiscObject Property Camera Auto Const

MiscObject Property ChemistrySetCan01 Auto Const

MiscObject Property BiometricScanner Auto Const

MiscObject Property HotPlate Auto Const

MiscObject Property Microscope Auto Const

MiscObject Property Fuse Auto Const


Int Property CurrentQuestItem Auto Conditional
;set to current item requested by shaun
;1 - alarm clock
;2 - aluminum canister
;3 - biometric scanner
;4 - camera
;5 - hot plate
;6 - microscope
;7 - fuse
;8 - telephone
;9 - vacuum tube
;10 - Rejected


Int Property LastQuestItem01 Auto Conditional
Int Property LastQuestItem02 Auto Conditional
Int Property LastQuestItem03 Auto Conditional
 
Int Property FreeformQuestReset Auto Conditional
; set to game day when quest is completed, keeps it from running for a while

Int Property DaysToReset Auto Conditional
;number of days to tack on until freeform can run again

Int Property BuildFailureChance Auto Conditional
; chance of shaun successfully building an item
; the lower the number, the better the odds

Int Property TimesCompleted Auto Conditional
;increments as quest completes, used for tracking custom weapon handout


;Freeform quest functions
Function UpdateQuestItem(Int ItemNum)

LastQuestItem03=LastQuestItem02
LastQuestItem02=LastQuestItem01
CurrentQuestItem=ItemNum


EndFunction


Function ResolveFreeform()

If CurrentQuestItem==10
;if shaun was rejected, just update ending
elseif CurrentQuestItem==1
Game.GetPlayer().RemoveItem(AlarmClock,1)
elseif CurrentQuestItem==2
Game.GetPlayer().RemoveItem(ChemistrySetCan01,1)
elseif CurrentQuestItem==3
Game.GetPlayer().RemoveItem(BiometricScanner,1)
elseif  CurrentQuestItem==4
Game.GetPlayer().RemoveItem(Camera,1)
elseif  CurrentQuestItem==5
Game.GetPlayer().RemoveItem(HotPlate,1)
elseif  CurrentQuestItem==6
Game.GetPlayer().RemoveItem(Microscope,1)
elseif  CurrentQuestItem==7
Game.GetPlayer().RemoveItem(Fuse,1)
elseif  CurrentQuestItem==8
Game.GetPlayer().RemoveItem(telephone01,1)
elseif  CurrentQuestItem==9
Game.GetPlayer().RemoveItem(vacuumtube,1)
endif
FreeformQuestRunning=0
LastQuestItem01=CurrentQuestItem
TimesCompleted+= 1
FreeformQuestReset=(GameDaysPassed.GetValueInt() + DaysToReset)



EndFunction


GlobalVariable Property GameDaysPassed Auto Const

Int Property RRConvDone Auto Conditional

Int Property FreeformQuestRunning Auto Conditional
