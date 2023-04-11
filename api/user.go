package api

import (
	"ProblemFocus_Backend/internal/controller"

	"github.com/astaxie/beego"
)

func init() {
	ns := beego.NewNamespace("/v1",
		beego.NSNamespace("/user",
			// beego.NSRouter("/",&controller.UserController{},"post:InsertUser"),
			// beego.NSRouter("/:id",&controller.UserController{},"delete:DeleteUserByID"),
			// beego.NSRouter("/:id",&controller.UserController{},"put:UpdateUserByID"),
			beego.NSRouter("/",&controller.UserController{},"get:GetAllUser"),
		),
	)
	beego.AddNamespace(ns)
}
