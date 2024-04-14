# frozen_string_literal: true

class Person < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :document_number, presence: true
  validates :birth_date, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true

  has_many :attendances

  def to_s
    "#{first_name} #{last_name} - #{document_number}"
  end
end
