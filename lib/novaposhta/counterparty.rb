module Novaposhta
  class Counterparty < Base

    class << self
      def get_counterparties(opts = {})
        opts[:counterparty_property] ||= 'Sender'
        opts[:page] ||= 1
        req opts
      end

      def my_firm
        get_counterparties.data.first
      end

      def get_counterparty_contact_persons opts = {}
        opts[:ref] ||= clients_list.ref
        opts[:page] ||= 1
        req opts
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
        req opts
      end

      def clients_list
        get_counterparties(counterparty_property: 'Recipient').data.first
      end

    end
  end
end
