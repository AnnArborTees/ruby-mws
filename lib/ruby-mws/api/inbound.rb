module MWS
  module API

    class Inbound < Base

      def_request [:list_inbound_shipments, :list_inbound_shipments_by_next_token],
        verb: :get,
        uri: '/FulfillmentInboundShipment/2010-10-01',
        version: '2010-10-01',
        lists: {
          seller_skus: 'SellerSkus.member'
        },
        mods: [
          -> (r) { r.shipment_status_list = [r.shipment_status_list.member].flatten }
        ]

    end

  end
end
