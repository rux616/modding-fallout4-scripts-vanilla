Scriptname DN054PaintJobCertificateScript extends ObjectReference

GlobalVariable Property PA_Global_Material_AtomCat Auto 
Message Property DN054PowerArmorPaintJobPurchaseMessage Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

  if akNewContainer == Game.GetPlayer()
    Debug.Trace("Doing frame stuff for Player")
   	PA_Global_Material_AtomCat.setValue(1)
   	DN054PowerArmorPaintJobPurchaseMessage.Show()
   	Delete()
  endIf

endEvent