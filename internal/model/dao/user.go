package deo

import (
	"time"

	"github.com/beego/beego/v2/client/orm"
)

func init() {
	//注册模型 相当于在数据库中自动建表
	orm.RegisterModel(new(User))
}

/*
属性名一定要与数据库名对应  大驼峰  tag中的db可写可不写，如果使用beego的orm框架并且不想使用默认Id为主键 那必须使用tag `orm:"pk"`
*/
// 用户表，用户表
type User struct {
	UserID        int    `json:"user_id" db:"user_id"`               // 用户ID
	UserUUID      string `json:"user_uuid" db:"user_uuid"`           // uuid
	UserNickName  string `json:"user_nick_name" db:"user_nick_name"` // 昵称
	UserIntro     string `json:"user_intro" db:"user_intro"`         // 个人简介
	UserSchool    string `json:"user_school" db:"user_school"`       // 学校
	UserAvatar    string `json:"user_avatar" db:"user_avatar"`       // 头像图片地址
	UserName      string `json:"user_name" db:"user_name"`           // 姓名
	UserSex       string `json:"user_sex" db:"user_sex"`             // 性别
	UserBirthday  string `json:"user_birthday" db:"user_birthday"`   // 出生日期
	UserIDNumber  string `json:"user_id_number" db:"user_id_number"` // 身份证号
	UserLocation  string `json:"user_location" db:"user_location"`   // 所在地
	UserTelephone string `json:"user_telephone" db:"user_telephone"` // 电话号码
	UserPassword  string `json:"user_password" db:"user_password"`   // 密码
	UserEmail     string `json:"user_email" db:"user_email"`         // 邮箱
	UserCreate    string `json:"user_create" db:"user_create"`       // 创建时间
	UserEdited    string `json:"user_edited" db:"user_edited"`       // 修改时间
	UserState     string `json:"user_state" db:"user_state"`         // 用户状态 0=正常 时间字符串=冻结结束日期
	UserDelete    int    `json:"user_delete" db:"user_delete"`       // 逻辑删除:0=未删除,1=已删除
}

func NewUser(uuid, userName, password, email, phoneNumber, avatar string, registrationTime, updateTime time.Time) *User {
	return nil
}
