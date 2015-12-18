//
//  AppModel.m
//  LimitFreeProject
//
//  Created by baoxu on 15/10/12.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
/**
    KVC
 *  setValuesForKeysWithDictionary, 会为我们把和dictionary的key名字相同的class proerty设置上dict中key对应的value
 *
    在实际开发及应用过程中，经常会遇到通过外部数据构造的字典的键要多于自定义数据模型中属性的个数的情况。
    如果json里面的某些key就是和object的property名字不一样呢，或者有些server返回的字段是objc保留字如”id”, “description”等， 我们也希望也map dict to object, 这时候我们就需要用上setValue:forUndefinedKey, 因为如果我们不处理这些Undefined Key，还是用setValuesForKeysWithDictionary就会 抛出异常。
    当使用setValuesForKeysWithDictionary:方法时，对于数据模型中缺少的、不能与任何键配对的属性的时候，系统会自动调用setValue:forUndefinedKey:这个方法，该方法默认的实现会引发一个NSUndefinedKeyExceptiony异常。
    如果想要程序在运行过程中不引发任何异常信息且正常工作，可以让数据模型类重写setValue:forUndefinedKey:方法以覆盖默认实现，而且可以通过这个方法的两个参数获得无法配对键值。
 */
@end
