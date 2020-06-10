module Schmutils
    refine Object do
        def add_or_return x
            self+x rescue x
        end
    end
end

using Schmutils
def cracklepop
    crackle = ->((i,v)){[i, i % 3 == 0 ? 'Crackle' : v ] }
    pop     = ->((i,v)){ i % 5 == 0 ? (v.add_or_return 'Pop') : v }
    (1..100).zip(1..100).map{|e| crackle[e]}.map{|e| pop[e]}
end

puts cracklepop
