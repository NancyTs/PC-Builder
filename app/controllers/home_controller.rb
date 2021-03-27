class HomeController < ApplicationController
  def index
  end

  def about
  end


  def search
    parts = find_part(params[:part])

    unless parts
      flash[:notice] = 'Part not found'
      return render action: :index
    end

    @part = parts['items']
  end

  private

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

    JSON.parse(response.body)
  end

end
