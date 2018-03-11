class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha1
      t.string :author
      t.date :date
      t.string :comment

      t.timestamps null: false
    end
  end
end
