
require 'byebug'
def sluggish_octopus(fish)
    current_index = 0
    fish.each_with_index do | f_1, idx_1 |
        fish.each do | f_2, idx_2 |
            if f_1.length < f_2.length && idx_1 != idx_2
                current_index = idx_2
            elsif f_1.length > f_2.length && idx_1 != idx_2
                current_index = idx_1
            else
                next
            end
        end
    end
    fish[current_index]
end

def dominant_octopus(fish)

     dominant_octopus_merge_sort(fish).last

end
def dominant_octopus_merge_sort(fish)
  #  debugger
    return fish if fish.length <= 1
    mid_index = fish.length / 2
 #   debugger
    sort_left_fish = dominant_octopus_merge_sort(fish[0...mid_index])
    #
    sort_right_fish = dominant_octopus_merge_sort(fish[mid_index..-1])
    merge_sort_helper(sort_left_fish, sort_right_fish)
end

def merge_sort_helper(left, right)
    #
    merge = []
    until left.empty? || right.empty?

        if left[0].length <= right[0].length
            merge << left.shift
        else
            merge << right.shift
        end
    end
    merge += left + right
    return merge
end

def clever_octopus(fish)
    fish.inject do | acc, f |
        if acc.length > f.length 
            acc
        else
            f 
        end
    end
end

def slow_dance(direction, tiles_array)

  tiles_array.each_with_index do |tile, idx|
        if direction == tile 
            return idx
        end
  end
end

def fast_dance(direction, tiles_array)
    new_tiles_data_structure = Hash.new(0)
    tiles_array.each_with_index do | tile, idx |
        new_tiles_data_structure[tile] = idx
    end
    return new_tiles_data_structure[direction]
end
fish  = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
puts sluggish_octopus(fish)
puts dominant_octopus(fish)
puts clever_octopus(fish)
puts slow_dance('up', tiles_array)
puts fast_dance('down', tiles_array)