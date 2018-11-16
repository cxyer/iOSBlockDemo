# Block
后续学习的补充：关于Block的实现原理，可以看我的这篇笔记[读书笔记（二）Blocks部分](https://github.com/cxyer/iOSNote/wiki/%E3%80%8AOC%E9%AB%98%E7%BA%A7%E7%BC%96%E7%A8%8B-iOS%E4%B8%8EOS-X%E5%A4%9A%E7%BA%BF%E7%A8%8B%E5%92%8C%E5%86%85%E5%AD%98%E7%AE%A1%E7%90%86%E3%80%8B%E8%AF%BB%E4%B9%A6%E7%AC%94%E8%AE%B0%EF%BC%88%E4%BA%8C%EF%BC%89Blocks%E9%83%A8%E5%88%86)
1. block的声明
2. block捕获局部变量
    1. block可以捕获局部变量
        ```
        int num = 666;
        void (^test)(void) = ^(void){
            NSLog(@"%d",num);
        };
        test();
        ```
    2. block不可以修改局部变量:会报错Variable is not assignable(missing __block type specifier)
    3. 使用__block修改局部变量
        ```
        __block int num = 666;
        void (^test)(void) = ^(void){
            num = 555;
            NSLog(@"%d",num);
        };
        test();
        ```
    4. block定义时便有了值
        ```
        int num = 666;
        void (^test)(void) = ^(void){
            NSLog(@"%d",num);
        };
        num = 555;
        test();
        ```
        输出为666
3. block捕获全局变量
    1. block可以捕获全局变量
        ```
        void (^test)(void) = ^(void){
            NSLog(@"%d",number);
        };
        test();
        ```
    2. block可以修改全局变量
        ```
        void (^test)(void) = ^(void){
            number = 555;
            NSLog(@"%d",number);
        };
        test();
        ```
4. 循环引用
    1. 一个对象里面有block，block内部使用self引用该对象，会造成循环引用
    2. 原因：block内部引用的对象都是强引用
    3. 解决：使用弱指针__weak typeof(self) weakSelf = self
5. 和代理的区别
    * 代理和block都是回调的方式
    * 区别一：block是集中代码块，而代理是分散代码块； 区别二：block成本高，因为需要栈到堆的拷贝
    
