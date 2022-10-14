##Creating and Delecting Files##
ls                                      #list the file in current folder position
mkdir folderName                        #create a new folder
cd folderName                           #navigate in this folder
touch index.html                        #create a new file with touch
touch styles.css script.css             #create multiple files seperate with a space
rm styles.css                           #remove the specific file without put it into the trush
rm script.css index.html                #remove multiple files seperate with a space
cd ..                                   #go to the level up
rmdir folderName                        #remove the folder now is empty we created before

##Introducing Flags and Removing data##
#flag: how the contents in the file should be displayed
ls -s                                   #shows total size of the folder,and specific size of individual file
ls -l                                   #the additional information about the data:creator, the created date
ls -ls                                  #the file size+additional information
man ls                                  #find more flag in the manual, quit the manual demsonstation use Q
rm folderName -r                        #remove the folder which contains data (delect the folder+all files)

##Copying&Moving Files and Folders##
mkdir data                              #create the folder for later operations first
mkdir copied
mkdir moved
cd data                                 #navigate into data folder
touch index.html styles.css             #create two files in data folder
mkdir more-data                         #create more data folder in data folder
cd more-data                            #navigate to more data folder
mkdir script.js                         #create file in more-data folder
cd ..
cd ..                                   #navigate backup
cp data/index.html copied/              #copy srcPath targetPath
cp -r data/ copied/                     #copy all files in data folder to copied folder using cp -r srcPath/ targetPath/ (with the slash is important)
mv data/html moved/                     #move file using mv srcPath targetPath
mv data/more-data moved/                #move the folder use mv srcPath targetPath
mv styles.css style.css                 #rename the file use mv originalName newName

##Core Command Overview##
pwd                                     #print the current working directory
cd (..)                                 #change directory, or go to higher level directory
cd /                                    #go to the root directory
cd ~                                    #go back to home directory, the first firectory you have when selecting a specifc user in your folder structure
cd /Users                               #go to Users directory
r                                       #remove the single file
