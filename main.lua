function love.load()
  math.randomseed(os.time())
end

function love.update(dt)
  handle_input(dt)
end

function handle_input()
end

function love.draw(dt)
  love.graphics.setBackgroundColor(255, 255, 255)
end

