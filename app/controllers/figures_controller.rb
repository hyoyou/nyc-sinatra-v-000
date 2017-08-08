class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @title = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:new_title].empty?
      @figure.titles << Title.create(name: params[:new_title])
    end

    if !params[:new_landmark].empty?
      @figure.landmarks << Landmark.create(name: params[:new_landmark])
    end

    @figure.save
    redirect to ("/figures/#{@figure.id}")
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:new_title].empty?
      @figure.titles << Title.create(name: params[:new_title])
    end

    if !params[:new_landmark].empty?
      @figure.landmarks << Landmark.create(name: params[:new_landmark])
    end

    @figure.save
    redirect to ("/figures/#{@figure.id}")
  end
end
