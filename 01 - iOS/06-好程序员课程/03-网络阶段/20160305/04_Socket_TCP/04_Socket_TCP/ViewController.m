//
//  ViewController.m
//  04_Socket_TCP
//
//  Created by baoxu on 16/3/5.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"
#import "AsyncSocket.h"

@interface ViewController ()<AsyncSocketDelegate>
{
    //客户端Socket
    AsyncSocket *sendSocket;
    //服务单Socket
    AsyncSocket *recvSocket;
    
    //保存通信连接
    NSMutableArray *socketArray;
}

@property (retain, nonatomic) IBOutlet UITextField *ipField;
@property (retain, nonatomic) IBOutlet UITextField *sendField;
@property (retain, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //实例化连接数组，用来保存每一次的连接
    socketArray = [[NSMutableArray alloc]init];
    //设置服务端的套接字
    recvSocket = [[AsyncSocket alloc]initWithDelegate:self];
    //实例化客户端的套接字，同时设置代理
    sendSocket = [[AsyncSocket alloc]initWithDelegate:self];
    
    //服务端在对应的端口上开始监听有没有客户端的；连接
    //端口号，建议使用5000以后的端口，以防与计算机中已有的端口冲突
    [recvSocket acceptOnPort:6666 error:nil];
    //同一个设备（网卡），同一个ip，不同的进程是怎样找到自己的通信线路的呢，通过端口来区分
}

- (IBAction)sendText:(id)sender {
    //判断客户端是否在连接状态
    if (sendSocket.isConnected == NO) {
        //连接服务端，客户端连接的端口，必须与服务端监听的端口一致
        [sendSocket connectToHost:self.ipField.text onPort:6666 withTimeout:30 error:nil];
        //参数一：要连接的网络ip
        //参数二：端口号，用来区分同一ip下的不同进程
        //参数三：超时时间，过时就放弃连接
    }
    //发送数据
    [sendSocket writeData:[self.sendField.text dataUsingEncoding:NSUTF8StringEncoding] withTimeout:30 tag:100];
}

#pragma mark -发送端-
//调用这个方法，就表明连接成功
-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port{
    NSLog(@"已经连接到了服务端：%@---端口号：%hu",host,port);
    //监听服务端返回的数据
    [sock readDataWithTimeout:-1 tag:100];
}

-(BOOL)onSocketWillConnect:(AsyncSocket *)sock{
    NSLog(@"将要建立连接，是否允许");
    return YES;
}

-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag{
    NSLog(@"已经写入数据到服务端");
}

-(void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err{
    NSLog(@"将要断开连接");
}
-(void)onSocketDidDisconnect:(AsyncSocket *)sock{
    NSLog(@"已经断开连接");
}

#pragma mark -服务端-
//服务端接收到了一个新的客户端的连接请求
-(void)onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket{
    //保存这个连接
    [socketArray addObject:newSocket];
    
    //继续监听
    //监听这个连接发来的数据，-1表示一直监听
    [newSocket readDataWithTimeout:-1 tag:100];
}
//调用它就表明服务端接收到了客户端发来的数据
-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    NSLog(@"已经接收到了TCP传输过来的消息");
    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    self.textView.text = [NSString stringWithFormat:@"%@%@:%@\n",self.textView.text,[sock connectedHost],str];
//    [sock connectedHost],表示对方的ip地址
    
    [sock readDataWithTimeout:-1 tag:100];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_ipField release];
    [_sendField release];
    [_textView release];
    [super dealloc];
}
@end
