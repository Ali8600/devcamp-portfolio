class Topic < ApplicationRecord
  validates_presence_of :title, presence: true
  has_many :blog
end
