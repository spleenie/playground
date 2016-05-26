def solution(m, n, arrPrices)
    i = 0
    output = ""
    while i < n
        j = i+1
        while j < n
            if arrPrices[i].to_i + arrPrices[j].to_i == m
                output = "#{i+1} #{j+1}"
                break
            else
                j+=1
            end
        end
        i+=1
    end
    
    return output
end


filename = "testcase1.txt"
numTestCases = 0
totalMoney = 0
totalFlavors = 0
arrayPrices = Array.new
File.open(filename, "r") do |f|
    numTestCases = f.readline.chomp.to_i
    
    for i in 0...numTestCases
        totalMoney=f.readline.chomp.to_i
        totalFlavors=f.readline.chomp.to_i
        arrayPrices=f.readline.chomp.split(" ")
        puts solution(totalMoney, totalFlavors, arrayPrices)
    end
end