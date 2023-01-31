# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

puts "There are #{Company.all.count} companies"

company = Company.new # # the company is like a variable repesented hash, the Company is a model
## company is just a variable name, we can inset different value to this variable 

puts company # without .inspect will not see the actual data

company["name"] = "Apple"
company["city"] = "cupertuno"
company["state"] = "CA"
company["url"] = "https://apple.com"

puts company.inspect

company.save

puts "There are #{Company.all.count} companies"

company = Company.new 
# puts company.inspect 
# 

company["name"] = "Amazon"
company["city"] = "Seattle"
company["state"] = "WA"
company["url"] = "https://AMAZON.com"

company.save

puts "There are #{Company.all.count} companies"



# 1a. check out the schema file
# 1b. check out the model file

# 2. insert new rows in companies table

# 3. query companies table to find all row with California company

all_companies = Company.all # model is Company
puts all_companies.inspect # the output is array!!
puts all_companies[0].inspect # it will be the first item in array

# 4. query companies table to find single row for Apple
cali_company = Company.where({"state"=>"CA"})
puts cali_company.inspect 

apple1 = Company.where({"name"=>"Apple"})[0] # this will not give active record xxxx
apple2 = Company.find_by({"name"=>"Apple"})

puts apple1.inspect
puts apple2.inspect


# RUN THIS:  rails runner code-along/2-models.rb

# 5. read a row's column value
puts apple1["url"]


# 6. update a row's column value

amazon = Company.find_by({"name"=>"Amazon"})
puts amazon.inspect

amazon["url"] = "https://amazon.com"
amazon.save

puts amazon.inspect

# 7. delete a row
# twitter = Company.find_by({"name"=>"Twitter"})
# puts twitter.inspect
# twitter.destroy 


