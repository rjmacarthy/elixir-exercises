defmodule Tuples do
  use Application

  def start(_type, _args) do
    Tuples.main()
    Supervisor.start_link(fn -> nil end, name: __MODULE__)
  end

  def main do
    memberships = {:bronze, :silver}
    # adds gold to the tuple
    memberships = Tuple.append(memberships, :gold)
    IO.inspect(memberships)

    prices = {5, 10, 15}
    avg = Tuple.sum(prices) / tuple_size(prices)
    IO.puts("Average price is #{avg}")

    IO.puts("Price for bronze is #{elem(prices, 0)}")
    IO.puts("Price for silver is #{elem(prices, 1)}")
    IO.puts("Price for gold is #{elem(prices, 2)}")

    # mixed types are allowed
    user1 = {"Richard", :gold}

    {name, membership} = user1
    IO.puts("Hello #{name}")
    IO.puts("You have a #{membership} membership")
    IO.inspect(user1)
  end
end
