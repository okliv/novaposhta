module Novaposhta
  class Address < Base

    class << self
      def get_cities(find_by_string = nil)
        if find_by_string
          process find_by_string: find_by_string
        else
          process
        end
      end

      def find_city(name)
        get_cities name
      end

      # населенные пункты
      def get_settlements(opts = {})
        process opts
      end

      # области
      def get_areas(opts = {})
        process opts
      end

      # отделения и типы компании
      def get_warehouses(opts = {})
        process opts
      end

      # улицы
      def get_street(city_ref, find_by_string = nil, opts={})
        dopts = {}
        dopts[:city_ref] = city_ref
        dopts[:find_by_string] = find_by_string if find_by_string
        process opts.merge dopts
      end

      def kiev
        @kiev ||= find_city('Киев').data.first
      end

      def kiev_warehouses
        @kiev_warehouses ||= get_warehouses(city_ref: kiev.ref).data
      end

      def kiev_warehouse(number)
        kiev_warehouses.find{|w| w.number==number.to_s}
      end

    end
  end
end
