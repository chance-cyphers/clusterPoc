defmodule ClusterPoc do
  def start(_type, _args) do
    topologies = [
      example: [
        strategy: Cluster.Strategy.Epmd,
        config: [hosts: [:"foo@127.0.0.1", :"bar@127.0.0.1"]],
      ]
    ]
    children = [
      {Cluster.Supervisor, [topologies, [name: ClusterPoc.ClusterSupervisor]]},
      %{id: ClusterPoc.Stuff, start: {Stuff, :start_link, []}}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: ClusterPoc.Supervisor)
  end
end
