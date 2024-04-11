defmodule Membership do
  defstruct [:type, :price]
end

defmodule User do
  defstruct [:name, :membership]
end

defmodule Structs do
  use Application

  def start(_type, _args) do
    Structs.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    # % creates a new instance of the struct
    gold_membership = %Membership{type: "gold", price: 100}
    silver_membership = %Membership{type: "silver", price: 50}
    bronze_membership = %Membership{type: "bronze", price: 25}
    none_membership = %Membership{type: "none", price: 0}

    users = [
      %User{name: "Richard", membership: gold_membership},
      %User{name: "Rachel", membership: silver_membership},
      %User{name: "Joe", membership: bronze_membership},
      %User{name: "Rachel", membership: none_membership}
    ]

    Enum.each(users, fn %User{name: name, membership: membership} ->
      IO.puts(
        "Hello #{name} you have a #{membership.type} membership the price is #{membership.price}"
      )
    end)
  end
end
