
def sum_to(num)
    if num < 0
        return nil
    end
    if num == 1
        return num
    end
    return num + sum_to(num-1)
end

def add_numbers(arr)
    if arr.empty?
        return nil
    end
    if arr.length == 1
        return arr[-1]
    end
    return arr[-1] + add_numbers(arr[0..-2])
end
def gamma_fnc(n)
    if n == 0
        return nil
    end
    if n == 1
        return 1
    end
    return (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(arr, str)
    if arr.empty?
        return false
    end
    if arr[0] == str
        return true
    else 
    ice_cream_shop(arr[1..-1], str)
    end
end

def reverse(str)
    if str == ""
        return ""
    end
    return str[-1] + reverse(str[0..-2])
end
