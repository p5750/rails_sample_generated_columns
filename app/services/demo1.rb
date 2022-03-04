class Demo1
  # generated columns で select してみる

  def call
    virtual_schedule = VirtualSchedule.find_by(start_month: 2, start_day: 26)
    pp virtual_schedule
    pp "start_month: #{virtual_schedule.start_month}"

    stored_schedule = StoredSchedule.find_by(start_month: 2, start_day: 26)
    pp stored_schedule
    pp "start_month: #{stored_schedule.start_month}"
  end
end
