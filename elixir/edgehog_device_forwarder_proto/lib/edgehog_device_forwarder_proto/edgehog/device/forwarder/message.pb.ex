defmodule EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.Message do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof(:protocol, 0)

  field(:http, 1, type: EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.Http, oneof: 0)
  field(:ws, 2, type: EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.WebSocket, oneof: 0)
  field(:https, 3, type: EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.Https, oneof: 0)
end
