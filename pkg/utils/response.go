package utils



// 分类	描述
// 1xx	信息，服务器收到请求，需要请求者继续执行操作
// 2xx	成功，操作被成功接收并处理
// 3xx	重定向，需要进一步的操作以完成请求
// 4xx	客户端错误，请求包含语法错误或无法完成请求
// 5xx	服务器错误，服务器在处理请求的过程中发生了错误



type responseBody struct {
	Code int
	Message interface{}
	Data interface{}
}

var ResponseBody responseBody

func (r *responseBody) Get200Response(data interface{}) *responseBody {
	return &responseBody{
		Code: 200,
		Message: "请求成功！",
		Data: data,
	}
}

func (r *responseBody) Get404Response(message interface{}) *responseBody {
	return &responseBody{
		Code: 404,
		Message: message,
		Data: "",
	}
}