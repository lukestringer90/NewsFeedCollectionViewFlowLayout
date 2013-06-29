NewsFeedCollectionViewLayout
============================

UICollectionViewFlowLayout subclass mimicking the Zite/Flipboard layout style of news feed articles.

![layout_a](https://raw.github.com/lukestringer90/NewsFeedCollectionViewLayout/master/Screens/layout_a.png)
![layout_c](https://raw.github.com/lukestringer90/NewsFeedCollectionViewLayout/master/Screens/layout_c.png)

## Usage
To use the flow layout, setup a collection view as follows:

```
self.flowLayout = [[NewsFeedCollectionViewFlowLayout alloc] init];
self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
self.flowLayout.minimumInteritemSpacing = 0.0;
self.flowLayout.minimumLineSpacing = 0.0f;

// Here we setup the layout configurations for the sections we want.
// Each section corresponds to a page as we have turn paging on for the collectionview.
// The number of elements in the sectionLayoutConfigurations array specifies how many pages there are
// and what configuration of cells should be used for that section and page.
self.flowLayout.sectionLayoutConfigurations = @[
												@(SectionLayoutConfigurationA),
                                              	@(SectionLayoutConfigurationB),
                                              	@(SectionLayoutConfigurationC),
                                              	@(SectionLayoutConfigurationD)
                                              	];

CGRect frame = <frame setup>
self.collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:self.flowLayout];
self.collectionView .pagingEnabled = YES;
self.collectionView .delegate = self;
self.collectionView .dataSource = self;
```

To get the number of section and items for the collection view using the layout, override like so:

```
#pragma mark - UICollectionViewDataSource
- (NSInteger )numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.flowLayout numberOfSections];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.flowLayout numberOfItemsInSection:section];
}

```

To get the right size for an item in the collection view using the layout, override like so:

```
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Get the size from the NewsFeedCollectionViewFlowLayout instance (a subclass of UICollectionViewFlowLayout)
    return [collectionViewLayout layoutAttributesForItemAtIndexPath:indexPath].size;
    
}
```


## Todo

* Change the way section layouts are defined via classes (subclassing and overing a layout method) rather than an enum used by NewsFeedCollectionViewFlowLayout.
* Add paging controls.
* Unit tests.

## Licence
This code is distributed under the terms and conditions of the MIT license.

Copyright (c) 2013 Luke Stringer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---

### Author

Follow me on twitter: [lukestringer90](http://twitter.com/lukestringer90)
