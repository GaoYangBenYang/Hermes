# RESTful接口规范
1. 使用HTTP动词：使用HTTP协议中的动词（GET, POST, PUT, DELETE等）来表示对资源的操作。
2. 资源的命名：每个资源都应该有一个唯一的标识符（URI），并且应该使用名词来描述资源。
3. 使用HTTP状态码：使用HTTP状态码来表示请求的结果，
   * 以下是常见的状态码：
      * 100 Continue：表示客户端应继续其请求。
      * 101 Switching Protocols：表示服务器已经理解了客户端的请求，并将通过Upgrade消息头通知客户端采用不同的协议来完成该请求。
      * 200 OK：表示请求成功，并且服务器已经成功返回请求的数据。
      * 201 Created：表示新资源已经成功创建。
      * 202 Accepted：表示服务器已经接受了请求，但尚未完成处理。
      * 204 No Content：表示请求成功，但是没有返回任何内容。
      * 206 Partial Content：表示服务器已经成功处理了部分GET请求。
      * 300 Multiple Choices：表示请求的资源有多种表示形式，服务器可以根据请求者的首选项选择一种。
      * 301 Moved Permanently：表示请求的资源已经被永久移动到新地址。
      * 302 Found：表示请求的资源已经被暂时移动到新地址。
      * 303 See Other：表示请求的资源可以在另一个URI中找到。
      * 304 Not Modified：表示客户端发送的请求中包含的资源未被修改，可以直接使用缓存中的资源。
      * 307 Temporary Redirect：表示请求的资源已经被暂时移动到新地址。
      * 400 Bad Request：表示请求有误，服务器无法处理该请求。
      * 401 Unauthorized：表示请求需要用户身份验证，但是用户没有提供有效的身份验证信息。
      * 403 Forbidden：表示服务器已经理解了请求，但是拒绝执行该请求。
      * 404 Not Found：表示请求的资源不存在。
      * 405 Method Not Allowed：表示请求中使用了服务器不支持的HTTP方法。
      * 406 Not Acceptable：表示服务器无法根据客户端请求的内容特性完成请求。
      * 409 Conflict：表示请求的资源与当前状态存在冲突。
      * 410 Gone：表示请求的资源已经不再可用。
      * 413 Payload Too Large：表示请求的实体过大，服务器无法处理。
      * 415 Unsupported Media Type：表示服务器无法处理请求中提交的数据类型。
      * 429 Too Many Requests：表示客户端已经发送过多的请求。
      * 500 Internal Server Error：表示服务器内部错误，无法完成请求。
      * 501 Not Implemented：表示服务器不支持请求的功能。
      * 502 Bad Gateway：表示服务器作为网关或代理，从上游服务器接收到无效的响应。
      * 503 Service Unavailable：表示服务器当前无法处理请求。
      * 504 Gateway Timeout：表示服务器作为网关或代理，无法及时从上游服务器接收到响应。
      * 505 HTTP Version Not Supported：表示服务器不支持请求中所用的HTTP版本。
4. 使用标准的响应格式：最好使用JSON或XML等标准格式来返回响应，以便客户端能够轻松地解析响应。以下是常见的HTTP状态码及其含义：
5. 使用HTTP请求头：使用HTTP请求头来传输一些元数据，例如Content-Type、Accept等。
6. 使用HTTP请求参数：使用HTTP请求参数来传递一些请求参数，例如查询参数、分页参数等。
7. 版本控制：为了支持API的演进和扩展，应该使用版本控制来管理API的版本。
8. 使用SSL：为了保护API的安全性，应该使用SSL加密传输数据。
9. 限制访问频率：为了防止恶意攻击和过度使用API，应该限制API的访问频率。
10. 文档化API：为了方便开发人员使用API，应该提供详细的文档，包括API的说明、参数、请求和响应示例等。