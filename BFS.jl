#=
    DFS example in Julia
    DataStructures package used for Queue Data Structure
=#
using DataStructures

## Sample DiGraph used
graph = Dict{String, Vector{String}}()
graph["a"] = ["b","c"]
graph["b"] = ["d"]
graph["c"] = ["e"]
graph["d"] = ["f"]
graph["e"] = []
graph["f"] = []


## Traverse the graph in BFS
function bfs(graph, source = "a")
    ## Queue to hold nodes during traversal
    queue = Queue{String}()
    ## Append the source node to the queue
    enqueue!(queue, source)

    ## Traverse the graph while the queue is not empty
    while(!isempty(queue))
        node = dequeue!(queue)
        print(node, " ")

        for neighbour in graph[node]
            ## Append the neighbours to the queue
            enqueue!(queue, neighbour)
        end
    end
end

bfs(graph)