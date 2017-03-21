---
title: /camera/
giturl: gitlab.com/space-sh/android
weight: 200
---
# Android module: Camera

Manages Android camera operations.

## ls
Lists all the camera data on an Android devive.

### Example

Listing all photos:
```sh
space -m android /camera/ls/
```

Output:
```sh
20160605_201618.jpg     20160718_184240.jpg     20161126_154112.jpg             
20160605_201623.jpg     20160723_062932.jpg     20161126_154115.jpg             
20160605_214711.jpg     20160723_160738.jpg     20161126_165628.jpg             
20160605_225046.jpg     20160723_160739.jpg     20161126_165629.jpg             
20160606_085514.jpg     20160726_145734.jpg     20161126_165632.jpg             
20160606_193400.jpg     20160726_145845.jpg     20161126_165633.jpg             
20160607_103126.jpg     20160726_145931.jpg     20161126_165637.jpg             
20160610_125832.jpg     20160726_145940.jpg     20161126_165638.jpg             
20160610_125846.jpg     20160726_145944.jpg     20161126_165639.jpg             
20160610_125915.jpg     20160731_195843.jpg     20161126_165642.jpg             
20160610_125928.jpg     20160731_195920.jpg     20161129_133135.mp4             
20160610_125948.jpg     20160731_204017.jpg     20161129_133158.mp4             
20160611_145921.jpg     20160801_090215.jpg   
```

## targz

Compresses all photos into a new archive.

### Example
Creating a new archive:
```sh
space -m android /camera/targz/
```

Exit status code is expected to be 0 on success.
