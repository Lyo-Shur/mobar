package dao

import (
	"common/bean"
	"common/db"
	"user/model"
	"user/model/query"
)

func init() {
	n := ${table.sName}Impl{}
	n.m = db.GetManager("./mapper/${table.sName}.xml", model.${table.bName}{})
	bean.GetFactory().Register("${table.sName}DAO", &n)
}

// 定义DAO层接口
type ${table.bName} interface {
	// 查询列表
	GetList(query query.${table.bName}) ([]model.${table.bName}, error)
	// 获取总数
	GetCount(query query.${table.bName}) (int64, error)
	// 获取实体
	GetModel(${table.sKey} int64) (model.${table.bName}, error)
	// 更新记录 返回受影响行数
	Update(${table.sName} model.${table.bName}) (int64, error)
	// 添加记录 返回新添加的Id
	Insert(${table.sName} model.${table.bName}) (int64, error)
	// 删除记录 返回受影响行数
	Delete(id int64) (int64, error)
}

// 定义DAO层接口实现
type ${table.sName}Impl struct {
	m db.Manager
}

// 实现接口GetList
func (impl *${table.sName}Impl) GetList(query query.${table.bName}) ([]model.${table.bName}, error) {
	// 错误处理
	vs, err := impl.m.Query("GetList", query)
	if err != nil {
		return nil, err
	}
	// 转换列表
	var list []model.${table.bName}
	for i := 0; i < len(vs); i++ {
		list = append(list, *vs[i].Interface().(*model.${table.bName}))
	}
	return list, nil
}

// 实现接口GetCount
func (impl *${table.sName}Impl) GetCount(query query.${table.bName}) (int64, error) {
	return impl.m.Count("GetCount", query)
}

// 实现接口GetModel
func (impl *${table.sName}Impl) GetModel(${table.sKey} int64) (model.${table.bName}, error) {
	// 错误处理
	v, err := impl.m.QueryFirst("GetModel", ${table.sKey})
	if err != nil {
		return model.${table.bName}{}, err
	}
	return *v.Interface().(*model.${table.bName}), nil
}

// 实现接口Insert
func (impl *${table.sName}Impl) Update(${table.sName} model.${table.bName}) (int64, error) {
	// 错误处理
	_, num, err := impl.m.Exec("Update", ${table.sName})
	if err != nil {
		return -1, err
	}
	return num, nil
}

// 实现接口Insert
func (impl *${table.sName}Impl) Insert(${table.sName} model.${table.bName}) (int64, error) {
	// 错误处理
	id, _, err := impl.m.Exec("Insert", ${table.sName})
	if err != nil {
		return -1, err
	}
	return id, nil
}

// 实现接口Delete
func (impl *${table.sName}Impl) Delete(id int64) (int64, error) {
	// 错误处理
	_, num, err := impl.m.Exec("Delete", id)
	if err != nil {
		return -1, err
	}
	return num, nil
}
