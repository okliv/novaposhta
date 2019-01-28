module Novaposhta
  class Counterparty < Base

    class << self

      def get_counterparties(opts = {})
        opts[:counterparty_property] ||= 'Recipient'
        opts[:page] ||= 1
        process opts
      end

      # def sender_firm
      #   @sender_firm ||= get_counterparties.data.find{|c| c.ref = sender }
      # end

      def get_counterparty_contact_persons(opts = {})
        opts[:ref] ||= sender
        opts[:page] ||= 1
        process opts
      end

      def get_counterparty_options(opts = {})
        opts[:ref] ||= sender
        process opts
      end

      def get_counterparty_addresses(opts={})
        opts[:ref] ||= sender
        opts[:counterparty_property] ||= 'Recipient'
        process opts
      end

      def sender_person
        @sender_person ||= get_counterparty_contact_persons.data.first
      end

      # :city_ref
      # :first_name
      # :middle_name
      # :last_name
      # :phone
      # :email
      # :counterparty_type
      # :counterparty_property
      def save(opts = {})
        opts[:city_ref] ||= Address.kiev.ref
        opts[:counterparty_type] ||= 'PrivatePerson'
        opts[:counterparty_property] ||= 'Recipient'
        process opts
      end

      # def update(opts={})
      #   opts[:ref] ||= sender
      #   opts[:city_ref] ||= Address.kiev.ref
      #   opts[:counterparty_type] ||= 'Organization'
      #   opts[:ownership_form] ||= sender_firm.ownership_form_ref
      #   opts[:counterparty_property] ||= 'Sender'
      #   opts[:first_name] ||= sender_firm.first_name
      #   process opts
      # end

      def clients_container
        @clients_container ||= get_counterparties(counterparty_property: 'Recipient').data.first
      end

    end
  end
end
