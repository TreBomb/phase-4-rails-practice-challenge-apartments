class ApartmentsController < ApplicationController
    def index
        render json: Apartment.all
    end

    def show
        apartment = Apartment.find(params[:id])

        if apartment
            render json: apartment
        else
            render json: {"error": "Apartment not found"}, status: :not_found
        end
    end

    def create
        apartment = Apartment.create(apartment_params)

        if apartment
            render json: apartment, status: :created
        else
            render json: {"error": apartment.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        place = Apartment.find(params[:id])
        if place
            apartment = place.update(apartment_params)
            if apartment
                render json: place, status: :created
            else
                render json: {"error": apartment.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {"error": "Apartment not found"}, status: :not_found
        end
    end

    def destroy
        apartment = Apartment.find(params[:id])

        if apartment
            apartment.destroy
            head :no_content
        else
            render json: {"error": "Apartment not found"}, status: :not_found
        end
    end

    private

    def apartment_params
        params.permit(:number)
    end
end
