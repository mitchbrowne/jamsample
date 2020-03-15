class Sample < ApplicationRecord
  belongs_to :collection
  has_and_belongs_to_many :genres, :optional => true
end
