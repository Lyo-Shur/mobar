package dao

import (
	"common/bean"
	"common/db"
	"${db}/model"
	"${db}/model/query"
)

func init() {
	n := ${smallHump(table.name)}Impl{}
	n.m = db.GetManager("./mapper/${smallHump(table.name)}.xml", model.${bigHump(table.name)}{})
	bean.GetFactory().Register("${smallHump(table.name)}DAO", &n)
}

// 定义DAO层接口
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

// 定义DAO层接口实现
type ${smallHump(table.name)}Impl struct {
	m db.Manager
}

// 实现接口GetList
func (impl *${smallHump(table.name)}Impl) GetList(query query.${bigHump(table.name)}) ([]model.${bigHump(table.name)}, error) {
	// 错误处理
	vs, err := impl.m.Query("GetList", query)
	if err != nil {
		return nil, err
	}
	// 转换列表
	var list []model.${bigHump(table.name)}
	for i := 0; i < len(vs); i++ {
		list = append(list, *vs[i].Interface().(*model.${bigHump(table.name)}))
	}
	return list, nil
}

// 实现接口GetCount
func (impl *${smallHump(table.name)}Impl) GetCount(query query.${bigHump(table.name)}) (int64, error) {
	return impl.m.Count("GetCount", query)
}

// 实现接口GetModel
func (impl *${smallHump(table.name)}Impl) GetModel(${smallHump(key)} int64) (model.${bigHump(table.name)}, error) {
	// 错误处理
	v, err := impl.m.QueryFirst("GetModel", ${smallHump(key)})
	if err != nil {
		return model.${bigHump(table.name)}{}, err
	}
	return *v.Interface().(*model.${bigHump(table.name)}), nil
}

// 实现接口Insert
func (impl *${smallHump(table.name)}Impl) Update(${smallHump(table.name)} model.${bigHump(table.name)}) (int64, error) {
	// 错误处理
	_, num, err := impl.m.Exec("Update", ${smallHump(table.name)})
	if err != nil {
		return -1, err
	}
	return num, nil
}

// 实现接口Insert
func (impl *${smallHump(table.name)}Impl) Insert(${smallHump(table.name)} model.${bigHump(table.name)}) (int64, error) {
	// 错误处理
	id, _, err := impl.m.Exec("Insert", ${smallHump(table.name)})
	if err != nil {
		return -1, err
	}
	return id, nil
}

// 实现接口Delete
func (impl *${smallHump(table.name)}Impl) Delete(${smallHump(key)} int64) (int64, error) {
	// 错误处理
	_, num, err := impl.m.Exec("Delete", ${smallHump(key)})
	if err != nil {
		return -1, err
	}
	return num, nil
}
