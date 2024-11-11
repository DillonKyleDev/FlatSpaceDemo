-- Pawn.scp.lua


function Awake() 
     Pawn[my_id] = 
     {
          name = this_object:GetName(),
          startTime = GetTime(),
          lifeTime = 5000,
          currentHealth = 10.0,
          totalHealth = 10.0,
          healthBar = this_object:FindChildByName("Healthbar"),
          animation = this_object:GetAnimation(),
          boxCollider = this_object:GetBoxCollider(),
          id = my_id,
          pointValue = 100
     }     
end 

function Start() 
     local data = Pawn[my_id]
     UpdateHealthbar(my_id)
end 

function Update() 
     local data = Pawn[my_id]
     if GetTime() >= (data.startTime + data.lifeTime) then          
          Destroy(my_id)
     end
end 

function UpdateHealthbar(id)
     local data = Pawn[id]
     local healthSprite = data.healthBar:GetSprite()
     local spriteScale = healthSprite:GetScale()
     local healthScale = data.currentHealth / data.totalHealth
     healthSprite:SetScale(Vector2:new(healthScale, spriteScale:y()))
end

function DamagePawn(id, amount)
     local data = Pawn[id]

     data.currentHealth = data.currentHealth - amount
     UpdateHealthbar(id)

     if data.currentHealth <= 0 then
          data.boxCollider:SetActive(false)
          data.animation:Play("ShipExplode")   
          AddToScore(data.pointValue)       
     end
end

function Die(id)
     Destroy(id)
end

function Die()
     Destroy(my_id)
end

-- each of these functions must be present in each file otherwise other files copies will be used with this object instead
function OnBoxCollision()
     local data = Pawn[my_id]
end

function OnBoxCollisionEnter(collidedWith)
     local data = Pawn[my_id]

     if (collidedWith:GetParent():HasTag("Player")) then          
          DamagePlayer(collidedWith:GetParentID(), 5)
     end
end

function OnBoxCollisionLeave()
     local data = Pawn[my_id]
end

function OnCircleCollision()
     local data = Pawn[my_id]
end

function OnCircleCollisionEnter()
     local data = Pawn[my_id]
end

function OnCircleCollisionLeave()
     local data = Pawn[my_id]
end

function OnButtonMouseOver()
     local data = Pawn[my_id]
end

function OnButtonMouseEnter()
     local data = Pawn[my_id]
end

function OnButtonMouseLeave()
     local data = Pawn[my_id]
end

function OnButtonLeftClick()
     local data = Pawn[my_id]
end

function OnButtonRightClick()
     local data = Pawn[my_id]
end