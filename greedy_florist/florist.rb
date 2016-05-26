$debugOn = true

def debug(debugStr)
    if $debugOn
        puts debugStr
    end
end

def sortDesc(arr)
    sortedArr = Array.new
    for i in 0...arr.size
        inserted = false
        if sortedArr.empty?
            sortedArr.push(arr[i])
            inserted = true
        else
            for j in 0...sortedArr.size
                if arr[i].to_i >= sortedArr[j].to_i
                    sortedArr.insert(j, arr[i])
                    inserted = true
                    break
                end
            end
        end
        if !inserted
            sortedArr.push(arr[i])
        end
    end
    debug("sortedArr: #{sortedArr}")
    return sortedArr
end

def lowestCost(numFlowers, numPersons, flowerPrices)
    totalCost = 0
    flowersBought = 0
    
    if numFlowers <= numPersons
        for i in 0...numFlowers
            totalCost = totalCost + flowerPrices[i].to_i
            flowersBought+=1
        end
        
    else
        flowerPrices = sortDesc(flowerPrices)
        debug("flowerPrices sorted: #{flowerPrices}")
        person = 0
        times = 0
        while flowersBought < numFlowers
            if person < numPersons
                thisFlowerCost = (times + 1) * flowerPrices[flowersBought].to_i
                totalCost = totalCost + thisFlowerCost
                if person == numPersons - 1
                    person = 0
                    times+=1
                else
                    person+=1
                end
            end
            flowersBought+=1
        end
    end

    debug("input: #{numFlowers}, #{numPersons}, #{flowerPrices}")
    puts totalCost
end

fileName = "testcase1.txt"
numFlowers = 0
numPersons = 0
flowerPrices = Array.new
File.open(fileName, "r") do |f|
    line = f.readline.chomp.split(" ")
    numFlowers = line[0]
    numPersons = line[1]
    flowerPrices = f.readline.chomp.split(" ")
end
lowestCost(numFlowers.to_i, numPersons.to_i, flowerPrices)

#163578911