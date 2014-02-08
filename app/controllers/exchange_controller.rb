require 'net/http'
require 'uri'
require 'nokogiri'

class ExchangeController < ApplicationController
  def index
    response = Net::HTTP.get(URI.parse("http://www.nbp.pl/kursy/xml/LastC.xml"))
    responseXML = Nokogiri::XML(response)
    @exchangeArray = responseXML.xpath('//tabela_kursow/pozycja').map do |i|
      {'nazwa_waluty' => i.xpath('nazwa_waluty').text,
       'kod_waluty' => i.xpath('kod_waluty').text,
       'kurs_kupna' => i.xpath('kurs_kupna').text,
       'kurs_sprzedazy' => i.xpath('kurs_sprzedazy').text}
    end

  end

  def exchange_date
    xml_codes = Net::HTTP.get(URI.parse("http://www.nbp.pl/kursy/xml/dir.txt"))
    xml_codes_array = xml_codes.split(/\r\n/)
    date_str = params[:exchange_date]["date"]
    date = Date.strptime(date_str, "%d-%m-%Y")

    xml_code = "lastC"

    xml_codes_array.each do |r|
      if r.include? date.strftime("%y%m%d")
        xml_code = r
        break
      end
    end

    response = Net::HTTP.get(URI.parse("http://www.nbp.pl/kursy/xml/#{xml_code}.xml"))
    responseXML = Nokogiri::XML(response)
    @exchangeArray = responseXML.xpath('//tabela_kursow/pozycja').map do |i|
      {'nazwa_waluty' => i.xpath('nazwa_waluty').text,
       'kod_waluty' => i.xpath('kod_waluty').text,
       'kurs_kupna' => i.xpath('kurs_kupna').text,
       'kurs_sprzedazy' => i.xpath('kurs_sprzedazy').text}
    end

    puts 'working'
  end

  def find
  end
end
