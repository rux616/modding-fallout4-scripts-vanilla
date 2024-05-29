Scriptname DLC04:DLC04AchievementsPlayerScript extends ReferenceAlias

Group NukaColas
	Potion Property DLC04_NukaCola_BombDrop Auto Const Mandatory
	Potion Property DLC04_NukaCola_NewkaCola Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaBerry Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaBuzz Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaCide Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaFancy Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaFree Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaFrutti Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaHearty Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaLixir Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaLove Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaPower Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaPunch Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaRay Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaRush Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaSlime Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaSunrise Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaTwin Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaVoid Auto Const Mandatory
	Potion Property DLC04_NukaCola_NukaXtreme Auto Const Mandatory
EndGroup

GlobalVariable Property DLC04AchievementsBombDrop Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNewkaCola Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaBerry Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaBuzz Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaCide Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaFancy Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaFree Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaFrutti Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaHearty Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaLixir Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaLove Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaPower Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaPunch Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaRay Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaRush Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaSlime Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaSunrise Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaTwin Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaVoid Auto Conditional Mandatory
GlobalVariable Property DLC04AchievementsNukaXtreme Auto Conditional Mandatory

Keyword Property DLC04AchievementsCraftedNukaColaKeyword Auto Const Mandatory

int Property NukaColasCrafted = 0 Auto Conditional

Event OnInit()
	AddInventoryEventFilter(DLC04AchievementsCraftedNukaColaKeyword)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	Debug.Trace("Item Added")
	If akBaseItem == DLC04_NukaCola_BombDrop && DLC04AchievementsBombDrop.GetValue() < 1
			Debug.Trace("Made Soda")
			DLC04AchievementsBombDrop.SetValue(1) 
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NewkaCola && DLC04AchievementsNewkaCola.GetValue() < 1
			DLC04AchievementsNewkaCola.SetValue(1)
			NukaColasCrafted += 1
		EndIf	
		If akBaseItem == DLC04_NukaCola_NukaBerry && DLC04AchievementsNukaBerry.GetValue() < 1
			DLC04AchievementsNukaBerry.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaBuzz && DLC04AchievementsNukaBuzz.GetValue() < 1
			DLC04AchievementsNukaBuzz.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaCide && DLC04AchievementsNukaCide.GetValue() < 1
			DLC04AchievementsNukaCide.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaFancy && DLC04AchievementsNukaFancy.GetValue() < 1
			DLC04AchievementsNukaFancy.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaFree && DLC04AchievementsNukaFree.GetValue() < 1
			DLC04AchievementsNukaFree.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaFrutti && DLC04AchievementsNukaFrutti.GetValue() < 1
			DLC04AchievementsNukaFrutti.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaHearty && DLC04AchievementsNukaHearty.GetValue() < 1
			DLC04AchievementsNukaHearty.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaLixir && DLC04AchievementsNukaLixir.GetValue() < 1
			DLC04AchievementsNukaLixir.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaLove && DLC04AchievementsNukaLove.GetValue() < 1
			DLC04AchievementsNukaLove.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaPower && DLC04AchievementsNukaPower.GetValue() < 1
			DLC04AchievementsNukaPower.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaPunch && DLC04AchievementsNukaPunch.GetValue() < 1
			DLC04AchievementsNukaPunch.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaRay && DLC04AchievementsNukaRay.GetValue() < 1
			DLC04AchievementsNukaRay.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaRush && DLC04AchievementsNukaRush.GetValue() < 1
			DLC04AchievementsNukaRush.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaSlime && DLC04AchievementsNukaSlime.GetValue() < 1
			DLC04AchievementsNukaSlime.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaSunrise && DLC04AchievementsNukaSunrise.GetValue() < 1
			DLC04AchievementsNukaSunrise.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaTwin && DLC04AchievementsNukaTwin.GetValue() < 1
			DLC04AchievementsNukaTwin.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaVoid && DLC04AchievementsNukaVoid.GetValue() < 1
			DLC04AchievementsNukaVoid.SetValue(1)
			NukaColasCrafted += 1
		EndIf
		If akBaseItem == DLC04_NukaCola_NukaXtreme && DLC04AchievementsNukaXtreme.GetValue() < 1
			DLC04AchievementsNukaXtreme.SetValue(1)
			NukaColasCrafted += 1
		EndIf
	If NukaColasCrafted >= 20
		Debug.Trace("Check int for 20")
		Game.AddAchievement(77)
	EndIf
EndEvent