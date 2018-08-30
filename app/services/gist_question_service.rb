# frozen_string_literal: true

class GistQuestionService
  attr_reader :responce

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @responce = @client.create_gist(gist_params)
  end

  def success?
    @responce&.html_url.present?
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end

  def gist_params
    {
      description: I18n.t('gist.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body, *@question.answers.pluck(:title)].join("\n")
  end
end
