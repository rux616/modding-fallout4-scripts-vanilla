Scriptname ViciousDogFXScript extends Actor
{Handles the VD fx}

Armor Property SkinViciousDogHairBald Auto
Armor Property SkinViciousDogMange Auto

float myScale

Event OnLoad()

  ; self.setscale(Utility.RandomFloat(0.75, 1.2))
  ; myScale = self.GetScale()

  if (myScale <= 1) ;I am younger
    if utility.RandomInt(1,3) == 1
      self.equipItem(SkinViciousDogHairBald)
    endif
    if utility.RandomInt(1,4) == 1
      self.equipItem(SkinViciousDogMange)
    endif
  endIf

  if (myScale > 1) ;I am older
   if utility.RandomInt(1,3) == 1
      self.equipItem(SkinViciousDogHairBald)
    endif
  endIf

endEvent


