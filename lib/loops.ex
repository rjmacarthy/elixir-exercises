defmodule Loops do
  use Application

  def start(_type, _args) do
    Loops.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    users = [
      {"Richard", :gold},
      {"Rachel", :silver},
      {"Joe", :bronze}
    ]

    Enum.each(users, fn {name, membership} ->
      IO.puts("Hello #{name} you have a #{membership} membership")
    end)
  end
end
