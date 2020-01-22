

import Config

config :cluster_poc,
       hello: System.get_env("USER")

config :mnesiac,
       stores: [ClusterPoc.Store],
       table_load_timeout: 600_000 # milliseconds, default is 600_000
#       schema_type: :disc_copies, # defaults to :ram_copies
