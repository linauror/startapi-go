package models

import "github.com/astaxie/beego/orm"

type Api struct {
	Id           int64
	CategoryId   int64
	Title        string
	Uri          string
	MethodType   string
	Desc         string
	RequestParam string
	ResultParam  string
	RequestCode  string
	ResultCode   string
	IsAuthed     int
	Sort         int64
	Deleted      int
}

func ApiList(categoryId int64) ([]*Api, int64) {
	query := orm.NewOrm().QueryTable("api")
	if categoryId > 0 {
		query = query.Filter("category_id", categoryId)
	}
	total, _ := query.Count()
	list := make([]*Api, 0)
	query.Filter("deleted", 0).OrderBy("id").All(&list)
	return list, total
}

func ApiAdd(api *Api) (int64, error) {
	id, err := orm.NewOrm().Insert(api)
	if err != nil {
		return 0, err
	}
	return id, nil
}

func ApiInfo(id int64) (Api, error) {
	query := Api{Id: id}
	err := orm.NewOrm().Read(&query)
	return query, err
}

func ApiUpdate(data Api) (error) {
	if _, err := orm.NewOrm().Update(&data); err != nil {
		return err
	}
	return nil
}

func ApiDel(id int64) (error) {
	query := Api{Id: id}
	orm.NewOrm().Read(&query)
	query.Deleted = 1
	if _, err := orm.NewOrm().Update(&query); err != nil {
		return err
	}
	return nil
}

