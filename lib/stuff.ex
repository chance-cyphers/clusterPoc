defmodule Stuff do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, {}, name: __MODULE__)
  end

  def get_nodes() do
    GenServer.call(__MODULE__, :get_nodes)
  end

  @impl true
  def init(_opts) do
    {:ok, {}}
  end

  @impl true
  def handle_call(:get_nodes, _from, state) do
    {:reply, Node.list(), state}
  end

end
