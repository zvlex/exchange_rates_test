class ExchangeRatesParser
  class << self

    def ecb(xml_data)
      result = {}

      xml = Nokogiri::XML(xml_data)

      doc = xml.xpath('gesmes:Envelope/xmlns:Cube/xmlns:Cube//xmlns:Cube').map(&:to_h)

      doc.each do |el|
        result[ el["currency"] ] = el["rate"]
      end

      result
    end

    def open_exchange_rates(data)
      data
    end

    def appspot(data)
      data
    end
  end
end
