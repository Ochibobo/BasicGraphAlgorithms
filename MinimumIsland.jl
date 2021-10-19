#=
    Find the size of the smallest island
=#

grid = [
    ["L", "W", "W", "L", "W"],
    ["L", "W", "W", "L", "L"],
    ["W", "L", "W", "L", "W"],
    ["W", "W", "W", "W", "W"],
    ["W", "W", "L", "L", "L"],
];


function dfs(grid::Vector{Vector{String}}, i::Int64, j::Int64, nrows::Int64, ncols::Int64) 
    if(i < 1 || i > ncols || j < 1 || j > nrows) return 0 end

    if(grid[i][j] != "L") return 0

    ## Set the visited Land "L" to "V"
    grid[i][j] = "V"
    size = 1
    ## Right traversal
    size += dfs(grid, i + 1, j, nrows, ncols)
    ## Down traversal
    size += dfs(grid, i, j + 1, nrows, ncols)
    ## Left traversal
    size += dfs(grid, i - 1, j, nrows, ncols)
    ## Up Traversal
    size += dfs(grid, i, j - 1, nrows, ncols)
    ## Presence of "L" indicates there is an island
    return size
end


function minimumIsland(grid::Vector{Vector{String}})
    ## Number of rows and number of columns
    ncols = length(grid)
    nrows = length(grid[1])

    ## Loop though entire grid looking for islands
    minIsland = nrows * ncols
    ## Pass a copy of the grid structure
    grid_copy = deepcopy(grid)
    for i=1:ncols, j = 1:nrows
        size = dfs(grid_copy, i, j, nrows, ncols)
        ## Only do size comparison if land has been encountered
        if size > 0 minIsland = min(minIsland, size) end
    end

    println(minIsland == nrows * ncols ? 0 : minIsland)
end

minimumIsland(grid)    