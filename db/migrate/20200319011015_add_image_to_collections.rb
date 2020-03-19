class AddImageToCollections < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :image, :text, :default => 'https://previews.123rf.com/images/vladwel/vladwel1605/vladwel160500181/57404563-vinyl-record-vector-icon-compact-cd-disk-dvd-disc-gramophone-record-symbol-rotating-record-disc-flat.jpg'
  end
end
