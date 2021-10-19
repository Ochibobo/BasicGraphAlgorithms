#=
    Function used to check if there exists a path between 
    2 nodes in a graph.
    Assumes the graph is acyclic (DiGraph).
=#

## Sample DiGraph used
graph = Dict{String, Vector{String}}()
graph["a"] = ["b","c"]
graph["b"] = ["d"]
graph["c"] = ["e"]
graph["d"] = ["f"]
graph["e"] = []
graph["f"] = []


## Check if there's a path between 2 Nodes
function has_path(graph, source, destination)
    if(source == destination) return true end

    for neighbour in graph[source]
        ## Check whether there is some path between the neighbour and the destination
        if(has_path(graph, neighbour, destination))
            return true
        end
    end
    return false
end

println(has_path(graph, "f", "a"))