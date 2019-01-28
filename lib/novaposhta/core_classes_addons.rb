class Hash

  def deep_transform_keys(&block)
    result = {}
    each do |key, value|
      result[yield(key)] = if value.is_a?(Hash)
        value.deep_transform_keys(&block)
      else
        if value.is_a?(Array)
          value.map { |e| e.is_a?(Hash) ? e.deep_transform_keys(&block) : e }
        else
          if (Float(value) rescue nil) == value.to_s
            Float(value)
          elsif (Integer(value) rescue nil) == value.to_s
            Integer(value)
          else
            value
          end
        end
      end
    end
    result
  end

end

class String

  def camelize(first_letter = :upper)
    case first_letter
    when :upper
      ActiveSupport::Inflector.camelize(self, true)
    when :lower
      ActiveSupport::Inflector.camelize(self, false)
    else
      raise ArgumentError, "Invalid option, use either :upper or :lower."
    end
  end

  def underscore
    ActiveSupport::Inflector.underscore(self)
  end

end

class Symbol

  def camelize
    to_s.camelize
  end

  def underscore
    to_s.underscore
  end

end
