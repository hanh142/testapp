class CreateCommitComments < ActiveRecord::Migration
  def change
    create_table :commit_comments do |t|
      t.string :sha1
      t.string :author
      t.date :commit_date
      t.string :comment

      t.timestamps null: false
    end
  end
end
