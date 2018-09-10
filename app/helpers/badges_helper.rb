module BadgesHelper
  def bage_card_parametrs(badge)
    html = []
    content_tag :p, class: "card-text" do
      html << content_tag(:div, "Rule: #{badge.rule}")
      if badge.rule == 'all_tests_in_category' && badge.category.present?
        html << content_tag(:div, "Category: #{badge.category.title}")
        end
      html << content_tag(:div, "Level: #{badge.level}") if badge.rule == 'all_tests_in_level'
      safe_join(html)
    end
  end
end
