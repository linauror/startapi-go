package models

import (
	"github.com/astaxie/beego/orm"
)

type Category struct {
	Id      int64
	Title   string
	Desc    string
	Sort    int
	Deleted int
}

func CategoryList() ([]*Category, int64) {
	query := orm.NewOrm().QueryTable("category")
	total, _ := query.Count()
	list := make([]*Category, 0)
	query.Filter("deleted", 0).OrderBy("id").All(&list)
	return list, total
}

func CategoryAdd(add *Category) (int64, error) {
	id, err := orm.NewOrm().Insert(add)
	if err != nil {
		return 0, err
	}
	return id, nil
}

func CategoryInfo(id int64) (Category, error) {
	query := Category{Id: id}
	err := orm.NewOrm().Read(&query)
	return query, err
}

func CategoryUpdate(data Category) (error) {
	if _, err := orm.NewOrm().Update(&data); err != nil {
		return err
	}
	return nil
}

func CategoryDel(id int64) (error) {
	query := Category{Id: id}
	orm.NewOrm().Read(&query)
	query.Deleted = 1
	if _, err := orm.NewOrm().Update(&query); err != nil {
		return err
	}
	return nil
}
