def justify(input, maxLineLen)
    arrayAll = Array.new
    arrayAll = input.split(" ")
    
    
    outputArray = Array.new
    outputArray[0] = ""
    
    x = 0
    line = 0
    while x < arrayAll.length
        word = arrayAll[x].to_s
        if word.length < maxLineLen
            if outputArray[line].to_s.length + word.length + 1 <= maxLineLen
                if outputArray[line].to_s.length <= 0
                    outputArray[line] = outputArray[line].to_s + word
                else
                    outputArray[line] = outputArray[line].to_s + " " + word
                end
            else
                x-=1
                line+=1
            end
        elsif word.length == maxLineLen
            outputArray[line] = word
        else
            outputArray[line] = word[0...maxLineLen]
            arrayAll[x] = word[maxLineLen..-1]
            x-=1
            #todo: if a word is longer or equal than the max line length, need to break into separate lines
        end
        x+=1
    end

    outputArray.each do |out|
        # puts out
        
        if out.to_s.length < maxLineLen
            lineArr = Array.new
            lineArr = out.to_s.split(" ")
            spacesNeeded = maxLineLen - out.to_s.length
            
            i = 0
            while spacesNeeded > 0
                if lineArr.length == 1
                    lineArr[i] = " " + lineArr[i]
                    spacesNeeded-=1
                else
                    if i == lineArr.length - 1 
                        i = 0
                    elsif i < lineArr.length - 1
                        lineArr[i] = lineArr[i] + " "
                        spacesNeeded-=1
                        i+=1
                    end
                end
            end
            
            newStr = ""
            i = 0
            while i < lineArr.length - 1
                newStr = newStr + lineArr[i].to_s + " "
                i+=1
            end
            newStr = newStr + lineArr.last.to_s
            
            puts "#{newStr}/#{newStr.length}"
            
        else
            puts "#{out} / #{out.length}"
        end
    end
    #puts "#{arrayAll}"
end

fileName = "testcase1.txt"
inputText = ""
File.open(fileName, "r") do |f|
    inputText = f.readline.chomp
end
justify(inputText, 30)