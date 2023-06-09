package redis

import (
	"fmt"

	"github.com/go-redis/redis"
)

// 声明一个全局的rdb变量
var redisDB *redis.Client

// 初始化连接
func InitRedis() {
	redisDB = redis.NewClient(&redis.Options{
		Addr:     "localhost:6379",
		Password: "", // no password set
		DB:       0,  // use default DB
	})

	_, err := redisDB.Ping().Result()
	if err != nil {
		fmt.Println("Redis连接失败!", err)
	} else {
		fmt.Println("Redis连接成功!")
	}
}