defmodule StackSupervisor do
  @moduledoc """
  Starts the supervision tree for the application.
  """
  use Application
  require System

  def start(_type, _args) do
    children = [
      Stack
    ]
    Supervisor.start_link(children, strategy: :one_for_all)
  end

end
