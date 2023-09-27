package model

type response struct {
	Code    int
	Message string
	Data    interface{}
}

func NewResponse(code int, message string, data interface{}) *response {
	return &response{
		Code:    code,
		Message: message,
		Data:    data,
	}
}
