class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :choices

  validates :content, presence: true, length: { maximum: 200}
  validate :one_is_correct

  def correct_choice
    choices.find_by(is_correct: true)
  end

  private
  def one_is_correct
    if choices.select{ |choice| choice.is_correct }.count != 1
      errors.add :base, "Must have one correct choice"
    end
  end
end
