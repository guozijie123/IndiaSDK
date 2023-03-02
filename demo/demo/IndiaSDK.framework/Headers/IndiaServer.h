#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface IndiaServer : NSObject



+ (IndiaServer *)getStartServer;

//注册和登陆的合并接口 参数为0是注册模式 参数为1是登陆模式 返回结果：当请求正常返回userid,不正常为nil
-(void)RegAndLoginWithThePhone:(NSString *)phone code:(NSString *)code password:(NSString *)password model:(BOOL)islogin withBlock:(void(^)(NSString * userid,NSString * errorInfo))block;


//fb登陆
-(void)openTheFbloginwithBlock:(void(^)(NSString * userid,NSString * errorInfo))block;


//调取用户信息
-(void)checkTheUserDetail:(NSString *)userid withBlock:(void(^)(NSDictionary * result,NSString * errorInfo))block;


//盒子信息
////返回盒子id 盒子售价 折扣  盒子类型  盒子创建时间  盒子名称  盒子说明  是否限时盲盒  限时开始时间 限时结束时间  盲盒图片
-(void)showTheBoxDetail:(NSString *)boxid withBlock:(void(^)(NSDictionary * result,NSString * errorInfo))block;

//开盒接口
-(void)openTheBox:(NSString *)boxid Userid:(NSString *)uid paychanel:(NSString *)number withBlock:(void(^)(NSDictionary * result,NSString * errorInfo))block;


//获取客服链接接口
-(NSString *)getTheUserServersRoomLink;


@end
