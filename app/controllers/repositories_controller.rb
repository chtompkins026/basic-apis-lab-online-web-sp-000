class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    res = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'fb485c4d11bbd817efcb'
      req.params['client_secret'] = '30cd2d6589c1d57899f34520213b89824fd89cf8'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(res.body)
    @items = body["items"]
  render 'search'
  end
end
end
