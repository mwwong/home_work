require 'set'
class GraphNode
    attr_accessor :val, :neighbors
    def initialize(val)
        self.val = val
        self.neighbors = []
    end

    def add_neighbors(node)
        self.neighbors << node
    end

end

def bfs(start_node, target)
    queue = [start_node]
    visited = Set.new()
    until queue.empty?
        current_node = queue.shift
        if visited.include?(current_node)
            if current_node.val == target
                return current_node.val
            end
        else
            visited << current_node
            queue += current_node.neighbors
        end
    end
    return nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, 'f')