require 'huginn_agent'
require 'json'

begin
  require 'transprt'
rescue LoadError
end

#HuginnAgent.load 'huginn_transport_opendata/concerns/my_agent_concern'
HuginnAgent.register 'huginn_transport_opendata/transport_opendata'
