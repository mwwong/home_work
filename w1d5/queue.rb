class Queue
    attr_reader :queue
    def initialize
        @queue = []        
    end 
    def enqueue(el)
        queue << el
    end
    def dequeue
        @queue = @queue[1..-1]
    end
    def peek
        @queue[0]
    end
end