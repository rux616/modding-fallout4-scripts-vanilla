ScriptName DN075_QuestScript extends Quest Conditional

Int Property PlayerAcceptQuest Auto Conditional
;Did the player want to do the job?
;1 = Positive, 2 = Negative, 3 = Neutral, 4 = Question

Int Property PlayerHaveItem Auto Conditional
;Does the player have the item?
;0 = No, 1 = Yes