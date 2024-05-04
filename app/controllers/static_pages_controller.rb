class StaticPagesController < ApplicationController
  def index
    @user_id = params[:user_id]
    @photos = get_user_photo_urls(@user_id) if @user_id
  end

  def get_user_photo_urls(user_id)
    flickr = Flickr.new(Rails.application.credentials.flickr[:key],
                        Rails.application.credentials.flickr[:secret])

   photos = flickr.people.getPhotos(user_id: user_id)
   photos.map do |photo|
        Flickr.url(photo)
   end
    
  end

  
end
