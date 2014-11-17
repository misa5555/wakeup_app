class PostsController < ApplicationController
  def create
    dates = post_params["date"].split("-").map(&:to_i)
    times = post_params["time"].split(":").map(&:to_i)
    date_input = Time.new(dates[0],dates[1], dates[2], times[0], times[1])
    post = current_user.posts.create({wakeup_time: date_input, memo: post_params[:memo]})
    if post.save
      redirect_to user_url(current_user) 
    else
      flash[:errors] = posts.errors.full_messages
      redirect_to user_url(current_user) 
    end
  end

  private
  def post_params
    params.require(:post).permit(:date, :time, :memo)
  end
end
