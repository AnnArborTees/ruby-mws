module MWS
  module API

    class Product < Base
      def_request [:get_matching_product_for_id],
        verb: :get,
        uri: '/Products/2011-10-01',
        version: '2011-10-01',
        lists: {
          id_list: "IdList.Id"
        },
        mods: [
          lambda do |result|
            [result].flatten.each do |r|
              r.products = r.products ? [r.products.product].flatten : [] 
            end
          end
        ],
        singular_marketplace_id: true
    end

  end
end
