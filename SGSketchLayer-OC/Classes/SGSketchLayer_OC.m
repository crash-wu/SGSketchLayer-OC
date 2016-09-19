//
//  SGSketchLayer-OC.m
//  SGSketchLayer-OC
//
//  Created by 吴小星 on 16/8/10.
//  Copyright © 2016年 吴小星. All rights reserved.
//

#import "SGSketchLayer_OC.h"

@interface SGSketchLayer_OC () <AGSMapViewTouchDelegate>

/**
 *  @author crash         crash_wu@163.com   , 16-08-10 16:08:31
 *
 *  @brief  线
 */
@property(strong,nullable,nonatomic) AGSMutablePolyline * polyline;

/**
 *  @author crash         crash_wu@163.com   , 16-08-10 16:08:36
 *
 *  @brief  多边形
 */
@property(strong,nullable,nonatomic) AGSMutablePolygon  * polygon;


/**
 *  @author crash         crash_wu@163.com   , 16-08-10 16:08:28
 *
 *  @brief  点
 */
@property(strong,nullable,nonatomic) AGSMutablePoint    * point;

/**
 *  @author crash         crash_wu@163.com   , 16-08-10 16:08:40
 *
 *  @brief  线的颜色
 */
@property(strong,nullable,nonatomic) AGSSimpleLineSymbol *lineSymbol;

/**
 *  @author crash         crash_wu@163.com   , 16-08-10 16:08:19
 *
 *  @brief  多边形内部填充颜色
 */
@property(strong,nullable,nonatomic) AGSSimpleFillSymbol *fillSymbol;


/**
 *  @author crash         crash_wu@163.com   , 16-08-10 16:08:12
 *
 *  @brief  点的样式
 */
@property(strong,nullable,nonatomic) AGSSimpleMarkerSymbol *markSymbol;

/**
 *  @author crash         crash_wu@163.com   , 16-08-10 16:08:02
 *
 *  @brief  图层
 */
@property(strong,nullable,nonatomic) AGSGraphic            *graphic;


@property(strong,nullable,nonatomic) AGSCompositeSymbol    *compositeSymbol;


/**
 *  @author crash         crash_wu@163.com   , 16-08-10 16:08:44
 *
 *  @brief  渲染器
 */
@property(strong,nullable,nonatomic) AGSSimpleRenderer     * simpleRenderer;

/**
 *  @author crash         crash_wu@163.com   , 16-08-10 16:08:20
 *
 *  @brief  绘图类型
 */
@property(nonatomic,assign) SketchType sketchType;


@end

@implementation SGSketchLayer_OC

//MARK: 懒加载

-(AGSMutablePolyline*)polyline{
    
    if(!_polyline){
        self.polyline = [[AGSMutablePolyline alloc] init];
        [self.polyline addPathToPolyline];
    }
    
    return _polyline;
}

-(AGSMutablePolygon *)polygon{
    if(!_polygon){
        self.polygon = [[AGSMutablePolygon alloc]init];
        [self.polygon addRingToPolygon];
    }
    
    return  _polygon;
    
}

-(AGSMutablePoint *) point{
    
    if(!_point){
        self.point = [[AGSMutablePoint alloc]init];
    }
    return _point;
}

-(AGSSimpleLineSymbol *)lineSymbol{
    
    if (!_lineSymbol) {

        self.lineSymbol = [[AGSSimpleLineSymbol alloc]init];
        self.lineSymbol.color = [UIColor redColor];
        self.lineSymbol.width = 3.0;
    }
    
    return _lineSymbol;
}

-(AGSSimpleFillSymbol *)fillSymbol{
    
    if (!_fillSymbol){
        //面的内部填充颜色
        self.fillSymbol = [[AGSSimpleFillSymbol alloc] initWithColor:[[UIColor redColor] colorWithAlphaComponent:0.4] outlineColor:nil];
        self.fillSymbol.outline = nil;
        
    }
    return  _fillSymbol;
}

-(AGSSimpleMarkerSymbol *)markSymbol{
    
    if(!_markSymbol){
        
        self.markSymbol = [[AGSSimpleMarkerSymbol alloc]initWithColor:[UIColor redColor]];
        self.markSymbol.style = AGSSimpleMarkerSymbolStyleCircle;
    }
    return _markSymbol;
}

