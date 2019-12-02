## 数据库设计文档

<#list tables as table>
### ${table_index + 1}.${table.name}

基本信息：${table.engine}、${table.collation}、${table.comment}

|序号|列名|列类型|是否允许为空|默认值|注释|
|----|----|----|----|----|----|
<#list table.columnList as column>
| ${column.number} | ${column.name} | ${column.type} | ${column.nullAble} | ${column.defaule!"空"} | ${column.comment} |
</#list>

|序号|索引名|列名|是否是唯一约束|索引类型|
|----|----|----|----|----|
<#list table.indexList as index>
| ${index_index + 1} | ${index.name} | ${index.columnName} | ${index.unique} | ${index.type} |
</#list>

</#list>