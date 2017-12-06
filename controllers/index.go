package controllers

import (
	"encoding/json"

	"github.com/astaxie/beego"

	"github.com/linauror/startapi-go/models"
	"github.com/astaxie/beego/httplib"
)

type IndexController struct {
	BaseController
}

func (self *IndexController) Index() {
	list, total := models.CategoryList()

	self.Data["list"] = list
	self.Data["total"] = total
	self.Data["headerTitle"] = "首页"
	self.TplName = "index.html"
}

func (self *IndexController) CategoryAdd() {
	if self.Ctx.Input.IsPost() {
		add := new(models.Category)
		add.Title = self.GetString("title")
		add.Desc = self.GetString("desc")
		if _, err := models.CategoryAdd(add); err != nil {
			self.MsgTip(err.Error())
		} else {
			self.MsgTip("分类新增成功")
			self.Redirect(beego.URLFor("IndexController.Index"), 302)
		}
	}

	self.Data["headerTitle"] = "分类新增"
	self.TplName = "category_add.html"
}

func (self *IndexController) CategoryUpdate() {
	id, _ := self.GetInt64("id")
	info, _ := models.CategoryInfo(id)
	if self.Ctx.Input.IsPost() {
		info.Title = self.GetString("title")
		info.Desc = self.GetString("desc")
		if err := models.CategoryUpdate(info); err != nil {
			self.MsgTip(err.Error())
		} else {
			self.MsgTip("分类更新成功")
			self.Redirect(beego.URLFor("IndexController.Index"), 302)
		}
	}

	self.Data["info"] = info
	self.Data["headerTitle"] = "分类更新"
	self.TplName = "category_update.html"
}

func (self *IndexController) CategoryDel() {
	id, _ := self.GetInt64("id")
	if err := models.CategoryDel(id); err != nil {
		self.MsgTip(err.Error())
	} else {
		self.Redirect(beego.URLFor("IndexController.Index"), 302)
	}
}

func (self *IndexController) ApiList() {
	categoryId, _ := self.GetInt64("category_id")
	categoryInfo, _ := models.CategoryInfo(categoryId)
	list, total := models.ApiList(categoryId)

	self.Data["categoryInfo"] = categoryInfo
	self.Data["list"] = list
	self.Data["total"] = total
	self.Data["headerTitle"] = "接口列表"
	self.TplName = "api_lists.html"
}

func (self *IndexController) ApiAdd() {
	if self.Ctx.Input.IsPost() {
		api := new(models.Api)
		api.CategoryId, _ = self.GetInt64("category_id")
		api.Title = self.GetString("title")
		api.Uri = self.GetString("uri")
		api.MethodType = self.GetString("method_type")
		api.IsAuthed, _ = self.GetInt("is_authed", 0)
		api.Desc = self.GetString("desc")
		api.RequestCode = self.GetString("request_code")
		api.ResultCode = self.GetString("result_code")

		// 使用数据绑定形式获取多维数据
		_requestParamMap := make([]map[string]string, 0)
		self.Ctx.Input.Bind(&_requestParamMap, "request_param")
		__requestParamMap := make(map[int]map[string]string)
		i := 0
		for _, v := range _requestParamMap {
			if len(v) > 0 {
				__requestParamMap[i] = v
				i++
			}
		}
		_requestParamJson, _ := json.Marshal(__requestParamMap)
		api.RequestParam = string(_requestParamJson)

		_resultParamMap := make([]map[string]string, 0)
		self.Ctx.Input.Bind(&_resultParamMap, "result_param")
		__resultParamMap := make(map[int]map[string]string, len(_resultParamMap))
		i = 0
		for _, v := range _resultParamMap {
			if len(v) > 0 {
				__resultParamMap[i] = v
				i++
			}
		}
		_resultParamJson, _ := json.Marshal(__resultParamMap)
		api.ResultParam = string(_resultParamJson)

		if _, err := models.ApiAdd(api); err != nil {
			self.MsgTip(err.Error())
		} else {
			self.MsgTip("接口新增成功")
			self.Redirect(beego.URLFor("IndexController.ApiList", "category_id", api.CategoryId), 302)
		}
	}

	self.Data["categoryId"] = self.GetString("category_id")
	self.Data["headerTitle"] = "接口新增"
	self.TplName = "api_add.html"
}

func (self *IndexController) ApiUpdate() {
	id, _ := self.GetInt64("id")
	api, _ := models.ApiInfo(id)
	if self.Ctx.Input.IsPost() {
		api.Title = self.GetString("title")
		api.Uri = self.GetString("uri")
		api.MethodType = self.GetString("method_type")
		api.IsAuthed, _ = self.GetInt("is_authed", 0)
		api.Desc = self.GetString("desc")
		api.RequestCode = self.GetString("request_code")
		api.ResultCode = self.GetString("result_code")

		// 使用数据绑定形式获取多维数据
		_requestParamMap := make([]map[string]string, 0)
		self.Ctx.Input.Bind(&_requestParamMap, "request_param")
		__requestParamMap := make(map[int]map[string]string)
		i := 0
		for _, v := range _requestParamMap {
			if len(v) > 0 {
				__requestParamMap[i] = v
				i++
			}
		}
		_requestParamJson, _ := json.Marshal(__requestParamMap)
		api.RequestParam = string(_requestParamJson)

		_resultParamMap := make([]map[string]string, 0)
		self.Ctx.Input.Bind(&_resultParamMap, "result_param")
		__resultParamMap := make(map[int]map[string]string, len(_resultParamMap))
		i = 0
		for _, v := range _resultParamMap {
			if len(v) > 0 {
				__resultParamMap[i] = v
				i++
			}
		}
		_resultParamJson, _ := json.Marshal(__resultParamMap)
		api.ResultParam = string(_resultParamJson)

		if err := models.ApiUpdate(api); err != nil {
			self.MsgTip(err.Error())
		} else {
			self.MsgTip("接口更新成功")
			self.Redirect(beego.URLFor("IndexController.ApiList", "category_id", api.CategoryId), 302)
		}
	}

	_requestParamMap := make(map[int]map[string]string, 0)
	json.Unmarshal([]byte(api.RequestParam), &_requestParamMap)

	_resultParamMap := make(map[int]map[string]string, 0)
	json.Unmarshal([]byte(api.ResultParam), &_resultParamMap)

	self.Data["info"] = api
	self.Data["RequestParam"] = _requestParamMap
	self.Data["ResultParam"] = _resultParamMap
	self.Data["count"] = len(_resultParamMap) + len(_resultParamMap)
	self.Data["headerTitle"] = "接口更新"
	self.TplName = "api_update.html"
}

func (self *IndexController) ApiDel() {
	id, _ := self.GetInt64("id")
	if err := models.ApiDel(id); err != nil {
		self.MsgTip(err.Error())
	} else {
		self.Redirect(self.Ctx.Request.Referer(), 302)
	}
}

func (self *IndexController) Pub() {
	url := beego.URLFor("IndexController.Publish")
	req := httplib.Get("http://" + self.Ctx.Request.Host + url)
	req.ToFile("api.html")

	self.Data["headerTitle"] = "文档生成"
	self.TplName = "create_html.html"
}

func (self *IndexController) Publish() {
	categoryList, _ := models.CategoryList()
	apiList, _ := models.ApiList(0)

	self.Data["apiList"] = apiList
	self.Data["categoryList"] = categoryList
	self.Data["headerTitle"] = "接口文档"
	self.Layout = ""
	self.TplName = "publish.html"
}
