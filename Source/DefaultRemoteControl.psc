Scriptname DefaultRemoteControl extends ScriptObject Hidden Const
{base script that others will import, holds definitions for structures}

Struct SignalParams
	float Value1
	float Value2
	float Value3
	float Value4
	Form Form1
	Form Form2
	Form Form3
	Form Form4
endStruct

Struct SignalChoices
	bool sendOn 
	bool sendOff
	bool sendToggle
	bool sendCustom 
endStruct
