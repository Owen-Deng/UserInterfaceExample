//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Owen on 8/29/23.
//

#import "ImageModel.h"

@interface ImageModel()

@property (strong, nonatomic) NSArray* imageNames;
@property (strong, nonatomic) NSMutableDictionary* imageDict;

@end


@implementation ImageModel


//NSMutableDictionary* _imageDict =  nil;

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


-(NSMutableDictionary*) imageDict{
    if (!_imageDict){
        _imageDict = [[NSMutableDictionary alloc]init];
        for(int i = 0; i<self.imageNames.count; ++i)
            _imageDict[self.imageNames[i]] = [UIImage imageNamed:self.imageNames[i]];
    }
    return _imageDict;
}

-(UIImage*)getImageWithName:(NSString*)name{
    // Get the UIImage with specified image name
    return self.imageDict[name];
}

-(UIImage*)getImageWithIndex:(NSInteger)index{
    // Get the UIImage at specified image index
    return self.imageDict[self.imageNames[index]];
}

-(NSInteger)numberOfImages{
    // Return the number of images
    return self.imageNames.count;
}

-(NSString*)getImageNameForIndex:(NSInteger)index{
    // Get the image name by index
    return self.imageNames[index];
}

@end
