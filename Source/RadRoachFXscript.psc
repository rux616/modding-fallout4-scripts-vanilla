Scriptname RadRoachFXscript extends Actor

float myScale
float Property minScale = 0.65 Auto
float Property maxScale = 1.2 Auto

Event OnLoad()

  self.setscale(Utility.RandomFloat(minScale, maxScale))
  myScale = self.GetScale()


EndEvent