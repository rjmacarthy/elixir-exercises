defmodule Variables do
  use Application
  @x 10

  def start(_type, _args) do
    Variables.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    @x = 10
    IO.puts("x = #{@x}") # x is a constant, so we can use it here
  end
end
