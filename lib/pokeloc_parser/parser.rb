require 'nokogiri'
require 'open-uri'

module PokelocParser
  def get(id:)
    Parser.new(id: id).parse
  end
  module_function :get

  class Parser
    def initialize(id:)
      @id = id
      @result = Result.new
    end

    def parse
      uri = "http://blsetup.city.kyoto.jp/blsp/show.php?sid=#{@id}"
      doc = Nokogiri::HTML(URI.open(uri))
      @result.station = doc.at_css('h1').content
      @result.got_at = doc.at_css('.bls-disp-time').content
      5.times do |i| # ポケロケの行き先設定できる系統は現在最高5つまで。
        div = doc.at_css("#ch#{i+1}")
        break if div.nil?

        approaching = get_alt(div.at_css('.bls-ap-img'))
        number = get_alt(div.at_css('.bls-keito-num-img'))
        destination = div.at_css('.bls-dest').content
        statuses = div.css('.busimg').map(&method(:get_alt))
        @result.numbers << NumberResult.new(approaching: approaching,
                                            number: number,
                                            destination: destination,
                                            statuses: statuses,
                                           )
      end
      @result
    end

    private

    def get_alt(leaf)
      leaf.attributes['alt'].content
    end
  end

  class Result
    attr_accessor :station, :got_at, :numbers
    def initialize
      @numbers = []
    end
  end

  class NumberResult
    attr_accessor :approaching, :number, :destination, :statuses
    def initialize(approaching:, number:, destination:, statuses:)
      @approaching = approaching
      @number = number
      @destination = destination
      @statuses = statuses
    end
  end
end
