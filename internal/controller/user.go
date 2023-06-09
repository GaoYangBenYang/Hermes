package controller

import (
	"fmt"
	"github.com/GaoYangBenYang/pfb/internal/model/deo"
	"github.com/GaoYangBenYang/pfb/internal/model/dto"
	"github.com/GaoYangBenYang/pfb/internal/service"

	
	beego "github.com/beego/beego/v2/server/web"
)

type UserController struct {
	beego.Controller
}

func (u *UserController) GetAllUser() {
	userSlice, err := deo.GetAllUser()
	if err == nil {
		u.Data["json"] = dto.ResponseBody.Get200DataResponse(userSlice)
		u.ServeJSON()
	} else {
		u.Data["json"] = dto.ResponseBody.Get404Response(err)
		u.ServeJSON()
	}
}

func (u *UserController) SelectUserByPhoneNumberOrEmail()  {
	phone_number_or_email :=u.Ctx.Input.Param(":phone_number_or_email")
	password := "wlthu"
	fmt.Println(phone_number_or_email,password)
	err := service.SelectUserByPhoneNumberOrEmail(phone_number_or_email,password)
	if err == nil {
		u.Data["json"] = dto.ResponseBody.Get200DataResponse(true)
		u.ServeJSON()
	} else {
		u.Data["json"] = dto.ResponseBody.Get404Response(err)
		u.ServeJSON()
	}
}

func (u *UserController) InsertUser()  {
	// user:=model.NewUser("","","","","","","","")
	// _,err := model.InsertUser(user) 
	// if err == nil {
		u.Data["json"] = dto.ResponseBody.Get200MessageResponse("注册成功!") 
		u.ServeJSON()
	// } else {
	// 	u.Data["json"] = model.ResponseBody.Get404Response(err) 
	// 	u.ServeJSON()
	// }
}