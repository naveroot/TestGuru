# frozen_string_literal: true

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
      get_badge(badge, @user)
    end
  end

  private

  def get_badge(badge, user)
    case badge.rule
    when 'first_try'
      condition = @test_passage.success? && TestPassage.where(user_id: @user.id, test_id: @test.id).count < 2
    when 'all_tests_in_category'
      condition = all_test_in_category_pass?(badge)
    when 'all_tests_in_level'
      condition = all_test_in_level_pass?(badge)
    end
    UserBadge.create(user_id: user.id, badge_id: badge.id) if !!condition
  end

  def first_try_success?
    @test_passage.success? && TestPassage.where(user_id: @user.id, test_id: @test.id).count < 2
  end

  def all_test_in_level_pass?(badge)
    (tests_in_level(badge.level) - success_user_tests(@user)).empty? &&
      !success_user_tests(@user).empty? &&
      !@user.has_badge?(badge)
  end

  def all_test_in_category_pass?(badge)
    (tests_in_category(badge.category.title) - success_user_tests(@user)).empty? &&
      !success_user_tests(@user).empty? &&
      !@user.has_badge?(badge)
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
