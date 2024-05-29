Scriptname DLC05:DLC05WorkshopJunkMortar extends ObjectReference Const

String Property BlastNode = "BlastNode" auto const
{Node name to spawn explosion at.}
ActorValue Property DLC05Force auto const
{actor value to get strength of explosive force.} 
Explosion Property MortarExplosionActor auto const
{This is the primary explosion which contains the sound and affects actors.}
Explosion Property MortarExplosionJunk auto const
{This is the secondary explosion.}

Event OnPowerOn(ObjectReference akPowerGenerator)
  Debug.Trace(self + "OnPowerOn: Firing Junk.")
  ObjectReference newExplosion00 = self.PlaceAtNode(BlastNode, MortarExplosionActor)
  ObjectReference newExplosion01 = self.PlaceAtNode(BlastNode, MortarExplosionJunk, GetValue(DLC05Force) as int)
EndEvent



