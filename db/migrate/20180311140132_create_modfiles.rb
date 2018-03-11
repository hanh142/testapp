class CreateModfiles < ActiveRecord::Migration
  def change
    create_table :modfiles do |t|
      t.string :modfile
      t.string :sha1
      t.string :file

      t.timestamps null: false
    end
  end
end
