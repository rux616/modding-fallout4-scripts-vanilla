Scriptname AODogmeatQuestScript extends Quest
{Attached to various AO_Dogmeat_XXX quests to handle things like setting quest type cooldowns, etc.}

Group Aliases
ReferenceAlias Property myActor const auto
{Dogmeat should be in here}

ReferenceAlias Property myObject const auto
{The object Dogmeat has "found"}

EndGroup

Group AOData 
GlobalVariable Property AO_Dogmeat_FindType_GLOBAL const auto
{Filter for: "AO_Dogmeat_FindType"}

Bool Property StartDistancePolling = true const auto
{Default: true - calls StartDistancePollingIfNeeded() on the AOAliasBailOutScript attached to Ref in myActor
NOTE: TO DO **** This should become an event when we can register for distance events****}

Bool Property ShouldProcessCollection = true const auto
{Default: true; should process the reference collection? Calls ProcessCollection on the RefCollectionAliasManager quest script}

EndGroup

Group Stages 
{IMPORTANT!: YOU MUST HAVE STAGES FOR STARTUP (Run on start flag) AND SHUT DOWN (Run on stop flag) EVEN IF THEY ARE EMPTY - AND SET THEIR VALUE HERE!}

int Property StartupStage = 0 const auto
{Default: 0; }

int Property ShutdownStage = 255 const auto
{Default: 255; When this stage runs, mark myObject as Finished and set the cool down based on Type}

EndGroup

Event OnStageSet(int auiStageID, int auiItemID)

	AOScript AO = AOScript.GetScript()

	if auiStageID == StartupStage
    	AO.DogmeatFindEventStarted()

    	if StartDistancePolling
    		(myActor as AOAliasBailOutScript).StartDistancePollingIfNeeded()
    	endif

    	if ShouldProcessCollection
    		((Self as Quest) as RefCollectionAliasManager).ProcessCollection()
    	endif


    elseif auiStageID == ShutdownStage
    	AOScript.FlagObjectFinished(myObject.GetReference())
    	AO.DogmeatFindEventEnded(AO_Dogmeat_FindType_GLOBAL)

    endif

EndEvent