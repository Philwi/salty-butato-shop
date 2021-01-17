class CreateColorTable < ActiveRecord::Migration[6.0]
  def down
    drop_table :color_tables
  end

  def up
    create_table :color_tables do |t|
      t.string :colorname, null: false
      t.string :hex, null: false
      t.timestamps
    end

    ::Printful::Util::Helper.create_colors_from_constant
  end
end
