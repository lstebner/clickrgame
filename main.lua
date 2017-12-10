current_time = 0
current_time_ms = 0

function update_time()
  current_time = love.timer.getTime()
  current_time_ms = math.floor(current_time * 1000)
  current_time = math.floor(current_time)
end

function love.load()
  math.randomseed(os.time())
  setup_board()
end

function love.update(dt)
  update_time()
  handle_input(dt)
  update_clickr(dt)
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
    type = "none",
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
  love.graphics.rectangle("fill", xpos, ypos, grid_size - 2, grid_size - 2)
end

spawn_cell_timer = 0
new_cell_spawn_interval = 3000 -- milliseconds
num_cells_spawned = 0
next_spawn_cell_row = 1
next_spawn_cell_col = 1
cell_colors = {
  {255, 0, 0},
  {0, 255, 0},
  {0, 0, 255},
}

function update_clickr(dt)
  spawn_cell_timer = spawn_cell_timer + dt * 1000
  if spawn_cell_timer > new_cell_spawn_interval then
    spawn_cell_timer = 0
    spawn_next_cell()
  end
end

function spawn_next_cell()
  while clickr_board[next_spawn_cell_row][next_spawn_cell_col].type ~= "none" do
    next_spawn_cell_col = next_spawn_cell_col + 1
    if next_spawn_cell_col > grid_cols then
      next_spawn_cell_col = 1
      next_spawn_cell_row = next_spawn_cell_row + 1

      if next_spawn_cell_row > grid_rows then
        return game_over()
      end
    end
  end

  num_cells_spawned = num_cells_spawned + 1
  local cell_type = math.random(#cell_colors)
  local cell_color = cell_colors[cell_type]
  clickr_board[next_spawn_cell_row][next_spawn_cell_col].type = cell_type
  clickr_board[next_spawn_cell_row][next_spawn_cell_col].color = cell_color
end

function game_over()
  print "game over"
end
