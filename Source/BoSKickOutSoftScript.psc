Scriptname BoSKickOutSoftScript extends Quest

Quest Property BoS000 Auto Const
Quest Property BoS100 Auto Const
Quest Property BoS101 Auto Const
Quest Property BoS200 Auto Const
Quest Property BoS201 Auto Const
Quest Property BoS201B Auto Const
Quest Property BoS202 Auto Const
Quest Property BoS203 Auto Const
Quest Property BoS204 Auto Const
Quest Property BoS301 Auto Const
Quest Property BoS302 Auto Const
Quest Property BoS302B Auto Const
Quest Property BoS303 Auto Const
Quest Property BoS304 Auto Const
Quest Property BoS101POI Auto Const
Quest Property BoS202LinkMQ Auto Const
Quest Property BoSKickOutSoft Auto Const
Quest Property BoSPostQuest Auto Const
Quest Property DNPrime_BoS304 Auto Const

Quest Property BoSM01 Auto Const
ReferenceAlias Property BoSRBerylliumAgitatorQuestItem Auto Const

Function SoftKickOut()

	;Start BoSPostQuest Content
	BoSPostQuest.SetStage(10)

	;Clear the Agitator from the Quest Item flagged alias
	BoSRBerylliumAgitatorQuestItem.Clear()

	if BoS000.GetStage() >= 10 && BoS000.GetStage() < 255
		BoS000.SetStage(355)
	endif

	if BoS100.GetStage() >= 50 && BoS100.GetStage() < 255 
		BoS100.SetStage(355)
	endif	

	if BoS101.IsRunning() == 1
		BoS101.SetStage(655)
	endif

	if BoS200.IsRunning() == 1
		BoS200.SetStage(355)
	endif

	if BoS201.IsRunning() == 1
		BoS201.SetStage(355)
	endif

	if BoS201B.IsRunning() == 1
		BoS201B.SetStage(355)
	endif

	if BoS202.IsRunning() == 1
		BoS202.SetStage(355)
	endif

	if BoS202LinkMQ.IsRunning() == 1
		BoS202LinkMQ.SetStage(355)
	endif

	if BoS203.IsRunning() == 1
		BoS203.SetStage(355)
	endif

	if BoS204.IsRunning() == 1
		BoS204.SetStage(355)
	endif

	if BoS301.IsRunning() == 1
		BoS301.SetStage(355)
	endif

	if BoS302.IsRunning() == 1
			if BoS302.GetStage() >= 10 && BoS302.GetStage() < 90
				BoS302.SetStage(85)
			endif
		BoS302.SetStage(355)
	endif

	if BoS302B.IsRunning() == 1
		BoS302B.SetStage(355)
	endif

	if BoS303.IsRunning() == 1
		BoS303.SetStage(355)
	endif

	if BoS304.IsRunning() == 1
		BoS304.SetStage(355)
	endif

	if DNPrime_BoS304.IsRunning() == 1
		DNPrime_BoS304.SetStage(1000)
	endif
		
	;Clean up the BoS101 POI (Walk to Arcjet) Encounters.
	BoS101POI.SetStage(255)

	if BoSM01.IsRunning() == 1
		BoSM01.SetStage(13)
	endif

	BoSKickOutSoft.SetStage(255)
EndFunction