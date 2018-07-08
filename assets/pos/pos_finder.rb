def pos_finder(array)
    pos = []
    array.each do |tile|
        aux = 0
        tile.each do |coord|
            if aux == 0
                @rst = coord
            else
                @rst = @rst + (coord*320)
                pos << @rst
            end
            aux += 1
        end
    end
    
    file = File.open("pos.txt", "w+")
    file.write(pos)
    file.close()
end

array = [[141,93],[141,124]]

pos_finder(array)