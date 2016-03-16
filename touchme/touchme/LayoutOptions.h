//
//  LayoutOptions.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 15/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#ifndef LayoutOptions_h
#define LayoutOptions_h

typedef NS_OPTIONS (NSInteger, LayoutOptions) {
    LayoutOptions_Horizontal = (1 << 0),
    LayoutOptions_Vertical = (1 << 1)
};


#endif /* LayoutOptions_h */
