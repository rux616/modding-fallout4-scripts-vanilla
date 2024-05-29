;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM__0103CBA5 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference [] Chain = akTerminalRef.GetLinkedRefChain(LinkCustom01)

int i = 0
while (i < chain.length)
     Actor Robot = Chain[i] as Actor
     Robot.SetUnconscious(False)
     i+=1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkCustom01 Auto Const
