module Novaposhta

  class TrackingDocument < Base

    class << self

      def get_status_documents(documents = [])
        opts = { documents: [] }
        documents.each { |dn| opts[:documents] << { document_number: dn.int_doc_number, phone: dn.recipient_contact_phone } }
        process opts
      end

    end

  end

end
