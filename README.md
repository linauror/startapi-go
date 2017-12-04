# startapi-go
api document tool with go
## 关于StartApi-go

StartApi-go是一款基于beego+mysql的简易接口文档编写生成工具,通过输入主要数据,快捷生成接口文档以供查阅和直接测试

## 如何安装部署

* go get github.com/linauror/startapi-go
* 创建mysql数据库，并将根目录下startapi-go.sql导入
* 修改config 配置数据库
* 运行 go build
* 运行生成的可执行程序

## 如何使用

* 1，可在conf/api.conf中设置接口文档基本信息及域名配置
* 2，新建接口分类及分类下接口
* 3，点击发布即生成接口文档api.html，上传到服务器或者直接复制发送都可

## 一些截图

首页
![首页](http://ww2.sinaimg.cn/large/525a24a4gw1f2uf5ru4q2j20xq082glq.jpg)
接口更新
![接口更新](http://ww4.sinaimg.cn/large/525a24a4gw1f2uf5rkzohj20xq0p875f.jpg)
生成文档
![生成文档](http://ww1.sinaimg.cn/large/525a24a4gw1f2uf5tnkjrj21100qywfj.jpg)
