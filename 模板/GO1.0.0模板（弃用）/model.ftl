package model

// ${table.comment}结构体
type ${table.bName} struct {
<#list table.columnList as column>
	// ${column.comment}
    ${column.bName} ${column.javaType}
</#list>
}
