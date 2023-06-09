package mysql

import (
	"fmt"

	"github.com/beego/beego/v2/client/orm"
	_ "github.com/go-sql-driver/mysql"
)

// 维护原生SQL语句
const (
	//查询所有用户信息
	SelectAllUserSQL = "select * from user"
	//注册用户
	InsertUser = "insert "
	//根电话号码或者邮箱查询用户信息（登录）
	SelectUserByPhoneNumberOrEmail = "select password from user where phone_number = ? or email = ?"
)

func InitMySQL(MySQLDataSource string) {
	//注册驱动，由于mysql为默认数据库类型，直接使用orm.DBMySQL
	orm.RegisterDriver("mysql", orm.DRMySQL)
	//注册数据库，默认本地时区
	orm.RegisterDataBase("default", "mysql", MySQLDataSource)
	//获取*sql.DB
	_, err := orm.GetDB()
	if err != nil {
		fmt.Println("MySQL连接失败!", err)
	} else {
		fmt.Println("MySQL连接成功!")
	}
}
