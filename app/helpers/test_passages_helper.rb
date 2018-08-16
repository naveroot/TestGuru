module TestPassagesHelper
  def result_message(test_passage)
    if test_passage.success?
      { css_class: 'pass_test', text: "You pass test with #{test_passage.points}% correct questions" }
    else
      { css_class: 'fail_test', text: "You failed test with #{test_passage.points}% correct questions" }
    end
  end

  def progress_bar(test_passage)
    "Вопрос №#{ test_passage.current_question_number } из #{ test_passage.questions_count }"
  end
end
