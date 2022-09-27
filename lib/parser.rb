require 'nokogiri'
require 'open-uri'

require_relative 'film'

module Parser
  IMDB_TOP_LIST = 'https://www.imdb.com/chart/top/'.freeze

  def self.from_imdb
    Nokogiri::HTML(URI.open(IMDB_TOP_LIST, &:read)).css('td.titleColumn').map do |movie_link|
      Film.new(
        title: movie_link.at('a').text,
        director: movie_link.at('a').attr('title').split(' (')[0],
        year: movie_link.at('span').content.delete('()')
      )
    end
  end
end
