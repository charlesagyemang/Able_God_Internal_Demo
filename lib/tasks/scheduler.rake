namespace :send_message do
    desc "SEND MESSAGE TO MEMBERS"
    task sermon_link: :environment do
      SendTodaysMessageLinkJob.perform_later
    end
end
  