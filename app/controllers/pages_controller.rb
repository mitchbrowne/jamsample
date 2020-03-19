class PagesController < ApplicationController

  def explore
    @users = User.all
    samples = []
      Sample.all.each do |sample|
        samples.append(sample)
      end
    samples.sort_by! {|sample| sample.updated_at}
    @samples = samples.reverse!
  end
end
