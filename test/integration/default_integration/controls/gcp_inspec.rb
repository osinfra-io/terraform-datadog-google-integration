# Chef InSpec
# https://www.chef.io/inspec

# Since this is the default test, we want to test as much as possible here and not be redundant in the other tests.

project = input('project')

control 'google_logging_project_sink' do
  title 'Google Logging Project Sink'

  # Logging Project Sink Resource
  # https://docs.chef.io/inspec/resources/google_logging_project_sink

  describe google_logging_project_sink(project: project, name: 'export-logs-to-datadog') do
    it { should exist }
  end
end

control 'google_pubsub_subscription' do
  title 'Google Pubsub Subscription'

  # Pubsub Subscription Resource
  # https://docs.chef.io/inspec/resources/google_pubsub_subscription

  describe google_pubsub_subscription(project: project, name: 'export-logs-to-datadog') do
    it { should exist }
  end
end

control 'google_pubsub_topic' do
  title 'Google Pubsub Topic'

  # Pubsub Topic Resource
  # https://docs.chef.io/inspec/resources/google_pubsub_topic

  describe google_pubsub_topic(project: project, name: 'export-logs-to-datadog') do
    it { should exist }
  end
end

control 'google_service_account' do
  title 'Google Service Account'

  # Service Account Resource
  # https://docs.chef.io/inspec/resources/google_service_account

  describe google_service_account(project: project, name: "datadog@#{project}.iam.gserviceaccount.com") do
    it { should exist }
  end
end
