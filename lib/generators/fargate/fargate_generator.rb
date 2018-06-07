module Stax
  module Generators
    class FargateGenerator < Base
      desc 'Create basic ECS Fargate service'

      class_option :stack, type: :string, default: nil, desc: 'stack to install'

      source_root File.expand_path('templates', __dir__)

      attr_accessor :stack, :vpc, :vpcid, :subnetids

      def check_args
        usage! unless args.empty?
      end

      def ask_for_options
        @stack     = options[:stack] || ask('stack to use or create?', default: 'app')
        @vpc       = ask('vpc stack to connect?', default: 'vpc')
        @vpcid     = ask("vpc export to import from stack #{vpc}?", default: 'VpcId')
        @subnetids = ask("subnet export to import from stack #{vpc}?", default: 'SubnetIds')
      end

      def add_to_staxfile
        append_to_file 'Staxfile', "stack :#{stack}, import: :#{vpc}, include: %w[Ecs Alb Logs]\n"
      end

      def add_templates
        directory '.', 'cf'
      end

      private

      def self.banner(*args)
        "#{basename} generate #{command_name}"
      end

    end
  end
end