package query

import (
	"common/db"
	"${db}/model"
)

// ${table.comment} 查询条件
type ${bigHump(table.name)} struct {
	// 分页字段
	db.Page
	// ${table.comment}结构体
	model.${bigHump(table.name)}
}
