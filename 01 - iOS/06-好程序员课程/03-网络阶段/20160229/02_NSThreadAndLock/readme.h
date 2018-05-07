一、
//NSThread 是 cocoa(MacOS,iOS)中一个轻量级的多线程对象
//NSThread 傻瓜式的操作,简单
//1.如何创建一个子线程
//2.把好时操作的逻辑转移到子线程中去
//object 给 @selector中要执行的方法传递参数

//    //方法一
//    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(doWCing) object:nil];
//    //可以给子线程命名
//    thread.name = @"子线程1";
//    //使用alloc创建的线程,一定要显示的调用start方法,才能够运行
//    [thread start];

//方法二
// 创建一个线程  只是创建就好 不亲自执行这个线程 只是创建
// 线程创建后 就会自动运行
//为了更加简化我们创建一个子线程的操作,NSObject对创建线程封装了一些方法
//内部会自动的创建一个子线程,并且把@selector中的方法交给子线程去做
[NSThread detachNewThreadSelector:@selector(doWCing) toTarget:self withObject:nil];

//线程工作完程，如果以后不再使用这个线程
//应当做如下操作
//    [thread cancel];
[NSThread exit];

二、
//线程锁 类比上厕所，多个线程有一把锁就够了。谁锁，谁才能打开。
NSLock * _threadLock;
/**
 *  (atomic)。所谓原子操作是指不会被线程调度机制打断的操作；这种操作一旦开始，就一直运行到结束，中间不会有任何 context switch （切换到另一个线程）。
 *
 //通过加锁和解锁，使一段代码成为原子操作。
 //使用线程锁，不是服务于线程，而是服务于代码。当我们希望一段代码进行原子操作，如数据库的写入，就可以进行加锁。
 //比如从判断缓存是否存在，到写入新的缓存。应当加一把线程锁。即使我们没有创建NSThread。
 //它和@Syncronized关键字起到同样效果。但是关键字不能在一个函数中加锁，另一个函数中解锁，NSLock可以。
 */
//上锁
[_threadLock lock];
//解锁
[_threadLock unlock];

Synchronized：Synchronized是iOS中的一个关键字，一般使用于需要加锁的对象上


