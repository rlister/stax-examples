module Stax
  module Generators
    class DynamoGenerator < Base
      desc 'Add dynamo table to new or existing stack'

      class_option :stack, type: :string, default: nil, desc: 'stack to install table'

      source_root File.expand_path('templates', __dir__)

      attr_accessor :stack, :table, :id, :attributes, :hash, :range

      def check_args
        usage! unless args.size == 1
        @table = args.first
        @id = "Dyn#{table.capitalize}"
      end

      def ask_for_options
        @stack = options[:stack] || ask('stack to use or create', default: 'dynamo')
      end

      def ask_for_attributes
        @attributes = []
        loop do
          name = ask('attribute name (blank when done)?')
          break if name.empty?
          type = ask('attribute type?', default: 'S')
          @attributes << [name, type]
        end

        abort('Minimum 1 attribute is required') if @attributes.empty?
      end

      def ask_for_key_schema
        @hash  = ask('hash key?',  default: attributes[0].first)
        @range = ask('range key?', default: attributes[1].first) if attributes[1]
      end

      def add_to_staxfile
        append_to_file 'Staxfile', "stack :#{@stack}, include: %w[DynamoDB]\n"
      end

      def append_include_template
        file = File.join('cf', "#{stack}.rb")
        create_file file, "description 'Dynamo tables'\n" unless File.exists?(file)
        append_to_file file, "include_template '#{stack}/dyn_#{table}.rb'\n"
      end

      def create_table_template
        template('dyn.rb.tt', File.join('cf', stack, "dyn_#{table}.rb"))
      end

      private

      def self.banner(*args)
        "#{basename} generate #{command_name} TABLENAME"
      end

    end
  end
end
