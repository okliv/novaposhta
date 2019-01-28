module Novaposhta

  class ContactPerson < Base

    class << self

      # :first_name
      # :middle_name
      # :last_name
      # :phone
      def save(opts = {})
        opts[:counterparty_ref] ||= Counterparty.clients_container.ref
        process opts
      end

      # :first_name
      # :middle_name
      # :last_name
      # :phone
      def update(ref, opts = {})
        opts[:ref] = ref
        opts[:counterparty_ref] ||= Counterparty.clients_container.ref
        process opts
      end

      def delete(ref)
        process ref: ref
      end

    end

  end

end
