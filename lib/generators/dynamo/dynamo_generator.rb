module Stax
  module Generators
    class DynamoGenerator < Base
      desc 'dynamo generator.'

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
      end

      def ask_for_key_schema
        @hash  = ask('hash key?',  default: attributes[0].first)
        @range = ask('range key?', default: attributes[1].first)
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

      # see https://www.rubydoc.info/github/wycats/thor/Thor/Actions for methods

      # def create_file
      #   create_file(filename) do
      #     content
      #   end
      # end

      # def create_template
      #   template(src, dest)
      # end

      # def create_dir
      #   empty_directory(path)
      # end

    end
  end
end