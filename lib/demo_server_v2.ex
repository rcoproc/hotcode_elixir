defmodule DemoServer do
  use GenServer
  @vsn "2"
  ## Client API
  def start_link employee do
    GenServer.start_link __MODULE__, employee, []
  end
  def add_money(pid, value) do
    GenServer.call(pid, {:add, value})
  end

  ## Server API
  def init(employee) do   # initiating state with passed employee details
    {:ok, employee}
  end

  # add the value to the state and returns :ok
  def handle_call({:add, value},_from, %{name: name, salary: salary} = state) do
    new_state = Map.put(state, :salary, salary+value)
    {:reply, new_state, new_state}
  end

  def code_change("1", %{name: name, money: money} = old_state, _dontcare) do
     {:ok, %{name: name, salary: money}}
  end
end
