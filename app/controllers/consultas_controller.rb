
class ConsultasController < ApplicationController
	protect_from_forgery
	
	before_filter :authenticate_user!, :only => [:show, :destroy]

	def index
		@consultas = Consulta.order("data DESC").all
		binding.pry
		if params[:month].blank?
			@hoje = Date.today 
		else
			@hoje = Date.new(params[:month])
		end
	end

	def selecionar_horario
		@data = DateTime.new(params[:ano].to_i,params[:mes].to_i,params[:dia].to_i)
		@consultas = Consulta.where(:data => @data)
		@horarios = ["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00",
      "12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30"]
	end

	def new
		@consulta = Consulta.new
		@convenios = Convenio.all.collect{|c| [c.nome,c.id]}
		@horarios_disponiveis = Consulta.horarios_disponiveis
		@proximo_horario_livre = Consulta.proximo_horario_livre
	end

	def create
		@convenios = Convenio.all.collect{|c| [c.nome,c.id]}
		@consulta = Consulta.new(params[:consulta])
		if @consulta.save
			redirect_to root_path, :notice => "Consulta criada com sucesso!"
		else
			params[:data] = params[:consulta][:data]
			@horarios_disponiveis = Consulta.horarios_disponiveis
			@proximo_horario_livre = Consulta.proximo_horario_livre
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
		@consulta = Consulta.find(params[:id])
		@consulta.destroy
		redirect_to root_path, :notice => "Consulta apagada."
	end

	def show
		@consulta = Consulta.find(params[:id])
	end

end
