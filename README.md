# BroadwayErrorRepro

To reproduce the Broadway rate limiting error:

1. Clone this repo
2. `mix deps.get`
3. `iex -S mix`

Doing that should yield:

```
23:02:39.265 [debug] Message data recieved: 1
Interactive Elixir (1.9.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1) ▶
23:02:39.512 [debug] Message data recieved: 2

23:02:39.762 [debug] Message data recieved: 3

23:02:40.013 [debug] Message data recieved: 4

23:02:40.264 [debug] Message data recieved: 5

23:02:40.515 [debug] Message data recieved: 6

23:02:40.766 [debug] Message data recieved: 7

23:02:41.017 [debug] Message data recieved: 8

23:02:41.268 [debug] Message data recieved: 9

23:02:41.519 [debug] Message data recieved: 10

23:02:41.783 [error] GenServer BroadwayErrorRepro.Processor.Broadway.Producer_0 terminating
** (MatchError) no match of right hand side value: {[], []}
    (broadway) lib/broadway/producer.ex:340: Broadway.Producer.rate_limit_and_buffer_messages/1
    (broadway) lib/broadway/producer.ex:244: Broadway.Producer.handle_info/2
    (gen_stage) lib/gen_stage.ex:2086: GenStage.noreply_callback/3
    (stdlib) gen_server.erl:637: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:711: :gen_server.handle_msg/6
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Last message: {Broadway.RateLimiter, :reset_rate_limiting}
State: %{consumers: [{#PID<0.386.0>, #Reference<0.3100754447.2273312771.158628>}], module: BroadwayErrorRepro.Counter, module_state: 11, rate_limiting: %{demand_buffer: {[5], [5]}, draining?: false, message_buffer: {[], []}, state: :closed, table_name: BroadwayErrorRepro.Processor.RateLimiter}, transformer: {BroadwayErrorRepro.Processor, :transform, []}}

23:02:41.884 [debug] Message data recieved: 1

23:02:42.021 [debug] Message data recieved: 2

23:02:42.272 [debug] Message data recieved: 3

23:02:42.523 [debug] Message data recieved: 4

23:02:42.774 [debug] Message data recieved: 5

23:02:43.025 [debug] Message data recieved: 6

23:02:43.276 [debug] Message data recieved: 7

23:02:43.527 [debug] Message data recieved: 8

23:02:43.778 [debug] Message data recieved: 9

23:02:44.029 [debug] Message data recieved: 10

23:02:44.281 [error] GenServer BroadwayErrorRepro.Processor.Broadway.Producer_0 terminating
** (MatchError) no match of right hand side value: {[], []}
    (broadway) lib/broadway/producer.ex:340: Broadway.Producer.rate_limit_and_buffer_messages/1
    (broadway) lib/broadway/producer.ex:244: Broadway.Producer.handle_info/2
    (gen_stage) lib/gen_stage.ex:2086: GenStage.noreply_callback/3
    (stdlib) gen_server.erl:637: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:711: :gen_server.handle_msg/6
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Last message: {Broadway.RateLimiter, :reset_rate_limiting}
State: %{consumers: [{#PID<0.386.0>, #Reference<0.3100754447.2273312769.157962>}], module: BroadwayErrorRepro.Counter, module_state: 11, rate_limiting: %{demand_buffer: {[5], [5]}, draining?: false, message_buffer: {[], []}, state: :closed, table_name: BroadwayErrorRepro.Processor.RateLimiter}, transformer: {BroadwayErrorRepro.Processor, :transform, []}}

23:02:44.383 [debug] Message data recieved: 1

23:02:44.531 [debug] Message data recieved: 2

23:02:44.782 [debug] Message data recieved: 3

23:02:45.033 [debug] Message data recieved: 4

23:02:45.284 [debug] Message data recieved: 5

23:02:45.535 [debug] Message data recieved: 6

23:02:45.786 [debug] Message data recieved: 7

23:02:46.037 [debug] Message data recieved: 8

23:02:46.288 [debug] Message data recieved: 9

23:02:46.539 [debug] Message data recieved: 10

23:02:46.791 [error] GenServer BroadwayErrorRepro.Processor.Broadway.Producer_0 terminating
** (MatchError) no match of right hand side value: {[], []}
    (broadway) lib/broadway/producer.ex:340: Broadway.Producer.rate_limit_and_buffer_messages/1
    (broadway) lib/broadway/producer.ex:244: Broadway.Producer.handle_info/2
    (gen_stage) lib/gen_stage.ex:2086: GenStage.noreply_callback/3
    (stdlib) gen_server.erl:637: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:711: :gen_server.handle_msg/6
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Last message: {Broadway.RateLimiter, :reset_rate_limiting}
State: %{consumers: [{#PID<0.386.0>, #Reference<0.3100754447.2273312769.157995>}], module: BroadwayErrorRepro.Counter, module_state: 11, rate_limiting: %{demand_buffer: {[5], [5]}, draining?: false, message_buffer: {[], []}, state: :closed, table_name: BroadwayErrorRepro.Processor.RateLimiter}, transformer: {BroadwayErrorRepro.Processor, :transform, []}}
```
