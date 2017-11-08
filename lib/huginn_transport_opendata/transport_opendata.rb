module Agents
  class TransportOpendata < Agent
    include FormConfigurable

    cannot_be_scheduled!
    can_dry_run!

    gem_dependency_check { defined?(Transprt::Client)}

    description <<-MD
      Add a Agent description here
    MD

    def default_options
      {
          "from" => "",
          "to" => "",
          "date" => "",
          "time" => "",
          "isArrivalTime" => 0
      }
    end

    form_configurable :from
    form_configurable :to
    form_configurable :date
    form_configurable :time
    form_configurable :isArrivalTime, type: :int

    def validate_options
    end

    def working?
      # Implement me! Maybe one of these next two lines would be a good fit?
      # checked_without_error?
      # received_event_without_error?
    end

#    def check
#    end

    def receive(incoming_events)
      incoming_events.each do |event|
          interpolate_with(event) do
            item["from"] = interpolated["from"] if interpolated["from"].present?
            item["to"] = interpolated["to"] if interpolated["to"].present?
            item["date"] = interpolated["date"] if interpolated["date"].present?
            item["time"] = interpolated["time"] if interpolated["time"].present?
            item["isArrivalTime"] = interpolated["isArrivalTime"].to_i if interpolated["isArrivalTime"].present?

            log "sending request item: #{item}"
            transprt = Transprt::Client.new
            result = transprt.connections from: item["from"], to: item["to"]
            create_event :payload => result
          end
      end
    end
  end
end
