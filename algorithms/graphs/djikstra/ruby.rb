graph = Hash.new { |hash,key| hash[key] = Hash.new(&hash.default_proc) }

graph["1"]["2"] = graph["2"]["1"] = 7
graph["1"]["3"] = graph["3"]["1"] = 9
graph["1"]["6"] = graph["6"]["1"] = 14

graph["2"]["3"] = graph["3"]["2"] = 10
graph["2"]["4"] = graph["4"]["2"] = 15

graph["3"]["4"] = graph["4"]["3"] = 11

graph["3"]["6"] = graph["6"]["3"] = 2

graph["4"]["5"] = graph["5"]["4"] = 6

graph["5"]["6"] = graph["6"]["5"] = 9


def djikstra(graph, from, to)
    costs = Hash.new(Float::INFINITY)
    costs[from] = 0
    parents = Hash.new(from)

    graph.each_key do |node_from|
        graph[node_from].each_key do |node_to|
            new_cost = costs[node_from] + graph[node_from][node_to]
            if new_cost < costs[node_to]
                costs[node_to] = new_cost
                parents[node_to] = node_from
            end
        end
    end

    { cost: costs[to], way: parents }
end

puts djikstra(graph, "1", "6")
