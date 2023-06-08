package controller

import (
	"fmt"
	"github.com/GaoYangBenYang/problemfocus_backend_user/internal/model"
	"github.com/GaoYangBenYang/problemfocus_backend_user/internal/service"
	"github.com/GaoYangBenYang/problemfocus_backend_user/internal/utils"

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

func (u *UserController) SelectUserByPhoneNumberOrEmail()  {
	phone_number_or_email :=u.Ctx.Input.Param(":phone_number_or_email")
	password := "wlthu"
	fmt.Println(phone_number_or_email,password)
	err := service.SelectUserByPhoneNumberOrEmail(phone_number_or_email,password)
	if err == nil {
		u.Data["json"] = utils.ResponseBody.Get200DataResponse(true)
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