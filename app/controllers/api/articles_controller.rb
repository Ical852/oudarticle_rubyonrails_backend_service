require 'veritrans'

module Api
    class ArticlesController < ApplicationController
        def show
            if params[:id]
                articles = Article.find(params[:id])
                category = Category.find(articles.category_id)
                image = Image.where(article_id: articles.id)
                data = {
                    articles: articles,
                    category: category,
                    image: image
                }
            elsif params[:category]
                articles = Article.where(category_id: params[:category])
                data = []
                for article in articles do
                    article_data = {
                        articles: article,
                        category: Category.find(article.category_id),
                        image: Image.where(article_id: article.id)
                    }

                    data.push(article_data)
                end
            else
                articles = Article.order('created_at ASC')
                data = []
                for article in articles do
                    article_data = {
                        articles: article,
                        category: Category.find(article.category_id),
                        image: Image.where(article_id: article.id)
                    }

                    data.push(article_data)
                end
            end
            render json: {
                status: 'success', 
                code: '200', 
                message: 'Articles Data',
                data: data
            },
            status: :ok
        end

        def create
            article = Article.new(params.permit(:title, :body, :category_id))

            if article.save
                render json: {
                    status: 'success', 
                    code: '200', 
                    message: 'Success Created Article',
                    data: article
                }
            else
                render json: {
                    status: 'failed', 
                    code: '500', 
                    message: 'Failed Created Article',
                    data: "failed"
                }
            end
        end

        def update
            article = Article.find(params[:id])
            if article.update(params.permit(:title, :body, :category_id))
                render json: {
                    status: 'success', 
                    code: '200', 
                    message: 'Success Updated Article',
                    data: article
                }
            else
                render json: {
                    status: 'failed', 
                    code: '500', 
                    message: 'Failed Updated Article',
                    data: "failed"
                }
            end
        end

        def destroy
            article = Article.find(params[:id])
            if article.destroy
                render json: {
                    status: 'success', 
                    code: '200', 
                    message: 'Success Deleted Article',
                    data: "delete success"
                }
            else
                render json: {
                    status: 'failed', 
                    code: '500', 
                    message: 'Failed Deleted Article',
                    data: "delete failed"
                }
            end
        end

        def test
            image = Image.create({
                article_id: 1,
                image_url: "test"
            })
            render json: {
                message: image
            }
        end

        def testgetpost
            jsondata = JSON.parse(request.raw_post)
            order = jsondata['order']
            if order == nil
                order = "gaada data jancok"                
            end
            render json: {
                message: order
            }
        end

        def getpaymenturl
            Midtrans.config.server_key = "SB-Mid-server-QvGNSlna9G41nOdjRvYPcY8p"
            Midtrans.config.client_key = "SB-Mid-client-thJUgy3dhkvfGpYW"

            result = Midtrans.create_snap_redirect_url(
                transaction_details: {
                    order_id: "test-transaction-order-123",
                    gross_amount: 100000,
                },
                customer_details: {
                    first_name: "tester",
                    email: "tester@gmail.com",
                    phone: "089754638192"
                }
            )
            payment_url = result.redirect_url

            render json: {
                status: 'success', 
                code: '200', 
                message: 'Success Created Article',
                data: {
                    payment_url: payment_url
                }
            }
        end
    end
end