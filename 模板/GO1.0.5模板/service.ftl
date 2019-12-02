package service

import (
	"common/bean"
	"${db}/dao"
	"${db}/model"
	"${db}/model/query"
)

func init() {
	bean.GetFactory().Register("${smallHump(table.name)}Service", &${smallHump(table.name)}Impl{})
}

// 定义service接口
type ${bigHump(table.name)} interface {
	// 查询列表
	GetList(query query.${bigHump(table.name)}) ([]model.${bigHump(table.name)}, error)
	// 获取总数
	GetCount(query query.${bigHump(table.name)}) (int64, error)
	// 获取实体
	GetModel(${smallHump(key)} int64) (model.${bigHump(table.name)}, error)
	// 更新记录 返回受影响行数
	Update(${smallHump(table.name)} model.${bigHump(table.name)}) (int64, error)
	// 添加记录 返回新添加的Id
	Insert(${smallHump(table.name)} model.${bigHump(table.name)}) (int64, error)
	// 删除记录 返回受影响行数
	Delete(${smallHump(key)} int64) (int64, error)
}

// 定义service实现
type ${smallHump(table.name)}Impl struct {
	Dao dao.${bigHump(table.name)}
}

// 实现接口内的GetAll
func (impl *${smallHump(table.name)}Impl) GetList(query query.${bigHump(table.name)}) ([]model.${bigHump(table.name)}, error) {
	return impl.Dao.GetList(query)
}

// 实现接口内的GetCount
func (impl *${smallHump(table.name)}Impl) GetCount(query query.${bigHump(table.name)}) (int64, error) {
	return impl.Dao.GetCount(query)
}

// 实现接口GetModel
func (impl *${smallHump(table.name)}Impl) GetModel(${smallHump(key)} int64) (model.${bigHump(table.name)}, error) {
	return impl.Dao.GetModel(${smallHump(key)})
}

// 实现接口Update
func (impl *${smallHump(table.name)}Impl) Update(${smallHump(table.name)} model.${bigHump(table.name)}) (int64, error) {
	return impl.Dao.Update(${smallHump(table.name)})
}

// 实现接口Insert
func (impl *${smallHump(table.name)}Impl) Insert(${smallHump(table.name)} model.${bigHump(table.name)}) (int64, error) {
	return impl.Dao.Insert(${smallHump(table.name)})
}

// 实现接口Delete
func (impl *${smallHump(table.name)}Impl) Delete(${smallHump(key)} int64) (int64, error) {
	return impl.Dao.Delete(${smallHump(key)})
}
