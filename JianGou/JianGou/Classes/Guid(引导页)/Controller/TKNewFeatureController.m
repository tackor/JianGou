//
//  TKNewFeatureController.m
//  JianGou
//
//  Created by 时空矩人 on 2017/3/9.
//  Copyright © 2017年 时空矩人. All rights reserved.
//

#import "TKNewFeatureController.h"
#import "TKNewFeatureCell.h"

@interface TKNewFeatureController ()

/** 页码 */
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

/** 起航按钮 */
@property (weak, nonatomic) IBOutlet UIButton *startNewLiveBtn;

@end

@implementation TKNewFeatureController

static NSString * const reuseIdentifier = @"NewFeatureCell";

/** 总页数 */
int TOTAL_PAGE = 3;

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置cell的尺寸
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    
    // 清空行距
    layout.minimumLineSpacing = 0;
    
    // 设置滚动的方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:layout];
    
}
// self.collectionView != self.view
// 注意： self.collectionView 是 self.view的子控件

// 使用UICollectionViewController
// 1.初始化的时候设置布局参数
// 2.collectionView必须注册cell
// 3.自定义cell

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册cell,默认就会创建这个类型的cell
    [self.collectionView registerClass:[TKNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // 分页
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
}

#pragma mart - 起航按钮点击事件
- (IBAction)startNewLive:(UIButton *)sender {
    
    //切换根视图
//    self.window.rootViewController = [ViewController new];
    
    //记录是否已经走过新特性
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:[NSString stringWithFormat:@"ISNEWFEATURE%@", APP_VERSION]];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 获取当前的偏移量，计算当前第几页
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
    
    // 设置页数
    self.pageControl.currentPage = page;
    
    if (TOTAL_PAGE == page) {
        self.startNewLiveBtn.hidden = NO;
    } else {
        self.startNewLiveBtn.hidden = YES;
    }
}

#pragma mark - UICollectionView数据源
// 返回有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

// 返回第section组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return TOTAL_PAGE;
}

// 返回cell长什么样子
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // dequeueReusableCellWithReuseIdentifier
    // 1.首先从缓存池里取cell
    // 2.看下当前是否有注册Cell,如果注册了cell，就会帮你创建cell
    // 3.没有注册，报错
    TKNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSString *imageName;
    
    if (IPHONE5 || IPHONE4) {
        
        imageName = [NSString stringWithFormat:@"img_guide_%ld_640w_1136h",indexPath.row + 1];
        
    }else if (IPHONE6){
        
        imageName = [NSString stringWithFormat:@"img_guide_%ld_750w_1334h",indexPath.row + 1];
        
    }else  {
        
        imageName = [NSString stringWithFormat:@"img_guide_%ld_1242w_2208h",indexPath.row + 1];
        
    }
    
    cell.imgView.image = [UIImage imageNamed:imageName];
    
    return cell;
    
}

@end
