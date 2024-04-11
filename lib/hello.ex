defmodule HelloWorld do
  use Application
  # How to import a module from hex
  alias UUID

  # _ means we aren't using it
  def start(_type, _args) do
    HelloWorld.main()
    IO.puts(UUID.uuid4())
    # A supervisor is a process that manages other processes
    # The first argument is the list of children, the second is the strategy for restarting them
    # one for one means if a child process crashes, only that one will be restarted
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    IO.puts("Hello World!")
  end
end
