package controllers

import (
	"github.com/astaxie/beego"
)

type BaseController struct {
	beego.Controller
}

func (self *BaseController) Prepare() {
	self.Layout = "layout.html"
}

func (self *BaseController) MsgTip(msg string) {
	beego.ReadFromRequest(&self.Controller)
	flash := beego.NewFlash()
	flash.Error(msg)
	flash.Store(&self.Controller)
}