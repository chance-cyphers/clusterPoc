defmodule ClusterPoc do
  def start(_type, _args) do
    hosts = [:"foo@127.0.0.1", :"bar@127.0.0.1"]

    topologies = [
      example: [
        strategy: Cluster.Strategy.Epmd,
        config: [
          hosts: hosts
        ],
      ]
    ]

    children = [
      {Cluster.Supervisor, [topologies, [name: ClusterPoc.ClusterSupervisor]]},
      {Mnesiac.Supervisor, [hosts, [name: ClusterPoc.MnesiacSupervisor]]},
      %{id: ClusterPoc.Stuff, start: {Stuff, :start_link, []}}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: ClusterPoc.Supervisor)
  end
end
