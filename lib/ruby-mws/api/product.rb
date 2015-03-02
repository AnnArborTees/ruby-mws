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
          lambda do |r|
            r.products = r.products ? [r.products.product].flatten : [] 
            r.products.each do |p|
              p.identifiers    = [p.identifiers.identifier].flatten
              p.attribute_sets = [p.attribute_sets.attribute_set].flatten
              p.relationships  = [p.relationships.relationship].flatten
              p.sales_rankings = [p.sales_rankings.sales_ranking].flatten
            end
          end
        ]
    end

  end
end
