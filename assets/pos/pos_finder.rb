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

array = [[153,194], [191,171], [229,148], [267,125], [153,171], [191,148],
        [229,125], [267,102], [115,171], [153,148], [191,125], [229,102],
        [155,148], [153,125], [191,102], [229,79], [77,148], [115,125], [153,102],
        [191,79], [77,125], [115,102], [153,79], [191,56], [39,125], [77,102],
        [115,79], [153,56], [39,102], [77,79], [115,56], [153,33]]

pos_finder(array)