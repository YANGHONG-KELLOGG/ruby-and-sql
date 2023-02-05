# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert 1-2 rows in salespeople table.

salesperson = Salesperson.new
salesperson["first_name"] = "Benjamin"
salesperson["last_name"] = "Block"
salesperson["email"] = "ben@test.com"
salesperson.save

salesperson = Salesperson.new
salesperson["first_name"] = "Brian"
salesperson["last_name"] = "Eng"
salesperson["email"] = "brian@test.com"
salesperson.save

# as long as the file is alive, the value for this veriable will be stored.


# 3. write code to display how many salespeople rows are in the database

puts "Salespeople: #{Salesperson.all.count}"
puts "Salespeople: #{Salesperson.count}"


# ---------------------------------
# Salespeople: 2

# 4. modify/update column data for a row in the salespeople table.

brian = Salesperson.find_by({"first_name"=>"Brian"})
brian["email"] = "brian@kellogg.com"


# CHALLENGE:
# 5. write code to display each salesperson's full name


all_salespeople = Salesperson.all

for guys in all_salespeople 
    puts "#{guys["first_name"]} #{guys["last_name"]}"
end

# ---------------------------------
# Salespeople: 2
# Ben Block
# Brian Eng

for salesperson1 in all_salespeople
    # read the relevant columns from the salesperson row
    first_name = salesperson1["first_name"]
    last_name = salesperson1["last_name"]
  
    # display a string with the relevant columns
    puts "#{first_name} #{last_name}"
  end