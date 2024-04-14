# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :set_person, only: %i[show edit update destroy]

  # GET /people or /people.json
  def index
    @people = Person.all
  end

  # GET /people/1 or /people/1.json
  def show; end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit; end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to person_url(@person), notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_person_user
    @person = Person.new
  end

  def create_person_user
    @person = Person.new(person_params)
    @user = User.new(email: @person.email, password: @person.document_number.to_s, password_confirmation: @person.document_number.to_s)
    @user.save!
    @person.user = @user
    respond_to do |format|
      if @person.save
        flash[:success] = 'La nueva persona fue agregada al sistema correctamente'
        format.html { redirect_to signin_signin_path, notice: 'La nueva persona fue agregada al sistema correctamente' }
        format.json { render :show, status: :created, location: @person }
      else
        flash[:error] = 'Error al agregar la nueva persona al sistema'
        format.html { redirect_to signin_signin_path, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to person_url(@person), notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy!

    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def person_params
    params.require(:person).permit(:first_name, :last_name, :document_type, :document_number, :birth_date,
                                   :phone_number, :email, :address, :city, :state, :zip_code, :country, :user_id)
  end
end
