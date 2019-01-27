module Novaposhta
  class InternetDocument < Base

    def self.save
      req({"PayerType": "Sender",
                    "PaymentMethod": "Cash",
                    "DateTime": "20.07.2016",
                    "CargoType": "Cargo",
                    "VolumeGeneral": "0.1",
                    "Weight": "10",
                    "ServiceType": "WarehouseDoors",
                    "SeatsAmount": "1",
                    "Description": "Гантелі",
                    "Cost": "1",
                    "CitySender": "8d5a980d-391c-11dd-90d9-001a92567626",
                    "Sender": "130b0760-c998-11e5-9e52-0025909b4e33",
                    "SenderAddress": "7b422fbe-e1b8-11e3-8c4a-0050568002cf",
                    "ContactSender": "de339d8c-c999-11e5-83bc-005056886752",
                    "SendersPhone": "380443555555",
                    "CityRecipient": "db5c88de-391c-11dd-90d9-001a92567626",
                    "Recipient": "640a049d-2d3a-11e6-bbb6-005056886752",
                    "RecipientAddress": "58428745-0862-11e6-bbb6-005056886752",
                    "ContactRecipient": "7f0cfa9e-315f-11e6-bbb6-005056886752",
                    "RecipientsPhone": "380637301196",
                    "BackwardDeliveryData": [
                        {
                            "PayerType": "Sender",
                            "CargoType": "Documents",
                            "Services": {
                                "Attorney": true,
                                "WaybillNewPostWithStamp": true,
                                "UserActions": "UserCallSender"
                            }
                        }
                    ]})
    end

    def self.get_document_list
      req "DateTimeFrom": "21.01.2019",
                       "DateTimeTo": "26.01.2019",
                       "RedeliveryMoney": "1"
    end
  end
end
