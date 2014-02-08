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

  def get_data
  end

  def find
  end
end
