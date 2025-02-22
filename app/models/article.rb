class Article < ApplicationRecord
  include HTTParty

  def self.search(query)
    base_url = "https://en.wikipedia.org/w/api.php"
    response = HTTParty.get(base_url, query: {
      action: 'query',
      format: 'json',
      list: 'search',
      srsearch: query,
      utf8: 1,
      srlimit: 10
    })
    
    response['query']['search']
  end

  def self.get_details(title)
    base_url = "https://en.wikipedia.org/w/api.php"
    response = HTTParty.get(base_url, query: {
      action: 'query',
      format: 'json',
      titles: title,
      prop: 'extracts|pageimages',
      exintro: true,
      explaintext: true,
      piprop: 'original'
    })

    response['query']['pages'].values.first
  end
end