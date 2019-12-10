defmodule BroadwayErrorRepro.Counter do
  use GenStage

  def start_link(number) do
    GenStage.start_link(BroadwayErrorRepro.Counter, number)
  end

  def init(counter) do
    {:producer, counter}
  end

  def handle_demand(demand, counter) when demand > 0 do
    events = Enum.to_list(counter..(counter + demand - 1))
    {:noreply, events, counter + demand}
  end
end
