package main

import (
	_ "problemfocus_backend_user/api"
	"problemfocus_backend_user/pkg/dataBase/mysql"
	"problemfocus_backend_user/pkg/dataBase/redis"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/plugins/cors"
)

func init() {
	//初始化MySQL
	mysql.InitMySQLClient()
	//初始化Redis
	redis.InitRedisClient()
}
func main() {
	if beego.BConfig.RunMode == "dev" {
		beego.BConfig.WebConfig.DirectoryIndex = true
		beego.BConfig.WebConfig.StaticDir["/swagger"] = "swagger"
		beego.SetLogFuncCall(true)
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
