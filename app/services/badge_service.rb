class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @category = @test.category
  end

  def call
    badges = Badge.all
    badges.each do |badge|
      get_bage(badge, @user)
    end
  end

  private

  def get_bage(badge, user)
    case badge.rule
    when 'first_try'
      condition = @test_passage.success? && TestPassage.where(user_id: @user.id, test_id: @test.id).count < 2
    when 'all_tests_in_category'
      condition = all_test_in_category_pass?(badge.category)
    when 'all_tests_in_level'
      condition = all_test_in_level_pass?(badge.level)
    end
    UserBadge.create(user_id: user.id, badge_id: badge.id) if !!condition
  end

  def first_try_success?
    @test_passage.success? && TestPassage.where(user_id: @user.id, test_id: @test.id).count < 2
  end

  def all_test_in_level_pass?(level)
    (tests_in_level(level) - success_user_tests(@user)).empty? && !success_user_tests(@user).empty?
  end

  def all_test_in_category_pass?(category_title)
    (tests_in_category(category_title) - success_user_tests(@user)).empty? && !success_user_tests(@user).empty?
  end

  def success_user_tests(user)
    TestPassage.by_user(user).success.map(&:test)
  end

  def tests_in_category(category_title)
    Test.by_category(category_title).to_a
  end

  def tests_in_level(level)
    Test.by_level(level).to_a
  end

  # def get_badge(rule)
  #   badge = Badge.find_by rule: rule
  #   UserBadge.create user_id: @user.id, badge_id: badge.id
  # end
end