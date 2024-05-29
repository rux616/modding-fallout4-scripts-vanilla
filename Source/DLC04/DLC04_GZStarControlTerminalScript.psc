Scriptname DLC04:DLC04_GZStarControlTerminalScript extends ObjectReference Conditional
{Script for the Star Control terminal. Most properties here are set by the Main or Tracking quests.}

DLC04:DLC04GZMainQuestScript property DLC04GZMainQuest Auto Const Mandatory
{DLC04GZMainQuest} 

GlobalVariable property DLC04GZ_StarCoresInstalled Auto Const Mandatory
{Count of Star Cores that have been installed.}

bool property BootSequence1Ready Auto Hidden Conditional
{Are we ready to display the Boot Sequence 1 screen?}
bool property BootSequence1Completed Auto Hidden Conditional
{Have we displayed the Boot Sequence 1 screen?}
bool property BootSequence2Ready Auto Hidden Conditional
{Are we ready to display the Boot Sequence 2 screen?}
bool property BootSequence2Completed Auto Hidden Conditional	
{Have we displayed the Boot Sequence 1 screen?}


Event OnActivate(ObjectReference akActionRef) 
	if (DLC04GZ_StarCoresInstalled.GetValueInt() == 0)
		Utility.Wait(3)
		DLC04GZMainQuest.SetStage(50)
	EndIf
EndEvent