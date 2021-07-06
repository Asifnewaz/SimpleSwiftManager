# CocoaPods

## Prepare POD's Template and Data
**Step 1:** Create New POD Template
```bash
pod lib create POD_NAME
```
Enter the command in the terminal, you will be asked a few question that needs to be answered. Questions are like:
* What platform do you want to use?? [ iOS / macOS ]
* What language do you want to use?? [ Swift / ObjC ]
* Would you like to include a demo application with your library? [ Yes / No ]
* Which testing frameworks will you use? [ Specta / Kiwi / None ]
* Would you like to do view based testing? [ Yes / No ]
* What is your class prefix?

After giving answers a new XCode project will be open with pod library configuration.

* Step 1.1: Now you can add your class/assets or other staff inside the following path

`pods > Development Pods > 'Your_Pod_Name' > `


**Step 2:** Create New Git Repo for maintaining source code

**Step 3:** Push the newly created projec file to git.


## Publish POD Publically:

**Step 1:** Register email for pod publish
```bash
pod trunk register 'your_email_address'
```

**Step 2:**  Verify pod spec 
```bash
pod lib lint 'pod_spec_file_name_with_extension'
```

**Step 3:** publish pod globally
```bash
pod trunk push 'pod_spec_file_name_with_extension'
```


Publish POD Privately:
