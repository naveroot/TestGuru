module TestPassagesHelper
  def result_message(result)
    if result < 85
      {css_class: 'fail_test', text: "You faliled test with #{result}% correct questions"}
    else
      {css_class: 'pass_test', text: "You pass test with #{result}% correct questions"}
    end
  end
end
