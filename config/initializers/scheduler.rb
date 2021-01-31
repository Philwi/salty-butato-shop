require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '10m' do
  ::SyncOrdersJob.perform_later
end
