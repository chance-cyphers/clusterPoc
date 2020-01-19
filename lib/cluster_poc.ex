defmodule ClusterPoc do

  def start(_type, _args) do
    DoThinger.start_link()
  end


end
