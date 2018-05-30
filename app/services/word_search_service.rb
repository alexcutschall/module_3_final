class WordSearchService
  def initialize(word)
    @word = word
  end

  def raw_information
    parsed_request
  end

  private
  attr_reader :word

  def connection
    Faraday.new(ENV['BASE_URL'])
  end

  def request
    response = connection.get do |req|
      req.url "/api/v1/inflections/en/#{word}"
      req.headers['app_id'] = ENV['ID']
      req.headers['app_key'] = ENV['API_KEY']
    end
    response.body
  end

  def parsed_request
    JSON.parse(request, symbolize_names: true)
  end
end
