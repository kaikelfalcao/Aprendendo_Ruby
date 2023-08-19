def stock_picker(precos)
    melhor_dia_compra = melhor_dia_venda = 0
    maximo_lucro = 0
    minimo_preco = Float::INFINITY

    precos.each_with_index do |preco, dia|
        if preco < minimo_preco
            minimo_preco = preco
        elsif preco - minimo_preco > maximo_lucro
            maximo_lucro = preco - minimo_preco
            melhor_dia_compra = minimo_preco
            melhor_dia_venda = preco 
        end
    end

    dia_compra = precos.index(melhor_dia_compra)
    dia_venda = precos.index(melhor_dia_venda)

    [dia_compra,dia_venda]
end

puts stock_picker([17,3,6,9,15,8,6,1,10])