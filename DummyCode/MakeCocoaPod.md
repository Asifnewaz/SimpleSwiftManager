# CocoaPods

## Prepare POD's Template and Data
**Step 1:** Create New POD Template and follow instruction
```bash
pod lib create POD_NAME
```

* Step 1.1: Now you can add your class/assets or other staff in pods Development Pods section

**Step 2:** Create New Git Repo then add the library to git

**Step 3:** Push The new pod template project to git

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
