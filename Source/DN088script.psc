Scriptname DN088script extends Quest conditional

bool property bInRoomScene = false auto conditional hidden
{Used by package conditions to tell Cooley when to stick to a scene}
objectReference property CooleySceneGoal auto
{This XmarkerHeading is where Cooley sandboxes during room scenes.}
