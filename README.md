# Block
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
    1. block可以捕获局部变量
        ```
        void (^test)(void) = ^(void){
            NSLog(@"%d",number);
        };
        test();
        ```
    2. block可以修改局部变量
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

    
