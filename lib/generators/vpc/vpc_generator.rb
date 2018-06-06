module Stax
  module Examples
    class VpcGenerator < Stax::Generators::Base
      desc 'Create a new stack with VPC and networking.'

      class_option :stack, type: :string, default: 'vpc', desc: 'name of stack to create'
      attr_accessor :cidr_block, :subnets

      source_root File.expand_path('templates', __dir__)

      def create_vpc_files
        @cidr_block = ask('cidr block for vpc?', default: '10.0.0.0/16')
        @subnets = ask('number of subnets to create?', default: '3')
        directory '.', 'cf'
      end

      def add_to_staxfile
        append_to_file 'Staxfile', "stack :#{options[:stack]}"
      end

      private

      def stack_name
        options[:stack]
      end

    end
  end
end