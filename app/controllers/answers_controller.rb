# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :find_question, only: %i[new create]
  before_action :find_answer, only: %i[show edit update destroy]

  def show; end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @answer, notice: 'done'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @answer.update
      redirect_to @answer, notice: 'done'
    else
      render :new
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:title, :correct)
  end
end
