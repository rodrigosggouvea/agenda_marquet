class ChangeCodigoCarteirinhaPacienteFromConsultas < ActiveRecord::Migration
  def up
  	change_table :consultas do |t|  
  		t.change :cpf_paciente, :string 
		end
  end

  def down
		change_table :consultas do |t|  
  		t.change :cpf_paciente, :integer
		end
  end
end
