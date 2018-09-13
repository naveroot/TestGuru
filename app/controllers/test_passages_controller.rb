# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      badges = BadgeService.new(@test_passage).call
      add_badges_to_user(badges)
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    gist_request = GistQuestionService.new(@test_passage.current_question)
    gist_request.call
    if gist_request.success?
      current_user.gists.create(question_id: @test_passage.current_question_id, link_hash: gist_request.response.id)
      flash[:notice] = t('gist.success', link: view_context.link_to('Gist', gist_request.response.html_url))
    else
      flash[:alert] = t('gist.failure')
    end

    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def add_badges_to_user(badges)
    badges.each { |badge| current_user.badges << badge }
  end
end
