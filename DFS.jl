#=
    DFS example in Julia
    DataStructures package used for Stack Data Structure
=#
using DataStructures

## Sample DiGraph used
graph = Dict{String, Vector{String}}()
graph["a"] = ["c","b"]
graph["b"] = ["d"]
graph["c"] = ["e"]
graph["d"] = ["f"]
graph["e"] = []
graph["f"] = []

## DFS using loop (Example ensures all nodes are reachable from "a" to show entire graph traversed)
function iterative_dfs(graph, source = "a")
    ## Stack used to store nodes while iterating
    stack = Stack{String}()
    ## Start with element "a"
    push!(stack, source)

    ## Loop throught all graph nodes in DFS manner
    while(!isempty(stack))
        ## Pop node from the top of the stack and print it out
        node::String = pop!(stack)
        print(node, " ")

        ## Get all this node's neighbours and push them into the stack
        for neighbour in graph[node]
            ## Push the neighbour into the stack
            push!(stack, neighbour)
        end
    end
end 

## Recursive solution
function recursive_dfs(graph, source="a")
    ## Log source node 
    print(source, " ")

    ## Get the source's neighbours, if any
    for neighbour in graph[source]
        recursive_dfs(graph, neighbour)
    end
end

## Run the iterative_dfs
iterative_dfs(graph)
println()
## Run the recursive_dfs
recursive_dfs(graph)