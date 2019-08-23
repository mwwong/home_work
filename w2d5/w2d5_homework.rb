class LRUCache
    attr_accessor :cache_q, :size
    def initialize(size)
        @cache_q = []
        @size = size
    end
    
    def count
        self.cache_q.count
    end

    def add(el)
        if !cache_q.include?(el) && cache_q.count < size
            cache_q.push(el)
        elsif !cache_q.include?(el) && cache_q.count >= size
            cache_q.shift
            cache_q.push(el)
        else
            cache_q.delete(el)
            cache_q.push(el)
        end

    end

    def show
        p cache_q
    end

    private

end

  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]