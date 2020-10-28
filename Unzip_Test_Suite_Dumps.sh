#! /bin/bash

zipFile='os_fresh.zip'
unzippedFile='os_fresh.sql'
workSpace=$1

changePathsDumpFiles()
{
	#Extracts Institute and User Suite dump file	
	cd $workSpace
	cd src/test/resources/
	unzipTheDump
	
	#Extracts CP suite dump file 
	cd cp
	unzipTheDump

	#Extracts Participants suite dump file. 
	cd ..
	cd participants
	unzipTheDump

	#Extracts Site suite dump file. 
	cd ..
	cd site
	unzipTheDump

	#Extracts User_Roles suite dump file.
	cd ..
	cd user_roles
	unzipTheDump
}

#Unzips database dumps after changing the directories.
unzipTheDump()
{
	if [ -f "$unzippedFile" ]
	then
		rm $unzippedFile
	fi
	unzip $zipFile
	
}

# Script Starts From Here
if [ -d "$workSpace" ] 
then
	changePathsDumpFiles
else
	echo "Please enter the os-api-tests Directory Path through command line!!"
exit		
fi
	

