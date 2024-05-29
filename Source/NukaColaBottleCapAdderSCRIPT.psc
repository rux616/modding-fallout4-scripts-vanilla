Scriptname NukaColaBottleCapAdderSCRIPT extends ActiveMagicEffect Const
{This script causes nuka products to add one bottlecap to the actor who consumes the drink.}

MiscObject Property Caps001 Auto Const

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akCaster.additem(Caps001)
EndEvent