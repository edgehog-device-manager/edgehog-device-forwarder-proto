#[derive(Eq)]
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct Http {
    #[prost(oneof = "http::Message", tags = "1, 2")]
    pub message: ::core::option::Option<http::Message>,
}
/// Nested message and enum types in `Http`.
pub mod http {
    #[derive(Eq)]
    #[allow(clippy::derive_partial_eq_without_eq)]
    #[derive(Clone, PartialEq, ::prost::Message)]
    pub struct Request {
        #[prost(bytes = "vec", tag = "1")]
        pub request_id: ::prost::alloc::vec::Vec<u8>,
        #[prost(string, tag = "2")]
        pub path: ::prost::alloc::string::String,
        #[prost(string, tag = "3")]
        pub method: ::prost::alloc::string::String,
        #[prost(string, tag = "4")]
        pub query_string: ::prost::alloc::string::String,
        #[prost(map = "string, string", tag = "5")]
        pub headers: ::std::collections::HashMap<
            ::prost::alloc::string::String,
            ::prost::alloc::string::String,
        >,
        #[prost(bytes = "vec", tag = "6")]
        pub body: ::prost::alloc::vec::Vec<u8>,
        #[prost(uint32, tag = "7")]
        pub port: u32,
    }
    #[derive(Eq)]
    #[allow(clippy::derive_partial_eq_without_eq)]
    #[derive(Clone, PartialEq, ::prost::Message)]
    pub struct Response {
        #[prost(bytes = "vec", tag = "1")]
        pub request_id: ::prost::alloc::vec::Vec<u8>,
        #[prost(uint32, tag = "2")]
        pub status_code: u32,
        #[prost(map = "string, string", tag = "3")]
        pub headers: ::std::collections::HashMap<
            ::prost::alloc::string::String,
            ::prost::alloc::string::String,
        >,
        #[prost(bytes = "vec", tag = "4")]
        pub body: ::prost::alloc::vec::Vec<u8>,
    }
    #[derive(Eq)]
    #[allow(clippy::derive_partial_eq_without_eq)]
    #[derive(Clone, PartialEq, ::prost::Oneof)]
    pub enum Message {
        #[prost(message, tag = "1")]
        Request(Request),
        #[prost(message, tag = "2")]
        Response(Response),
    }
}
#[derive(Eq)]
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct WebSocket {
    #[prost(bytes = "vec", tag = "1")]
    pub socket_id: ::prost::alloc::vec::Vec<u8>,
    #[prost(oneof = "web_socket::Message", tags = "2, 3, 4, 5, 6")]
    pub message: ::core::option::Option<web_socket::Message>,
}
/// Nested message and enum types in `WebSocket`.
pub mod web_socket {
    #[derive(Eq)]
    #[allow(clippy::derive_partial_eq_without_eq)]
    #[derive(Clone, PartialEq, ::prost::Message)]
    pub struct Close {
        #[prost(uint32, tag = "1")]
        pub code: u32,
        #[prost(string, tag = "2")]
        pub reason: ::prost::alloc::string::String,
    }
    #[derive(Eq)]
    #[allow(clippy::derive_partial_eq_without_eq)]
    #[derive(Clone, PartialEq, ::prost::Oneof)]
    pub enum Message {
        #[prost(string, tag = "2")]
        Text(::prost::alloc::string::String),
        #[prost(bytes, tag = "3")]
        Binary(::prost::alloc::vec::Vec<u8>),
        #[prost(bytes, tag = "4")]
        Ping(::prost::alloc::vec::Vec<u8>),
        #[prost(bytes, tag = "5")]
        Pong(::prost::alloc::vec::Vec<u8>),
        #[prost(message, tag = "6")]
        Close(Close),
    }
}
#[derive(Eq)]
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct Message {
    #[prost(oneof = "message::Protocol", tags = "1, 2")]
    pub protocol: ::core::option::Option<message::Protocol>,
}
/// Nested message and enum types in `Message`.
pub mod message {
    #[derive(Eq)]
    #[allow(clippy::derive_partial_eq_without_eq)]
    #[derive(Clone, PartialEq, ::prost::Oneof)]
    pub enum Protocol {
        #[prost(message, tag = "1")]
        Http(super::Http),
        #[prost(message, tag = "2")]
        Ws(super::WebSocket),
    }
}
