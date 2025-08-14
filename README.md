# VR Point Cloud File Visualizer

## Table of Contents
- [About](https://github.com/LorelaiDavis/RAZR_PointCRep?tab=readme-ov-file#about)
- [Getting Setup](https://github.com/LorelaiDavis/RAZR_PointCRep?tab=readme-ov-file#getting-setup)
  - [Headset setup](https://github.com/LorelaiDavis/RAZR_PointCRep?tab=readme-ov-file#headset-setup)
  - [Software setup](https://github.com/LorelaiDavis/RAZR_PointCRep?tab=readme-ov-file#software-setup)
  - [Opening & Running the project](https://github.com/LorelaiDavis/RAZR_PointCRep?tab=readme-ov-file#opening--running-the-project)
- [Features](https://github.com/LorelaiDavis/RAZR_PointCRep?tab=readme-ov-file#features)
- [FAQ](https://github.com/LorelaiDavis/RAZR_PointCRep?tab=readme-ov-file#faq)
- [Documents](https://github.com/LorelaiDavis/RAZR_PointCRep?tab=readme-ov-file#documents)

## About
RAZR_PointCRep is a simple VR application for turning pcd file data into visible 3d point clouds. The application uses the open source library [Stereokit](https://github.com/StereoKit/StereoKit)<br>
Made June 2nd - August 9th 2025 for summer internship by Lorelai Davis

## Getting setup
#### Headset setup
> Note : These are required to install applications on specifically on the Meta Quest
1. Join/Create an organization for meta quest account
2. Enable developer mode 
   - Settings > Advanced Settings > Enable developer settings
#### Software setup
> More in-depth instruction can be found on [meta](https://developers.meta.com/horizon/documentation/native/android/mobile-device-setup) & [Stereokit's own website](https://stereokit.net/Pages/Guides/Getting-Started.html)
1. **Install adb**
   - [Meta developer website](https://developers.meta.com/horizon/documentation/native/android/mobile-device-setup#install-the-oculus-adb-drivers-windows-only)
   - [Android developer website](https://developer.android.com/tools/adb)
   - Using [Chocolatey](https://chocolatey.org/install) and installing via command line
      ````
      choco install adb
      ````
2. **Install .NET sdk**
      ````
      winget install Microsoft.DotNet.SDK.9
      ````
3. **Install Visual Studio 2022**
   <br>**Make sure to install the workloads**<br>
   - Azure development
   - .Net multiplatform app UI Development
   - .Net desktop development
   <br>**++Individual Components**<br>
   - USB device connectivity
#### Opening & running the project
1. Copy this github repository onto your computer
2. Locate the RAZR_PointCRep.Android.csproj in file explorer and double click the csproj file to open in visual studio
   - enable show all files if not all files are appearing in the solution explorer
   - If you want access to the assets folder, additionally open the other csproj in the same solution explorer
3. Set Android as setup project, if everything is set up correctly you should be able to run it in the editor
![Screenshot](Media/VisualStudioRun.png)

## Features
**This project has 3 main features**
1. ShowPointCloud
   - Creates a point cloud using a model or from a pcd file (binary of ascii)
   - Adjustable point cloud size, point size, & ability to switch between perspective and fixed
   - HTML loading option to get pcd data from website
2. ShowModel
   - Prints model into world you can grab & move around
3. Spatial Anchors
   - User can manually place spatial anchors into the world for digital objects to be placed at

## FAQ
### My visual studio isn't showing an option for me to run
  That's alright! There are other ways to install the application into the headset both include creating an apk file of our android csproj<br>
  you can use adb install via command line
  ````
  adb devices
  # check out device is recognized
  adb install .\path\to\file\name_of_apk.apk
  ````
  or you can use the [Meta Quest Developer Hub](https://developers.meta.com/horizon/downloads/package/oculus-developer-hub-win/), my personal reccomendation out of the two

### Which files do what
  #### Program.cs
  - Think of this almost as your "main class", stuff implemented here will stay throughout the entire play time. This is where spatial anchors and passthrough are called
  #### [Program Classes folder](https://github.com/LorelaiDavis/RAZR_PointCRep/tree/main/Projects/Android/Program%20Classes)
  - These contain classes implementing the IClass interface that will appear in the class menu when using the application
  #### [Spatial Anchor folder](https://github.com/LorelaiDavis/RAZR_PointCRep/tree/main/Projects/Android/Spatial%20Anchor)
  - Contains all files related to spatial anchors
  #### [Tools folder](https://github.com/LorelaiDavis/RAZR_PointCRep/tree/main/Projects/Android/Tools)
  - Files such as IClass, Menu Sort for the Asset Menu's, and PassthroughFBExt to enable passthrough on the meta quest

### When I'm using the binary point cloud in play, it's freezing
  As of the most recent commit the binary point cloud, on release builds, takes about 8 seconds to load and, on debug builds, about 16.
  <br>My best tip is as it loads, stay still as the point cloud loads to reduce visual strain and wait a maximum of 20 seconds. If it has not loaded by then, exit out of the program and rebuild it to try again.

### The application exits when I exit out of the HTTP point cloud
  The application *sometimes* crashes when you try to switch out of the HTTP point cloud. If this happens rebuild it on a debug build instead of release.


## Documents
[Test Video](https://drive.google.com/file/d/14J-0k_106lZS49GJQJL0jk1Cz-1NNrQF/view?usp=sharing) <br>
[Current github for HTTP Loading](https://github.com/LorelaiDavis/PCDDataTest) - using github raw link of the pcd file <br>
[Powerpoint Presentation](https://github.com/LorelaiDavis/RAZR_PointCRep/blob/main/Media/LorelaiDavisSummer2025-PCD-VR.pptx) - final presentation of project <br>
[Research Document](https://github.com/LorelaiDavis/RAZR_PointCRep/blob/main/Media/VR%20headset%20research.docx) - Initial Research, includes other platforms that can be used and a list of stereokit dependencies
