class Word < ApplicationRecord
  validates :text, presence: true
end