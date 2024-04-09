class Configuration < ApplicationRecord
  validates :singleton_guard, uniqueness: true, if: -> { singleton_guard }
  has_one_attached :image

  def self.instance
    Configuration.first || Configuration.create(singleton_guard: true)
  end
end
