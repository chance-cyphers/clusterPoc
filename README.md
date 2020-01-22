# ClusterPoc

Goal: build a clustered application that discovers other nodes as they appear and dynamically updates Mnesia schema with both distributed and local-only tables 

Run nodes like this: `iex --name <instance name> -S mix`
- current configuration is looking for \<instance name> of either `foo@127.0.0.1` or `bar@127.0.0.1` 

Call `Stuff.<function name>` to see some things demo-d