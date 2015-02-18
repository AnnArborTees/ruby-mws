module MWS
  module API

    class Inbound < Base

      def_request [:list_inbound_shipments, :list_inbound_shipments_by_next_token],
        verb: :get,
        uri: '/FulfillmentInboundShipment/2010-10-01',
        version: '2010-10-01',
        mods: [
        ]

      def_request [:list_inbound_shipment_items, :list_inbound_shipment_items_by_next_token],
        verm: :get,
        uri: '/FulfillmentInboundShipment/2010-10-01',
        version: '2010-10-01',
        mods: [
          ->(r) { r.item_data = [r.item_data.member].flatten }
        ]

    end

  end
end
