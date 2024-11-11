-- BlasterRound.scp.lua


function Awake() 
     BlasterRound[my_id] = 
     {
          lifeTime = 1500,
          startTime = GetTime(),
          audio = this_object:GetAudio()
     }     
end 

function Start() 
     local data = BlasterRound[my_id]
     data.audio:Play("Fire")
end 

function Update() 
     local data = BlasterRound[my_id]
     if GetTime() >= (data.startTime + data.lifeTime) then
          Destroy(my_id)
     end
end 

function OnBoxCollision(collidedWith)
end
 
-- each of these functions must be present in each file otherwise other files copies will be used with this object instead
function OnBoxCollision()
     local data = BlasterRound[my_id]
end

function OnBoxCollisionEnter(collidedWith)
     local data = BlasterRound[my_id]

     local collidedName = collidedWith:GetParent():GetName()     
     data.audio:Play("Explode")
     if collidedWith:GetParent():HasTag("Enemy") then
          if (collidedName == "Queen") then          
               DamageQueen(collidedWith:GetParentID(), 5)         
          end
          if (collidedName == "Pawn") then
               DamagePawn(collidedWith:GetParentID(), 5)
          end
     end     

     Destroy(my_id)
end

function OnBoxCollisionLeave()
     local data = BlasterRound[my_id]
end

function OnCircleCollision()
     local data = BlasterRound[my_id]
end

function OnCircleCollisionEnter()
     local data = BlasterRound[my_id]
end

function OnCircleCollisionLeave()
     local data = BlasterRound[my_id]
end

function OnButtonMouseOver()
     local data = BlasterRound[my_id]
end

function OnButtonMouseEnter()
     local data = BlasterRound[my_id]
end

function OnButtonMouseLeave()
     local data = BlasterRound[my_id]
end

function OnButtonLeftClick()
     local data = BlasterRound[my_id]
end

function OnButtonRightClick()
     local data = BlasterRound[my_id]
end