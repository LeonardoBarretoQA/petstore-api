Dado('que eu acesse a rota {string} e faço um envio') do |rota|
    @header = { "Content-type" => "aplication/json" }
    
    @corpo = {
        "id": 56,
        "petId": 0,
        "quantity": 0,
        "shipDate": "2022-11-15T14:54:05.173Z",
        "status": "placed",
        "complete": true
    }.to_hash
    
    @response = HTTParty.post(
        "https://petstore.swagger.io/v2/#{rota}",
        :headers => @header,
        :body => @corpo.to_json
    )
        @resposta = @response.parsed_response
    
    puts @response.class
    puts @resposta.class
    end


Entao('devo receber as informaçoes do envio') do
   expect(@resposta["id"]).to eql @corpo[:id]
end

Entao('o status code deve ser {string}') do |code|
    expect(@response.code).to eql code.to_i
end
