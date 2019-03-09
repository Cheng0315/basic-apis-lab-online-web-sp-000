class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.8b5c60b5e7060cde'
      req.params['client_secret'] = '0acf28d9c3267c7386ec2f5742f470ee598a2f8c'
      req.params['query'] = 'tetris'
    end

    body_hash = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["response"]
    else
      @error = body["meta"]["errorDetail"]
    end
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end

end
