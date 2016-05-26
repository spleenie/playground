def orderOfOrders(numFans, inputArray)
    
    n = 0
    output = Array.new
    while (n < numFans) 
        tempArray = Array.new
        tempArray.push n+1
        totalTime = inputArray[n][0].to_i + inputArray[n][1].to_i
        tempArray.push totalTime
        output.push tempArray
        n+=1
    end
    
    srcPointer = 0
    sortedOutput = Array.new
    while srcPointer < output.size
        destPointer = 0
        x = output[srcPointer]
        if sortedOutput.empty?
            sortedOutput.push x
        else
            inserted = false
            while destPointer < sortedOutput.length && !inserted
                y = sortedOutput[destPointer]
                if x[1].to_i < y[1].to_i #current time is less than the time in the line => insert before it
                    sortedOutput.insert(destPointer, x)
                    inserted = true
                elsif x[1].to_i > y[1].to_i #current time is more than the time in the line => move to next
                    destPointer+=1
                elsif x[1].to_i == y[1].to_i #current time is equal to the the time in the line => insert before if x[0] is < y[0], else move to next
                    if x[0].to_i < y[0].to_i
                        sortedOutput.insert(destPointer, x)
                        inserted = true
                    else
                        destPointer += 1
                    end
                end
            end
            if !inserted #i.e. traversed to the end and not put in
                sortedOutput.push x
            end
        end
        srcPointer +=1
    end
    
    outputStr = ""
    i = 0
    while i < sortedOutput.length
        if i == 0
            outputStr = sortedOutput[i][0].to_s
        else
            outputStr = outputStr + " " + sortedOutput[i][0].to_s
        end
        i+=1
        
    end
    
    puts outputStr
end



fileName = "testcase1.txt"
n = 0
arrayFans = Array.new
File.open(fileName, "r") do |f|
    n = f.readline.chomp.to_i
    f.each_line do |line|
        arrayFans.push line.chomp.split(" ")
    end
end
orderOfOrders(n, arrayFans)