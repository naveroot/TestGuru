# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found

  def index
    @questions = @test.questions
  end

  def show; end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.test = @test
    @question.save
    redirect_to test_questions_path(@question.test)
  end


  def destroy
    @question.destroy!
    redirect_to test_questions_path(@question.test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_from_question_not_found
    render plain: 'Question not found'
  end
end
