#=
    Check if there is a path between 2 elements of an undirected graph
    Check for cycles too.
=#
edges = [
    ["i", "j"],
    ["k", "i"],
    ["m", "k"],
    ["k", "l"],
    ["k", "j"],
    ["o", "n"]
]

## Build a graph from the edge list
function buildGraph(edgeList)
    graph = Dict{String,Vector{String}}()

    for nodePair in edgeList
        nodeA = nodePair[1]
        nodeB = nodePair[2]

        if !haskey(graph, nodeA) graph[nodeA] = [] end
        if !haskey(graph, nodeB) graph[nodeB] = [] end

        push!(graph[nodeA], nodeB)
        push!(graph[nodeB], nodeA)
    end

    return graph
end

## Check if there is a path between 2 nodes in the graph
function has_path(graph::Dict{String,Vector{String}}, source::String, destination::String, visitedSet::Set)
    if(source == destination) return true end
    ## If the element has already been visited, return false (this prevents cyclic visits)
    if(in(source, visitedSet)) return false end
    ## Append the element to the visited Set
    push!(visitedSet, source)

    for neighbour in graph[source]
        if(has_path(graph, neighbour, destination, visitedSet))
            return true
        end
    end

    return false
end

## Primary function to run
function has_path(edges::Vector{Vector{String}}, source::String, destination::String)
    graph = buildGraph(edges)
    visitedSet = Set()

    path_exists = has_path(graph, source, destination, visitedSet) 

    println(path_exists)
end

has_path(edges, "i", "k")