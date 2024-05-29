;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RESceneRJ02_001ABE43 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

ObjectReference Enemy01A = Alias_Enemy01A.GetReference()
ObjectReference Enemy01B = Alias_Enemy01B.GetReference()
ObjectReference Enemy01C = Alias_Enemy01C.GetReference()
ObjectReference Enemy02A = Alias_Enemy02A.GetReference()
ObjectReference Enemy02B = Alias_Enemy02B.GetReference()
ObjectReference Enemy02C = Alias_Enemy02C.GetReference()
ObjectReference Enemy03A = Alias_Enemy03A.GetReference()
ObjectReference Enemy03B = Alias_Enemy03B.GetReference()
ObjectReference Enemy03C = Alias_Enemy03C.GetReference()
ObjectReference Enemy04A = Alias_Enemy04A.GetReference()
ObjectReference Enemy04B = Alias_Enemy04B.GetReference()
ObjectReference Enemy05A = Alias_Enemy05A.GetReference()
ObjectReference Enemy06A = Alias_Enemy06A.GetReference()
ObjectReference Enemy06B = Alias_Enemy06B.GetReference()

int x = Utility.RandomInt(0,99)
debug.trace("x = " + x)

if (x >= 30 && x < 50)
	Enemy02A.Enable()
	Enemy02B.Enable()
	Enemy02C.Enable()
elseif (x >= 50 && x < 70)
	Enemy03A.Enable()
	Enemy03B.Enable()
	Enemy03C.Enable()
elseif (x >= 70 && x < 85)
	Enemy04A.Enable()
	Enemy04B.Enable()
elseif (x >= 85 && x < 95)
	Enemy05A.Enable()
elseif (x >= 95)
	Enemy06A.Enable()
	Enemy06B.Enable()
else
	Enemy01A.Enable()
	Enemy01B.Enable()
	Enemy01C.Enable()
endif


setstage(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
int Size = ReSceneRJ02_FormList.GetSize()
debug.trace("Size = " + Size)
int x = Utility.RandomInt(0,Size)
int y = Utility.RandomInt(0,Size)
int z = Utility.RandomInt(0,Size)

ObjectReference Postman = Alias_Postman.GetReference()

;add the letter at index x
Postman.AddItem(ReSceneRJ02_FormList.GetAt(x), 1, true)

;add the letter at index y, but only if it is unique
if (y !=x)
	Postman.AddItem(ReSceneRJ02_FormList.GetAt(y), 1, true)
endif

;add the letter at index z, but only if it is unique
if (z !=x && z != y)
	Postman.AddItem(ReSceneRJ02_FormList.GetAt(z), 1, true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

FormList Property RESceneRJ02_FormList Auto Const

ReferenceAlias Property Alias_Postman Auto Const



ReferenceAlias Property Alias_Enemy01A Auto Const

ReferenceAlias Property Alias_Enemy01B Auto Const

ReferenceAlias Property Alias_Enemy01C Auto Const

ReferenceAlias Property Alias_Enemy02A Auto Const

ReferenceAlias Property Alias_Enemy02B Auto Const

ReferenceAlias Property Alias_Enemy02C Auto Const

ReferenceAlias Property Alias_Enemy03A Auto Const

ReferenceAlias Property Alias_Enemy03B Auto Const

ReferenceAlias Property Alias_Enemy03C Auto Const

ReferenceAlias Property Alias_Enemy04A Auto Const

ReferenceAlias Property Alias_Enemy04b Auto Const

ReferenceAlias Property Alias_Enemy05A Auto Const

ReferenceAlias Property Alias_Enemy06A Auto Const

ReferenceAlias Property Alias_Enemy06B Auto Const
