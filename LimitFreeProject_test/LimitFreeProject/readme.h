

//ps:工程简单，做好了也不简单


//架构
/**
 1.工程的创建和设置
    <1>.创建工程
    <2>.导入资源，导入第三库
    <3>.建立文件分组（Page，Resource，ThirdLibrary）
 
 2.应用框架
    <1>.根据页面的特点，架构出五个分组+公用的组
    <2>.创建类 
        a.RootViewController （必须的）
        b.AppListViewController（继承Root，观察工程特点，使用率高，可提取出来作为公用类）
        c.LimitViewController（继承AppList）
    <3>.设置标签栏 AppDelete里面 创建 TabBar
 
 3.实现主页面 （实现AppListViewController）
    mvc模式
    <1>.数据下载     NetInterface.h --->  LimitUrL
                    downloadData   --->  AFNetworking
    <2>.创建AppModel，利用ZJModelTool 生成 model 模型
    <3>.创建AppCell，代码定制cell
    <4>.创建表格视图，用来显示cell

 4.界面的适配
    通过定义好的宏，ZJScreenAdaptation
 
 5.限免、降价、免费、热榜  显示不同的数据
    <1>.Applist定制urlString，请求数据加载 self.urlString
    <2>.Appdelete.m  createTabBar 里面设置不同的网址
 
 6.分类页面
    AppListView导航条上添加分类按钮、配置按钮；
    创建了分类页面CategoryViewController
    CategoryCell、CategoryModel
    设置block反向传值
    下载数据
    显示页面
 
 7.搜索页面
    AppList添加 searchBar显示搜索框
    创建SearchViewController，添加searchKeyword
    处理搜索请求把汉字转码
    网络请求，显示搜索结果
 
 8.显示配置页面
 
 9.显示app详细页面
 
 */
