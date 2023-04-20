class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :description
      t.string :total_post
      t.string :ctc

      t.timestamps
    end
  end
end
