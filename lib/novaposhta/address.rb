module Novaposhta
  class Address < Base

    class << self
      def get_cities(find_by_string = nil)
        if find_by_string
          req find_by_string: find_by_string
        else
          req
        end
      end

      def find_city(name)
        get_cities name
      end

      # населенные пункты
      def get_settlements opts = {}
        req opts
      end

      # области
      def get_areas opts = {}
        req opts
      end

      # отделения и типы компании
      def get_warehouses opts = {}
        req opts
      end

      # улицы
      def get_street(city_ref, find_by_string = nil, opts={})
        dopts = {}
        dopts[:city_ref] = city_ref
        dopts[:find_by_string] = find_by_string if find_by_string
        req opts.merge dopts
      end

      def kiev
        find_city('Киев').data.first
      end
    end
  end
end
