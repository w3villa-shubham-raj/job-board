class AddActiveToJob < ActiveRecord::Migration[7.0]
 def change
    add_column :jobs, :active, :boolean, default: true
  end
end
