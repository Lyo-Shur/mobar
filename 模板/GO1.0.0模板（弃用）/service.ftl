package service

import (
	"common/bean"
	"user/dao"
	"user/model"
	"user/model/query"
)

func init() {
	bean.GetFactory().Register("${table.sName}Service", &${table.sName}Impl{})
}

// 定义service接口
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
	Delete(${table.sKey} int64) (int64, error)
}

// 定义service实现
type ${table.sName}Impl struct {
	Dao dao.${table.bName}
}

// 实现接口内的GetAll
func (impl *${table.sName}Impl) GetList(query query.${table.bName}) ([]model.${table.bName}, error) {
	return impl.Dao.GetList(query)
}

// 实现接口内的GetCount
func (impl *${table.sName}Impl) GetCount(query query.${table.bName}) (int64, error) {
	return impl.Dao.GetCount(query)
}

// 实现接口GetModel
func (impl *${table.sName}Impl) GetModel(${table.sKey} int64) (model.${table.bName}, error) {
	return impl.Dao.GetModel(${table.sKey})
}

// 实现接口Update
func (impl *${table.sName}Impl) Update(${table.sName} model.${table.bName}) (int64, error) {
	return impl.Dao.Update(${table.sName})
}

// 实现接口Insert
func (impl *${table.sName}Impl) Insert(${table.sName} model.${table.bName}) (int64, error) {
	return impl.Dao.Insert(${table.sName})
}

// 实现接口Delete
func (impl *${table.sName}Impl) Delete(id int64) (int64, error) {
	return impl.Dao.Delete(id)
}
