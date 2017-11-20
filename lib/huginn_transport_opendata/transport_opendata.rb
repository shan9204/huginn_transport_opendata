module Agents
  class TransportOpendata < Agent
    include FormConfigurable

    cannot_receive_events!
    can_dry_run!

    gem_dependency_check {defined?(Transprt::Client)}

    description <<-MD
      Connects to the transport.opendata.ch API and checks currently available connections between two defined cities for the timestamp the request is sent.
    MD

    def default_options
      {
          'from' => 'Basel',
          'to' => 'Bern'
      }
    end

    form_configurable :from
    form_configurable :to

    def validate_options
      errors.add(:base, 'from is required') unless options['from'].present?
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

      log "received result: #{result}"

      result.each do |item|
        create_event payload: item
    end
  end
end
