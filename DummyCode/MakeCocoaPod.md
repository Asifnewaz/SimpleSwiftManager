# CocoaPods

## Prepare POD
Step 1: Create New POD Template and follow instruction
	'pod lib create POD_NAME'

    Step 1.1: Now you can add your class or other staff in pods Development Pods section

Step 2: Create New Git Repo. To add the library to git

Step 3: Push The new pod template project to git

## Publish POD Publically:

Step 1: Register email for pod publish
	'pod trunk register 'Your_Email_address''

Step 2:  Verify pod spec 
	'pod lib lint 'Pod_Spec_file_Name_with_Extension''

Step 3: publish pod globally
	'pod trunk push 'Pod_Spec_file_Name_with_Extension''


Publish POD Privately:
