Scriptname RESceneCC_DN101NoteScript extends ObjectReference

ObjectReference property mapmarker auto

auto state waiting
Event OnRead()
    mapmarker.addtomap()
    gotoState("Done")
EndEvent
endState

state Done
endstate
