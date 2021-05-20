# Multiple Firebase Environments in iOS

# FCM Script

```sh

# Name of the resource we're selectively copying
GOOGLESERVICE_INFO_PLIST=GoogleService-Info.plist

# Get references to dev and prod versions of the GoogleService-Info.plist
# NOTE: These should only live on the file system and should NOT be part of the target (since we'll be adding them to the target manually)

# SAN: custoemr
GOOGLESERVICE_INFO_CBWSANF=${PROJECT_DIR}/${TARGET_NAME}/Firebase/cbwalletsanfintech/${GOOGLESERVICE_INFO_PLIST}
# SAN: merchant
GOOGLESERVICE_INFO_CBBSANF=${PROJECT_DIR}/${TARGET_NAME}/Firebase/cbbusinesssan/${GOOGLESERVICE_INFO_PLIST}


#Production: Customer
GOOGLESERVICE_INFO_WPRO=${PROJECT_DIR}/${TARGET_NAME}/Firebase/WalletProd/${GOOGLESERVICE_INFO_PLIST}
#Production: merchant
GOOGLESERVICE_INFO_BPRO=${PROJECT_DIR}/${TARGET_NAME}/Firebase/BusinessProd/${GOOGLESERVICE_INFO_PLIST}



# NEW Make sure the CB Wallet SAN version of GoogleService-Info.plist exists
# SAN: custoemr
echo "Looking for ${GOOGLESERVICE_INFO_PLIST} in ${GOOGLESERVICE_INFO_CBWSANF}"
if [ ! -f $GOOGLESERVICE_INFO_CBWSANF ]
then
echo "No SAN Wallet GoogleService-Info.plist found. Please ensure it's in the proper directory."
exit 1
fi

# SAN: merchant
echo "Looking for ${GOOGLESERVICE_INFO_PLIST} in ${GOOGLESERVICE_INFO_CBBSANF}"
if [ ! -f $GOOGLESERVICE_INFO_CBBSANF ]
then
echo "No SAN Wallet GoogleService-Info.plist found. Please ensure it's in the proper directory."
exit 1
fi


#Production: Customer
echo "Looking for ${GOOGLESERVICE_INFO_PLIST} in ${GOOGLESERVICE_INFO_WPRO}"
if [ ! -f $GOOGLESERVICE_INFO_WPRO ]
then
echo "No Wallet Pro GoogleService-Info.plist found. Please ensure it's in the proper directory."
exit 1
fi

#Production: merchant
echo "Looking for ${GOOGLESERVICE_INFO_PLIST} in ${GOOGLESERVICE_INFO_BPRO}"
if [ ! -f $GOOGLESERVICE_INFO_BPRO ]
then
echo "No Business Pro GoogleService-Info.plist found. Please ensure it's in the proper directory."
exit 1
fi

# Get a reference to the destination location for the GoogleService-Info.plist
PLIST_DESTINATION=${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app
echo "Will copy ${GOOGLESERVICE_INFO_PLIST} to final destination: ${PLIST_DESTINATION}"

#Copy over the prod GoogleService-Info.plist for Release builds
if [ "${CONFIGURATION}" == "Release" ]
then
echo "Using ${GOOGLESERVICE_INFO_WPRO}"
cp "${GOOGLESERVICE_INFO_WPRO}" "${PLIST_DESTINATION}"
else
echo "Using ${GOOGLESERVICE_INFO_CBWSANF}"
cp "${GOOGLESERVICE_INFO_CBBWSANF}" "${PLIST_DESTINATION}"
fi

```

## Reference

* [Meduim](https://medium.com/rocket-fuel/using-multiple-firebase-environments-in-ios-12b204cfa6c0)
