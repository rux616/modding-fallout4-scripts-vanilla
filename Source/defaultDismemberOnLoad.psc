Scriptname defaultDismemberOnLoad extends Actor

bool property bExplodeParts = FALSE auto const
bool property bKillifNotDead = TRUE auto const

bool property head = FALSE auto const
bool property armLeft = FALSE auto const
bool property armRight = FALSE auto const
bool property legLeft = FALSE auto const
bool property legRight = FALSE auto const

string property typeInLimb = "none" auto const
{Need some other, specific limb?  Enter the string name here. Case-sensitive.}

auto STATE Dismembering
    Event OnLoad()
        GoToState("Done")

        if bKillifNotDead && !isDead()
            self.killSilent(self)
            ("defaultDismemberOnLoad: Loading and killing actor: "+self)
        endif

         if !head && !armLeft && !armRight && !legLeft && !legRight && typeInLimb == "none"
            ; Dismember random parts.
            if Utility.RandomInt(0,1) == 1
                Dismember("Head1", bExplodeParts, TRUE)
            endif
            if Utility.RandomInt(0,1) == 1
                Dismember("LeftArm1", bExplodeParts, TRUE)
            endif
            if Utility.RandomInt(0,1) == 1
                Dismember("RightArm1", bExplodeParts, TRUE)
            endif
            if Utility.RandomInt(0,1) == 1
                Dismember("LeftLeg1", bExplodeParts, TRUE)
            endif
            if Utility.RandomInt(0,1) == 1
                Dismember("RightLeg1", bExplodeParts, TRUE)
            endif
        else
            ; Dismember specified parts.
             if head
                Dismember("Head1", bExplodeParts, TRUE)
            endif
            if armLeft
                Dismember("LeftArm1", bExplodeParts, TRUE)
            endif
            if armRight
                Dismember("RightArm1", bExplodeParts, TRUE)
            endif
            if legLeft
                Dismember("LeftLeg1", bExplodeParts, TRUE)
            endif
            if legRight
                Dismember("RightLeg1", bExplodeParts, TRUE)
            endif
            if typeInLimb != "none"
                Dismember(typeInLimb, bExplodeParts, TRUE)
            endif
        endif
    EndEvent
EndSTATE

STATE Done

EndSTATE