class Publics::HomesController < ApplicationController
  def top
    @items = Item.(created_at: :desc).limit(4)
  end
end
