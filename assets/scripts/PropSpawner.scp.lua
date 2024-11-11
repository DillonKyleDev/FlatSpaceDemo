-- PropSpawner.scp.lua


function Awake() 
     PropSpawner[my_id] = 
     {
          animation = this_object:GetAnimation(),
          rigidBody = RigidBody:new(),
          waveTracker = 1,
          spawnWaves = {}
     }    
end 

function Start() 
     local data = PropSpawner[my_id]
     data.animation:Play("Level1")
end 

function Update() 
     local data = PropSpawner[my_id]

     for i, wave in ipairs(data.spawnWaves) do
          if (wave.startTime ~= 0) and (wave.totalSpawned < wave.numberToSpawn) then
               if GetTime() > (wave.startTime + (wave.frequency * wave.totalSpawned)) then
                    wave.spawnPos = GetObjectByName(wave.locationToSpawn):GetTransform():GetTruePosition()
                    wave.totalSpawned = wave.totalSpawned + 1
                    local spawnedMob = Instantiate(wave.mobToSpawn, wave.spawnPos)                    
                    wave.rigidBody = spawnedMob:GetRigidBody()
                    wave.rigidBody:AddForce(wave.direction, 4)
               end
          end

          if wave.totalSpawned == wave.numberToSpawn then
               wave.startTime = 0
               wave.totalSpawned = 0
          end
     end
end 

function SpawnWave(numberOfEnemies, nameOfEnemy, spawnLocation, spawnTrajectory, isBool)
     local data = PropSpawner[my_id]

     local wave = {
          numberToSpawn = numberOfEnemies:int(),
          totalSpawned = 0,
          mobToSpawn = nameOfEnemy:string(),
          locationToSpawn = spawnLocation:string(),
          startTime = GetTime(),
          frequency = 250,
          direction = spawnTrajectory:Vector2()
     }
     data.spawnWaves[data.waveTracker] = wave
     data.waveTracker = data.waveTracker + 1
end