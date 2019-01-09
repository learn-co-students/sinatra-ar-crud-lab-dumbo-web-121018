
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # New
  get '/articles/new' do
    erb :new
  end

  #Create
  post '/articles' do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  # Index
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # Show
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #Edit
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  #Update
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params["article"])
    redirect "/articles/#{@article.id}"
  end

  #Delete
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect '/articles'
  end
end
