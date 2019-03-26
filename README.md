# CPOS
#### Clothing Point of Sale

#### 服装销售终端系统
  
 - 系统框架采用 jfinal 2.2 完成
 - 权限、会话管理采用 shiro 1.2.4 完成
 - 条形码生成采用了 barcode4j 2.1 完成
 - 图形报表采用了 highchart 5.0.11 完成
 
#### 启动说明
- 数据库 启动设置
  系统运行前确保已安装mysql数据库，新建数据库，名称为“db_pos”，然后将项目目录下的启动说明文件中的 db_pos.sql 导入，将 res/jdbc.propertites 文件中的数据库用户名和密码改成符合自己的数据库
- 项目启动
 项目使用两种启动方式：

    1. 将项目导入 myeclipse 或者别的 ide （按实际情况调整），直接运行 /src/com/scau/mis/config/Config.java 启动;

    2. 将项目发布到 Tomcat 服务器，直接访问即可，附 ant 的打包文件，可直接打包成 war 文件，也可以导入 ide 中通过 ide 发布部署到Tomcat服务器。

 
- 初始密码 
    1. admin  123456
    1. cashier  123456

#### 扩展
- 使用了 jfinal-shiro-freemarker-0.2.jar 的 <@shiro.principal /> 标签报错，查看源码发现cn/dreampie/shiro/freemarker/PrincipalTag.java 源码有误，使用了shiro-freemarker插件的该类的源码替换（具体代码项目可见），运行通过
#### 感谢

- jfinal     @[jfinal](http://git.oschina.net/jfinal/)   
- shiro      [shiro权限控制框架](https://shiro.apache.org)
- java1234   [一头扎进shiro视频讲解](http://www.java1234.com/a/yuanchuang/shiro/)


#### 部分截图
![登录界面](https://git.oschina.net/uploads/images/2017/0525/230111_ecd8f602_942742.png "在这里输入图片标题")
![报表分析](https://git.oschina.net/uploads/images/2017/0525/230246_9c31093d_942742.png "在这里输入图片标题")
![权限--角色](https://git.oschina.net/uploads/images/2017/0525/230343_ce90cad6_942742.png "在这里输入图片标题")
![权限--用户](https://git.oschina.net/uploads/images/2017/0525/230442_4e62632e_942742.png "在这里输入图片标题")
![输入图片说明](https://git.oschina.net/uploads/images/2017/0525/230553_79f18d4d_942742.png "在这里输入图片标题")
![输入图片说明](https://git.oschina.net/uploads/images/2017/0525/230834_0deab1ff_942742.png "在这里输入图片标题")
![输入图片说明](https://git.oschina.net/uploads/images/2017/0525/230933_4e9608c2_942742.png "在这里输入图片标题")
![输入图片说明](https://git.oschina.net/uploads/images/2017/0525/231030_4d8e3cf1_942742.png "在这里输入图片标题")

