# NewCalculator
iOS based calculator  
设计模式：MVC  
集成开发环境：Xcode  
模型：iOS - Single View App  
目的物理机型：全面屏iPhone系列  
整个分层开发结构采用两层，表示层采用Swift，业务层采用的是C++。主要是考虑到Swift是苹果公司会持续更新的语言，更易于初学者学习；底层采用C++可以提升运行效率。中间的桥接文件采用了Objective-C和Objective-C++，这也是苹果公司推荐的桥接组合。  
表示层直接将用户输入的表达式（String）传给业务层，业务层进行表达式判断和计算。
