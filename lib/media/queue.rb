require "queue_classic"

module Media
  module Queue
    Default = QC.default_queue
    Failed = QC::Queue.new("queue_classic_failed_jobs")
    
    class Worker < QC::Worker
      def handle_failure(job, exception)
        Failed.enqueue(job[:method], *job[:args])
      end
    end
  end
end

