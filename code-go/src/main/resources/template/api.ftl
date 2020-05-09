package api

import (
	"common/api"
	"common/bean"
	"common/controller"
	"common/form"
	"common/validator"
	"${db}/model"
	"${db}/service"
	"${db}/model/query"
	"github.com/kataras/iris"
	"log"
)

func init() {
	controller.GetFactory().Register("/api/${smallHump(table.name)}", new(${bigHump(table.name)}))
}

// ${table.comment} 控制器
type ${bigHump(table.name)} struct{}

// 获取列表数据
func (${smallHump(table.name)} *${bigHump(table.name)}) PostList(ctx iris.Context) string {
	// 设置搜索条件默认值
	q := query.${bigHump(table.name)}{}
	q.Init()
	q.Length = 10

	// 将请求中的值装载到结构体
	err := form.Helper(ctx).Binding(&q)
	if err != nil {
		log.Println(err)
		return api.JsonCodeModeDTO(api.PARAMETER_ERROR, err.Error(), nil)
	}

	//计算分页
	q.TranslatePaging()

	//执行查询
	${smallHump(table.name)}Service := bean.GetFactory().Get("${smallHump(table.name)}Service").(service.${bigHump(table.name)})
	list, err := ${smallHump(table.name)}Service.GetList(q)
	if err != nil {
		log.Println(err)
		return api.JsonCodeModeDTO(api.SYSTEM_ERROR, "系统内部错误", nil)
	}
	count, err := ${smallHump(table.name)}Service.GetCount(q)
	if err != nil {
		log.Println(err)
		return api.JsonCodeModeDTO(api.SYSTEM_ERROR, "系统内部错误", nil)
	}
	return api.JsonCodeModeDTO(api.SUCCESS, "请求成功", map[string]interface{}{
		"Query": q,
		"List": list,
		"Count": count,
	})
}

// 获取单条记录
func (${smallHump(table.name)} *${bigHump(table.name)}) GetBy(${smallHump(key)} int64) string {
	// 检查主键
	if ${smallHump(key)} < 1 {
		return api.JsonCodeModeDTO(api.PARAMETER_ERROR, "主键参数非法", nil)
	}

	//查询model详情
	${smallHump(table.name)}Service := bean.GetFactory().Get("${smallHump(table.name)}Service").(service.${bigHump(table.name)})
	item, err := ${smallHump(table.name)}Service.GetModel(${smallHump(key)})
	if err != nil {
		log.Println(err)
		return api.JsonCodeModeDTO(api.SYSTEM_ERROR, "系统内部错误", nil)
	}
	if item.${bigHump(key)} == 0 {
		return api.JsonCodeModeDTO(api.PARAMETER_ERROR,"记录不存在", nil)
	}
	return api.JsonCodeModeDTO(api.SUCCESS,"请求成功", item)
}

// 新增记录
func (${smallHump(table.name)} *${bigHump(table.name)}) PostInsert(ctx iris.Context) string {
	//创建脚本实体
	item := model.${bigHump(table.name)}{}

	//将请求中的值装载到结构体
	err := form.Helper(ctx).Binding(&item)
	if err != nil {
		return api.JsonCodeModeDTO(api.PARAMETER_ERROR , err.Error(),nil)
	}

	// 数据校验
	err = validator.Helper(&item, map[string]string{
	<#list table.columnList as column>
		"${bigHump(column.name)}": "length[1-255]",
	</#list>
	}).Check()
	if err != nil {
		return api.JsonCodeModeDTO(api.PARAMETER_ERROR, err.Error(), nil)
	}

	//执行
	${smallHump(table.name)}Service :=bean.GetFactory().Get("${smallHump(table.name)}Service").(service.${bigHump(table.name)})
	${smallHump(key)} ,err := ${smallHump(table.name)}Service.Insert(item)
	if err != nil {
		log.Println(err)
		return api.JsonCodeModeDTO(api.SYSTEM_ERROR,"系统内部错误",nil)
	}
	if ${smallHump(key)} == -1{
		return api.JsonCodeModeDTO(api.SYSTEM_ERROR,"系统内部错误",nil)
	}
	return api.JsonCodeModeDTO(api.SUCCESS,"success", ${smallHump(key)})

}

// 修改接口
func (${smallHump(table.name)} *${bigHump(table.name)}) PostUpdate(ctx iris.Context) string {
	// 构建参数
	item := model.${bigHump(table.name)}{}

	// 将请求中的值装载到结构体
	err := form.Helper(ctx).Binding(&item)
	if err != nil {
		return api.JsonCodeModeDTO(api.PARAMETER_ERROR, err.Error(), nil)
	}

	// 执行操作
    ${smallHump(table.name)}Service := bean.GetFactory().Get("${smallHump(table.name)}Service").(service.${bigHump(table.name)})
	_, err = ${smallHump(table.name)}Service.Update(item)
	if err != nil {
		log.Println(err)
		return api.JsonCodeModeDTO(api.SYSTEM_ERROR, "系统内部错误", nil)
	}

	return api.JsonCodeModeDTO(api.SUCCESS, "请求成功", nil)
}

// 删除接口
func (${smallHump(table.name)} *${bigHump(table.name)}) PostDelete(ctx iris.Context) string {
	// 记录Id
    ${smallHump(key)} := ctx.PostValueInt64Default("${smallHump(key)}", 0)
	if ${smallHump(key)} < 1 {
		return api.JsonCodeModeDTO(api.PARAMETER_ERROR, "参数id非法", nil)
	}

	// 执行操作
    ${smallHump(table.name)}Service := bean.GetFactory().Get("${smallHump(table.name)}Service").(service.${bigHump(table.name)})
	_, err := ${smallHump(table.name)}Service.Delete(${smallHump(key)})
	if err != nil {
		return api.JsonCodeModeDTO(api.SYSTEM_ERROR, "系统内部错误", nil)
	}

	return api.JsonCodeModeDTO(api.SUCCESS, "请求成功", nil)
}
