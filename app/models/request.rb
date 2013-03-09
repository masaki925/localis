class Request < ActiveRecord::Base
  attr_accessible :budget_hotel, :budget_meal, :end_datetime, :option_booking, :option_edit, :option_guide, :option_pdf, :option_qa, :option_transport, :people_num, :start_datetime, :title, :user_id
end
