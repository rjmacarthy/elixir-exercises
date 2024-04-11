defmodule Lists do
  require Integer
  use Application

  def start(_type, _args) do
    Lists.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    grades = [90, 85, 72, 64]
    # comprehension like a js map
    new = for n <- grades, do: n + 5
    # prints the list to the console
    IO.inspect(new, charlists: :as_charlist)
    # append
    new = new ++ [100, 150]
    IO.inspect(new, charlists: :as_charlist)
    # or
    # prepend
    final = [5 | new]
    IO.inspect(final, charlists: :as_charlist)
    # comprehension with condition
    even = for n <- final, Integer.is_even(n), do: n
    IO.inspect(even)
  end
end
