class HomeController < ApplicationController

  require "json"

  def index
  end

  def about
  end

  def autocomplete

    file = File.open "response.json"
    response = JSON.load file
    #response = find_part(params[:input])
    puts params[:input]
    puts params[:type]

    parts = [response["items"]["title"]]
    #parts = response["items"].map { |i| i["title"] }

    render json: parts
  end

  def find_part(name)
    request_api(
      "https://api.apigenius.io/products/search?keyword=#{URI.encode(name)}"
    )
  end

  def request_api(url)
    response = Excon.get(
      url,
      headers: {
        'ApiGenius_API_Key' => ENV.fetch('ApiGenius_API_Key')
      }
    )

    return nil if response.status != 200

    response.body
  end

end
