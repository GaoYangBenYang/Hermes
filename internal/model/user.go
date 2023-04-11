package model

import (
	"ProblemFocus_Backend/pkg/dataBase/mysql"
	"time"

	"github.com/astaxie/beego/orm"
)

func init() {
	//注册模型 相当于在数据库中自动建表
	orm.RegisterModelWithPrefix("table_", new(User))
}
/*
属性名一定要与数据库名对应  大驼峰  tag中的db可写可不写，如果使用beego的orm框架并且不想使用默认Id为主键 那必须使用tag `orm:"pk"`
*/
// Comment: 用户表
type User struct {
	// Comment: 用户ID,唯一标识符,自增长整数类型
	UserId int `db:"user_id" orm:"pk"`
	// Comment: 用户名，字符串类型，不可重复
	UserName string `db:"user_name"`
	// Comment: 密码，字符串类型，加密存储
	Password string `db:"password"`
	// Comment: 电子邮件地址，字符串类型
	Email *string `db:"email"`
	// Comment: 电话号码，字符串类型
	PhoneNumber *string `db:"phone_number"`
	// Comment: 头像,字符串类型,存储头像的URL地址
	Avatar *string `db:"avatar"`
	// Comment: 注册时间，日期时间类型
	RegistrationTime *time.Time `db:"registration_time"`
	// Comment: 用户更新时间，可为空
	UpdateTime *time.Time `db:"update_time"`
}


func GetAllUser() ( []User , error){
	o := orm.NewOrm()
	var userSlice []User
	_ , err := o.Raw(mysql.SelectAllUserSQL).QueryRows(&userSlice)
	if err == nil {
		return userSlice, nil
	} else {
		return nil, err
	}
}