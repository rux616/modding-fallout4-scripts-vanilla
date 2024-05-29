ScriptName MinDefendCastleAttackROOT Extends Quest

Struct AttackerPhase
    bool useTeleporter = false
    bool VertibirdPhase = false
    bool ApproachFromSouth = false
    {if true this squad will approach from the south, otherwise from the north}
    float SecondsBeforeNextPhase = 30.0
    RefCollectionAlias AttackerSquad
    ReferenceAlias VertibirdStartMarker
    ;ReferenceAlias VertibirdCircleMarker
    ;ReferenceAlias VertibirdLandingMarker
    {If this is a vertibird phase, this is where it starts from}
EndStruct