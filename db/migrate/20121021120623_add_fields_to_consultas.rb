class AddFieldsToConsultas < ActiveRecord::Migration
  def change
  	add_column :consultas, :endereco_paciente, :string
  	add_column :consultas, :cep_paciente, :string
  	add_column :consultas, :idade_paciente, :integer
  	add_column :consultas, :codigo_carteirinha_paciente, :string
  	add_column :consultas, :email_paciente, :string
  end
end
