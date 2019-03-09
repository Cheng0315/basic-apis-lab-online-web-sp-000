class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = Iv1.8b5c60b5e7060cde
      req.params['client_secret'] = 0acf28d9c3267c7386ec2f5742f470ee598a2f8c
      req.params['query'] = 'tetris'
    end
  end
end
