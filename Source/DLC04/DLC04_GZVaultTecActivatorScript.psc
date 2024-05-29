Scriptname DLC04:DLC04_GZVaultTecActivatorScript Extends ObjectReference

DLC04:DLC04GZMainQuestScript property DLC04GZMainQuest Auto Const Mandatory
DLC04:DLC04GZVaultTecQuestScript property DLC04GZVaultTec Auto Const Mandatory
int property sceneID Auto Const
Sound property QSTArcJetLightsOnA Auto Const Mandatory
Keyword property LinkCustom01 Auto Const Mandatory
Keyword property LinkCustom02 Auto Const Mandatory
ActorValue property ProtectronPodStatus Auto Const Mandatory
Activator property DLC04GZ_VaultTecButton Auto Const Mandatory

Event OnUnload()
	ObjectReference[] EnableTargets = Self.GetLinkedRefChain(LinkCustom02)
	int i = 0
	While (i < EnableTargets.Length)
		EnableTargets[i].DisableNoWait()
		i = i + 1
	EndWhile
	DLC04GZVaultTec.ClearSceneTimestamp(sceneID)
EndEvent

Event OnActivate(ObjectReference akActivator)
	Debug.Trace("Activator hit. " + akActivator + ", " + akActivator.GetBaseObject())
	if (akActivator.GetBaseObject() == DLC04GZ_VaultTecButton)
		Utility.Wait(1)
	EndIf

	int i = 0

	ObjectReference[] EnableTargets = Self.GetLinkedRefChain(LinkCustom02)
	While (i < EnableTargets.Length)
		if ((EnableTargets != None) && (EnableTargets.Length > 0) && (EnableTargets[0].IsDisabled()))
			QSTArcJetLightsOnA.Play(Self)
		EndIf
		EnableTargets[i].EnableNoWait()
		i = i + 1
	EndWhile

	DLC04GZVaultTec.PlayVaultTecScene(sceneID, akActivator)

	Utility.Wait(0.25)

	ObjectReference[] Enemies = Self.GetLinkedRefChain(LinkCustom01)
	i = 0
	While (i < Enemies.Length)
		Debug.Trace("VAULT: Enemies " + Enemies.Length)
		Actor currentEnemy = (Enemies[i] as Actor)
		Debug.Trace("VAULT: Current " + Enemies[i])
		if ((currentEnemy != None) && !((DLC04GZMainQuest.IsRunning()) && (DLC04GZMainQuest.ShouldBeShutDown(currentEnemy))))
			Debug.Trace("VAULT: Processing " + Enemies[i])
			currentEnemy.SetValue(ProtectronPodStatus, 1)
			currentEnemy.SetUnconscious(False)
			currentEnemy.EvaluatePackage()
			Utility.Wait(Utility.RandomFloat(0.0, 0.5))
		EndIf
		i = i + 1
	EndWhile
EndEvent