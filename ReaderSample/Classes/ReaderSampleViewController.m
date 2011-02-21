//
//  ReaderSampleViewController.m
//  ReaderSample
//
//  Created by spadix on 8/4/10.
//

#import "ReaderSampleViewController.h"

@implementation ReaderSampleViewController

@synthesize resultImage, resultText;

- (IBAction) scanButtonTapped {
    UIImagePickerController *reader = [UIImagePickerController new];
    reader.delegate = self;

    [self presentModalViewController: reader animated: YES];
    [reader release];
}

- (void) imagePickerController: (UIImagePickerController*) reader didFinishPickingMediaWithInfo: (NSDictionary*) info {
	UIImage *image = [info objectForKey: UIImagePickerControllerOriginalImage];
	ZBarImage *zimg = [[ZBarImage alloc] initWithCGImage: image.CGImage];
	
	ZBarImageScanner *scanner = [ZBarImageScanner new];
    [scanner setSymbology: 0
				   config: ZBAR_CFG_X_DENSITY
					   to: 3];
    [scanner setSymbology: 0
				   config: ZBAR_CFG_Y_DENSITY
					   to: 3];
	
    int nsyms = [scanner scanImage: zimg];
	
	if (nsyms > 0) {
		id<NSFastEnumeration> results =scanner.results;
		ZBarSymbol *symbol = nil;
		for(symbol in results)
			// EXAMPLE: just grab the first barcode
			break;
		
		resultText.text = symbol.data;
		resultImage.image = image;		
	} else {
		resultText.text = @"Couldn't scan";
	}
	
	[zimg release];
	[scanner release];
		
    [reader dismissModalViewControllerAnimated: YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	[picker dismissModalViewControllerAnimated: YES];
}

- (void)dealloc {
    self.resultImage = nil;
    self.resultText = nil;
    [super dealloc];
}

@end
