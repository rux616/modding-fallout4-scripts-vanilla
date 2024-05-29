Scriptname DLC04:DLC04_KK_RadFogCommentScript extends ObjectReference

Group NoTouch CollapsedOnRef
	DLC04:DLC04KiddieKingdomMainQuestScript Property DLC04_KiddieKingdomMain Auto Const Mandatory
EndGroup

Float Property InitialCommentTimer = 20.0 Auto Const
Float Property LoopingCommentTimer = 20.0 Auto 
Float Property CommentTimerIncrement = 10.0 Auto Const
DLC04:DLC04_KK_RadiationFogScript Property DLC04_KK_FogAttachRef const auto mandatory
GlobalVariable Property DLC04_KK_RadMistersAreOn Auto Const Mandatory

bool TimerIsRunning

;/
Event OnCellAttach()
	if !Initialized
		DoInit()
	Endif
EndEvent
/;

bool firstTimer = true
Event OnTriggerEnter(ObjectReference akActionRef)
    if !TimerIsRunning
    	TimerIsRunning = true
        if firstTimer
    	   StartTimer(InitialCommentTimer)
           firstTimer = false
        else
            StartTimer(1.0)
        endif
    Endif
EndEvent

Event OnTimer(int aiTimerID)
    Debug.trace(Self + ": OnTimer")
    int myTriggerObjects = GetTriggerObjectCount() 
    if myTriggerObjects > 0
        Debug.trace(Self + ": GetTriggerObjectCount == " + myTriggerObjects)
        if DLC04_KK_RadMistersAreOn.GetValue() == 1
            Debug.trace(Self + ": RadMistersAreOn = TRUE")
            if Game.GetPlayer().IsInPowerArmor()
                Debug.trace(Self + ": Player is in Power Armor")
                ;Power Armor Comment
                DLC04_KiddieKingdomMain.AddToPAQueue(80, 1, 60.0)
                StartTimer(LoopingCommentTimer)
            else
                Debug.trace(Self + ": Taunt with random line")
            	int i = utility.RandomInt(0, mySceneProperties.Length - 1)
            	DLC04_KiddieKingdomMain.AddToPAQueue(mySceneProperties[i].mySceneNum, mySceneProperties[i].playOnlyOnce, mySceneProperties[i].cutOffTime)
            	LoopingCommentTimer += CommentTimerIncrement
            	StartTimer(LoopingCommentTimer)
            endif
        else    ;DLC04_KK_RadMistersAreOn.GetValue() == 0
            Debug.trace(Self + ": RadMistersAreOn = FALSE")
            if !DLC04_KiddieKingdomMain.GetStageDone(800)
                Debug.trace(Self + ": Oswald is still active, turn the fog back on!")
                if !DLC04_KiddieKingdomMain.GetStageDone(210)
                    Debug.trace(Self + ": First time turning Radiation back on")
                    utility.wait(3.0)
                    DLC04_KiddieKingdomMain.AddToPAQueue(21, 1, 60.0)
                    DLC04_KK_RadMistersAreOn.SetValue(1)
                    DLC04_KK_FogAttachRef.CheckFogAttach()
                else
                    Debug.trace(Self + ": Keep turning Radiation back on")
                    utility.wait(3.0)
                    DLC04_KiddieKingdomMain.AddToPAQueue(22, 0, 60.0)
                    DLC04_KK_RadMistersAreOn.SetValue(1)
                    DLC04_KK_FogAttachRef.CheckFogAttach()
                endif
                StartTimer(LoopingCommentTimer)
            endif
        endif
    Else
    	TimerIsRunning = false
	Endif
EndEvent

Struct SceneProperty
	int mySceneNum = -1
	bool playOnlyOnce
	float cutOffTime = 15.0
EndStruct

SceneProperty[] Property mySceneProperties Auto Const Mandatory
;/
int[] SceneStack

bool Initialized
Function DoInit()
	int numScenes = mySceneProperties.Length

EndFunction

int s = 0
int Function PickSceneFromStack()


EndFunction
/;