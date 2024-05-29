Scriptname TEST_MAINMENU

function Main()
	Utility.PostStartUpTimes()
    Utility.EnterTestData("MainMenu", "Memory", "", "", Utility.GetCurrentMemory())
    RunBudgetTests()
    Debug.QuitGame()
endFunction

function RunBudgetTests()
    int ibudgetCount = Utility.GetBudgetCount();
	int ibudgetsSeen = 0;
	while(ibudgetsSeen < ibudgetCount)
        string sBudgetName = Utility.GetBudgetName(ibudgetsSeen)
        string sCurrentBudget = Utility.GetCurrentBudget(ibudgetsSeen)
        string sBudgetLimit = Utility.GetBudgetLimit(ibudgetsSeen)
        Utility.EnterTestData("Budget", sBudgetName, "", sBudgetLimit, sCurrentBudget)
		ibudgetsSeen += 1;
	endwhile
endFunction