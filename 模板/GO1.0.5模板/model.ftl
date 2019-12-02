package model

// ${table.comment}结构体
type ${bigHump(table.name)} struct {
<#list table.columnList as column>
	// ${column.comment}
    ${bigHump(column.name)} ${type(column.type)}
</#list>
}
