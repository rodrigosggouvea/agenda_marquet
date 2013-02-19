#encoding: utf-8
require 'contact_us_mailer'
class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
  	@consultas = Consulta.all
  	if params[:month].blank?
	  	@hoje = Date.today
	  else
	  	dia = params[:month].split("-")[2].to_i
	  	mes = params[:month].split("-")[1].to_i
	  	ano = params[:month].split("-")[0].to_i
	  	@hoje = Date.new(ano,mes,dia)
	  end
  end

  def convenios
  end

  def contato
  end

  def mandar_email
  	user_info = params[:user_info]
    if ContactUsMailer.send_email(user_info).deliver
      flash[:notice] = "Mensagem enviada."
    else
      flash[:notice] = "Oops. Sua mensagem não pôde ser enviada."
    end
    redirect_to contact_url
  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # Overwriting the sign_up redirect path method
  def after_sign_up_path_for(resource_or_scope)
    root_path
  end

  # Overwriting the sign_up redirect path method
  def after_sign_in_path_for(resource_or_scope)
    root_path
  end
end
