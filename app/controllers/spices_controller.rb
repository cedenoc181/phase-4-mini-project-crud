class SpicesController < ApplicationController

def index
    spices = Spice.all
    render json: spices, status: :ok
end 

# def show
#         spice = find_spice
#     if spice
#         render json: spice, status: :ok
#     else
#         render json: { error: "Spice not found" }, status: :not_found 
#     end 
# end 

def create 
    spice = Spice.create(spice_params)
    render json: spice, status: :created
end 

def update
    spice = find_spice
    if spice 
        spice.update(spice_params)
        render json: spice, status: :accepted
    else 
        spice_not_found
    end
end 

def destroy
    spice = find_spice
    if spice 
        spice.destroy
       head :no_content 
    else 
        spice_not_found
    end
end 

private 

def find_spice
    spice = Spice.find_by(id: params[:id])
end 

def spice_params 
params.permit(:title, :image, :description, :notes, :rating )
end 

def spice_not_found 
    render json: { error: "Spice not found" }, status: :not_found 
end 













end
