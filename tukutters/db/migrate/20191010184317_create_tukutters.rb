class CreateTukutters < ActiveRecord::Migration[5.2]
  def change
    create_table :tukutters do |t|
      t.text :content

      t.timestamps
    end
  end
end
