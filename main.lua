function lovr.load()
    -- Load a 3D model
    model = lovr.graphics.newModel('monkey.obj')
  
    -- Use a dark grey background
    lovr.graphics.setBackgroundColor(.2, .2, .2)
  end
  
  function lovr.draw(pass)
    -- Draw the model
    pass:setColor(1, 1, 1)
    pass:draw(model, -.5, 1, -3)
  
    -- Draw a red cube using the "cube" primitive
    pass:setColor(1, 0, 0)
    pass:cube(.5, 1, -3, .5, lovr.timer.getTime())
  end
