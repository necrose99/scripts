## http://stackoverflow.com/questions/21637282/how-to-find-and-replace-multiple-lines-in-text-file
## made to WALK and replace Ebuild Strings in files ie OLD as dirt EAPI 
## Eventualy 1:1 for depricated strings for now just outdated headers 
## dir Wlaker 
import fnmatch
import os

for root, subFolders, files in os.walk(rootdir,topdown=False):

def listDirs(dir):
    for root, subFolders, files in os.walk(dir, topdown=False):
        for folder in subFolders:
           yield os.path.join(root,folder)
    return

##############
    #!c:/Python31/python.exe -u
    import os
    path = "test"
    for (path, dirs, files) in os.walk(path):
        print (path)
        print ("-----------------")
        if "monitoring" in path:
            dst = path.replace("monitoring", "managing", 10)
            print (dst)
            os.rename(path, dst)
            print ("path----")
        for file in files:
            if "hw" in file:
                print (file)
                dst = file.replace("hw", "hw2", 10)
                os.rename(file, dst)
                print (dst)
                print ("file----")
############## 
### 
data = open("*.ebuild", 'r')
for line in data:
    # fix the line
find = open("find.txt", 'r').readlines()
replace = open("replace.txt", 'r').readlines()
new_data = open("new_data.txt", 'w')
for find_token, replace_token in zip(find, replace):
    new_line = line.replace(find_token, replace_token)
    new_data.write(new_line + os.linesep)
