Scriptname RESceneJS01DN067Note extends ObjectReference 

ObjectReference property mapmarker auto

auto state waiting
Event OnRead()
    mapmarker.addtomap()
    gotoState("Done")
EndEvent
endState

state Done
endstate