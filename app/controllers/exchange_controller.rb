require 'net/http'
require 'uri'
require 'nokogiri'

class ExchangeController < ApplicationController
  def index
    if params[:xml_code]
      response = Net::HTTP.get(URI.parse("http://www.nbp.pl/kursy/xml/#{params[:xml_code]}.xml"))
    else
      response = Net::HTTP.get(URI.parse("http://www.nbp.pl/kursy/xml/LastC.xml"))
    end
    responseXML = Nokogiri::XML(response)

    @exchangeDate = responseXML.xpath('//tabela_kursow/data_publikacji').text

    @exchangeArray = responseXML.xpath('//tabela_kursow/pozycja').map do |i|
      {'nazwa_waluty' => i.xpath('nazwa_waluty').text,
       'kod_waluty' => i.xpath('kod_waluty').text,
       'kurs_kupna' => i.xpath('kurs_kupna').text,
       'kurs_sprzedazy' => i.xpath('kurs_sprzedazy').text}
    end

    if params[:search]
      if params[:search]["whole_word"] == '1'
        @exchangeArray = @exchangeArray.select{ |i| i["nazwa_waluty"] == params[:search]["text"] ||
            i["kod_waluty"] == params[:search]["text"]}
      else
        @exchangeArray = @exchangeArray.select{ |i| i["nazwa_waluty"].include?(params[:search]["text"]) ||
            i["kod_waluty"].include?(params[:search]["text"])}
      end

    end

    puts 'index'

  end

  def exchange_date
    xml_codes = Net::HTTP.get(URI.parse("http://www.nbp.pl/kursy/xml/dir.txt"))
    xml_codes_array = xml_codes.split(/\r\n/)
    date_str = params[:exchange_date]["date"]
    date = Date.strptime(date_str, "%d-%m-%Y").strftime("%y%m%d")

    xml_code = "lastC"

    xml_codes_array.each do |r|
      if r.include? date
        xml_code = r
        break
      end
    end

    redirect_to :action => "index", :xml_code => xml_code
  end

  def find
    puts 'OK'
  end
end
