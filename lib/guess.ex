defmodule Guess do
  use Application

  @spec start(any(), any()) :: {:error, any()} | {:ok, pid()}
  def start(_type, _args) do
    Guess.main()
    Supervisor.start_link(fn -> nil end, name: __MODULE__)
  end

  def main do
    # this is a random number between 0 and 10
    # access to the built in erlang library :rand
    correct = :rand.uniform(11) - 1
    # it will be a string so we need to convert it to an integer
    # creates a tuple
    guess = IO.gets("Guess a number between 0 and 20: ") |> String.trim() |> Integer.parse()

    case guess do
      {result, _} ->
        IO.puts("You entered: #{result}")

        if result == correct do
          IO.puts("Correct!")
        else
          IO.puts("Wrong!, the correct number is: #{correct}")
        end
    end
  end
end
