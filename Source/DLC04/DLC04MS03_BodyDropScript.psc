Scriptname DLC04:DLC04MS03_BodyDropScript extends ReferenceAlias

Quest Property DLC04MS03 Auto Const Mandatory

ObjectReference Property DLC04_MS03_BodyDrop01Marker Auto Const Mandatory
ObjectReference Property DLC04_MS03_BodyDrop02Marker Auto Const Mandatory
ObjectReference Property DLC04_MS03_BodyDrop03Marker Auto Const Mandatory

GlobalVariable Property DLC04MS03_LastBodyDrop Auto Mandatory
GlobalVariable Property GameDaysPassed Auto Const Mandatory

Int Property Place Auto
Int Property BodyType Auto
Actor Property Body Auto

ActorBase Property LvlGunner Auto Const Mandatory
ActorBase Property LvlRaider Auto Const Mandatory
ActorBase Property LvlMinuteman Auto Const Mandatory
ActorBase Property LvlBoSScribe Auto Const Mandatory
ActorBase Property LvlSupermutantMixed Auto Const Mandatory

Event OnLoad()
	if  GameDaysPassed.GetValue() > DLC04MS03_LastBodyDrop.GetValue() + 3.0
		if DLC04MS03.GetStageDone(860) == true || DLC04MS03.GetStageDone(950) == true || DLC04MS03.GetStageDone(1000) == true
			DLC04MS03_LastBodyDrop = GameDaysPassed
			Place = utility.RandomInt(1, 3)
			BodyType = utility.RandomInt(1, 5)
			if Place == 1
				if BodyType == 1
					Body = (DLC04_MS03_BodyDrop01Marker.PlaceAtMe(LvlGunner, 1, false, false, true) as actor)
				elseif BodyType == 2
					Body = (DLC04_MS03_BodyDrop01Marker.PlaceAtMe(LvlRaider, 1, false, false, true) as actor)
				elseif BodyType == 3
					Body = (DLC04_MS03_BodyDrop01Marker.PlaceAtMe(LvlMinuteman, 1, false, false, true) as actor)
				elseif BodyType == 4
					Body = (DLC04_MS03_BodyDrop01Marker.PlaceAtMe(LvlBoSScribe, 1, false, false, true) as actor)
				elseif BodyType == 5
					Body = (DLC04_MS03_BodyDrop01Marker.PlaceAtMe(LvlSupermutantMixed, 1, false, false, true) as actor)
				endif
			elseif Place == 2
				if BodyType == 1
					Body = (DLC04_MS03_BodyDrop01Marker.PlaceAtMe(LvlGunner, 1, false, false, true) as actor)
				elseif BodyType == 2
					Body = (DLC04_MS03_BodyDrop01Marker.PlaceAtMe(LvlRaider, 1, false, false, true) as actor)
				elseif BodyType == 3
					Body = (DLC04_MS03_BodyDrop01Marker.PlaceAtMe(LvlMinuteman, 1, false, false, true) as actor)
				elseif BodyType == 4
					Body = (DLC04_MS03_BodyDrop01Marker.PlaceAtMe(LvlBoSScribe, 1, false, false, true) as actor)
				elseif BodyType == 5
					Body = (DLC04_MS03_BodyDrop01Marker.PlaceAtMe(LvlSupermutantMixed, 1, false, false, true) as actor)
				endif
			elseif Place == 3
				if BodyType == 1
					Body = (DLC04_MS03_BodyDrop01Marker.PlaceAtMe(LvlGunner, 1, false, false, true) as actor)
				elseif BodyType == 2
					Body = (DLC04_MS03_BodyDrop01Marker.PlaceAtMe(LvlRaider, 1, false, false, true) as actor)
				elseif BodyType == 3
					Body = (DLC04_MS03_BodyDrop01Marker.PlaceAtMe(LvlMinuteman, 1, false, false, true) as actor)
				elseif BodyType == 4
					Body = (DLC04_MS03_BodyDrop01Marker.PlaceAtMe(LvlBoSScribe, 1, false, false, true) as actor)
				elseif BodyType == 5
					Body = (DLC04_MS03_BodyDrop01Marker.PlaceAtMe(LvlSupermutantMixed, 1, false, false, true) as actor)
				endif
			endif
		endif
	endif
EndEvent




