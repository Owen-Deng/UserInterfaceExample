//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Owen on 8/29/23.
//

#import "ImageModel.h"

@interface ImageModel()

@property (strong, nonatomic) NSArray* imageNames;

@end


@implementation ImageModel

@synthesize imageNames = _imageNames;

NSMutableDictionary* _imageDict =  nil;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate,^{
        _sharedInstance = [[ImageModel alloc] init];
    });
    
    return _sharedInstance;
}

-(NSArray*) imageNames{
    // All image names available
    if(!_imageNames)
        _imageNames = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    return _imageNames;
}

-(UIImage*)getImageWithName:(NSString*)name{
    // Return the UIImage with specified image name
    if (!_imageDict){
        _imageDict = [[NSMutableDictionary alloc]init];
        for(int i = 0; i<self.imageNames.count; ++i)
            _imageDict[self.imageNames[i]] = [UIImage imageNamed:self.imageNames[i]];
    }
    
    return _imageDict[name];
    
}

-(UIImage*)getImageWithIndex:(NSInteger)index{
    // Return the UIImage with specified image index
    if (!_imageDict){
        _imageDict = [[NSMutableDictionary alloc]init];
        for(int i = 0; i<self.imageNames.count; ++i)
            _imageDict[self.imageNames[i]] = [UIImage imageNamed:self.imageNames[i]];
    }
    
    return _imageDict[self.imageNames[index]];
}

-(NSInteger)numberOfImages{
    // Return the number of images
    return self.imageNames.count;
}

-(NSString*)getImageNameForIndex:(NSInteger)index{
    // Return the image name by index
    return self.imageNames[index];
}

@end
