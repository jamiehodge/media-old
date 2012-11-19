require "logger"

module Media
  module Job
    module Queueable

      module ClassMethods

        def enqueue(queue, args)
          queue.enqueue("#{self.name}.perform", args)
        end

        def perform(args)
          new(args).perform
        end
      end

      module InstanceMethods
        def logger
          Logger.new(STDOUT)
        end
      end

      def self.included(receiver)
        receiver.extend ClassMethods
        receiver.send(:include, InstanceMethods)
      end
    end
  end
end
