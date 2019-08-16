class Map
    attr_reader :_set_
    def initialize
        @_set_ = []
    end
    def set(key, val)
        if _set_.empty?
            _set_ << [key, val]
        end
        _set_.each_with_index do | pair, index | 
         if pair[0] != key 
            @_set_ << [key, val]
         end
         if pair[1] != val && pair[0] == key
            @_set_[index] = [key, val]
         end
        end
        @_set_ = @_set_.uniq
    end
    def get(key)
        _set_.each do | sets |
            if sets[0] == key
                return sets[1]
            end
        end
        nil
    end
    def delete(key)
        @_set_ = _set_.select { | sets | sets[0] != key }
    end
    def show
        _set_
    end
end