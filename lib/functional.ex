defmodule Functional do
  use Application

  @spec start(any(), any()) :: {:error, any()} | {:ok, pid()}
  def start(_type, _args) do
    Functional.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def double(n) do
    n * 2
  end

  def sum_and_average(numbers) do
    sum = Enum.sum(numbers)
    avg = sum / Enum.count(numbers)
    {sum, avg}
  end

  def print_numbers(numbers) do
    numbers |> Enum.join(" ") |> IO.puts()
  end

  def get_numbers_from_user do
    IO.puts("Enrer numbers separaed by spaces")
    user_inputs = IO.gets("") |> String.trim()
    String.split(user_inputs, " ") |> Enum.map(&String.to_integer/1)
  end

  @spec main() :: any()
  def main do
    numbers = get_numbers_from_user()
    doubled = Enum.map(numbers, fn n -> double(n) end)
    IO.inspect(doubled)

    # capure operator &, chanegs non anon function to anon function, you must also pass the arity.
    result1 = Enum.map(["1", "2", "3"], &String.to_integer/1)

    print_numbers(result1)

    {sum, avg} = sum_and_average(numbers)
    IO.puts("Sum #{sum}, Average #{avg}")
  end
end
