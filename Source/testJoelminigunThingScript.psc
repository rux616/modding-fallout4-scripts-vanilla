Scriptname testJoelminigunThingScript extends ObjectReference

Weapon Property Minigun Auto Const
ammo property ammo5mm auto const
ObjectReference property attachRef auto const
bool property bRotateRight auto
float property fspeed = 1.0 auto


Event OnLoad()
    startTimer(1.0)
    attachRef.setAnimationVariableFloat("fSpeed",fSpeed)
    attachRef.setAnimationVariableFloat("fValue",90)
    forceaddragdolltoworld()
EndEvent

Event OnTimer(int aiTimerID)
	;minigun.fire(self,ammo5mm)

    if bRotateRight
    	attachRef.setAnimationVariableFloat("fValue",-90)
    else
    	attachRef.setAnimationVariableFloat("fValue",90)
    endif

    attachRef.playAnimation("Play01")

    int countLimit = 12
    int count = 0

    while count < countLimit
    	minigun.fire(self,ammo5mm)
    	count+= 1
    	utility.wait(0.1)
    	debug.trace("test Joel: minigun count: "+count)
    endwhile

    if bRotateRight
    	bRotateRight = FALSE
    else
    	bRotateRight = TRUE
    endif

    debug.trace("test Joel: minigun thing ended at count "+count)
    startTimer(0.1)
EndEvent