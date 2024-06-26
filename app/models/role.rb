# frozen_string_literal: true

class Role < ApplicationRecord
  has_and_belongs_to_many :users
  validates :name, presence: true
  validates :name, uniqueness: true
end
