Scriptname DLC04:DLC04_KK_LoopingProxyCommentScript extends ObjectReference

Group NoTouch CollapsedOnRef
	DLC04:DLC04KiddieKingdomMainQuestScript Property DLC04_KiddieKingdomMain Auto Const Mandatory
EndGroup

Float Property InitialCommentTimer = 20.0 Auto Const
Float Property LoopingCommentTimer = 20.0 Auto 
Float Property CommentTimerIncrement = 10.0 Auto Const
int property cutOffStage = -1 auto const
bool TimerIsRunning

;/
Event OnCellAttach()
	if !Initialized
		DoInit()
	Endif
EndEvent
/;

Event OnTriggerEnter(ObjectReference akActionRef)
    Quest KKQuest = (DLC04_KiddieKingdomMain as Quest)
    if cutOffStage == -1 || !KKQuest.GetStageDone(cutOffStage)
        if !TimerIsRunning
        	TimerIsRunning = true
        	StartTimer(InitialCommentTimer)
        Endif
    Endif
EndEvent

Event OnTimer(int aiTimerID)
    if GetTriggerObjectCount() > 0
        Quest KKQuest = (DLC04_KiddieKingdomMain as Quest)
        if cutOffStage == -1 || !KKQuest.GetStageDone(cutOffStage)
        	int i = utility.RandomInt(0, mySceneProperties.Length - 1)
        	DLC04_KiddieKingdomMain.AddToPAQueue(mySceneProperties[i].mySceneNum, mySceneProperties[i].playOnlyOnce, mySceneProperties[i].cutOffTime)
        	LoopingCommentTimer += CommentTimerIncrement
        	StartTimer(LoopingCommentTimer)
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