module Novaposhta

  class ContactPerson < Base

    class << self

      # :first_name
      # :middle_name
      # :last_name
      # :phone
      def save opts = {}
        opts[:counterparty_ref] ||= Counterparty.clients_list.ref
        req opts
      end

    end

  end

end
