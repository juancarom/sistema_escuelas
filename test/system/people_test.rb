# frozen_string_literal: true

require 'application_system_test_case'

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test 'visiting the index' do
    visit people_url
    assert_selector 'h1', text: 'People'
  end

  test 'should create person' do
    visit people_url
    click_on 'New person'

    fill_in 'Address', with: @person.address
    fill_in 'Birth date', with: @person.birth_date
    fill_in 'City', with: @person.city
    fill_in 'Country', with: @person.country
    fill_in 'Document number', with: @person.document_number
    fill_in 'Document type', with: @person.document_type
    fill_in 'Email', with: @person.email
    fill_in 'First name', with: @person.first_name
    fill_in 'Last name', with: @person.last_name
    fill_in 'Phone number', with: @person.phone_number
    fill_in 'State', with: @person.state
    fill_in 'User', with: @person.user_id
    fill_in 'Zip code', with: @person.zip_code
    click_on 'Create Person'

    assert_text 'Person was successfully created'
    click_on 'Back'
  end

  test 'should update Person' do
    visit person_url(@person)
    click_on 'Edit this person', match: :first

    fill_in 'Address', with: @person.address
    fill_in 'Birth date', with: @person.birth_date
    fill_in 'City', with: @person.city
    fill_in 'Country', with: @person.country
    fill_in 'Document number', with: @person.document_number
    fill_in 'Document type', with: @person.document_type
    fill_in 'Email', with: @person.email
    fill_in 'First name', with: @person.first_name
    fill_in 'Last name', with: @person.last_name
    fill_in 'Phone number', with: @person.phone_number
    fill_in 'State', with: @person.state
    fill_in 'User', with: @person.user_id
    fill_in 'Zip code', with: @person.zip_code
    click_on 'Update Person'

    assert_text 'Person was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Person' do
    visit person_url(@person)
    click_on 'Destroy this person', match: :first

    assert_text 'Person was successfully destroyed'
  end
end
