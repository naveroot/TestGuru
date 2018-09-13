# frozen_string_literal: true

class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
    @test_passage = test_passage
    @test = test_passage.test
  end

  def call
    badge_list = []
    Badge.all.each do |badge|
      badge_list << badge if send("#{badge.rule}_pass?", badge.rule_param)
    end
    badge_list
  end

  private

  def first_try_pass?(_args)
    @test_passage.success? && TestPassage.where(user_id: @user.id, test_id: @test.id).count < 2
  end

  def all_tests_in_level_pass?(level)
    tests_in_level_ids(level) - success_user_tests_ids &&
      !success_user_tests_ids.empty?
  end

  def all_tests_in_category_pass?(title)
    tests_by_category_ids(title) == success_user_tests_ids &&
      !success_user_tests_ids.empty?
  end

  def success_user_tests_ids
    TestPassage.by_user(@user).success.map(&:test).map(&:id).sort
  end

  def tests_by_category_ids(category_title)
    Test.by_category(category_title).ids.sort
  end

  def tests_in_level_ids(level)
    Test.by_level(level).ids.sort
  end
end
