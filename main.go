package main

import (
	_ "github.com/GaoYangBenYang/pfb/internal/router"
	"github.com/GaoYangBenYang/pfb/internal/database/mysql"
	"github.com/GaoYangBenYang/pfb/internal/middleware/redis"

	beego "github.com/beego/beego/v2/server/web"
	"github.com/beego/beego/v2/server/web/filter/cors"
)

func init() {
	//获取数据库配置
	const MySQLDataSource string = "root:123456@/problemfocus?charset=utf8"
	//初始化MySQL
	mysql.InitMySQL(MySQLDataSource)
	//初始化Redis
	redis.InitRedis()
}
func main() {
	if beego.BConfig.RunMode == "dev" {
		beego.BConfig.WebConfig.DirectoryIndex = true
		beego.BConfig.WebConfig.StaticDir["/swagger"] = "swagger"
	}
	//CORS
	//InsertFilter是提供一个过滤函数
	beego.InsertFilter("*", beego.BeforeRouter, cors.Allow(&cors.Options{
		//允许访问所有源
		AllowAllOrigins: true,
		//可选参数"GET", "POST", "PUT", "DELETE", "OPTIONS" (*为所有)
		//其中Options为跨域复杂请求的预检
		AllowMethods: []string{"*"},
		//指的是允许的Header的种类
		AllowHeaders: []string{"Content-Type", "Authorization", "X-Requested-With"},
		//公开的HTTP标头列表
		ExposeHeaders: []string{"Content-Length"},
		//如果设置，则允许共享身份验证凭据，例如cookie
		AllowCredentials: true,
	}))
	//开始监听端口
	beego.Run("localhost")
}
