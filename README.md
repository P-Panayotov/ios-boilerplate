# Boilerplate for Fire iOS apps
This project includes the bare minimum to start a fresh iOS app.
The following frameworks are included:
  1. Alamofire
  2. OjectMapper
 
# Renaming the project

## Step 1 - Rename the project.
   1. Click on the project you want to rename in the “project navigator” on the left of the Xcode view.
   2. On the right select the “file inspector” and the name of your project should be in there under “Identity and Type”, change it to the new name.
   3. A drop down appears, with a “rename” ok box
   4. Click rename.

## Step 2 - Rename the Scheme
  1. In the top bar, just by the “Stop” button, is the scheme for your OLD product, click this then “manage schemes”
  2. Click on the OLD name in the scheme, and it will become editable, change the name. If you click it twice, you go into the editor (which you don’t want) click the manage schemes button to get back again.
  
## Step 3 - Rename the folder with your assets
  1. Quit out of Xcode
  2. In the correctly names master folder, there is your newly named xcodeproj file with the the wrongly named OLD folder. Rename the OLD folder to your new name
  3. Reopen the project and you get a warning “The folder OLD does not exist”, dismiss the warning
  4. On the left in the “project navigator” click the top level OLD folder name.
  5. On the right in the “file navigator” under “Identity and type” you will see the “Name” entry change this from the OLD to the new name
  6. Just under this is the “location” entry, just below that is a folder symbol with the OLD name. click this and chose the newly renamed folder

## Step 4 - Rename the Build plist data
  1. Click on the project in the “project inspector” on the left, in the centre panel select “Build Settings”
  2. in this section search for plist
  3. Under packaging, you will see Info.plist, and Product bundle identifier.
  4. in Info.plist rename the top entry
  5. click the Product Identifier and do the same
  
## Finally
Clean and Build the project.
