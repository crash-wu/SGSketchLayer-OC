//
//  SGSketchLayer-OC.h
//  SGSketchLayer-OC
//
//  Created by 吴小星 on 16/8/10.
//  Copyright © 2016年 吴小星. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ArcGis/Arcgis.h>
#import <Foundation/Foundation.h>

/**
 *  @author crash         crash_wu@163.com   , 16-08-10 17:08:46
 *
 *  @brief  绘图类型
 */
typedef NS_ENUM(NSInteger,SketchType){
    /**
     *  @author crash         crash_wu@163.com   , 16-08-10 17:08:46
     *
     *  @brief  点
     */
    MutalPoint= 0,
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-10 17:08:46
     *
     *  @brief  折线
     */
    FoldLine,
    /**
     *  @author crash         crash_wu@163.com   , 16-08-10 17:08:46
     *
     *  @brief  曲线
     */
    Curve,
    /**
     *  @author crash         crash_wu@163.com   , 16-08-10 17:08:46
     *
     *  @brief  曲面
     */
    Surfaces,
    /**
     *  @author crash         crash_wu@163.com   , 16-08-10 17:08:46
     *  
     *  @brief  多边形
     */
    Polygon
};


/**
 绘图工具类
 */
@interface SGSketchLayer_OC : AGSGraphicsLayer

/**
 *  @author crash         crash_wu@163.com   , 16-08-10 16:08:51
 *
 *  @brief  初始化绘图工具
 *
 *  @param sketchType 绘制图形类型
 *
 *  @return 绘图工具
 */
-(_Nullable instancetype)initWithSketchType:(SketchType )sketchType;

/**
 *  @author crash         crash_wu@163.com   , 16-08-10 16:08:11
 *
 *  @brief  清除图层
 */
-(void)clear;

/**
 *  @author crash         crash_wu@163.com   , 16-08-10 16:08:06
 *
 *  @brief  获取标绘图形
 *
 *  @return 获取标绘图形
 */
-( AGSGeometry* _Nullable )geometry;


@end
