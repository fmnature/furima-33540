class CreateInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :infos do |t|
      t.string     :post_num   , null: false
      t.integer    :area_id    , null: false
      t.string     :municipal  , null: false
      t.string     :address    , null: false
      t.string     :build_name , null: false
      t.string     :phone_num  , null: false
      t.references :order      , foreign_key: true

      t.timestamps
    end
  end
end
