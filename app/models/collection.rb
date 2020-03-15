class Collection < ApplicationRecord
  belongs_to :user, :optional => true
  has_many :samples
  has_many :genres, :through => :samples
end
