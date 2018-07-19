# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: :destroy
  # before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found
  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
    @test = Test.first
  end

  def create
    Question.create! question_params
    redirect_to '/tests/1/questions'
  end

  def destroy
    @question.destroy!
    redirect_to '/tests/1/questions'
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  # def find_test
  #   @test = Test.find params[:id]
  # end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_from_question_not_found
    render plain: 'Question not found'
  end

end
