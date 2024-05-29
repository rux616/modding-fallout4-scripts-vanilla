Scriptname BoSDPQuestScript extends Quest

MiscObject Property Caps001 Auto Const
MiscObject Property BoSBloodSample Auto Const
MiscObject Property BoSTechnicalDocument Auto Const
MiscObject Property BoSReactorCoolant Auto Const
ReferenceAlias Property BoSNeriah Auto Const
ReferenceAlias Property BoSQuinlan Auto Const
ReferenceAlias Property BoSMaxon Auto Const
ReferenceAlias Property BoSIngram Auto Const
int Property BloodCurrentCount Auto
int Property DocumentCurrentCount Auto
int Property BloodPayout Auto
int Property DocPayout Auto
int Property CoolantCurrentCount Auto
int Property CoolantPayout Auto
GlobalVariable Property BoSBloodPay Auto Const
GlobalVariable Property BoSDocPay Auto Const
GlobalVariable Property BoSCoolantPay Auto Const
GlobalVariable Property BoSX111Threshold Auto
GlobalVariable Property BoSNeriahRadDone Auto
GlobalVariable Property BoSEndgateCade Auto
GlobalVariable Property BoSEndgateIngram Auto
GlobalVariable Property BoSEndgateQuinlan Auto
GlobalVariable Property BoSEndgateTeagan Auto
GlobalVariable Property BoSEndgateRhys Auto
GlobalVariable Property BoSEndgateHaylen Auto
GlobalVariable Property BoSEndgateNeriah Auto
GlobalVariable Property BoSEndgateLi Auto
Quest Property MQ206BoS Auto Const
ObjectReference Property BoSMaxsonCommandDeckMarker Auto Const
ObjectReference Property BoS301IngramWorkingMarker Auto Const


Function CashBlood()

	BloodCurrentCount = Game.GetPlayer().GetItemCount(BoSBloodSample)
	BloodPayout = ( BloodCurrentCount * BoSBloodPay.GetValueInt())
	Game.GetPlayer().RemoveItem(BoSBloodSample,BloodCurrentCount)
	Game.GetPlayer().AddItem(Caps001,BloodPayout)

	BoSX111Threshold.SetValueInt(BoSX111Threshold.GetValueInt() + BloodCurrentCount)

	if BoSX111Threshold.GetValueInt() >= 20
		if BoSNeriahRadDone.GetValue() == 0
			BoSNeriahRadDone.SetValue(1)
			BoSX111Threshold.SetValue(0)
		elseif BoSNeriahRadDone.GetValue() == 2
			BoSNeriahRadDone.SetValue(3)
			BoSX111Threshold.SetValue(0)
		endif
	endif

endFunction

Function CashDocs()

	DocumentCurrentCount = Game.GetPlayer().GetItemCount(BoSTechnicalDocument)
	DocPayout = ( DocumentCurrentCount * BoSDocPay.GetValueInt())
	Game.GetPlayer().RemoveItem(BoSTechnicalDocument,DocumentCurrentCount)
	Game.GetPlayer().AddItem(Caps001,DocPayout)

endFunction

Function CashCoolant()

	CoolantCurrentCount = Game.GetPlayer().GetItemCount(BoSReactorCoolant)
	CoolantPayout = ( CoolantCurrentCount * BoSCoolantPay.GetValueInt())
	Game.GetPlayer().RemoveItem(BoSReactorCoolant,CoolantCurrentCount)
	Game.GetPlayer().AddItem(Caps001,CoolantPayout)

endFunction


Function BoSEndgates()

	BoSEndgateCade.SetValue(1)
	BoSEndgateIngram.SetValue(1)
	BoSEndgateQuinlan.SetValue(1)
	BoSEndgateTeagan.SetValue(1)
	BoSEndgateRhys.SetValue(1)
	BoSEndgateHaylen.SetValue(1)
	BoSEndgateNeriah.SetValue(1)
	BoSEndgateLi.SetValue(1)

endFunction

;This is fired off in MQ207 to move NPCs back to Prydwen
Function BoSTeleMove()

	debug.trace("Moved Maxson and Ingram home")
	BoSMaxon.GetActorRef().MoveTo(BoSMaxsonCommandDeckMarker)
	BoSMaxon.GetActorRef().EvaluatePackage()
	BoSIngram.GetActorRef().MoveTo(BoS301IngramWorkingMarker)
	BoSIngram.GetActorRef().EvaluatePackage()

endFunction