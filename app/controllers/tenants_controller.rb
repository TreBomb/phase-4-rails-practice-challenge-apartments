class TenantsController < ApplicationController
    def index
        render json: Tenant.all
    end

    def show
        tenant = Tenant.find(params[:id])

        if tenant
            render json: tenant
        else
            render json: {"error": "Tenant not found"}, status: :not_found
        end
    end

    def create
        tenant = Tenant.new(tenant_params)

        if tenant.save
            render json: tenant, status: :created
        else
            render json: {"error": tenant.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        tenant = Tenant.find(params[:id])
        updater = tenant.update(tenant_params)
        if tenant
            if updater
                render json: tenant
            else
                render json: {"error": updater.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {"error": "Tenant not found"}, status: :not_found
        end
    end

    def destroy
        tenant = Tenant.find(params[:id])

        if tenant
            tenant.destroy
            head :no_content
        else
            render json: {"error": "Tenant not found"}, status: :not_found
        end
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end
end
