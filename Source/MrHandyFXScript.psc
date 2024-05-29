Scriptname MrHandyFXScript extends ActiveMagicEffect 
{Mr handy fx toggle between pre and post war}


Armor Property HandyArtObjectsFX Auto Const

Armor Property PHandyArtObjectsPrewarFX Auto Const

ActorBase Property PMQ101PrewarCodsworth Auto Const

MagicEffect Property pabHandyHoverFX Auto Const Mandatory

;MagicEffect myBaseObject

Event OnEffectStart(Actor akTarget, Actor akCaster)
    ;selfRef = akCaster
  ;  myBaseObject = GetBaseObject()
    if pabHandyHoverFX == GetBaseObject()
	    if akCaster.GetActorBase() == PMQ101PrewarCodsworth
	    	;debug.trace("Adding prewar fx to haaaaaandy")
	    	akCaster.equipitem(PHandyArtObjectsPrewarFX)	
	    else
	    	;debug.trace("Adding regular fx to haaaaaandy")
	    	akCaster.equipitem(HandyArtObjectsFX)	
		endif
	endif
 endEvent





