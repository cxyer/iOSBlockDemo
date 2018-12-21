# Block
## block的声明
```objc
void (^test)(void) = ^{
};
```
注意到右边的式子，标准形式为：^返回类型 参数列表 表达式

返回类型可以省略，但是return返回的类型必须一致

如果没用到参数，参数列表可以省略
## block捕获局部变量
1. block可以捕获局部变量
    ```objc
    int num = 666;
    void (^test)(void) = ^(void){
        NSLog(@"%d",num);
    };
    test();
    ```
2. block不可以修改局部变量:会报错Variable is not assignable(missing __block type specifier)
3. 使用__block修改局部变量
    ```objc
    __block int num = 666;
    void (^test)(void) = ^(void){
        num = 555;
        NSLog(@"%d",num);
    };
    test();
    ```
4. block所捕获的值不受外部值的影响
    ```objc
    int num = 666;
    void (^test)(void) = ^(void){
        NSLog(@"%d",num);
    };
    num = 555;
    test();
    ```
    输出为666
## block捕获全局变量
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
## 循环引用
    1. 一个对象里面有block，block内部使用self引用该对象，会造成循环引用
    2. 原因：block内部引用的对象都是强引用
    3. 解决：使用弱指针__weak typeof(self) weakSelf = self
## 和代理的区别
    * 代理和block都是回调的方式
    * 区别一：block是集中代码块，而代理是分散代码块； 区别二：block成本高，因为需要栈到堆的拷贝
    
