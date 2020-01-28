# Hotcode Swapping Example

[ Exemplo1 do Medium ]( https://medium.com/blackode/how-to-perform-hot-code-swapping-in-elixir-afc824860012 )
[ Exemplo2 do Medium - Destillary ]( https://medium.com/blackode/how-to-perform-hot-code-swapping-using-distillery-2-a-live-demo-genserver-state-update-53d8344d9147 )


## Run

### Before rename lib/demo_server_v2.ex to demo_server_v2.txt)


```iex -S Mix
iex-> employee = %{name: "blackode", money: 30000}
%{money: 30000, name: "blackode"}

iex-> {:ok, pid} = DemoServer.start_link employee
{:ok, #PID<0.195.0>}

iex-> DemoServer.add_money pid, 30000
"30000 added to blackode "

# Rename lib/demo_server_v2.txt to ..demo_server_v2.ex
iex-> c "lib/demo_server_v2.ex"
warning: redefining module DemoServer...

iex-> :sys.suspend pid
:ok

iex-> :sys.change_code pid, DemoServer, "1", nil
:ok

iex-> :sys.resume pid
:ok

iex-> DemoServer.add_money(pid, 100000)
%{name: "blackode", salary: 260000}

```

