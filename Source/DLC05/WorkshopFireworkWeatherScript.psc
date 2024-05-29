Scriptname DLC05:WorkshopFireworkWeatherScript extends ObjectReference Const
{script for changing the weather }

Weather property myWeather auto const mandatory 
{ what weather to set when this is placed }

event OnInit()
	myWeather.SetActive(false, true)
endEvent


