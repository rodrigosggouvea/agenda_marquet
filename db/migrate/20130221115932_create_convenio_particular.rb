class CreateConvenioParticular < ActiveRecord::Migration
  def up
  	Convenio.create(:nome => "Particular")
  end

  def down
  	Convenio.where(:nome => "Particular").first.destroy
  end
end
