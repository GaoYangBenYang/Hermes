package dto

type responseBody struct {
	Code int
	Message interface{}
	Data interface{}
}

var ResponseBody responseBody

func (r *responseBody) Get200DataResponse(data interface{}) *responseBody {
	return &responseBody{
		Code: 200,
		Message: "请求成功！",
		Data: data,
	}
}


func (r *responseBody) Get200MessageResponse(message interface{}) *responseBody {
	return &responseBody{
		Code: 200,
		Message: message,
		Data: "",
	}
}

func (r *responseBody) Get404Response(message interface{}) *responseBody {
	return &responseBody{
		Code: 404,
		Message: message,
		Data: "",
	}
}