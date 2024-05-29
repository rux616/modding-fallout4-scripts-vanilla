Scriptname tpSmelterXMarkerSCRIPT extends ObjectReference

; //pointers to the containers
OBJECTREFERENCE Property inputBoxRef Auto
OBJECTREFERENCE Property outputBoxRef Auto
OBJECTREFERENCE Property Button Auto

; //////////////////////////////////
; //get the components on the items
; //////////////////////////////////

; //barrels
KEYWORD PROPERTY dn_HasBarrelLong Auto
KEYWORD PROPERTY dn_HasBarrelShort Auto

; //bayonet
KEYWORD PROPERTY dn_HasBayonet Auto

; //extra damage types
KEYWORD PROPERTY dn_HasDamageCryo Auto
KEYWORD PROPERTY dn_HasDamageElectrical Auto
KEYWORD PROPERTY dn_HasDamageFire Auto
KEYWORD PROPERTY dn_HasDamagePoison Auto
KEYWORD PROPERTY dn_HasDamageRadiation Auto

; //mag
KEYWORD PROPERTY dn_HasExtendedMag Auto

; //grips
KEYWORD PROPERTY dn_HasGripPistol Auto
KEYWORD PROPERTY dn_HasGripRifle Auto
KEYWORD PROPERTY dn_HasHuntingRifleShortGrip Auto

; //receivers
KEYWORD PROPERTY dn_HasReceiverPipeMachineGun Auto
KEYWORD PROPERTY dn_HasReceiverPipeSemiAuto Auto
KEYWORD PROPERTY dn_HasReceiverPipeSingleShot Auto
KEYWORD PROPERTY dn_HasReceiverRevolver Auto
KEYWORD PROPERTY dn_HasReceiverShotgun Auto

; //scopes
KEYWORD PROPERTY dn_HasScope Auto
KEYWORD PROPERTY dn_HasScopeOptical Auto
KEYWORD PROPERTY dn_HasScopeReflex Auto

; //silencer
KEYWORD PROPERTY dn_HasSilencer Auto

; //ammo
AMMO PROPERTY Ammo10mm AUTO
AMMO PROPERTY Ammo22Caliber AUTO
AMMO PROPERTY Ammo32Caliber AUTO 
AMMO PROPERTY Ammo556 AUTO

; //anno counts
FLOAT PROPERTY ammoPowderCount AUTO HIDDEN
FLOAT PROPERTY ammoShellCount AUTO HIDDEN

; //ammo properties
MISCOBJECT PROPERTY tpCompGunpowder AUTO
MISCOBJECT PROPERTY tpCompSteel AUTO

; // the gun hack
OBJECTREFERENCE PROPERTY gunA AUTO
OBJECTREFERENCE PROPERTY gunB AUTO
OBJECTREFERENCE PROPERTY gunC AUTO
OBJECTREFERENCE PROPERTY gunD AUTO

; //////////////////////
; // THE LEVELED LISTS
; //////////////////////

LEVELEDITEM PROPERTY llBarrels Auto
FLOAT PROPERTY barrelCount AUTO HIDDEN

LEVELEDITEM PROPERTY llBayonets Auto
FLOAT PROPERTY bayonetCount Auto HIDDEN

LEVELEDITEM PROPERTY llDamageTypes Auto
FLOAT PROPERTY damageTypeCount Auto HIDDEN

LEVELEDITEM PROPERTY llMag Auto
FLOAT PROPERTY magCount Auto HIDDEN

LEVELEDITEM PROPERTY llGrips Auto
FLOAT PROPERTY gripCount Auto HIDDEN

LEVELEDITEM PROPERTY llReceivers Auto
FLOAT PROPERTY receiverCount Auto HIDDEN

LEVELEDITEM PROPERTY llScopes Auto
FLOAT PROPERTY scopeCount Auto HIDDEN

LEVELEDITEM PROPERTY llSilencers Auto
FLOAT PROPERTY silencerCount AUTO HIDDEN
