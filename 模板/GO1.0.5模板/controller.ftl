package controller

import (
	"common/bean"
	"common/controller"
	"common/form"
	"${db}/model/query"
	"${db}/service"
	"github.com/kataras/iris"
	"github.com/kataras/iris/mvc"
	"log"
)

func init() {
	controller.GetFactory().Register("/${smallHump(table.name)}", new(${bigHump(table.name)}))
}

// ${table.comment} 控制器
type ${bigHump(table.name)} struct{}

// 打开列表页
func (${smallHump(table.name)} *${bigHump(table.name)}) Get(ctx iris.Context) mvc.Result {
	// 设置搜索条件默认值
	q := query.${bigHump(table.name)}{}
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
    ${smallHump(table.name)}Service := bean.GetFactory().Get("${smallHump(table.name)}Service").(service.${bigHump(table.name)})
	list, err := ${smallHump(table.name)}Service.GetList(q)
	if err != nil {
		log.Println(err)
		return mvc.View{
			Name: "error",
		}
	}
	count, err := ${smallHump(table.name)}Service.GetCount(q)
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
func (${smallHump(table.name)} *${bigHump(table.name)}) GetAdd() mvc.Result {
	return mvc.View{
		Name:"unknown",
	}
}

// 打开详情页
func (${smallHump(table.name)} *${bigHump(table.name)}) GetBy(${smallHump(key)} int64) mvc.Result {
	// 检查主键参数
	if ${smallHump(key)} < 1 {
		return mvc.View{
			Name: "error",
		}
	}

	// 查询详情
    ${smallHump(table.name)}Service := bean.GetFactory().Get("${smallHump(table.name)}Service").(service.${bigHump(table.name)})
	item, err := ${smallHump(table.name)}Service.GetModel(${smallHump(key)})
	if err != nil || item.${bigHump(key)} < 0 {
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
func (${smallHump(table.name)} *${bigHump(table.name)}) GetEditBy(${smallHump(key)} int64) mvc.Result {
	// 检查主键参数
	if ${smallHump(key)} < 1 {
		return mvc.View{
			Name: "error",
		}
	}

	// 查询详情
	${smallHump(table.name)}Service := bean.GetFactory().Get("${smallHump(table.name)}Service").(service.${bigHump(table.name)})
	item, err := ${smallHump(table.name)}Service.GetModel(${smallHump(key)})
	if err != nil || item.${bigHump(key)} < 0 {
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