-(AGSGraphic *)graphic{
    
    if(!_graphic){
        self.graphic = [[AGSGraphic alloc]init];
        self.graphic.symbol = self.compositeSymbol;
        [self addGraphic:self.graphic];
    }
    return  _graphic;
}

-(AGSCompositeSymbol *)compositeSymbol{
    
    if(!_compositeSymbol){
        self.compositeSymbol = [[AGSCompositeSymbol alloc]init];
        [self.compositeSymbol addSymbol:self.lineSymbol];
        [self.compositeSymbol addSymbol:self.fillSymbol];
        
    }
    return  _compositeSymbol;
}

-(AGSSimpleRenderer * )simpleRenderer{
    
    if(!_simpleRenderer){
        self.simpleRenderer = [[AGSSimpleRenderer alloc] initWithSymbol:self.compositeSymbol];
    }
    
    return _simpleRenderer;
}

/**
 *  @author crash         crash_wu@163.com   , 16-08-10 16:08:51
 *
 *  @brief  初始化绘图工具
 *
 *  @param sketchType 绘制图形类型
 *
 *  @return 绘图工具
 */
-(_Nullable instancetype)initWithSketchType:(SketchType )sketchType{
    
    self = [super init];
    if (self) {
        
        self.sketchType = sketchType;

    }
    
    return self;
}


-(void)mapView:(AGSMapView *)mapView didClickAtPoint:(CGPoint)screen mapPoint:(AGSPoint *)mappoint features:(NSDictionary *)features{
    
    switch (self.sketchType) {
        case MutalPoint:{
                //点
                self.point.spatialReference = mapView.spatialReference;
                [self.point updateWithX:mappoint.x y:mappoint.y];
                self.graphic.geometry = self.point;
                [self.compositeSymbol addSymbol:self.markSymbol];
        }
            break;
        case Polygon:{
                //多边形
                self.polygon.spatialReference = mapView.spatialReference;
                [self.polygon addPointToRing:mappoint];
                self.graphic.geometry = self.polygon;
        }
            break;
            
        case FoldLine:{
                //折线
                self.polyline.spatialReference = mapView.spatialReference;
                [self.polyline addPointToPath:mappoint];
                self.graphic.geometry = self.polyline;
        }
            break;
            
        default:
            break;
    }
    //刷新图层
    [self refresh];
    
}


-(void)mapView:(AGSMapView *)mapView didMoveTapAndHoldAtPoint:(CGPoint)screen mapPoint:(AGSPoint *)mappoint features:(NSDictionary *)features{
    
    
    switch (self.sketchType) {
        case Curve:{
                //自由线
                self.polyline.spatialReference = mapView.spatialReference;
                [self.polyline addPointToPath:mappoint];
                self.graphic.geometry = self.polyline;
        }
            break;
        case Surfaces:{
            //自由面
            self.polygon.spatialReference = mapView.spatialReference;
            [self.polygon addPointToRing:mappoint];
            self.graphic.geometry = self.polygon;
        }
            break;
            
        default:
            break;
    }
    
    //刷新图层
    [self refresh];
}

/**
 *  @author crash         crash_wu@163.com   , 16-08-10 16:08:11
 *
 *  @brief  清除图层
 */
-(void)clear{
    
    self.graphic.geometry = nil;
    [self refresh];
    
    switch (self.sketchType) {
        case Curve:
        case FoldLine: {
            //曲线
            for(NSInteger i = 0 ; i < self.polyline.numPaths;i++){
                [self.polyline removePathAtIndex:i];
            }
            [self.polyline addPathToPolyline];
        }
            break;
        case Polygon:
        case Surfaces:{
            //曲面
            for(NSInteger i = 0; i<self.polygon.numRings;i++){
                [self.polygon removeRingAtIndex:i];
            }
            
            [self.polygon addRingToPolygon];
        }
            break;
        
            
        default:
            break;
    }
    [self refresh];

}

/**
 *  @author crash         crash_wu@163.com   , 16-08-10 16:08:06
 *
 *  @brief  获取标绘图形
 *
 *  @return 获取标绘图形
 */
-( AGSGeometry* _Nullable )geometry{
    
    return self.graphic.geometry;
}

@end
