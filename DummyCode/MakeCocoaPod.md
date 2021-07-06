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


## Publish Public POD:

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


## Publish Private POD:
`Before Proceed please note that to keep pod private both repo needs to be private repo.`

**Step 1:** Create a new folder to maintaining podspec file.

**Step 2:** Create a private git repo to upload newly created folder.

**Step 3:** Add podspec file inside the folder.

**Step 4:** Push the newly created folder containing podspec file to git.

**Step 5** Test POD:
  * Create new project
  * init pod
  * open pod file
  * add source of the private pod, like
```bash
source 'https://github.com/Asifnewaz/TestPodSpec.git'
```
  * Here  source link must be the link of the repo that contains only pod spec file
  * then inside   `use_frameworks!` add following line
```bash
pod 'POD_NAME'
```
  * save pod file, Enter the following comman
```bash
pod install
```


## Reference 
* [CocoaPods](https://guides.cocoapods.org/making/making-a-cocoapod.html)
* [Tuts Tutorial](https://code.tutsplus.com/tutorials/creating-your-first-cocoapod--cms-24332)
* [Cocoapods Tutorial - Create Launch and Maintain (part 1)](https://www.youtube.com/watch?v=u8pHhxZ6BvE)
* [CocoaPods Swift - Create, Launch and Maintain](https://www.youtube.com/watch?v=_Y5tJcc6g-s)
* [How to Create a CocoadPods Library to share code](https://www.youtube.com/watch?v=LqPCpAZaCME)
* [Here's How to Easily Setup your Private CocoaPods Repository](https://www.youtube.com/watch?v=atNlyV8Xkm0)
