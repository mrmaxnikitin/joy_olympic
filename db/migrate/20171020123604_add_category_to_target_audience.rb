class AddCategoryToTargetAudience < ActiveRecord::Migration
  def change
  	add_column :contests, :targetAudience, :string
  end
end
