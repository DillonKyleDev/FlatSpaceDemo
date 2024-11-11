-- QuitButton.scp.lua

-- Use "this_object" to reference the object that owns this script


function Awake() 
     QuitButton[my_id] =
     {
		-- Key value pairs here
     }
     local data = QuitButton[my_id]
end

function Start()
     -- required to access instance data
     local data = QuitButton[my_id]
end

function Update()
     local data = QuitButton[my_id]
end

-- each of these functions must be present in each file otherwise other files copies will be used with this object instead
function OnBoxCollision()
end

function OnBoxCollisionEnter()
end

function OnBoxCollisionLeave()
end

function OnCircleCollision()
end

function OnCircleCollisionEnter()
end

function OnCircleCollisionLeave()
end

function OnButtonMouseOver()
end

function OnButtonMouseEnter()
end

function OnButtonMouseLeave()
end

function OnButtonLeftClick()
     CloseProgram()
end

function OnButtonRightClick()
end