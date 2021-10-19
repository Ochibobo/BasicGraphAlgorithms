#=
    Size of the largest component
=#

graph = Dict{Int64, Vector{Int64}}(
    0 => [8, 1, 5],
    1 => [0],
    5 => [0, 8],
    8 => [0, 5],
    2 => [3, 4],
    3 => [2, 4],
    4 => [3, 2]
)


function largest_component(graph)
    visitedSet = Set{Int64}()
    size = 0
 
    for node in keys(graph)
        size = max(dfs_traversal(graph, node, visitedSet), size)
    end

    println(size)
end

function dfs_traversal(graph, node, visitedSet)
    if(in(node, visitedSet)) return 0 end
    push!(visitedSet, node)

    size = 1 
    for neighbour in graph[node]
       ## Increment size
       size += dfs_traversal(graph, neighbour, visitedSet)
    end

    return size
end

largest_component(graph)