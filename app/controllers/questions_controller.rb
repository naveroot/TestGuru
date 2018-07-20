# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show]
  before_action :find_test, only: %i[index destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found
  def index
    @questions = @test.questions
  end

  def show; end

  def new
    @question = Question.new
  end

  def create
    Question.create! question_params
    redirect_to test_questions(@test.id)
  end

  def destroy
    render plain 'Deleting...'
    @question.destroy!
    render plain 'Deleted'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_from_question_not_found
    render plain: 'Question not found'
  end
end
