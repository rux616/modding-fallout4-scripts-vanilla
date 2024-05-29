Scriptname REPostman_OnReadAddMultipleToMap extends ObjectReference Hidden Const

ObjectReference Property MapMarker1 Auto Const
ObjectReference Property MapMarker2 Auto Const

Event OnRead()
    MapMarker1.addtomap()
    MapMarker2.addtomap()
EndEvent
