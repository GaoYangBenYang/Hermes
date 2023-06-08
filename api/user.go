package api

import (
	"github.com/GaoYangBenYang/problemfocus_backend_user/internal/controller"

	"github.com/astaxie/beego"
)

func init() {
	ns := beego.NewNamespace("/v1",
		beego.NSNamespace("/signin",
	
	
	
	
		),
		beego.NSNamespace("/signup",
	
	
	
	
		),
		beego.NSNamespace("/signout",
	
	
	
	
		),
		beego.NSNamespace("/user",
			
			beego.NSRouter("/",&controller.UserController{},"post:InsertUser"),
			beego.NSRouter("/:phone_number_or_email",&controller.UserController{},"post:SelectUserByPhoneNumberOrEmail"),
			// beego.NSRouter("/:id",&controller.UserController{},"delete:DeleteUserByID"),
			// beego.NSRouter("/:id",&controller.UserController{},"put:UpdateUserByID"),
			beego.NSRouter("/",&controller.UserController{},"get:GetAllUser"),
		),
	)
	beego.AddNamespace(ns)
}
