module Agents
  class TransportOpendata < Agent
    include FormConfigurable

    cannot_be_scheduled!
    cannot_receive_events!
    can_dry_run!

    gem_dependency_check {defined?(Transprt::Client)}

    description <<-MD
      Add a Agent description here
    MD

    def default_options
      {

      }
    end

    form_configurable :from
    form_configurable :to

    def validate_options
    end

    def working?
      # Implement me! Maybe one of these next two lines would be a good fit?
      # checked_without_error?
      # received_event_without_error?
    end

    def check
      log "sending request item: #{options}"
      transprt = Transprt::Client.new
      result = transprt.connections from: options["from"], to: options["to"]
      create_event payload: result
    end
  end
end
