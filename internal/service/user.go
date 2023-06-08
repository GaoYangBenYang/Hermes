package service

import (
	"fmt"
	"github.com/GaoYangBenYang/problemfocus_backend_user/internal/model"
)

func SelectUserByPhoneNumberOrEmail(phone_number_or_email, password string) (error) {
	//根据phone_number_or_email查询数据库判断用户是否存在是否账号异常
	userPassword,err := model.SelectUserByPhoneNumberOrEmail(phone_number_or_email)
	if err == nil &&userPassword==password {
		//判断密码是否正确
			fmt.Println(userPassword)
			return nil
		
	} else {
		return err
	}
}