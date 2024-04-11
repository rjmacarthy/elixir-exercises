defmodule Maps do
  use Application

  def start(_type, _args) do
    Maps.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    # Use atoms as values
    memberships = %{
      gold: :gold,
      silver: :silver,
      bronze: :bronze,
      none: :none
    }

    # keys are atoms
    prices = %{
      gold: 100,
      silver: 50,
      bronze: 25,
      none: 0
    }

    users = [
      {"Richard", memberships.gold},
      {"Rachel", memberships.silver},
      {"Joe", memberships.bronze}
    ]

    Enum.each(users, fn {name, membership} ->
      IO.puts(
        "Hello #{name} you have a #{membership} membership the price is #{prices[membership]}"
      )
    end)
  end
end
