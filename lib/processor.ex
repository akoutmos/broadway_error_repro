defmodule BroadwayErrorRepro.Processor do
  use Broadway

  alias Broadway.Message

  require Logger

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producer: [
        module: {BroadwayErrorRepro.Counter, 1},
        transformer: {__MODULE__, :transform, []},
        rate_limiting: [
          allowed_messages: 1,
          interval: 250
        ]
      ],
      processors: [
        default: [stages: 1]
      ]
    )
  end

  @impl true
  def handle_message(:default, message, _context) do
    Logger.debug("Message data recieved: #{message.data}")

    message
  end

  def transform(event, _opts) do
    %Message{
      data: event,
      acknowledger: {__MODULE__, :ack_id, :ack_data}
    }
  end

  def ack(:ack_id, successful, failed) do
    # Write ack code here
  end
end
