Scriptname DN170_FloorCrack extends ObjectReference

float Property iDelay Auto Const
float Property iSpeed auto Const
bool Property Triggered auto
Explosion Property DirtSplosion auto Const
Keyword Property LinkCustom01 auto Const
Keyword Property LinkCustom02 auto Const
Sound Property Lurk01 auto Const
Sound Property WoodSqueak01 auto Const
Sound Property WoodSnap01 auto Const

Sound Property LurkFlare01 auto Const
Sound Property LurkFlare02 auto Const

auto State Waiting

	Event OnTriggerEnter(ObjectReference akActionRef)

		if !Triggered
			ObjectReference Player = Game.GetPlayer()
			if akActionRef == Player && (Player.GetAngleZ() >= 30 && Player.GetAngleZ() <= 150)
				Triggered = True
				GoToState("Busy")

				ObjectReference[] linkedRefArray = GetLinkedRefChain()
				int i = 0

				while i < linkedRefArray.Length
					ObjectReference ObjectRef = linkedRefArray[i]

					if utility.RandomInt(1, 10) >= 8
						int Lurk01ID = Lurk01.play(Game.GetPlayer())
						Sound.SetInstanceVolume(Lurk01ID, 1.0)

						if utility.RandomInt(1, 10) >= 8
							if utility.RandomInt(1, 10) >= 5
								int LurkFlare01ID = LurkFlare01.play(Game.GetPlayer())
								Sound.SetInstanceVolume(LurkFlare01ID, 1.0)

							else
								int LurkFlare02ID = LurkFlare02.play(Game.GetPlayer())
								Sound.SetInstanceVolume(LurkFlare02ID, 1.0)


							endif

						endif
					endif
					if ObjectRef.GetLinkedRef(LinkCustom01)
						MoverPlusRotate(ObjectRef, true)

					else
						Mover(ObjectRef, true)
						utility.wait(iDelay)
						int WoodSqueak01ID = WoodSqueak01.Play(Game.GetPlayer())
						Sound.SetInstanceVolume(WoodSqueak01ID, 3)

					endif
					if ObjectRef.GetLinkedRef(LinkCustom02)
						ObjectRef.GetLinkedRef(LinkCustom02).Activate(Player)

					endif

					i += 1
				endWhile
				GoToState("Waiting")

			endif
		endif


	endEvent

endState

state Busy
	;do nothing

endState

Function Mover(ObjectReference ObjectRef, bool Up)

	ObjectRef.SetAnimationVariableFloat("fspeed", iSpeed)

	if Up
		ObjectRef.SetAnimationVariableFloat("fvalue", 1)
	else
		ObjectRef.SetAnimationVariableFloat("fvalue", 0)

	endif
	ObjectRef.PlayAnimation("Play01")

	

endFunction

Function MoverPlusRotate(ObjectReference ObjectRef, bool Up)

		ObjectRef.SetAnimationVariableFloat("fspeed", iSpeed)
		ObjectReference RotateRef = ObjectRef.GetLinkedRef(LinkCustom01)
	RotateRef.SetAnimationVariableFloat("fvalue", -8)
	RotateRef.SetAnimationVariableFloat("fSpeed", iSpeed/7)

	if Up
		ObjectRef.SetAnimationVariableFloat("fvalue", 1)
	else
		ObjectRef.SetAnimationVariableFloat("fvalue", 0)

	endif
	ObjectRef.PlayAnimation("Play01")


		utility.wait(iSpeed - 0.30)
		RotateRef.PlayAnimation("Play01")
		int WoodSnap01ID = WoodSnap01.play(Game.GetPlayer())
		Sound.SetInstanceVolume(WoodSnap01ID, 1.0)
		RotateRef.placeatme(DirtSplosion)

endFunction
