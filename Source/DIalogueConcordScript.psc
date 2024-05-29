Scriptname DialogueConcordScript extends Quest Conditional 

Int Property IntroState  Auto Conditional  
;0=Pre
;1=Refused Early
;2=Need to get Core
;4=On way to roof
;5=Mission complete

Int Property IntroPlayerOpinion  Auto Conditional  
;0=player is cool
;1=player is a jerk

Int Property Science  Auto Conditional  
;1=have high Science

Int Property Rewarded  Auto Conditional  
;1=Quest over, rewarded by Preston Garvey

Int Property FirstChoice  Auto Conditional  
;1=Positive
;2=Negative
;3=Neutral
;4=Question
;5=Walkaway

Int Property BumpSturges Auto Conditional
;1=Get Sturges off the terminal
MinutemenCentralScript Property MinutemenCentralQuest Auto Const

Int Property PrestonConvoSkip01 auto Conditional

Int Property PrestonConvoSkip02 auto Conditional

;we need to track when Preston ends the scene when you refuse to help him, since we're also doing some dialogue overlap at that point and End Running Scene isn't fast enough
Int Property PrestonEndScene01 Auto Conditional