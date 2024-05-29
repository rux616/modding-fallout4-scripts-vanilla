Scriptname TestSnapIntoArmor extends Actor
{Script placed on an actor to instantly snap them into a suit of linked power armor}

Keyword Property ArmorLinkKeyword Auto Const

Event OnInit()
	Self.SwitchToPowerArmor(Self.GetLinkedRef(ArmorLinkKeyword))
	Self.Enable()
EndEvent