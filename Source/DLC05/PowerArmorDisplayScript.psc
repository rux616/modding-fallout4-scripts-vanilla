Scriptname DLC05:PowerArmorDisplayScript extends ObjectReference
{ Script for the power armor display }

DLC05:DLC05InitScript property DLC05Init auto const mandatory 

Keyword Property powerArmorFurnitureKW Auto

String property NodeName = "rampdummy" auto const 
{ name of node to move power armor to }

ObjectReference[] nearbyPowerArmors  ; hang onto nearby power armors

float Property fPowerArmorSearchRadius = 280.0 auto const 
float property fAllowedDistanceZMin = -100.0 auto const 
float property fAllowedDistanceZMax = 100.0 auto const 
float property fIgnoreHeadingAngleDistance = 40.0 auto const 

float property fAllowedHeadingAngle = 22.0 auto const 
{ +/- heading angle allowed between me and target - to make sure it is in front of me }

float property fHeadingAngleModifier01 = 0.0 auto const 
{ how much to add to heading angle calculation (relative to my actual 0 angle) }

float property fHeadingAngleModifier02 = 180.0 auto const 
{ how much to add to heading angle calculation (relative to my actual 0 angle) }


int iOnLoadCheckTimerID = 1

Event OnInit()
	BlockActivation()
	nearbyPowerArmors = new ObjectReference[0]
endEvent

function DisplayNearestPowerArmor()
	GetEditLock()
	; find nearest suit of power armor
	debug.trace( "Found " + nearbyPowerArmors.Length + " nearby unoccupied power armors" )
	
	ObjectReference nearestPowerArmor
	If nearbyPowerArmors.Length > 0
		float fnearestDistance = 999999999999.9
		int i = 0
		while (i < nearbyPowerArmors.Length)
			float fcurrentDistance = GetDistance(nearbyPowerArmors[i])
			if( fcurrentDistance < fnearestDistance && nearbyPowerArmors[i].IsEnabled() )
				nearestPowerArmor = nearbyPowerArmors[i]
				fnearestDistance = fcurrentDistance
			endIf
			i = i + 1
		endWhile
		
		if( nearestPowerArmor )
			debug.trace("Found nearest power armor " + nearestPowerArmor + " teleporting it to workbench")
			; teleport it to us
			nearestPowerArmor.MoveToNode(Self, NodeName)
			; achievement check
			DLC05Init.SetPowerArmorAchievementFlag()
		endIf
	EndIf
	ClearEditLock()
endFunction 

Event OnActivate( ObjectReference akActionRef )
	if Game.GetPlayer() == akActionRef
		FindNearbyPowerArmor()
		DisplayNearestPowerArmor()
	EndIf
EndEvent

Event OnUnload()
	; clear array so not holding onto references
	GetEditLock()
	nearbyPowerArmors.Clear()
	ClearEditLock()
EndEvent

bool editingArray = false 
function GetEditLock()
	while editingArray
		debug.trace(self + " GetEditLock...")
		utility.wait(1.0)
	endWhile
	editingArray = true 
endFunction

function ClearEditLock()
	editingArray = false
endFunction

function FindNearbyPowerArmor()
	debug.trace(self + " FindNearbyPowerArmor")
	; clear current container list
	GetEditLock()
	nearbyPowerArmors.Clear()

	ObjectReference[] foundPowerArmors = FindAllReferencesWithKeyword(powerArmorFurnitureKW, fPowerArmorSearchRadius)

	if foundPowerArmors.Length > 0
		int i = 0
		while i < foundPowerArmors.Length
			AddPowerArmor(foundPowerArmors[i])
			i += 1
		endWhile
	endif

	ClearEditLock()
endFunction

function AddPowerArmor(ObjectReference newPowerArmor)
	if CheckPowerArmorPosition(newPowerArmor)
		debug.trace(self + "   adding " + newPowerArmor + " to list")
		if nearbyPowerArmors.Find(newPowerArmor) == -1
			nearbyPowerArmors.Add(newPowerArmor)
		endif
	endif
endFunction 

; returns true if the specified ref is within the valid "trigger zone" of the display rack
bool function CheckPowerArmorPosition(ObjectReference thePowerArmor)
	bool bValidPosition = false
	float zDifference = thePowerArmor.GetPositionZ() - GetPositionZ()
	debug.trace(self + " CheckPowerArmorPosition for " + thePowerArmor + " zDifference=" + zDifference)
	bValidPosition = ( zDifference >= fAllowedDistanceZMin ) && ( zDifference <= fAllowedDistanceZMax )

	; don't check heading angle if very close
	if bValidPosition && GetDistance(thePowerArmor) > fIgnoreHeadingAngleDistance
		; check heading angle (front and back)
		bValidPosition = CheckHeadingAngle(thePowerArmor, fHeadingAngleModifier01) || CheckHeadingAngle(thePowerArmor, fHeadingAngleModifier02)
	endif

	debug.trace(self + " CheckPowerArmorPosition = " + bValidPosition)
	return bValidPosition
endFunction 

bool function CheckHeadingAngle(ObjectReference thePowerArmor, float fHeadingAngleModifier)
	; check heading angle
	float fHeadingAngle = GetHeadingAngle(thePowerArmor) + fHeadingAngleModifier
	; convert to +/- angle
	if fHeadingAngle > 180
		fHeadingAngle = fHeadingAngle - 360
	endif

	debug.trace(self + " CheckHeadingAngle for " + thePowerArmor + " headingAngle=" + fHeadingAngle)
	bool bValidAngle = (Math.abs(fHeadingAngle) <= fAllowedHeadingAngle)
	return bValidAngle
endFunction 

