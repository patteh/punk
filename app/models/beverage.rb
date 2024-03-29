class Beverage
  PUNK_API_BASE_URL = 'https://api.punkapi.com/v2/'.freeze
  PER_PAGE = 10

  def initialize(params:)
    @params = params
  end

  def sought_beer
    return if id.blank?

    response = Faraday.get(sought_beer_url)
    return if response.status != 200

    JSON.parse(response.body).first
  end

  def sought_beers
    return if query.blank?

    response = Faraday.get(sought_beers_url)
    return if response.status != 200

    JSON.parse(response.body)
  end

  private

  attr_reader :params

  def sought_beer_url
    "#{PUNK_API_BASE_URL}beers/#{id}"
  end

  def sought_beers_url
    "#{PUNK_API_BASE_URL}beers?beer_name=#{query}&page=#{page}&per_page=#{PER_PAGE}"
  end

  def id
    params[:id]
  end

  def query
    params[:query]
  end

  def page
    params[:page] || 1
  end
end
