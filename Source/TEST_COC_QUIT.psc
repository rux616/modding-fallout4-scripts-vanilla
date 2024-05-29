Scriptname TEST_COC_QUIT

function Main(string cellName)
    Utility.SetINIBool("bForceAutoVanityMode:Camera", true)
    Debug.EnableDetection(false)
    Debug.CenterOnCellAndWait(cellName)
    Debug.QuitGame()
endFunction