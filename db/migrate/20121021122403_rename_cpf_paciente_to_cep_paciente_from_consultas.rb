class RenameCpfPacienteToCepPacienteFromConsultas < ActiveRecord::Migration
  def up
  	rename_column :consultas, :cpf_paciente, :cep_paciente
  end

  def down
  	rename_column :consultas, :cep_paciente, :cpf_paciente
  end
end
