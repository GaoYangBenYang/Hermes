package redis

import (
	"fmt"
	"strconv"

	"github.com/beego/beego/v2/core/config"
	"github.com/beego/beego/v2/core/logs"
	"github.com/go-redis/redis"
)

// 声明一个全局的rdb变量
var redisClient *redis.Client

// 初始化连接
func InitRedis() {
	//获取数据库配置
	RedisAddress, addressErr := config.String("RedisAddress")
	if addressErr != nil {
		logs.Error(addressErr)
	}
	RedisPassword, passwordErr := config.String("RedisPassword")
	if passwordErr != nil {
		logs.Error(passwordErr)
	}
	RedisDB, dbErr := config.String("RedisDB")
	if dbErr != nil {
		logs.Error(dbErr)
	}
	redisDB, _ := strconv.Atoi(RedisDB)

	redisClient = redis.NewClient(&redis.Options{
		Addr:     RedisAddress,
		Password: RedisPassword, // no password set
		DB:       redisDB,       // use default DB
	})

	_, err := redisClient.Ping().Result()
	if err != nil {
		fmt.Println("Redis连接失败!", err)
	} else {
		fmt.Println("Redis连接成功!")
	}
}
