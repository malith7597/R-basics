#use dbConnect() function to connect the db on local host.
library("RMySQL")  
mysql_connect = dbConnect(MySQL(), user = 'root', password = '', dbname = 'ev_cars',  host = 'localhost') 
record = dbSendQuery(mysql_connect, "select * from ev_cars")
data_frame= fetch(record,n=15)
 print(data_frame)

#clear previous data_frame
dbClearResult(dbListResults(mysql_connect)[[1]])
record2=dbSendQuery(mysql_connect, "select * from ev_cars where Seats=5 and TopSpeed_KMH>=200")
data_frame= fetch(record2)
print(data_frame)

dbClearResult(dbListResults(mysql_connect)[[1]])
record3=dbSendQuery(mysql_connect, "select AVG(Range_Km) as Average_rage ,Efficiency_Whkm as Efficiency, BodyStyle from ev_cars group by BodyStyle")
data_frame=fetch(record3)
print(data_frame)

record4=dbSendQuery(mysql_connect, "select Model,AccelSec from ev_cars where Segment='F'")
data_frame=fetch(record4)
print(data_frame)

record5=dbSendQuery(mysql_connect, "select MAX(`Battery_Pack Kwh`) As Max_Battery_pack,MIN(FastCharge_KmH) as Min_fast_charge from ev_cars 
                    where BodyStyle= 'Hatchback'")
data_frame=fetch(record5)
print(data_frame)

record6=dbSendQuery(mysql_connect, "select Model from ev_cars where Brand LIKE 'S%' and PriceEuro<40000")
data_frame=fetch(record6)
print(data_frame)

install.packages("dbplyr")
library(dbplyr)
con<-dbConnect(RMySQL::MySQL(), dbname="ev_cars",host="localhost",user="root",password="")
ev_cars_db<-tbl(con,"ev_cars")
first_fifteen<-ev_cars_db %>% filter(row_number() %in% c(1:15))
View(first_fifteen)

f2<-ev_cars_db %>% filter(Seats==5 & TopSpeed_KmH>=200) %>% show_query()
print(f2)

f2<-ev_cars_db %>%  group_by(BodyStyle) %>% summarize( Efficiency_WhKm,Mean= mean(Range_Km,na.rm = True)) %>% show_query()

f3<-ev_cars_db %>% filter(Segment=='F') %>% select(Model, AccelSec) %>% show_query()
print(f3)

f4<-ev_cars_db %>% filter(BodyStyle=="Hatchback") %>% mutate(Max_Battery_Pack=max(`Battery_Pack Kwh`),Min_Fast_Charge=min(FastCharge_KmH)) %>% 
  select(Max_Battery_Pack,Min_Fast_Charge)  %>%show_query()

f4<-ev_cars_db %>% filter(PriceEuro<40000,str_detect(Brand, "^S")) %>% show_query()

x= dbSendQuery(mysqlconnect, "select Seats,count(*) as count from ev_cars group by(Seats)")
data_frame= fetch(x)
pie(data_frame$Seats,main="Propotion of Cars against no of seats")

record2= dbSendQuery(mysqlconnect, "select AccelSec,Range_Km from ev_cars")
data_frame= fetch(record2)
plot(x=data_frame$AccelSec, y=data_frame$Range_Km,xlab="Accelaration", ylab="Range")


record3= dbSendQuery(mysqlconnect, "select FastCharge_KmH,BodyStyle from ev_cars group by(BodyStyle)")
data_frame= fetch(record3)
boxplot(FastCharge_KmH~BodyStyle, data = data_frame, xlab = "Body Style", ylab = "Fast Charge", main = "Fast Charge Vs Body Style")

record3= dbSendQuery(mysqlconnect, "select BodyStyle,count(*) as no_of_cars from ev_cars group by(BodyStyle)")
data_frame= fetch(record3)
barplot(data_frame$no_of_cars,names.arg=data_frame$BodyStyle, ylab="No of Cars",xlab="Body Styles", beside = TRUE)





