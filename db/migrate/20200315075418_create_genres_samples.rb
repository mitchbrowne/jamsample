class CreateGenresSamples < ActiveRecord::Migration[5.2]
  def change
    create_table :genres_samples, :id => false do |t|
      t.integer :genre_id
      t.integer :sample_id
    end
  end
end
