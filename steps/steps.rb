def steps(n,k)
    # n = num of actions
    # k = missing step
    
    x = 1
    currStep = 0
    topStep = currStep
    
    while x <= n
        if (currStep + x != k)
            currStep+=x
        end
        topStep = currStep
        x+=1
    end
    
    puts topStep
end


fileName = "testcase1.txt"
n = 0
k = 0
File.open(fileName, "r") do |f|
    n = f.readline.chomp.to_i
    k = f.readline.chomp.to_i
end
steps(n,k)