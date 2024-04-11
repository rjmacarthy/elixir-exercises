defmodule Dates do
  use Application

  def start(_type, _args) do
    Dates.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    time = Time.new!(16, 30, 0, 0)
    date = Date.new!(2021, 8, 19)
    # the ! means that it will raise an error if it is invalid
    date_time = DateTime.new!(date, time, "Etc/UTC")
    IO.inspect(time)
    IO.inspect(date)
    IO.inspect(date_time)

    # date manipulation
    time1 = DateTime.new!(Date.new!(2025, 1, 1), Time.new!(0, 0, 0, 0), "Etc/UTC") # this is the first day of the year
    time_till_next_year = Date.diff(time1, DateTime.utc_now()) # this is the number of seconds till next year = 31536000
    IO.puts(time_till_next_year)

    days = div(time_till_next_year, 86400)
    IO.puts(days)
  end
end
