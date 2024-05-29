Scriptname DN041_PowerOn extends ObjectReference Const

;ObjectReference property DN041_LightEnabler00 auto Const
;ObjectReference property DN041_LightEnabler01 auto Const
;ObjectReference property DN041_LightEnabler02 auto Const

Keyword property LinkCustom01 Auto Const
Keyword property LinkCustom02 Auto Const
Keyword property LinkCustom03 Auto Const
Keyword property LinkCustom04 Auto Const
Keyword property LinkCustom05 Auto Const

int RJTimer01 = 0 Const
int RJTimer02 = 10 Const
int RJTimer03 = 20 Const
int RJTimer04 = 30 Const

Event OnActivate(ObjectReference akActionRef)
;    	Self.StartTimer(3,RJTimer01)
	Self.GetLinkedRef(LinkCustom05).Enable()
	Self.StartTimer(0.5,RJTimer01)
EndEvent

;first floor power turns on
Function Stage01()
	Self.StartTimer(1,RJTimer02)
	Self.GetLinkedRef(LinkCustom01).Enable()
endFunction

;second floor power turns on
Function Stage02()
	Self.StartTimer(1,RJTimer03)
	Self.GetLinkedRef(LinkCustom02).Enable()
endFunction

;third floor power turns on
Function Stage03()
	Self.StartTimer(3,RJTimer04)
	Self.GetLinkedRef(LinkCustom03).Enable()
endFunction

;activate robots
Function Stage04()
	Self.GetLinkedRef(LinkCustom04).Enable()
endFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == RJTimer01
    	Self.Stage01()
    elseif aiTimerID == RJTimer02
    	Self.Stage02()
    elseif aiTimerID == RJTimer03
    	Self.Stage03()
    elseif aiTimerID == RJTimer04
    	Self.Stage04()
    endif 
EndEvent
