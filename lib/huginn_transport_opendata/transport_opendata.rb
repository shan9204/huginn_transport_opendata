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
      item["from"] = interpolated["from"] if interpolated["from"].present?
      item["to"] = interpolated["to"] if interpolated["to"].present?

      log "sending request item: #{item}"
      transprt = Transprt::Client.new
      result = transprt.connections from: item["from"], to: item["to"]
      create_event(result)
    end

    # def receive(incoming_events)
    #   incoming_events.each do |event|
    #       interpolate_with(event) do
    #         item["from"] = interpolated["from"] if interpolated["from"].present?
    #         item["to"] = interpolated["to"] if interpolated["to"].present?
    #
    #         log "sending request item: #{item}"
    #         transprt = Transprt::Client.new
    #         result = transprt.connections from: item["from"], to: item["to"]
    #         create_event(result)
    #       end
    #   end
    # end
  end
end
