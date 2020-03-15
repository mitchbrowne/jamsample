class CreateSamples < ActiveRecord::Migration[5.2]
  def change
    create_table :samples do |t|
      t.text :title
      t.text :audio_file
      t.text :image
      t.text :type
      t.integer :collection_id

      t.timestamps
    end
  end
end
