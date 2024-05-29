Scriptname MinDefendCastleAttackerFillScript extends MinDefendCastleAttackROOT

;This stores the data for a single attacker phase
;       THIS IS DERIVED FROM MinDefendCastleAttackROOT
;   This allows us to use the data structure in the MinDefendCastle_Attackers quest


;/Struct AttackerPhase
    bool useTeleporter = false
    bool VertibirdPhase = false
    bool ApproachFromSouth = false
    {if true this squad will approach from the south, otherwise from the north}
    float SecondsBeforeNextPhase = 30.0
    RefCollectionAlias AttackerSquad
    ReferenceAlias VertibirdStartMarker
    {If this is a vertibird phase, this is where it starts from}
EndStruct/;




;This chooses the correct array of attack phases then kicks over to MatchPhases to actually do the assigning
Function FillWithAttacker(int AttackerNumber)
	Debug.Trace(Self + ": IsRunning FillWithAttacker -> " + AttackerNumber)
	AttackerPhase[] LocalAttackerPhases
	;AttackerPhases.Clear()
    if AttackerNumber == 0  ;Raiders
        LocalAttackerPhases = RaiderAttackerPhases
    elseif AttackerNumber == 1  ;Gunners
        LocalAttackerPhases = GunnerAttackerPhases
    elseif AttackerNumber == 2  ;Super Mutants
        LocalAttackerPhases = SuperMutantAttackerPhases
    elseif AttackerNumber == 3  ;Brotherhood of Steel
        LocalAttackerPhases = BrotherhoodAttackerPhases
    elseif AttackerNumber == 4  ;Institute
        LocalAttackerPhases = InstituteAttackerPhases
    elseif AttackerNumber == 5  ;Institute Remenants
        LocalAttackerPhases = InstituteRemenantAttackerPhases
    elseif AttackerNumber == 6  ;Brotherhood Rememants
        LocalAttackerPhases = BrotherhoodRemenantAttackerPhases
    elseif AttackerNumber == 7  ;Brotherhood of Steel
        LocalAttackerPhases = PrydwenDestructionAttackerPhases
    elseif AttackerNumber == 8  ;Super Mutants & Behemoth
        LocalAttackerPhases = SuperMutantBehemothAttackerPhases
    endif



    MatchPhases(LocalAttackerPhases)

    SetStage(1000)
EndFunction


;This sets the actual phases for the AttackerPhases on MinDefendCastle
Function MatchPhases(AttackerPhase[] LocalAttackerPhases)
	Debug.Trace(self + ": MatchPhases >>>>>")
	int i = 0
	int iCount = LocalAttackerPhases.length
	int j = 0
	int jCount
	Debug.Trace(self + ": iCount == "+ iCount)

	;Set the length equal that of the attacker phases
	;MinDefendCastle.AttackerPhases = new AttackerPhase[iCount]

	;while the current phase is less than the total phases
	While i < iCount
		;j = 0

		;Count the attackers in the squad
		jCount = LocalAttackerPhases[i].AttackerSquad.GetCount()
		Debug.Trace(self + ": jCount == "+ jCount)
		
		;Add the squad attackers one by one to the attacker RefCollectionAliases
		MinDefendCastleAttackerPhases[i].AddRefCollection(LocalAttackerPhases[i].AttackerSquad)
		;/while j < jCount
			MinDefendCastleAttackerPhases[i].AddRef(LocalAttackerPhases[i].AttackerSquad.GetAt(j))
			;MinDefendCastleAttackerPhases[i].AddRefCollection(LocalAttackerPhases[i].AttackerSquad)
			
			j += 1
		endWhile/;
		
		;Match all the phases data, timers, teleport, vertibird, etc.
		MinDefendCastle.AttackerPhases[i].useTeleporter = LocalAttackerPhases[i].useTeleporter
		MinDefendCastle.AttackerPhases[i].VertibirdPhase = LocalAttackerPhases[i].VertibirdPhase
		MinDefendCastle.AttackerPhases[i].ApproachFromSouth = LocalAttackerPhases[i].ApproachFromSouth
		MinDefendCastle.AttackerPhases[i].SecondsBeforeNextPhase = LocalAttackerPhases[i].SecondsBeforeNextPhase
		MinDefendCastle.AttackerPhases[i].VertibirdStartMarker = LocalAttackerPhases[i].VertibirdStartMarker

		;Set to the MinDefendCastle Local Attacker RefCollectionAliases so this quest can shut down
		MinDefendCastle.AttackerPhases[i].AttackerSquad = MinDefendCastleAttackerPhases[i]
		Debug.Trace(Self + " : MinDefendCastle.AttackerPhases[i].AttackerSquad == " + MinDefendCastle.AttackerPhases[i].AttackerSquad)
		
		i += 1	
	endWhile
	Debug.Trace(self + ": MatchPhases DONE >>>>>")
EndFunction





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;				Attacker Phase Data
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




Group MinDefendCastlePhases
	RefCollectionAlias[] Property MinDefendCastleAttackerPhases Auto Const
	MinDefendCastleAttackScript Property MinDefendCastle Auto Const
EndGroup

Group RaiderAttackerProperties
    AttackerPhase[] Property RaiderAttackerPhases Auto Const
EndGroup

Group GunnerAttackerProperties
    AttackerPhase[] Property GunnerAttackerPhases Auto Const
EndGroup

Group SuperMutantAttackerProperties
    AttackerPhase[] Property SuperMutantAttackerPhases Auto Const
EndGroup

Group BrotherhoodAttackerProperties
    AttackerPhase[] Property BrotherhoodAttackerPhases Auto Const
EndGroup

Group InstituteAttackerProperties
    AttackerPhase[] Property InstituteAttackerPhases Auto Const
EndGroup

Group BrotherhoodRemenantAttackerProperties
    AttackerPhase[] Property BrotherhoodRemenantAttackerPhases Auto Const
EndGroup

Group InstituteRemenantAttackerProperties
    AttackerPhase[] Property InstituteRemenantAttackerPhases Auto Const
EndGroup

Group PrydwenDestructionAttackerProperties
    AttackerPhase[] Property PrydwenDestructionAttackerPhases Auto Const
EndGroup

Group SuperMutantBehemothAttackerProperties
    AttackerPhase[] Property SuperMutantBehemothAttackerPhases Auto Const
EndGroup