Scriptname DLC04:DLC04MasonIntroToughGuyChoiceScript extends TopicInfo
{Increments global holding "tough guy" dialogue choices the player makes, to change difficult of the end phase speech challenge}

GlobalVariable Property DLC04_MasonIntro_PlayerToughGuyChoices Auto Const Mandatory
{autofill}

int Property ModAmount = 1 Auto Const
{default 1; how much to add to global?}

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    DLC04_MasonIntro_PlayerToughGuyChoices.Mod(ModAmount)
EndEvent