# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_408_175_500) do
  create_table 'attendances', charset: 'utf8', force: :cascade do |t|
    t.bigint 'person_id', null: false
    t.string 'type'
    t.datetime 'time'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['person_id'], name: 'index_attendances_on_person_id'
  end

  create_table 'labor_license_types', charset: 'utf8', force: :cascade do |t|
    t.string 'name'
    t.string 'abreviation'
    t.boolean 'with_salary'
    t.boolean 'continuous_days'
    t.integer 'limit'
    t.integer 'year_limit'
    t.integer 'month_limit'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'labor_licenses', charset: 'utf8', force: :cascade do |t|
    t.bigint 'person_id', null: false
    t.bigint 'labor_license_type_id', null: false
    t.date 'date_from'
    t.date 'date_to'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['labor_license_type_id'], name: 'index_labor_licenses_on_labor_license_type_id'
    t.index ['person_id'], name: 'index_labor_licenses_on_person_id'
  end

  create_table 'people', charset: 'utf8', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'document_type'
    t.integer 'document_number'
    t.date 'birth_date'
    t.string 'phone_number'
    t.string 'email'
    t.string 'address'
    t.string 'city'
    t.string 'state'
    t.string 'zip_code'
    t.string 'country'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_people_on_user_id'
  end

  create_table 'roles', charset: 'utf8', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'roles_users', charset: 'utf8', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'role_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['role_id'], name: 'index_roles_users_on_role_id'
    t.index ['user_id'], name: 'index_roles_users_on_user_id'
  end

  create_table 'signins', charset: 'utf8', force: :cascade do |t|
    t.bigint 'person_id', null: false
    t.string 'type'
    t.datetime 'time'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['person_id'], name: 'index_signins_on_person_id'
  end

  create_table 'users', charset: 'utf8', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'attendances', 'people'
  add_foreign_key 'labor_licenses', 'labor_license_types'
  add_foreign_key 'labor_licenses', 'people'
  add_foreign_key 'people', 'users'
  add_foreign_key 'roles_users', 'roles'
  add_foreign_key 'roles_users', 'users'
  add_foreign_key 'signins', 'people'
end
