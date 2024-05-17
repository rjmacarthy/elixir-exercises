defmodule StackTest do
  @moduledoc """
  Push your push pop!
  """
  use ExUnit.Case
  doctest Stack

  test "push" do
    {:noreply, state} = Stack.handle_cast({:push, 1}, [1])
    assert state == [1, 1]
  end

  test "pop" do
    reply = Stack.handle_call(:pop, nil, [1, 2])
    {:reply, head, _tail} = reply
    assert head == 1
  end
end
