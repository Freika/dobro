module Admin
  class AnnouncementsController < ApplicationController

    def index
      @announcements = Announcement.all
    end

    def new
      @announcement = Announcement.new
    end

    def create
      @announcement = Announcement.new(announcement_params)
      if @announcement.save
        redirect_to admin_announcements_path
      else
        render :edit
      end
    end

    def edit
      @announcement = Announcement.find(params[:id])
    end

    def update
      @announcement = Announcement.find(params[:id])
      if @announcement.update(announcement_params)
        redirect_to admin_announcements_path
      else
        render :edit
      end
    end

    def destroy
      @announcement = Announcement.find(params[:id])
      @announcement.destroy
      redirect_to admin_announcements_path
    end

    def show
      @announcement = Announcement.find(params[:id])
    end

    def hide
      ids = [params[:id], *cookies.signed[:hidden_announcement_ids]]
      cookies.permanent.signed[:hidden_announcement_ids] = ids
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end

    private

    def announcement_params
      params.require(:announcement).permit(:starts_at, :ends_at, :message)
    end

  end
end
