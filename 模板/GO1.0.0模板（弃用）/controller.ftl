package controller

import (
	"common/bean"
	"common/controller"
	"common/form"
	"user/model/query"
	"user/service"
	"github.com/kataras/iris"
	"github.com/kataras/iris/mvc"
	"log"
)

func init() {
	controller.GetFactory().Register("/${table.sName}", new(${table.bName}))
}

// ${table.comment} 控制器
type ${table.bName} struct{}

// 打开列表页
func (${table.sName} *${table.bName}) Get(ctx iris.Context) mvc.Result {

	// 设置搜索条件默认值
	q := query.${table.bName}{}
	q.Init()
	q.Length = 10

	// 将请求中的值装载到结构体
	err := form.Helper(ctx).Binding(&q)
	if err != nil {
		log.Println(err.Error())
		return mvc.View{
			Name: "error",
		}
	}

	// 计算分页
	q.TranslatePaging()

	// 执行查询
    ${table.sName}Service := bean.GetFactory().Get("${table.sName}Service").(service.${table.bName})
	list, err := ${table.sName}Service.GetList(q)
	if err != nil {
		log.Println(err)
		return mvc.View{
			Name: "error",
		}
	}
	count, err := ${table.sName}Service.GetCount(q)
	if err != nil {
		log.Println(err)
		return mvc.View{
			Name: "error",
		}
	}

	// 返回页面
	return mvc.View{
		Name: "unknown",
		Data: map[string]interface{}{
			"Query": q,
			"List": list,
			"Count": count,
		},
	}
}

// 新增页面
func (${table.sName} *${table.bName}) GetAdd() mvc.Result {
	return mvc.View{
		Name:"unknown",
	}
}

// 打开详情页
func (${table.sName} *${table.bName}) GetBy(${table.sKey} int64) mvc.Result {
	// 检查主键参数
	if ${table.sKey} < 1 {
		return mvc.View{
			Name: "error",
		}
	}

	// 查询详情
    ${table.sName}Service := bean.GetFactory().Get("${table.sName}Service").(service.${table.bName})
	item, err := ${table.sName}Service.GetModel(${table.sKey})
	if err != nil || item.${table.bKey} < 0 {
		return mvc.View{
			Name: "error",
		}
	}

	// 返回页面
	return mvc.View{
		Name: "unknown",
		Data: map[string]interface{}{
			"Item": item,
		},
	}
}

// 打开编辑页面
func (${table.sName} *${table.bName}) GetEditBy(${table.sKey} int64) mvc.Result {
	// 检查主键参数
	if ${table.sKey} < 1 {
		return mvc.View{
			Name: "error",
		}
	}

	// 查询详情
	${table.sName}Service := bean.GetFactory().Get("${table.sName}Service").(service.${table.bName})
	item, err := ${table.sName}Service.GetModel(${table.sKey})
	if err != nil || item.${table.bKey} < 0 {
		return mvc.View{
			Name: "error",
		}
	}

	// 返回页面
	return mvc.View{
		Name: "unknown",
		Data: map[string]interface{}{
			"Item": item,
		},
	}
}
