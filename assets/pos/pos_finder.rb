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

array = [[141,189], [179,166], [217,143], [255,120], [141,166], [179,143], [217,120],
        [255,97], [103,166], [141,143], [179,120], [217,97], [103,143], [141,120], [179,97],
        [217,74], [65,143], [103,120], [141,97], [179,74], [65,120], [103,97], [141,74], [179,51],
        [27,120], [65,97], [103,74], [141,51], [27,97], [65,74], [103,51], [141,28]]

pos_finder(array)