Scriptname Dn011OverdueBookScript extends ObjectReference Hidden Const

Quest Property DN011OverdueBooks Auto Const

Event OnInit()
    (DN011OverdueBooks as DN011OverdueBooksQuest).AddToOverdueBooks()
EndEvent