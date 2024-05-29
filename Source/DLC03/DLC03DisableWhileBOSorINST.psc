Scriptname DLC03:DLC03DisableWhileBOSorINST extends ObjectReference Hidden

Quest Property DLC03Acadia_Institute Auto Const Mandatory
Quest Property DLC03Acadia_BoS Auto Const Mandatory

Event OnLoad()
    if DLC03Acadia_Institute.GetStageDone(50) || DLC03Acadia_BoS.GetStageDone(50)
    	if !DLC03Acadia_Institute.GetStageDone(200) || !DLC03Acadia_BoS.GetStageDone(200)
    		self.DisableNoWait()
    	else
    		self.EnableNoWait()
    	EndIf
    EndIf
EndEvent