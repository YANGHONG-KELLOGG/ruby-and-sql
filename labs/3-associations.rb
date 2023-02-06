# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

puts "Activities: #{Activity.all.count}"


# first query to find a salesperson row in the salespeople table
ben = Salesperson.find_by({"first_name" => "Benjamin", "last_name" => "Block"})

# next, query to find a contact row in the contacts table
cook = Contact.find_by({"first_name" => "Tim", "last_name" => "Cook"})

activity = Activity.new
activity["salesperson_id"] = ben["id"]
activity["contact_id"] = cook["id"]
activity["note"] = "quick checkin over facetime"
activity.save

activity = Activity.new
activity["salesperson_id"] = ben["id"]
activity["contact_id"] = cook["id"]
activity["note"] = "met at Cupertino"
activity.save

bezos = Contact.find_by({"first_name" => "Jeff", "last_name" => "Bezos"})

activity = Activity.new
activity["salesperson_id"] = ben["id"]
activity["contact_id"] = bezos["id"]
activity["note"] = "met at Blue Origin HQ"
activity.save

puts "Activities: #{Activity.all.count}"

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

puts "Activities between Ben and Tim Cook:"
activities = Activity.where({"salesperson_id" => ben["id"],  "contact_id" => cook["id"]})

#activities = Activity.find_by({"contact_id"=>cook["id"]}) --- wrong, why not find_by???

for active in activities
puts "#{active["note"]}"
end

# or

for activity in activities
    # read the note column from the row
    note = activity["note"]
  
    # display a string with the note
    puts "- #{note}"
  end

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino



# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

puts "Ben's Activities:"

activities = Activity.where({"salesperson_id" => ben["id"]})

puts activities.inspect

for activity in activities
    # query to find the contact for this activity
    contact = Contact.find_by({"id" => activity["contact_id"]})
  
    # read the first_name and last_name columns from the contact row
    contact_first_name = contact["first_name"]
    contact_last_name = contact["last_name"]
    
    # read the note column from the activity row
    note = activity["note"]
  
    # display a string with the contact's full name and note
    puts "#{contact_first_name} #{contact_last_name} - #{note}"
  end

#e.g. apple_contacts = Contact.where({ "company_id" => apple["id"] })

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

#contact["company_id"] = apple["id"]

for activity in activities
    # query to find the contact for this activity
    contact = Contact.find_by({"id" => activity["contact_id"]})
    company = Company.find_by({"id" => contact["company_id"]})

    # read the first_name and last_name columns from the contact row
    contact_first_name = contact["first_name"]
    contact_last_name = contact["last_name"]
    company_name = company["name"]
    

  # query to find the company for this contact
  #company = Company.where({"id" => contact["company_id"]}) ---wrong, why ????
# SINCE here we need a list of activities, not the first one


    # read the note column from the activity row
    note = activity["note"]
  
    # display a string with the contact's full name and note
    puts "#{contact_first_name} #{contact_last_name} (#{company_name}) - #{note}"
  end




# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

salespeople = Salesperson.all

for salesperson in salespeople
    # query to find all rows in activities with relationship to salesperson
    activities = Activity.where({"salesperson_id" => salesperson["id"]})
    # get the count
    number_of_activities = activities.count
  
    # display count of results
    puts "#{number_of_activities} activities"
  
    # display count of results
    puts "#{salesperson["first_name"]} #{salesperson["last_name"]}: #{activities.count} activities"
  end

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
