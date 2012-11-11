#encoding: utf-8
class ContactUsMailer < ActionMailer::Base

  attr_accessor :name, :email, :message

  default to: "clinicamarquet@hotmail.com",
          from: "clinicamarquet@hotmail.com"

  headers = {'Return-Path' => 'clinicamarquet@hotmail.com'}

  def send_email(user_info)
    @user_info = user_info
    mail(:to => "rodrigosggouvea@gmail.com", :subject => "Formulário de Contato da Minha Aplicação",)
  end
end