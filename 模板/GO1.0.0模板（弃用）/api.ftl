package api

import (
	"common/api"
	"common/bean"
	"common/controller"
	"common/form"
	"common/validator"
	"user/model"
	"user/service"
	"user/model/query"
	"github.com/kataras/iris"
	"log"
)

func init() {
	controller.GetFactory().Register("/api/${table.sName}", new(${table.bName}))
}

// 专栏控制器
type ${table.bName} struct{}

// 获取列表数据
func (${table.sName} *${table.bName}) PostList(ctx iris.Context) string {
	// 设置搜索条件默认值
	q := query.${table.bName}{}
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
	${table.sName}Service := bean.GetFactory().Get("${table.sName}Service").(service.${table.bName})
	list, err := ${table.sName}Service.GetList(q)
	if err != nil {
		log.Println(err)
		return api.JsonCodeModeDTO(api.SYSTEM_ERROR, "系统内部错误", nil)
	}
	count, err := ${table.sName}Service.GetCount(q)
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
func (${table.sName} *${table.bName}) GetBy(${table.sKey} int64) string {
	// 检查主键
	if ${table.sKey} < 1 {
		return api.JsonCodeModeDTO(api.PARAMETER_ERROR, "主键参数非法", nil)
	}

	//查询model详情
	${table.sName}Service := bean.GetFactory().Get("${table.sName}Service").(service.${table.bName})
	item, err := ${table.sName}Service.GetModel(${table.sKey})
	if err != nil {
		log.Println(err)
		return api.JsonCodeModeDTO(api.SYSTEM_ERROR, "系统内部错误", nil)
	}
	if item.${table.bKey} == 0 {
		return api.JsonCodeModeDTO(api.PARAMETER_ERROR,"记录不存在", nil)
	}
	return api.JsonCodeModeDTO(api.SUCCESS,"请求成功", item)
}

// 新增记录
func (${table.sName} *${table.bName}) PostInsert(ctx iris.Context) string {
	//创建脚本实体
	item := model.${table.bName}{}

	//将请求中的值装载到结构体
	err := form.Helper(ctx).Binding(&item)
	if err != nil {
		return api.JsonCodeModeDTO(api.PARAMETER_ERROR , err.Error(),nil)
	}

	// 数据校验
	err = validator.Helper(&item, map[string]string{
	<#list table.columnList as column>
			"${column.bName}": "length[1-255]",
	</#list>
	}).Check()
	if err != nil {
		return api.JsonCodeModeDTO(api.PARAMETER_ERROR, err.Error(), nil)
	}

	//执行
	${table.sName}Service :=bean.GetFactory().Get("${table.sName}Service").(service.${table.bName})
	${table.sKey} ,err := ${table.sName}Service.Insert(item)
	if err != nil {
		log.Println(err)
		return api.JsonCodeModeDTO(api.SYSTEM_ERROR,"系统内部错误",nil)
	}
	if ${table.sKey} == -1{
		return api.JsonCodeModeDTO(api.SYSTEM_ERROR,"系统内部错误",nil)
	}
	return api.JsonCodeModeDTO(api.SUCCESS,"success", ${table.sKey})

}

// 修改接口
func (${table.sName} *${table.bName}) PostUpdate(ctx iris.Context) string {
	// 构建参数
	item := model.${table.bName}{}

	// 将请求中的值装载到结构体
	err := form.Helper(ctx).Binding(&item)
	if err != nil {
		return api.JsonCodeModeDTO(api.PARAMETER_ERROR, err.Error(), nil)
	}

	// 数据校验
	err = validator.Helper(&item, map[string]string{
    <#list table.columnList as column>
        "${column.bName}": "length[1-255]",
    </#list>
	}).Check()
	if err != nil {
		return api.JsonCodeModeDTO(api.PARAMETER_ERROR, err.Error(), nil)
	}

	// 执行操作
    ${table.sName}Service := bean.GetFactory().Get("${table.sName}Service").(service.${table.bName})
	_, err = ${table.sName}Service.Update(item)
	if err != nil {
		log.Println(err)
		return api.JsonCodeModeDTO(api.SYSTEM_ERROR, "系统内部错误", nil)
	}

	return api.JsonCodeModeDTO(api.SUCCESS, "请求成功", nil)
}

// 删除接口
func (${table.sName} *${table.bName}) PostDelete(ctx iris.Context) string {
	// 记录Id
    ${table.sKey} := ctx.PostValueInt64Default("${table.sKey}", 0)
	if ${table.sKey} < 1 {
		return api.JsonCodeModeDTO(api.PARAMETER_ERROR, "参数id非法", nil)
	}

	// 执行操作
    ${table.sName}Service := bean.GetFactory().Get("${table.sName}Service").(service.${table.bName})
	_, err := ${table.sName}Service.Delete(${table.sKey})
	if err != nil {
		return api.JsonCodeModeDTO(api.SYSTEM_ERROR, "系统内部错误", nil)
	}

	return api.JsonCodeModeDTO(api.SUCCESS, "请求成功", nil)
}
