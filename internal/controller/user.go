package controller

import (
	"ProblemFocus_Backend/internal/model"
	"ProblemFocus_Backend/pkg/utils"

	"github.com/astaxie/beego"
)

type UserController struct {
	beego.Controller
}

func (u *UserController) GetAllUser() {
	userSlice, err := model.GetAllUser()
	if err == nil {
		
		u.Data["json"] = utils.ResponseBody.Get200DataResponse(userSlice)
		u.ServeJSON()
	} else {
		u.Data["json"] = utils.ResponseBody.Get404Response(err)
		u.ServeJSON()
	}
}

func (u *UserController) InsertUser()  {
	// user:=model.NewUser("","","","","","","","")
	// _,err := model.InsertUser(user) 
	// if err == nil {
		u.Data["json"] = utils.ResponseBody.Get200MessageResponse("注册成功!") 
		u.ServeJSON()
	// } else {
	// 	u.Data["json"] = utils.ResponseBody.Get404Response(err) 
	// 	u.ServeJSON()
	// }
}