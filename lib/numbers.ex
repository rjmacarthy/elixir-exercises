defmodule Numbers do
  use Application

  def start(_type, _args) do
    Numbers.main()
    Supervisor.start_link(fn -> nil end, name: __MODULE__)
  end

  def main do
    # elixir is a dynamic typed language
    # integer
    a = 10
    # float
    b = 3.5
    IO.puts(a + b)

    # In elixir you can do math with integers and floats
    # float and doubles are the same thing in elixir
    x = 10.0
    y = 3
    # float = 3.3333333333333335
    IO.puts(x / y)
    # binary representation of a float
    :io.format("~.20f\n", [0.1])

    # float math
    IO.puts(Float.ceil(10.5))
    IO.puts(Float.floor(10.5))
    IO.puts(Float.round(10.5))

    # integers
    # greatest common divisor
    IO.puts(Integer.gcd(12, 8))
    IO.puts(Integer.pow(2, 3))
  end
end
