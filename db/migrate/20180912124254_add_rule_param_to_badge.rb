class AddRuleParamToBadge < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :rule_param, :integer
  end
end
