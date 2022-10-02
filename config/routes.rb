Rails.application.routes.draw do
  namespace 'api' do
    resource :articles
  end

  namespace 'api' do
    resource :categories
  end

  namespace 'api' do
    resource :users
  end

  namespace 'api' do
    resource :transactions
  end

  #test segala test
  get 'api/articles/test' => 'api/articles#test'
  get 'api/articles/testpayment' => 'api/articles#getpaymenturl'
  post 'api/articles/testgetpost' => 'api/articles#testgetpost'
  #test segala test

end