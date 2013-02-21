class AddTelefoneToConsultas < ActiveRecord::Migration
  def change
    add_column :consultas, :telefone, :string
  end
end
