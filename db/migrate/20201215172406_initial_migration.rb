class InitialMigration < ActiveRecord::Migration[6.1]
  def change

    create_table :words do |t|
      t.string :text, null: false
      t.timestamps
    end

    create_table :enemies do |t|
      t.string :name, null: false
      t.integer :hp, null: false
      t.timestamps
    end

  end
end
