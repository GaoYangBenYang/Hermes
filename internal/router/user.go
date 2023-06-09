package api

import (
	"github.com/GaoYangBenYang/beego-project-example/internal/controller"

	beego "github.com/beego/beego/v2/server/web"
)

func init() {
	ns := beego.NewNamespace("/v1",
		beego.NSNamespace("/user",

			beego.NSRouter("/", &controller.UserController{}, "post:InsertUser"),
			beego.NSRouter("/:phone_number_or_email", &controller.UserController{}, "post:SelectUserByPhoneNumberOrEmail"),
			// beego.NSRouter("/:id",&controller.UserController{},"delete:DeleteUserByID"),
			// beego.NSRouter("/:id",&controller.UserController{},"put:UpdateUserByID"),
			beego.NSRouter("/", &controller.UserController{}, "get:GetAllUser"),
		),
	)
	beego.AddNamespace(ns)
}
