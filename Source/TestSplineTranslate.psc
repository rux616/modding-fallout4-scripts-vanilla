Scriptname TestSplineTranslate extends ObjectReference
{test scrript for debugging}
ObjectReference myLinkedRef
float tang = 1000.0
float speed = 150.0
float rot = 100.0
float myStartX
float myStartY
float myStartZ
float myStartRX
float myStartRY
float myStartRZ

Event OnCellLoad()
 		myLinkedRef = GetNthLinkedRef(1)
	    SplineTranslateToRef(myLinkedRef, tang, speed, rot)  
	    goToState ("toTwo")   
EndEvent


State toOne
	Event OnTranslationAlmostComplete()
		myLinkedRef = GetNthLinkedRef(1)
	    SplineTranslateToRef(myLinkedRef, tang, speed, rot)  
	    goToState ("toTwo")
	EndEvent
endState



 State toTwo
	Event OnTranslationAlmostComplete()
		myLinkedRef = GetNthLinkedRef(2)
    	SplineTranslateToRef(myLinkedRef, tang, speed, rot)  
    	goToState ("toThree")
	EndEvent
endState


 State toThree
	Event OnTranslationAlmostComplete()
		myLinkedRef = GetNthLinkedRef(3)
		setHomeCoords()
		SplineTranslateToRef(myLinkedRef, tang, speed, rot)  
    	goToState ("toOne")
	EndEvent
endState

function setHomeCoords()
	myStartX = myLinkedRef.GetPositionX()
	myStartY = myLinkedRef.GetPositionY()
	myStartZ = myLinkedRef.GetPositionZ()
	myStartRX = myLinkedRef.GetAngleX()
	myStartRY = myLinkedRef.GetAngleY()
	myStartRZ = myLinkedRef.GetAngleZ()     
endFunction
