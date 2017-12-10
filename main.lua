function love.load()
  math.randomseed(os.time())
  setup_board()
end

function love.update(dt)
  handle_input(dt)
end

function handle_input()
end

function love.draw(dt)
  love.graphics.setBackgroundColor(255, 255, 255)
  draw_board()
end

clickr_board = {}

grid_size = 30
grid_cols = 22
grid_rows = 6
grid_offset = grid_size

function setup_board()
  local ypos, xpos
  for y = 0, grid_rows, 1 do
    clickr_board[y + 1] = {}
    for x = 0, grid_cols, 1 do
      table.insert(clickr_board[y + 1], create_grid_cell(x, y))
    end
  end
end

function create_grid_cell(x, y)
  return {
    xpos = x * grid_size,
    ypos = y * grid_size,
    color = {255, 255, 255},
  }
end

function draw_board()
  for y = 0, grid_rows, 1 do
    for x = 0, grid_cols, 1 do
      draw_grid_cell(x, y)
    end
  end
end

function draw_grid_cell(x, y)
  local cell = clickr_board[y + 1][x + 1]
  local xpos = cell.xpos + grid_offset
  local ypos = cell.ypos + grid_offset
  love.graphics.setColor(200, 200, 200)
  love.graphics.rectangle("line", xpos, ypos, grid_size, grid_size)
  love.graphics.setColor(unpack(cell.color))
  love.graphics.rectangle("fill", xpos + 1, ypos + 1, grid_size - 2, grid_size - 2)
end
