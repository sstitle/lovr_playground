local cubes = {}

function lovr.load()
  -- Use a dark grey background
  lovr.graphics.setBackgroundColor(.2, .2, .2)
end

function lovr.update(dt)
  -- Add a new cube at a random position every frame
  table.insert(cubes, {
    x = math.random(-5, 5),
    y = 5,
    z = math.random(-10, -6), -- Ensure cubes aren't too close to the camera by excluding the range -5 to -6
    size = math.random() * 0.5 + 0.1,
    speed = math.random() * 0.5 + 0.1,
    color = {math.random(), math.random(), math.random()} -- Random color for each cube
  })

  -- Update cube positions and check if they are in view
  for i = #cubes, 1, -1 do
    local cube = cubes[i]
    cube.y = cube.y - cube.speed * dt

    -- Check if the cube is out of view
    if cube.y < -5 or cube.x < -5 or cube.x > 5 or cube.z < -10 or cube.z > 5 then
      table.remove(cubes, i)
    end
  end
end

function lovr.draw(pass)
  -- Draw all cubes with shading and outlines
  for _, cube in ipairs(cubes) do
    -- Set color for shading
    pass:setColor(cube.color[1], cube.color[2], cube.color[3]) -- Use the cube's random color
    pass:cube(cube.x, cube.y, cube.z, cube.size)

    -- Set color for outline
    pass:setColor(0, 0, 0) -- Black for outline
    pass:setWireframe(true) -- Enable wireframe mode for outline
    pass:cube(cube.x, cube.y, cube.z, cube.size)
    pass:setWireframe(false) -- Disable wireframe mode
  end
end
