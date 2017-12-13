class DojosController < ApplicationController
  def index
      @dojos = Dojo.all
      render "index"
  end
  def new
      render "new"
  end
  def create
      create = Dojo.create(dojo_params)
      if create.id == nil
          flash[:error] = "All fields must be filled!"
          redirect_to "/dojos/new"
      else
          flash[:success] = "New Dojo Added!"
          redirect_to "/dojos"
      end
  end
  def destroy
      Dojo.destroy(params[:id])
      redirect_to "/dojos"
  end
  def show
      @dojo = Dojo.find(params[:id])
      @students = Dojo.find(params[:id]).students
      render "show"
  end
  def edit
      @dojo = Dojo.find(params[:id])
      render "edit"
  end
  def update
      dojo = Dojo.find(params[:id])

      if params[:dojo][:branch]
          dojo.branch = params[:dojo][:branch]
      end
      if params[:dojo][:street]
          dojo.street = params[:dojo][:street]
      end
      if params[:dojo][:city]
          dojo.city = params[:dojo][:city]
      end
      if params[:dojo][:state]
          dojo.state = params[:dojo][:state]
      end
      
      dojo.save
      
      redirect_to "/dojos/#{params[:id]}"
  end


  private
      def dojo_params
          params.require(:dojo).permit(:branch, :street, :city, :state)
      end

end