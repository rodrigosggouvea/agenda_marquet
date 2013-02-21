require 'date'
class Consulta < ActiveRecord::Base
	include ActiveModel::Validations
  attr_accessible :convenio_id, :cpf_paciente, :data, :nome_paciente, :cep_paciente, :endereco_paciente, :idade_paciente, :email_paciente, :codigo_carteirinha_paciente, :data_nascimento, :telefone
  belongs_to :convenio

  validates :convenio_id, :presence => true
  validates :data, :presence => true, :uniqueness => true
  validates :nome_paciente, :presence => true
  validates :data_nascimento, :presence => true, :format =>{:with => /\d{2}\/\d{2}\/\d{4}/}, :length => { :is => 10 }
  validates :cpf_paciente, :presence => true
  validates :telefone, :presence => true, :format =>{:with => /^\(\d{2,3}\)\d{4,5}-\d{4,5}$/}
  # validates :endereco_paciente, :presence => true
  # validates :idade_paciente, :presence => true
  # validates :email_paciente, :presence => true
  validates :codigo_carteirinha_paciente, :presence => true, :unless => "particular?"

  def self.horarios_disponiveis(data = Date.today)
  	array = []
    horarios = ["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00",
      "12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30"]
  	while array.count < 3 do
  		horarios.each do |horario|
  			datahora = DateTime.new(data.year.to_i, data.month.to_i, data.day.to_i, horario[0..1].to_i, horario[3..4].to_i)
  			if Consulta.where(:data => datahora) == [] # && datahora > DateTime.now && array.count < 5 && !datahora.sunday?
	  			array << [datahora.to_s[0..9],datahora.to_s[11..16]]
	  		end
  		end
			data = data.next_day
  	end
	  array
  end

  def self.proximo_horario_livre
  	horarios = ["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00",
      "12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30"]
    data = Date.today
    while true do
      horarios.each do |horario|
        datahora = DateTime.new(data.year.to_i, data.month.to_i, data.day.to_i, horario[0..1].to_i, horario[3..4].to_i)
        if !datahora.sunday? && Consulta.where(:data => datahora) == [] && datahora > DateTime.now
          return datahora
        end
      end
      data = data.next_day
    end
  end

  def self.horario_disponivel(data)
    datahora = DateTime.new(data.year,data.month,data.day, ((data.hour) + 3), data.minute)
    !Consulta.where(:data => datahora).any?
  end

  def self.horario_valido(datahora)
    datahora = DateTime.new(datahora.year,datahora.month,datahora.day, ((datahora.hour) + 3), datahora.minute)
    datahora >= DateTime.now
  end

  def self.data_valida(data, current_user)
    (!data.sunday? && (data >= Date.today || current_user))
  end

  def somente_data
  	data.to_s[0..9]
  end

  def hora
  	data.to_s[11..16]
  end

  def particular?
    self.convenio.nome == "PARTICULAR"
  end
end

