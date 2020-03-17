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
end
