#!/bin/bash

	#path location needs to be changed if run on TA's Ubuntu machine bcoz "/mnt/e/Shell/myfile.sh" this is my system path for Linux on Windows
	#crontab statmemts
	#crontab -e
	#* * * * * /bin/bash /mnt/e/Shell/myfile.sh
	
	#a=read value from another file variable.txt to maintain global counter for 3 instance of file creation
	
while IFS=' ' read a ;
 do
	break
done < /mnt/e/Shell/variable.txt

	if [ $a -gt 3 ]
	then
		# open previous three files and find the greatest memory consuming process
		#write it into new file memory_log.txt
	   x=1
	   prec=0 #bydefault prev record i.e process mem consumption is assigned as 0
	   f=0
	   while [ $x -lt 4 ]	
	   do
			while IFS=" " read -r rec 
			do
				if [ 1 -eq "$(echo "${rec} >= ${prec}" | bc)" ]
				then 
					f=$x  #to store the file number
					prec=$rec #storing highest memory consuming process
				fi
							
			done  < <(awk '{print $4}' /mnt/e/Shell/file$x.txt | tail -1 )  #capturing column 4 values
			x=`expr $x + 1`
		done
		#printing Current timestamp process name process id total memory consumed in memory_log.txt
		awk '{print $10,$11,$2,$4}' /mnt/e/Shell/file$f.txt | tail -1 >> /mnt/e/Shell/memory_log.txt
		
		#resetting a value in variable.txt for over-writing the process data into the files already created.
		a=1
		echo "$a" > /mnt/e/Shell/variable.txt	
		
	 else
	 #creating 3 file instances with process info 
	ps -aux | sort -nk 4 | tail -5 > /mnt/e/Shell/File$a.txt
	  a=`expr $a + 1`
	 
	  echo "$a" > /mnt/e/Shell/variable.txt
	fi
	

