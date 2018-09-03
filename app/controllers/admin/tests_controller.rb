# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show destroy edit update update_inline]
  before_action :find_tests, only: %i[index update_inline]
  before_action :find_gists, only: %i[index update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_test_not_found

  def index
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path(@test), notice: t('.success')
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.authored_tests.new(test_params)

    if @test.save
      redirect_to admin_tests_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def destroy
    @test.destroy!
    redirect_to admin_tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_tests
    @tests = Test.all
  end

  def find_gists
    @gists = Gist.all
  end

  def test_params
    params.require(:test).permit(:title, :category_id, :level)
  end

  def rescue_from_test_not_found
    render plain: 'Question not found'
  end
end
