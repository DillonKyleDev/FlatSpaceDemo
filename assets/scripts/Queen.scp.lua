-- Queen.scp.lua


function Awake() 
     Queen[my_id] = 
     {
          name = this_object:GetName(),
          currentHealth = 500.0,
          totalHealth = 500.0,
          healthBar = this_object:FindChildByName("Healthbar"),
          animation = this_object:GetAnimation(),
          boxCollider = this_object:GetBoxCollider(),
          transform = this_object:GetTransform(),
          id = my_id,          
          shots = {}
     }          
end 

function Start() 
     local data = Queen[my_id]
     UpdateHealthbar(my_id)
     data.animation:Play("AttackPhase1")
end 

function Update() 
     local data = Queen[my_id]     
     
     for i, shot in ipairs(data.shots) do          
          if (shot.startTime ~= 0) and (shot.totalSpawned < shot.shots) then
               if GetTime() > (shot.startTime + (shot.frequency * shot.totalSpawned)) then                    
                    shot.totalSpawned = shot.totalSpawned + 1
                    local bullet = Instantiate("EnemyBlasterRound", data.transform:GetTruePosition())
                    local rigidBody = bullet:GetRigidBody()
                    rigidBody:AddForce(Vector2:new(0,-1), 10)
               end
          end

          if shot.totalSpawned == shot.numberToSpawn then
               shot.startTime = 0
               shot.totalSpawned = 0
          end
     end
end 

function UpdateHealthbar(id)
     local data = Queen[id]
     local healthSprite = data.healthBar:GetSprite()
     local spriteScale = healthSprite:GetScale()
     local healthScale = data.currentHealth / data.totalHealth
     healthSprite:SetScale(Vector2:new(healthScale, spriteScale:y()))
end

function DamageQueen(id, amount)
     local data = Queen[id]
     data.currentHealth = data.currentHealth - amount     
     UpdateHealthbar(id)

     if data.currentHealth <= 0 then
          data.boxCollider:SetActive(false)
          data.animation:Play("ShipExplode")
          AddToScore(500)
     end
end

function Die(id)
     Destroy(id)
end

function Die()
     scoreScreen = GetObjectByName("EndOfLevelScore")
     scoreScreen:SetActive(true)
     Destroy(my_id)
end


function QueenShoot(shots)
     local data = Queen[my_id]

     local shot = { 
          shots = shots:int(),
          totalSpawned = 0,
          startTime = GetTime(),
          frequency = 400
     }
     
     data.shots[#data.shots + 1] = shot
end


-- each of these functions must be present in each file otherwise other files copies will be used with this object instead
function OnBoxCollision()
     local data = Queen[my_id]
end

function OnBoxCollisionEnter(collidedWith)
     local data = Queen[my_id]
     
     local collidedName = collidedWith:GetParent():GetName()   
     if (collidedWith:GetParent() and collidedWith:GetParent():HasTag("Player")) then          
          DamagePlayer(collidedWith:GetParentID(), 10)
     end
end

function OnBoxCollisionLeave()
     local data = Queen[my_id]
end

function OnCircleCollision()
     local data = Queen[my_id]
end

function OnCircleCollisionEnter()
     local data = Queen[my_id]
end

function OnCircleCollisionLeave()
     local data = Queen[my_id]
end

function OnButtonMouseOver()
     local data = Queen[my_id]
end

function OnButtonMouseEnter()
     local data = Queen[my_id]
end

function OnButtonMouseLeave()
     local data = Queen[my_id]
end

function OnButtonLeftClick()
     local data = Queen[my_id]
end

function OnButtonRightClick()
     local data = Queen[my_id]
end