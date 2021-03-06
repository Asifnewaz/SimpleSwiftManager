# Filter With Crop 

## using `applyingCIFiltersWithHandler` method 

```objc
- (void) addFilterWithCrop: (CGRect)cropRect {
    //Link: https://stackoverflow.com/questions/42165964/not-applying-cifilter-on-video-properly
    
    AVAssetTrack *FirstAssetTrack = [[self.asset tracksWithMediaType:AVMediaTypeVideo] objectAtIndex:0];
    CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectInstant"];
    //CGFloat deviceWidth = UIScreen.mainScreen.bounds.size.width;
    CGFloat cropOffX = cropRect.origin.x;
    CGFloat cropOffY = cropRect.origin.y;
    CGFloat cropWidth = cropRect.size.width;
    CGFloat cropHeight = cropRect.size.height;

    UIImageOrientation videoOrientation = [self getVideoOrientationFromAsset:self.asset];

    CGAffineTransform t1 = CGAffineTransformIdentity;
    CGAffineTransform t2 = CGAffineTransformIdentity;

    switch (videoOrientation) {
        case UIImageOrientationUp:
            t1 = CGAffineTransformMakeTranslation(FirstAssetTrack.naturalSize.height - cropOffX, 0 - cropOffY );
            t2 = CGAffineTransformRotate(t1, M_PI_2 );
            break;
        case UIImageOrientationDown:
            t1 = CGAffineTransformMakeTranslation(0 - cropOffX, FirstAssetTrack.naturalSize.width - cropOffY ); // not fixed width is the real height in upside down
            t2 = CGAffineTransformRotate(t1, - M_PI_2 );
            break;
        case UIImageOrientationRight:
            t1 = CGAffineTransformMakeTranslation(0 - cropOffX, 0 - cropOffY );
            t2 = CGAffineTransformRotate(t1, 0 );
            break;
        case UIImageOrientationLeft:
            t1 = CGAffineTransformMakeTranslation(FirstAssetTrack.naturalSize.width - cropOffX, FirstAssetTrack.naturalSize.height - cropOffY );
            t2 = CGAffineTransformRotate(t1, M_PI  );
            break;
        default:
            NSLog(@"no supported orientation has been found in this video");
            break;
    }

    CGAffineTransform finalTransform = t2;

    AVMutableVideoComposition *comosition = [AVMutableVideoComposition videoCompositionWithAsset:self.asset applyingCIFiltersWithHandler:^(AVAsynchronousCIImageFilteringRequest * _Nonnull request) {
        // Step 1: get the input frame image (screenshot 1)
        CIImage *sourceImage = request.sourceImage;

        // Step 2: rotate the frame
        CIFilter *transformFilter = [CIFilter filterWithName:@"CIAffineTransform"];
        [transformFilter setValue:sourceImage forKey: kCIInputImageKey];
        [transformFilter setValue: [NSValue valueWithCGAffineTransform: finalTransform] forKey: kCIInputTransformKey];
        sourceImage = transformFilter.outputImage;
        CGRect extent = sourceImage.extent;
        
        // Step 3: apply the custom filter chosen by the user
        extent = sourceImage.extent;
        sourceImage = [sourceImage imageByClampingToExtent];
        [filter setValue:sourceImage forKey:kCIInputImageKey];
        sourceImage = filter.outputImage;
        sourceImage = [sourceImage imageByCroppingToRect:extent];

        
        // Step 4: finish processing the frame (screenshot 2)
        [request finishWithImage:sourceImage context:nil];

    }];
    
    comosition.renderSize = CGSizeMake(cropWidth, cropHeight);
    self.customComosition = comosition;
    self.item.videoComposition = comosition;
}


- (UIImageOrientation)getVideoOrientationFromAsset:(AVAsset *)asset {
    AVAssetTrack *videoTrack = [[asset tracksWithMediaType:AVMediaTypeVideo] objectAtIndex:0];
    CGSize size = [videoTrack naturalSize];
    CGAffineTransform txf = [videoTrack preferredTransform];

    if (size.width == txf.tx && size.height == txf.ty)
        return UIImageOrientationLeft; //return UIInterfaceOrientationLandscapeLeft;
    else if (txf.tx == 0 && txf.ty == 0)
        return UIImageOrientationRight; //return UIInterfaceOrientationLandscapeRight;
    else if (txf.tx == 0 && txf.ty == size.width)
        return UIImageOrientationDown; //return UIInterfaceOrientationPortraitUpsideDown;
    else
        return UIImageOrientationUp;  //return UIInterfaceOrientationPortrait;
}

```

## using `applyingCIFiltersWithHandler` method2

```objc

- (AVMutableVideoComposition *)getCompositionWithCIFilter {

    CIFilter *filter = [CIFilter filterWithName:filterName];
    AVMutableVideoComposition *composition = [AVMutableVideoComposition videoCompositionWithAsset:asset applyingCIFiltersWithHandler:^(AVAsynchronousCIImageFilteringRequest * _Nonnull request) {
        CIImage *source = request.sourceImage.imageByClampingToExtent;
        if([filterName isEqual:@"CIGaussianBlur"]){
            
            int currentTime = (int)(request.compositionTime.value / request.compositionTime.timescale);
            if (currentTime < 3) {
                [request finishWithImage:source context:nil];
            } else {
                [filter setValue:source forKey:kCIInputImageKey];
        
                CIImage *output = [filter.outputImage imageByCroppingToRect:request.sourceImage.extent];
                [request finishWithImage:output context:nil];
            }
        } else if([filterName isEqual:@"CIPhotoEffectInstant"]) {
            [filter setValue:source forKey:kCIInputImageKey];
    
            CIImage *output = [filter.outputImage imageByCroppingToRect:request.sourceImage.extent];
            [request finishWithImage:output context:nil];
        }
    }];
    return composition;
}

```
