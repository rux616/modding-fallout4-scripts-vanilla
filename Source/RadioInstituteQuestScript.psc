Scriptname RadioInstituteQuestScript extends Quest Conditional

Int Property CurrentSong Auto Conditional

Int Property LastSongPlayed01 Auto Conditional

Int Property LastSongPlayed02 Auto Conditional

Int Property LastSongPlayed03 Auto Conditional

Int Property LastSongPlayed04 Auto Conditional

Int Property LastSongPlayed05 Auto Conditional

Int Property LastSongPlayed06 Auto Conditional

Int Property LastSongPlayed07 Auto Conditional

Int Property LastSongPlayed08 Auto Conditional

Int Property LastSongPlayed09 Auto Conditional

Int Property LastSongPlayed10 Auto Conditional

Int Property LastSongPlayed11 Auto Conditional

Int Property LastSongPlayed12 Auto Conditional

Int Property LastSongPlayed13 Auto Conditional

Int Property LastSongPlayed14 Auto Conditional

Int Property LastSongPlayed15 Auto Conditional

Int Property LastSongPlayed16 Auto Conditional

Int Property LastSongPlayed17 Auto Conditional

Int Property LastSongPlayed18 Auto Conditional







Function UpdateRadio()
LastSongPlayed18=LastSongPlayed17
LastSongPlayed17=LastSongPlayed16
LastSongPlayed16=LastSongPlayed15
LastSongPlayed15=LastSongPlayed14
LastSongPlayed14=LastSongPlayed13
LastSongPlayed13=LastSongPlayed12
LastSongPlayed12=LastSongPlayed11
LastSongPlayed11=LastSongPlayed10
LastSongPlayed10=LastSongPlayed09
LastSongPlayed09=LastSongPlayed08
LastSongPlayed08=LastSongPlayed07
LastSongPlayed07=LastSongPlayed06
LastSongPlayed06=LastSongPlayed05
LastSongPlayed05=LastSongPlayed04
LastSongPlayed04=LastSongPlayed03
LastSongPlayed03=LastSongPlayed02
LastSongPlayed02=LastSongPlayed01
LastSongPlayed01=CurrentSong


EndFunction

