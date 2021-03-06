class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title       , null: false
      t.text       :text        , null: false
      t.integer    :price       , null: false
      t.integer    :genre_id    , null: false
      t.integer    :state_id    , null: false
      t.integer    :burden_id   , null: false
      t.integer    :area_id     , null: false
      t.integer    :day_id      , null: false
      t.references :user        , foreign_key: true
      t.timestamps
    end
  end
end
