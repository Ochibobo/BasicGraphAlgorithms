#=
    Get the number of connected components in an undirected graph
=#

## Sample graph
graph = Dict{Int64,Vector{Int64}}(
    0 => [8, 1, 5],
    1 => [0],
    5 => [0, 8],
    8 => [0, 5],
    2 => [3, 4],
    3 => [2, 4],
    4 => [3, 2]
)


function connectected_components_count(graph)
    visitedSet = Set{Int64}()
    count = 0

    ## Loop through all the nodes to get the number of connected components
    for node in keys(graph)
        ## Each time the dfs_traversal returns true, a new disjoint component has been visited, increase the count value
        if(dfs_traversal(graph, node, visitedSet)) 
            count += 1
        end
    end

    println(count)
end


function dfs_traversal(graph, node, visitedSet) 
    ## If the node's component has already been visited, don't traverse it again
    if(in(node, visitedSet)) return false end

    ## Append the node to the visited Set
    push!(visitedSet, node) 

    for neighbour in graph[node]
        dfs_traversal(graph, neighbour, visitedSet)
    end

    ## If the component is newly traversed, after traversing it completely, return true
    return true 
end

connectected_components_count(graph)  