# frozen_string_literal: true

module TestPassagesHelper
  def result_message(test_passage)
    message = if test_passage.success?
                { css_class: 'pass_test', text: "You pass test with #{test_passage.points}% correct questions" }
              else
                { css_class: 'fail_test', text: "You failed test with #{test_passage.points}% correct questions" }
    end

    content_tag(:p, class: message[:css_class]) do
      message[:text]
    end
  end

  def progress_bar(test_passage)
    "Вопрос №#{test_passage.current_question_number} из #{test_passage.questions_count}"
  end

  def current_percent_test_passage(test_passage)
    (test_passage.current_question_number - 1) * 100 / test_passage.questions_count
  end

  def timer(test_passage)
    html =[]
    if @test_passage.test.timer_exists?
      content_tag :p do
        html << "Осталось времени на выполнение: "
        html << content_tag(:span, test_passage.time_left, class: 'timer', data: { timer: test_passage.time_left })
        safe_join(html)
      end
    end
  end
end
