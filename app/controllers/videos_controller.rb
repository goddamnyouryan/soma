class VideosController < ApplicationController
  def index
    @background = Background.all.sample
    @background = @background.photo.url
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create(params[:video])
    if @video.save
      redirect_to admin_path, :notice => "Video Uploaded."
    else
      render :new
    end
  end

  def edit
    @video = Video.find params[:id]
  end

  def update
    @video = Video.find params[:id]
    @video.update_attributes(params[:video])
    if @video.save
      redirect_to admin_path, :notice => "Video Updated"
    else
      render :edit
    end
  end
  
  def show
    @video = Video.find params[:id]
  end

  def destroy
    @video = Video.find params[:id]
    @video.destroy
    redirect_to admin_path, :notice => "Video Deleted."
  end
  
  def play
    @video = Video.find params[:video_id]
    @videos = Video.all
    previous_video = @videos.index(@video) - 1
    @previous = @videos[previous_video]
    next_video = @videos.index(@video) + 1
    @next = @videos[next_video]
    if @videos.index(@video) == @videos.index(@videos.first)
		  @previous = @videos.last
	  end
	  if @videos.index(@video) == @videos.index(@videos.last)
	    @next = @videos.first
    end
    respond_to do |format|
      format.js
    end
  end
  
  def exit
    @videos = Video.all
    respond_to do |format|
      format.js
    end
  end
    

end
