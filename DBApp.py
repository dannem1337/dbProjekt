import mysql.connector

group_number="26" #FILL IN YOUR GROUP NUMBER

mydb = mysql.connector.connect(
  host="127.0.0.1",
  user="ht22_1_group_"+group_number,
  passwd="pwd_26"+group_number,
  database="ht22_1_project_group_"+group_number
)

print("hej")

mycursor = mydb.cursor()
name="\"Golden Nugget\""
mycursor.execute("SELECT EANHotelID, Name FROM Property WHERE Name = "+name)

print("hej1")
myresult = mycursor.fetchall()
print("EANHotelID\t Name")
for x in myresult:
  print(str(x[0])+"\t"+x[1])

mydb.close()
