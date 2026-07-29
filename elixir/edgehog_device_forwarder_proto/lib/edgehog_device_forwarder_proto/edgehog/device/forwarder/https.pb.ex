defmodule EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.Https do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof(:message, 0)

  field(:request_id, 1, type: :bytes, json_name: "requestId")

  field(:request, 3,
    type: EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.Http.Request,
    oneof: 0
  )

  field(:response, 4,
    type: EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.Http.Response,
    oneof: 0
  )
end
