module Api
    class UsersController < ApplicationController
        def show
            if params[:id]
                user = User.find(params[:id])
            end
            render json: {
                status: 'success', 
                code: '200', 
                message: 'Categoryes Data',
                data: user
            },
            status: :ok
        end

        def create
            user = User.new(params.permit(:name, :email, :phone_number))

            if user.save
                render json: {
                    status: 'success', 
                    code: '200', 
                    message: 'Success Created User',
                    data: user
                }
            else
                render json: {
                    status: 'failed', 
                    code: '500', 
                    message: 'Failed Created User',
                    data: "failed"
                }
            end
        end
    end
end