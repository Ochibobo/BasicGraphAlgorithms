#=
    Calculate the shortest path. (BFS)
=#
## Queue data structure for BFS traversal
using DataStructures

edges = [
  ["w", "x"],
  ["x", "y"],
  ["z", "y"],
  ["z", "v"],
  ["w", "v"]
];

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

## Find the shortest path between source and destination nodes, if it exists.
function shortestPath(graph::Dict{String, Vector{String}}, source::String, destination::String, visitedSet::Set{String})
    ## Pair is used to store <Node, NodeLevel> pairs
    ## This removes need for an extra loop to traverse all nodes at a particular level
    ## Instead, we can access a node's level directly from it's value stored alongside it in the queue
    queue = Queue{Pair{String, Int64}}()
    ## Default length 
    len = 0
    ## Append the source to the visited set and to the queue
    enqueue!(queue, source => len)

    ## Exhaust the queue as you traverse the graph
    while(!isempty(queue))
        ## Get the length of the queue
        # n = length(queue)
        ## Loop through n queue elements at level len
        # for _ in 1:n
        ## Remove element at the front of the queue
        currentNodePair = dequeue!(queue)
        currentNode = currentNodePair.first
        distance = currentNodePair.second
        ## If the currentNode has already been visited, keep looping
        if(in(currentNode, visitedSet)) continue end
        ## Append the currentNode to the visitedSet otherwise
        push!(visitedSet, currentNode)
        ## if the currentNode is the destination, return the length
        if currentNode == destination
            return distance
        end
        ## Get the neighbours of the node
        for neighbour in graph[currentNode]
            enqueue!(queue, neighbour => distance + 1)
        end
        # end

        ## Increase the length 
        # len += 1
    end

    ## If there is no path, return the length as -1
    return -1
end

function shortestPath(edges::Vector{Vector{String}}, source::String, destination::String)
    ## Build a graph from the edges
    graph = buildGraph(edges) 
    println(graph)
    ## Set to hold the visited nodes
    visitedSet = Set{String}()

    ## return the length of the shortest path
    len = shortestPath(graph, source, destination,visitedSet)

    println(len)
end


shortestPath(edges, "w", "z")

