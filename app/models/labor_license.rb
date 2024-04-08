# frozen_string_literal: true

class LaborLicense < ApplicationRecord
  belongs_to :person
  belongs_to :labor_license_type
end
