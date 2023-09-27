package redis

import (
	"log"

	"github.com/go-redis/redis"
)

// 声明一个全局的rdb变量
var redisClient *redis.Client

// 初始化连接
func InitRedisClient() {
	redisClient = redis.NewClient(&redis.Options{
		Addr:     "localhost:6379",
		Password: "", // no password set
		DB:       0,  // use default DB
	})

	_, err := redisClient.Ping().Result()
	if err != nil {
		log.Println("Redis连接失败!", err)
	} else {
		log.Println("Redis连接成功!")
	}
}
