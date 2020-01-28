defmodule DemoServer do
  use GenServer
  @vsn "1"
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
  def handle_call({:add, value},_from, %{name: name, money: money} = state) do
    {:reply, "#{value} added to #{name} ", Map.put(state, :money, money+value)}
  end
end
