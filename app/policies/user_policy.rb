class UserPolicy < ApplicationPolicy

  attr_reaser :current_user, :user
  
  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end




end
