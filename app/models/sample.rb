class Sample < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :collection, :optional => true
  has_and_belongs_to_many :genres
end
