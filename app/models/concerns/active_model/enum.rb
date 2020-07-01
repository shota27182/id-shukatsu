module ActiveModel
  module Enum
    extend ActiveSupport::Concern

    module ClassMethods
      def enum(definitions)
        raise ArgumentError, 'enum attribute: { key: value, key, value, ...} の形式で指定してください' unless valid?(definitions)

        attribute = definitions.keys.first
        values = definitions.values.first

        # getterを上書き
        define_method(attribute.to_s) do
          values.invert[attributes[attribute.to_s]]
        end

        # 既存のsetterを別名に退避
        alias_method "#{attribute}_value=", "#{attribute}="

        # setterを上書き
        define_method("#{attribute}=") do |argument|
          checked_argument = case argument
                             when Integer
                               values.values.include?(argument) ? argument : nil
                             when String
                               values[argument.to_sym]
                             when Symbol
                               values[argument]
                             else
                               raise ArgumentError, 'string, symbol, integerのいずれかを指定してください'
                             end
          raise ArgumentError, "'#{argument}' is not a valid #{attribute}" if checked_argument.nil?

          send("#{attribute}_value=", checked_argument)
        end

        # enum_helpの_i18n的なメソッド追加
        define_method("#{attribute}_i18n") do
          enumed_value = send(attribute)
          I18n.t("enums.#{self.class.name.underscore}.#{attribute}.#{enumed_value}", default: enumed_value.to_s)
        end
      end

      private

      def valid?(definitions)
        return false unless definitions.is_a?(Hash)
        return false if definitions.keys.size != 1

        values = definitions.values.first
        return false unless values.is_a?(Hash)
        return false unless values.keys.all? { |key| key.is_a?(Symbol) }
        return false unless values.values.all? { |value| value.is_a?(Integer) }

        true
      end
    end
  end
end