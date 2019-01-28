module Novaposhta
  class InternetDocument < Base

    class << self

      # def sender_firm
      #   Counterparty.sender_firm
      # end

      def sender_person
        Counterparty.sender_person
      end

      # :warehouse_number
      # :description
      # :cost
      # :weight
      # :recipient_address_name # номер отделения
      # :recipient_name
      # :recipient_city_name
      # :recipient_area
      # :recipient_area_regions
      # :recipients_phone
      def save(opts = {})
        opts[:new_address] ||= "1"
        opts[:payer_type] ||= "Recipient"
        opts[:payment_method] ||= "Cash"
        opts[:cargo_type] ||= "Parcel"
        # opts[:volume_general] ||= "0.1"
        opts[:service_type] ||= "WarehouseWarehouse" #"WarehouseDoors
        opts[:seats_amount] ||= "1"
        opts[:city_sender] ||= Address.kiev.ref
        opts[:sender] ||= sender
        opts[:sender_address] ||= Address.kiev_warehouse(opts[:warehouse_number]).ref
        opts[:contact_sender] ||= sender_person.ref
        opts[:senders_phone] ||= sender_person.phones
        opts[:recipient_type] ||= "PrivatePerson"
        opts[:recipient_house] ||= ""
        opts[:recipient_flat] ||= ""
        # "CityRecipient": "db5c88de-391c-11dd-90d9-001a92567626",
        # "Recipient": "640a049d-2d3a-11e6-bbb6-005056886752",
        # "RecipientAddress": "58428745-0862-11e6-bbb6-005056886752",
        # "ContactRecipient": "7f0cfa9e-315f-11e6-bbb6-005056886752",
        # "DateTime": "23.09.2016",
        # "BackwardDeliveryData": [
        #     {
        #         "PayerType": "Sender",
        #         "CargoType": "Documents",
        #         "Services": {
        #             "Attorney": true,
        #             "WaybillNewPostWithStamp": true,
        #             "UserActions": "UserCallSender"
        #         }
        #     }
        # ]
        process opts
      end

      def get_document_list(opts = {})
        now = Time.now
        format = lambda { |a| a.strftime('%d.%m.%Y') }
        opts[:date_time_from] ||= format[now - 1.month]
        opts[:date_time_to] ||= format[now]
        opts[:redelivery_money] ||= "1"
        opts[:page] ||= "1"
        process opts
      end

      def pdf_url(ttn)
        "https://my.novaposhta.ua/orders/printDocument/orders[]/#{ttn}/type/pdf/apiKey/#{Novaposhta::Base.api_key}"
      end

    end

  end
end
