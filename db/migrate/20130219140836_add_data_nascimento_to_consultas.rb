class AddDataNascimentoToConsultas < ActiveRecord::Migration
  def change
  	add_column :consultas, :data_nascimento, :string
  end
end
