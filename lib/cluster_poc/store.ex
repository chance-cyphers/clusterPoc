defmodule ClusterPoc.Store do
  use Mnesiac.Store
  import Record, only: [defrecord: 3]

  @doc """
  Record definition for ExampleStore example record.
  """
  Record.defrecord(
    :example,
    __MODULE__,
    id: nil,
    topic_id: nil,
    event: nil
  )

  @typedoc """
  ExampleStore example record field type definitions.
  """
  @type example ::
          record(
            :example,
            id: String.t(),
            topic_id: String.t(),
            event: String.t()
          )

  @impl true
  def store_options,
      do: [
        record_name: __MODULE__,
        attributes: example()
                    |> example()
                    |> Keyword.keys(),
        index: [:topic_id],
        ram_copies: [node()]
      ]


end
