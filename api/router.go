package api

import (
	"ProblemFocus_Backend/internal/controller"

	"github.com/astaxie/beego"
)

func init() {
	ns := beego.NewNamespace("/v1",
		beego.NSNamespace("/object",
			beego.NSInclude(
				&controller.ObjectController{},
			),
		),
		beego.NSNamespace("/user",
			beego.NSInclude(
				&controller.UserController{},
			),
		),
	)
	beego.AddNamespace(ns)
}
