defmodule Atoms do
  use Application

  def start(_type, _args) do
    Atoms.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    # name and value are the same thing in elixir
    IO.puts(:hello)
    # same as above, but with a string less efficient
    IO.puts("hello")
    # you can use strings or atoms with spaces
    IO.puts(:"hello world")

    name = "Richard"

    # Random enum helper function, awesome!
    status = Enum.random([:silver, :gold])

    # == and === are the same thing, but === is more strict like javascript
    if status === :gold do
      IO.puts("Welcome back to the golden age #{name}")
    else
      IO.puts("You're not a gold member yet")
    end

    # This is an example of pattern matching, you can use it to check if something is true or false
    # Similar to rusts match syntax
    case status do
      :gold ->
        IO.puts("Welcome back to the golden age #{name}")

      :silver ->
        IO.puts("You're not a gold member yet")

      _ ->
        IO.puts("You're not a gold member yet")
    end
  end
end
