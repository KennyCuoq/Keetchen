class EmployeesDetailsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "employees_details_channel"
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
