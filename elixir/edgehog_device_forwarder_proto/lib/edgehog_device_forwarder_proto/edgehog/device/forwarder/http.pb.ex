defmodule EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.Http.Request.HeadersEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.Http.Request do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:path, 1, type: :string)
  field(:method, 2, type: :string)
  field(:query_string, 3, type: :string, json_name: "queryString")

  field(:headers, 4,
    repeated: true,
    type: EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.Http.Request.HeadersEntry,
    map: true
  )

  field(:body, 5, type: :bytes)
  field(:port, 6, type: :uint32)
  field(:host, 7, proto3_optional: true, type: :string)
end

defmodule EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.Http.Response.HeadersEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.Http.Response do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:status_code, 1, type: :uint32, json_name: "statusCode")

  field(:headers, 2,
    repeated: true,
    type: EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.Http.Response.HeadersEntry,
    map: true
  )

  field(:body, 3, type: :bytes)
end

defmodule EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.Http do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof(:message, 0)

  field(:request_id, 1, type: :bytes, json_name: "requestId")

  field(:request, 2,
    type: EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.Http.Request,
    oneof: 0
  )

  field(:response, 3,
    type: EdgehogDeviceForwarderProto.Edgehog.Device.Forwarder.Http.Response,
    oneof: 0
  )
end
