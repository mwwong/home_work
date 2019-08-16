class Stack
   attr_reader :stack
    def initialize
        @stack = []        
    end
    def push(el)
        @stack << el
    end
    def pop
        @stack = @stack[0...-1]
    end
    def peek
        @stack[-1]
    end
end