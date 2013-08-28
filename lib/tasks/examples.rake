namespace :examples do
  desc "Display a user-creation histogram"
  task histogram: :environment do
    ######################
    # Create a histogram
    # 

    # Create an empty hash with default value as an empty array
    date_hash = Hash.new { |hash, key| hash[key] = [] }
    # For each user in the system...
    User.all.each do |user|
      # add an entry with the date as the key, and the values are 
      # arrays of users
      date_hash[user.created_at.to_date] << user 
    end

    #########################
    # Display the histogram
    #

    # Starting from 30 days ago
    starting = 30.days.ago.to_date
    # Ending today
    ending = Date.today
    # For each day between starting and ending...
    (starting..ending).each do |day|
      # print a line:
      # 2013-8-10: ********
      puts "#{day}: #{'*' * date_hash[day].count}"  
    end
  end
end