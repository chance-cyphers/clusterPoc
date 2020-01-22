defmodule Stuff do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, {}, name: __MODULE__)
  end

  def get_nodes() do
    GenServer.call(__MODULE__, :get_nodes)
  end

  def read_all() do
    GenServer.call(__MODULE__, :read_all)
  end

  def write(stuff) do
    GenServer.call(__MODULE__, {:write, stuff})
  end

  def config() do
    GenServer.call(__MODULE__, :config)
  end

  @impl true
  def init(_opts) do
    {:ok, {}}
  end

  @impl true
  def handle_call(:get_nodes, _from, state) do
    {:reply, Node.list(), state}
  end

  @impl true
  def handle_call(:config, _from, state) do
    config_value = Application.fetch_env!(:cluster_poc, :hello)

    {:reply, config_value, state}
  end

  @impl true
  def handle_call(:read_all, _from, state) do
    #    read
    {:reply, Node.list(), state}
  end

  @impl true
  def handle_call({:write, _stuff}, _from, state) do
    #    write
    {:reply, Node.list(), state}
  end
end
