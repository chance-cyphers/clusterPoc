defmodule DoThinger do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, {})
  end

  @impl true
  def init(_opts) do
    {:ok, {}}
  end

end
