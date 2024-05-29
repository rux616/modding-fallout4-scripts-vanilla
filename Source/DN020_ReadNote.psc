Scriptname DN020_ReadNote extends ObjectReference Const

Quest Property DN020 Auto Const

Event OnRead()
	debug.trace("HELLO HELLO HELLO")
    (DN020 as DN020QuestScript).PrincipalPassword = True
    debug.trace("Password = " +(DN020 as DN020QuestScript).PrincipalPassword)
EndEvent
