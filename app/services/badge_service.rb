class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @category = @test.category
  end

  def call
    get_badge('first_try') if @test_passage.success? && TestPassage.where(user_id: @user.id, test_id: @test.id).count < 2
    get_badge('all_tests_in_category') if all_test_in_category_pass?
    get_badge('all_tests_in_level') if all_test_in_level_pass?
  end

  private

  def all_test_in_level_pass?
    (tests_in_level(@test.level) - success_user_tests(@user)).empty? && !success_user_tests(@user).empty?
  end

  def all_test_in_category_pass?
    (tests_in_category(@test.category.title) - success_user_tests(@user)).empty? && !success_user_tests(@user).empty?
  end

  def success_user_tests(user)
    TestPassage.by_user(@user).success.map(&:test)
  end

  def tests_in_category(category_title)
    Test.by_category(category_title).to_a
  end

  def tests_in_level(level)
    Test.by_level(level).to_a
  end

  def get_badge(rule)
    badge = Badge.find_by rule: rule
    UserBadge.create user_id: @user.id, badge_id: badge.id
  end
end