class HomeController < ApplicationController

  def index
  end

  def about
  end

  def autocomplete
    response = find_part(params[:input],params[:type])
    parts = [response["items"]["title"]]

    render json: parts
  end

  def find_part(name, type)
    request_api(
      "https://api.apigenius.io/products/search?keyword=#{URI.encode(name)}&title=#{URI.encode(type)}"
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

    JSON.parse(response.body)
  end

end
