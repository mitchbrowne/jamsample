class PagesController < ApplicationController
  before_action :check_for_login

  def welcome
    @users = User.all
    samples = []
      Sample.all.each do |sample|
        samples.append(sample)
      end
    samples.sort_by! {|sample| sample.updated_at}
    @samples = samples.reverse!
  end

  #   samples = []
  #   @users.each do |user|
  #     user.collections.each do |collection|
  #       collection.samples.each do |sample|
  #         samples.append(sample)
  #       end
  #     end
  #   end
  #   samples.sort_by! {|sample| sample.created_at}
  #   @samples = samples.reverse!
  # end
end
