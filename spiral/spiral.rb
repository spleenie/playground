def spiral(numRow,numCol,arrayA)
    
    #arrayA = Array.new
    #arrayA = input.split("\n")
    
    maxRow = numRow.to_i - 1
    maxCol = numCol.to_i - 1
    minRow = 0
    minCol = 0
    output = ""
    
    
    
    while (minCol <= maxCol  && minRow <= maxRow)
        
        col = minCol
        
        while col <= maxCol
            output.concat (arrayA[minRow][col].to_s)
            col+=1
        end
         
        minRow += 1
        row = minRow
       
        while row <= maxRow
            output.concat (arrayA[row][maxCol].to_s)
            row+=1 
        end
        
        maxCol-=1
        col = maxCol
        
        while col >= minCol && maxRow >= minRow
            output.concat(arrayA[maxRow][col].to_s)
            col-=1
        end
        
        maxRow -= 1
        row = maxRow
       
        while row >= minRow && maxCol >= minCol
            output.concat(arrayA[row][minCol].to_s)
            row-=1
        end
        minCol+=1
    end
    
    puts output

end

fileName = "spiral_testcase_5x1.txt"
x = 0
y = 0
arrayN = Array.new
arrayX = Array.new
File.open(fileName, "r") do |f|
  arrayN = f.readline.chomp.split(",")
  x = arrayN[0]
  y = arrayN[1]
  f.each_line do |line|
    tempArray = line.chomp.split(",")
    arrayX.push tempArray
  end
end

puts "Input:"
arrayX.each do |element|
    puts "#{element}"
end
    
puts "Output:"

#input = "1234\n3456\n8902\nasde"
spiral(x,y,arrayX)

