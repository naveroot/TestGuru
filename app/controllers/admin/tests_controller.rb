class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_test_not_found

  def index
    @tests = Test.all
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

  def test_params
    params.require(:test).permit(:title, :category_id)
  end

  def rescue_from_test_not_found
    render plain: 'Question not found'
  end
end
