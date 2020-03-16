class CreateSamples < ActiveRecord::Migration[5.2]
  def change
    create_table :samples do |t|
      t.text :title
      t.text :audio_file
      t.text :image, :default => 'https://st.depositphotos.com/1742172/2007/v/950/depositphotos_20077185-stock-illustration-cartoon-music-note.jpg'
      t.text :sample_type
      t.integer :collection_id

      t.timestamps
    end
  end
end
