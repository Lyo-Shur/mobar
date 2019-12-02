package query

import (
	"common/db"
	"user/model"
)

// ${table.comment} 查询条件
type ${table.bName} struct {
	// 分页字段
	db.Page
	// ${table.comment}结构体
	model.${table.bName}
}
