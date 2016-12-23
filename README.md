# Android module | [![build status](https://gitlab.com/space-sh/android/badges/master/build.svg)](https://gitlab.com/space-sh/android/commits/master)

Manages an Android device's filesystem


## /camera/
	Android camera

	Manages Android camera directory

+ ls
+ targz

## /sms/
	Android SMS

	Manages Android SMS/MMS data

+ ls

# Functions 

## ANDROID\_DEP\_INSTALL ()  
  
  
  
Check for module dependencies  
  
### Returns:  
- non-zero on failure  
  
  
  
## ANDROID\_CAMERA\_LS ()  
  
  
  
List Android camera directory  
  
### Parameters:  
- $1: directory path. Defaults to /storage/emulated/0/DCIM/Camera/  
  
  
  
## ANDROID\_CAMERA\_TARGZ ()  
  
  
  
Generate a compressed tar file  
containing Android camera files  
  
### Parameters:  
- $1: directory path. Defaults to /storage/emulated/0/DCIM/Camera/  
  
  
  
