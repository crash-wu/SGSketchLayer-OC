# SGSketchLayer-OC

[![CI Status](http://img.shields.io/travis/吴小星/SGSketchLayer-OC.svg?style=flat)](https://travis-ci.org/吴小星/SGSketchLayer-OC)
[![Version](https://img.shields.io/cocoapods/v/SGSketchLayer-OC.svg?style=flat)](http://cocoapods.org/pods/SGSketchLayer-OC)
[![License](https://img.shields.io/cocoapods/l/SGSketchLayer-OC.svg?style=flat)](http://cocoapods.org/pods/SGSketchLayer-OC)
[![Platform](https://img.shields.io/cocoapods/p/SGSketchLayer-OC.svg?style=flat)](http://cocoapods.org/pods/SGSketchLayer-OC)


##Describe


A layer that allows the user to interactively sketch geometries on the map .You can sketch point(点) ,FoldLine(折线),Curve(曲线),Surfaces(曲面),Polygon(多边形) geometries from scratch.

##Usage

 import<SGSketchLayer_OC/SGSketchLayer_OC.h>
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



## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
    ArcGIS-Runtime-SDK-iOS for version 10.2.5

## Installation

SGSketchLayer-OC is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SGSketchLayer_OC"
```

## Author

吴小星, crash_wu@163.com

## License

SGSketchLayer-OC is available under the MIT license. See the LICENSE file for more info.



## Exmaple

![(绘制点)](http://images.cnblogs.com/cnblogs_com/crash-wu/864784/o_sketchLayer_1.gif)

![(绘制折线)](http://images.cnblogs.com/cnblogs_com/crash-wu/864784/o_SketchLayer_2.gif)

![(绘制曲线)](http://images.cnblogs.com/cnblogs_com/crash-wu/864784/o_SketchLayer_3.gif)

![(绘制曲面,多边形)](http://images.cnblogs.com/cnblogs_com/crash-wu/864784/o_SketchLayer_4.gif)
