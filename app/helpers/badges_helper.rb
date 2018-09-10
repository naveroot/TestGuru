module BadgesHelper
  def bage_card_parametrs(badge)
    html = []
    content_tag :p, class: "card-text" do
      html << content_tag(:div, "Rule: #{badge.rule}")
      html << content_tag(:div, "Category: #{badge.category.title}") if badge.rule == 'all_tests_in_category'
      html << content_tag(:div, "Level: #{badge.level}") if badge.rule == 'all_tests_in_level'
      safe_join(html)
    end
  end
end
