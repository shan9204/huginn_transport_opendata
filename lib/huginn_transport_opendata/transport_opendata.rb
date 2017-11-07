module Agents
  class TransportOpendata < Agent
    default_schedule '12h'

    gem_dependency_check {defined?(Transprt::Client)}

    description <<-MD
      Add a Agent description here #{Transport::Client.new.location query: 'Geneva'}
    MD

    def default_options
      {
      }
    end

    def validate_options
    end

    def working?
      # Implement me! Maybe one of these next two lines would be a good fit?
      # checked_without_error?
      # received_event_without_error?
    end

#    def check
#    end

#    def receive(incoming_events)
#    end
  end
end
