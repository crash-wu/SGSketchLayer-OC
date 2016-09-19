//
//  MapViewController.m
//  SGSketchLayer-OC
//
//  Created by 吴小星 on 16/8/10.
//  Copyright © 2016年 吴小星. All rights reserved.
//

#import "MapViewController.h"
#import <ArcGIS/ArcGIS.h>


@interface MapViewController ()

@property(nonatomic,strong) AGSMapView *mapView;
@property(nonatomic,strong) UIButton    *drawBtn;
@property(nonatomic,assign) SketchType sketchType;
@property(nonatomic,strong) UIButton *clearBtn;
@property(nonatomic,strong)     SGSketchLayer_OC *sketchLayer;

@end

@implementation MapViewController

-(instancetype)initWithSketchType:(SketchType) sketchType{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.mapView = [[AGSMapView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:self.mapView];
        
        self.drawBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.drawBtn.frame = CGRectMake(0, self.view.frame.origin.y, 100, 50);
        [self.view addSubview:self.drawBtn];
        [self.drawBtn setTitle:@"绘图" forState:UIControlStateNormal];
        [self.drawBtn setBackgroundColor:[UIColor blueColor]];
        [self.drawBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.drawBtn addTarget:self action:@selector(drawBntTouch:) forControlEvents:UIControlEventTouchUpInside];
        
        self.clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.clearBtn.frame = CGRectMake(100, self.view.frame.origin.y, 100, 50);
        [self.view addSubview:self.clearBtn];
        [self.clearBtn setTitle:@"清除" forState:UIControlStateNormal];
        [self.clearBtn setBackgroundColor:[UIColor blueColor]];
        [self.clearBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.clearBtn addTarget:self action:@selector(clearTouch:) forControlEvents:UIControlEventTouchUpInside];
        
        self.sketchType = sketchType;

        
    }
    
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    AGSTiledMapServiceLayer * tileLayer = [[AGSTiledMapServiceLayer alloc]initWithURL:[[NSURL alloc]initWithString:@"http://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer"]];
    [self.mapView addMapLayer:tileLayer];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)drawBntTouch:(UIButton *)button{
    
    
    self.sketchLayer = [[SGSketchLayer_OC alloc]initWithSketchType:self.sketchType];
    [self.mapView addMapLayer:self.sketchLayer];
    self.mapView.touchDelegate = self.sketchLayer;
}

-(void)clearTouch:(UIButton *)button{
    
    if (self.sketchLayer) {
        [self.sketchLayer clear];
    }
}

@end
