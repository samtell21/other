module SwapOut
    refine Enumerable do
        def swap(arr)
            map.with_index{|e, i| arr[i] ? arr[i] : e}
        end
        def append_or_swap(arr)
            map.with_index{|e, i| arr[i] ? (e+arr[i] rescue arr[i]) : e}
        end
    end
end
using SwapOut
def cracklepop
    #taking advantage of some special syntax & duck typing that lets me use a block like a dynamically computed array
    crackle = ->(i){ (i+1) % 3 == 0 ? 'crackle'  : nil}
    pop     = ->(i){ (i+1) % 5 == 0 ? 'pop'      : nil}
    (1..100).swap(crackle).append_or_swap(pop)
end

puts cracklepop