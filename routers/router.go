package routers

import (
	"github.com/linauror/startapi-go/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.AutoRouter(&controllers.IndexController{})
    beego.Router("/", &controllers.IndexController{}, "get:Index")
}
