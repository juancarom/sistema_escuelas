# frozen_string_literal: true

json.extract! person, :id, :first_name, :last_name, :document_type, :document_number, :birth_date, :phone_number,
              :email, :address, :city, :state, :zip_code, :country, :user_id, :created_at, :updated_at
json.url person_url(person, format: :json)
