class M5E1

  NOTICIAS = "09:55 - [política] Prefeito da Krakosia é eleito o melhor para economia\n" +
                      "10:14 - [cotidiano] Cachorro salva dono de assalto\n" +
                      "11:01 - [esporte] Seleção local de golfe se classifica para mundial\n" +
                      "11:36 - [esporte] João da Silva Sauro é cortado da seleção de golfe\n" +
                      "13:19 - [economia] Desemprego sobe para 12% no último mês\n" +
                      "14:55 - [política] Lei de incentivo ao esporte é aprovada no senado às 10:20\n" +
                      "16:13 - [economia] Cotação do dólar sobe 5% em uma semana\n" +
                      "19:26 - [esporte] Liga nacional de basquete tem recorde de público"

  def format_news

    NOTICIAS.each_line do |line|

        @formated_line = line.match(/(\d{2}:\d{2}) - \[(\p{Alpha}+)\] ([\p{Alpha}\s]+)/)


        puts @formated_line[2] + ":" + " " + @formated_line[3] + " " + "(" + @formated_line[1] + ")"    

    end 
  end

  def find_economy_dollar_news 

    dollars = NOTICIAS.scan(/\[economia\] [\w\s\p{Alpha}]* dólar/)

    puts "existem" + dollars.length + " notícia(s) sobre o dólar"

  end  

  def find_times 

    i = 0 

     times = [NOTICIAS.scan(/(\d{2}:\d{2})/)] 

    while times[i] != nil
    
      puts times[i]

      i+=1

    end
  
  end

end