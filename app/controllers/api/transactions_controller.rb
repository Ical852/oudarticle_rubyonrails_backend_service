require 'veritrans'

module Api
    class TransactionsController < ApplicationController
        def show
            if params[:id]
                transactions = Transaction.find(params[:id])
            elsif params[:user_id]
                transactions = Transaction.where(user_id: params[:user_id])
            end
            render json: {
                status: 'success', 
                code: '200', 
                message: 'Transactions Data',
                data: transactions
            },
            status: :ok
        end

        def create
            requestdata = JSON.parse(request.raw_post)

            Midtrans.config.server_key = ""
            Midtrans.config.client_key = ""

            user = User.find(requestdata['user_id'])

            result = Midtrans.create_snap_redirect_url(
                transaction_details: {
                    order_id: requestdata['order_id'],
                    gross_amount: requestdata['gross_amount'],
                },
                customer_details: {
                    first_name: user.name,
                    email: user.email,
                    phone: user.phone_number
                }
            )
            payment_url = result.redirect_url

            transaction = Transaction.new({
                order_id: requestdata['order_id'],
                gross_amount: requestdata['gross_amount'],
                payment_url: payment_url,
                user_id: user.id,
                article_id: requestdata['article_id'],
            })

            if transaction.save
                render json: {
                    status: 'success', 
                    code: '200', 
                    message: 'Success Created Transaction',
                    data: transaction
                }
            else
                render json: {
                    status: 'failed', 
                    code: '500', 
                    message: 'Failed Created Transaction',
                    data: "failed"
                }
            end
        end
    end
end