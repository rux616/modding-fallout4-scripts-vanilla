Scriptname TEST_COC_WAIT

function Main(string cellName)
    Utility.SetINIBool("bForceAutoVanityMode:Camera", true)
    Debug.EnableDetection(false)
    Debug.CenterOnCellAndWait(cellName)
    Utility.Wait(300.0)
    Debug.QuitGame()
endFunction