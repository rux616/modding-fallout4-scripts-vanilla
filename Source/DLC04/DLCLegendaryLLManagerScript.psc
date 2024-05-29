Scriptname DLC04:DLCLegendaryLLManagerScript extends Quest

Struct LeveledListDatum
	leveleditem ListToUpdate
{the leveled list item is being added to}
	form FormToAdd
{LeveledList or BaseObject to add to list}
	int Level
{what level to make this item in the list}
	int count = 1
{How many of this item in the list}
EndStruct

LeveledListDatum[] Property LeveledListData auto const mandatory

Event OnInit()
  int i = 0
  while (i < LeveledListData.length)
  	LeveledListDatum LLD = LeveledListData[i]
  	Debug.TraceSelf(self, "OnInit()", "Updating ListToUpdate: " + LLD.ListToUpdate + ", by adding FormToAdd: " + LLD.FormToAdd)

  	LLD.ListToUpdate.AddForm(LLD.FormToAdd, LLD.Level, LLD.Count)
  	i += 1
  endWhile

EndEvent