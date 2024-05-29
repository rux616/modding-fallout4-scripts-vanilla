Scriptname TEST_COC

function Main(string cellName)
    float readyTime = Utility.GetCurrentRealTime()
    Utility.SetINIBool("bForceAutoVanityMode:Camera", true)
    Debug.EnableDetection(false)
    Debug.CenterOnCellAndWait(cellName)
	float fLoadTime = Utility.GetCurrentRealTime() - readyTime;
    Utility.EnterTestData("COC", "LoadTime", "", "", fLoadTime)
    RunCellTests()
    RunBudgetTests()
    Debug.QuitGame()
endFunction

function RunCellTests()
    Utility.Wait(10.0)
	Utility.StartFrameRateCapture()
	Utility.Wait(30.0)
	Utility.EndFrameRateCapture()
    
    float fMinFrameRate = Utility.GetMinFrameRate()
    float fMaxFrameRate = Utility.GetMaxFrameRate()
    float fAvgFrameRate = Utility.GetAverageFrameRate()
    string sMemoryUsage = Utility.GetCurrentMemory()
    
    Utility.EnterTestData("COC", "MinFR", "", "", fMinFrameRate)
    Utility.EnterTestData("COC", "MaxFR", "", "", fMaxFrameRate)
    Utility.EnterTestData("COC", "AvgFR", "", "", fAvgFrameRate)
    Utility.EnterTestData("COC", "Memory", "", "", sMemoryUsage)
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