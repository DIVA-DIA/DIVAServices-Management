Delayed::Worker.class_eval do

  def handle_failed_job_with_notification(job, error)
    handle_failed_job_without_notification(job, error)
    ExceptionNotifier.notify_exception(error)
  end

  alias_method_chain :handle_failed_job, :notification
  Delayed::Worker.logger ||= Logger.new(File.join(Rails.root, 'log', 'delayed_job_production.log'), 10, 100*1024*1024)
end
