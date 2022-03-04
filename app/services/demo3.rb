class Demo3
  # generated columns に値をセットしてみる

  def call
    virtual_schedule = VirtualSchedule.find_by(start_month: 2, start_day: 26)

    pp virtual_schedule

    virtual_schedule.start_month = 3

    pp virtual_schedule

    virtual_schedule.save! # エラー
  end
end
