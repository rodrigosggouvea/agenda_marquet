class CreateConsultas < ActiveRecord::Migration
  def change
    create_table :consultas do |t|
      t.datetime :data
      t.string :nome_paciente
      t.integer :cpf_paciente
      t.integer :convenio_id

      t.timestamps
    end
  end
end
