
#using ruby
#wrote some disgusting algorithms (the second one's not bad)
#I think I'm gonna start from scratch...

#some duck-typing
def cracklepop1
    def aux x
        /[A-Z]+/i.match(x.to_s).to_s
    end
    (1..100).map do |i|
        x = i%3==0 ? 'crackle' : i
        i%5==0 ? (aux(x)+'pop') : x
    end
end

#some closures
def cracklepop2
    l = lambda do |i|
        {15=>'cracklepop',5=>'pop',3=>'crackle'}
        .each do |n,s| 
            return s if i%n==0
        end
        i
    end
    (1..100).map(&l)
end

#one more for the road
def cracklepop3
    (1..100).zip(Array.new 100, nil).map do |i,x|
        [i%3, i%5].map.with_index do |y, j| 
            x = x.to_s + ['crackle','pop'][j] if y==0
        end
        x ? x : i
    end
end


(1..3).map{|i| eval "cracklepop#{i}"}.uniq.length == 1 ? puts(cracklepop1) : raise(":O")

     
