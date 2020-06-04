module SwapOut
    refine Enumerable do
        def swap(hash)
            map{|e| hash[e] || e}
        end
    end
end

module SemiWeakTyping
    refine Object do
        def add_or_return x
            self+x rescue x
        end
    end
end

using SwapOut
using SemiWeakTyping
def cracklepop
    #taking advantage of some special syntax & duck typing that lets me use a block like a dynamically computed hash
    crackle = ->((i,v)){[i, i % 3 == 0 ? 'crackle' : v ] }
    pop     = ->((i,v)){ i % 5 == 0 ? (v.add_or_return 'pop') : v }
    (1..100).zip(1..100).swap(crackle).swap(pop)
end

puts cracklepop