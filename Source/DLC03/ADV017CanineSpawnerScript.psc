Scriptname DLC03:ADV017CanineSpawnerScript extends Quest
{This script handles spawning & naming dogs for Erikson}

referenceAlias[] Property Names Auto Mandatory
Group Forms
	Form Property DLC03_ADV017_Dog Auto Const Mandatory
	Form Property DLC03_ADV017_FEVHound Auto Const Mandatory
	Form Property DLC03_ADV017_MutantWolf Auto Const Mandatory
EndGroup

Group ExternalAliases
	referenceAlias Property Alias_Dog Auto Const
	referenceAlias Property Alias_Wolf Auto Const
	referenceAlias Property Alias_FEVHound Auto Const
	DLC03:ADV017QuestScript Property DLC03_ADV017 Auto Const mandatory
EndGroup

Group Markers
	ObjectReference Property DLC03_ADV017CanineSpawnMarkerRef Auto Const mandatory
	ObjectReference Property DLC03_ADV017CanineMoveMarkerRef Auto Const mandatory
EndGroup

Function SpawnDog()
	CanineSpawn(DLC03_ADV017_Dog, Alias_Dog)
	DLC03_ADV017.ForSaleDog = true
EndFunction

Function SpawnWolf()
	CanineSpawn(DLC03_ADV017_MutantWolf, Alias_Wolf)
	DLC03_ADV017.ForSaleWolf = true
EndFunction

Function SpawnFEVHound()
	CanineSpawn(DLC03_ADV017_FEVHound, Alias_FEVHound)
	DLC03_ADV017.ForSaleFEVHound= true
EndFunction


Function CanineSpawn(Form myCanine, referenceAlias myRefAlias)
	Actor myCanineActor = (DLC03_ADV017CanineSpawnMarkerRef.PlaceAtMe(myCanine, aiCount = 1, abForcePersist = false, abInitiallyDisabled = false, abDeleteWhenAble = false) as actor)
	int count = Names.Length
	if count > 0
		Debug.Trace(self + ": Generating name!")
		int i = utility.RandomInt(0, (count - 1))
		Names[i].ApplyToRef(myCanineActor)
		Names.Remove(i)
	Else
		Debug.Trace(self + ": Could not generate name!")
	endif

	myRefAlias.ForceRefTo(myCanineActor)
	myCanineActor.AllowPCDialogue(true)
	myCanineActor.Moveto(DLC03_ADV017CanineMoveMarkerRef)
EndFunction