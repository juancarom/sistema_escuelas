# frozen_string_literal: true

class Signin < ApplicationRecord
  belongs_to :person

  def self.signin_types
    %w[Entrada Salida]
  end

  validates :signin_type, presence: true, inclusion: { in: signin_types }
  validates :time, presence: true

  def to_s
    "#{person} - #{signin_type} - #{time}"
  end
end
