class AdminsForsaleController < ApplicationController
    before_action :authenticate_admin!
    layout 'admins_forsale'
end
