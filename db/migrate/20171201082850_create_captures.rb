class CreateCaptures < ActiveRecord::Migration[5.1]
  def change
    create_table :captures do |t|
      t.string :name
      t.string :imgurl
      t.references :url, foreign_key: true

      t.timestamps
    end
  end
end
