class SigninController < ApplicationController
  def signin
    @signins = Signin.limit(20).order(time: :desc)

  end
  def create
    @signins = Signin.limit(20).order(time: :desc)
    @person = Person.find_by(document_number: params[:documento])
    if @person
      @signin_type = Signin.where(person_id: @person.id, time: Date.today.beginning_of_day..Date.today.end_of_day).count % 2 == 0 ? 'Entrada' : 'Salida'
      @signin = Signin.new(person_id: @person.id, signin_type: @signin_type, time: Time.now)
      # flash[:success] = "Se ha registrado la #{@signin_type} con éxito."
      # redirect_to signin_signin_path
    else
      flash[:error] = "No se encontró la persona con el número de documento proporcionado. le pedimos que se registre en el botón de verde de registrarme."
      #redirect_to signin_signin_path
    end

    respond_to do |format|
      if @signin && @signin.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@signin, partial: "signins/signin", locals: { signin: @signin }) }
        flash[:success] = "Se ha registrado la #{@signin_type} con éxito."

      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@signin, partial: "signins/form", locals: { signin: @signin }) }
        flash[:error] = "No se encontró la persona con el número de documento proporcionado. le pedimos que se registre en el botón de verde de registrarme."
      end
      format.html { redirect_to signin_signin_path, notice: "Signin was successfully created." }
    end

  end
end
