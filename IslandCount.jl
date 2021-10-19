#=
    Count the number of islands on the grid
    "L" for land, "W" for water
=#

grid = [
  ["W", "L", "W", "W", "W"],
  ["W", "L", "W", "W", "W"],
  ["W", "W", "W", "L", "W"],
  ["W", "W", "L", "L", "W"],
  ["L", "W", "W", "L", "L"],
  ["L", "L", "W", "W", "W"],
];

function dfs(grid::Vector{Vector{String}}, i::Int64, j::Int64, nrows::Int64, ncols::Int64)
    if(i < 1 || i > ncols || j < 1 || j > nrows) return 0 end

    if(grid[i][j] == "L")
        ## Set the visited Land "L" to "V"
        grid[i][j] = "V"
        ## Right traversal
        dfs(grid, i + 1, j, nrows, ncols)
        ## Down traversal
        dfs(grid, i, j + 1, nrows, ncols)
        ## Left traversal
        dfs(grid, i - 1, j, nrows, ncols)
        ## Up Traversal
        dfs(grid, i, j - 1, nrows, ncols)
        ## Presence of 'L' indicates there is an island
        return 1
    end
    return 0
end

## Count the number of islands on the grid
function islandCount(grid::Vector{Vector{String}})
    ## Number of rows and number of columns
    ncols = length(grid)
    nrows = length(grid[1])

    ## Loop though entire grid looking for islands
    numberOfIslands = 0
    ## Pass a copy of the grid structure
    grid_copy = deepcopy(grid)
    for i=1:ncols, j = 1:nrows
        numberOfIslands += dfs(grid_copy, i, j, nrows, ncols)
    end

    println(numberOfIslands)
end

islandCount(grid)
