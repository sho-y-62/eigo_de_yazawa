class Lesson < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers
  has_many :choices, through: :answers

  def next_word
    (category.words - words).first
  end
end
