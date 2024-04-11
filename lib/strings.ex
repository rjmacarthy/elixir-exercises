defmodule Strings do
  use Application

  def start(_type, _args) do
    Strings.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    IO.puts("This\n is\n a\n multiline\n string")
    IO.puts("This is a single line string")
    IO.puts("Interpolation #{1 + 2}")
    # escape interpolation with \#\{}
    IO.puts("Interpolation \#{1 + 2}")
    # To display unicode use the ? syntax
    IO.puts(?a)
  end
end
