# frozen_string_literal: true

class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '84645d474f0335e585dad94a87217f4395a9b23b'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gits', params) do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new url: ROOT_ENDPOINT
  end
end
