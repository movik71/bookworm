class Enemy < ApplicationRecord
  validates :name, presence: true
  validates :hp, presence: true
end